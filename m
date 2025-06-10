Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122519460
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749525205; cv=none; b=uMlpHqxNouK1TDsMDkY8zUFk+39aSi02KoGQCsbiLh42urM53o5XT3/nNqCulJdB3BIzgyLWpVMu2veQB9W0AFVQPWGUyUkTMx0vfwPi5VRM+zfCAYMPa7nsdMlSe2wyoNyHzp9ij90RzQ50dWlDj49edGfIk/3eR+by2GtCpm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749525205; c=relaxed/simple;
	bh=BSiQJhCcYWAN/A2STP7AiIic5RGj2SD+iwQKZkZYSFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGWUng4l1YyRRiA+/AhPZo13jEuJuDcZfmzPJ1ybemmCf1b6Zdk9YtoTE+9RIqIl9MYtr3dsDt0CKoVkQoSccD9RtL0DW75TdBfOAyqO82AuHhHWPjMbMLyU9rp4nniXyN8/TUPfn+0r2p5bQ8qtfRHqE7ASTfob74JgLXZDOdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkdQi2WR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkdQi2WR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1241DC4CEEB;
	Tue, 10 Jun 2025 03:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749525204;
	bh=BSiQJhCcYWAN/A2STP7AiIic5RGj2SD+iwQKZkZYSFY=;
	h=From:To:Cc:Subject:Date:From;
	b=DkdQi2WRsVIrh1GetZHOeJHmKewjdez5k+KgwhiRO5+v23kAMrQKFoGe9k2QQLeob
	 JyNeCA8YKh5sg/jZdX8gBkwzkqEMOKviPIvbX6fFwVGIw2nhYKiwvz+coEuksNnLw/
	 3900DBQlbjr2OIGtvhTG7tAeUUBF3MtQPldqyDi0ZTnF2RbR2wD9Qqs2CIfKMPd/Hm
	 X1IFH12TY+tBSQllYOH57h+itBSNJOdcmWr5xe2mKFzXQbgM5NP05sx8ZnRjh5F/uf
	 hKcl84uxHpLN5ZM+yzQ4UvWHQ8g2uXuVkzRXjr4/rmwR65N/PRp7JyhGE9QNkG4aGq
	 Ec1OboW8NP2VA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: do sanity check on fio.new_blkaddr in do_write_page()
Date: Tue, 10 Jun 2025 11:13:15 +0800
Message-ID: <20250610031315.1067993-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS-fs (dm-55): access invalid blkaddr:972878540
Call trace:
 dump_backtrace+0xec/0x128
 show_stack+0x18/0x28
 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4
 f2fs_is_valid_blkaddr+0x10/0x20
 f2fs_get_node_info+0x21c/0x60c
 __write_node_page+0x15c/0x734
 f2fs_sync_node_pages+0x4f8/0x700
 f2fs_write_checkpoint+0x4a8/0x99c
 __checkpoint_and_complete_reqs+0x7c/0x20c
 issue_checkpoint_thread+0x4c/0xd8
 kthread+0x11c/0x1b0
 ret_from_fork+0x10/0x20

If f2fs_allocate_data_block() fails, we may update nat.blkaddr w/
uninitialized fio.new_blkaddr.

- __write_node_folio
 - f2fs_do_write_node_page
  - do_write_page
   - f2fs_allocate_data_block
   : once it fails, it may not allocate new blkaddr
 - set_node_addr
 : update w/ uninitialized fio.new_blkaddr variable

I've checked all error paths in f2fs_allocate_data_block(), it should
be tagged w/ CP_ERROR_FLAG.

In addition, f2fs_allocate_data_block() succeeds, fio.new_blkaddr should
be valid.

Let's add f2fs_bug_on() to check above two conditions to detect any
potential bugs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dad5a92b7e70..5653716460ea 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3948,8 +3948,14 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		folio_end_writeback(folio);
 		if (f2fs_in_warm_node_list(fio->sbi, folio))
 			f2fs_del_fsync_node_entry(fio->sbi, folio);
+		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
+							CP_ERROR_FLAG));
 		goto out;
 	}
+
+	f2fs_bug_on(fio->sbi, !f2fs_is_valid_blkaddr(fio->sbi,
+				fio->new_blkaddr, DATA_GENERIC_ENHANCE));
+
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
 		f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr, 1);
 
-- 
2.49.0

