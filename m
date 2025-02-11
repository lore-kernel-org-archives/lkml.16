Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AF1D63F7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258256; cv=none; b=hcf56rTsULrPjuD8OYHCe54ycYsnhRgg6qMmUWTu1jST5aIPsdVgCzP4ZvI8KeHZ0ulzzx7LpFwjHaBsdQd7miOoxVVkxvF+jHjaIzVAIGzI4qKYrEn7ctysCSmXQC3h4M64LgzJ22da7zUNe6Sjn4Qsozp7mitfRlwtL7f3EV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258256; c=relaxed/simple;
	bh=5RzxvLb5nIJ6JuzhSFBxZcRkYWm59niakiJkEIZELu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbgJewqO3uLXPwojqUOpRu6EZR+JB+JQgh2KVEbHHVml9XRU9OCaKCFUrjij1ztkmdA1qTojSSoDu6cnGPLnvyUd8f5iZEsb7AGDURU/O3ch6reX2NjkDMGsKAP9US2Bnr6UF+R6NdxC3fQxR38rPf41xPYUi9SgFxabGF3fTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8f5QS+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8f5QS+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AC9C4CEDD;
	Tue, 11 Feb 2025 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739258255;
	bh=5RzxvLb5nIJ6JuzhSFBxZcRkYWm59niakiJkEIZELu0=;
	h=From:To:Cc:Subject:Date:From;
	b=M8f5QS+d9ww+ZQzkQFPLG11cVrAm28k/0fKAM0VEKVBQJAnyD9QBvnHKMbt/0fgOU
	 2GuTenjp+/PDmuA3w/m6bY4ied/+ChG0kxVfnb55RSm6bqto3/P2VM0TcU0BkuNedb
	 WVt7/eu4TgBSCWJXBqXd3/UjgfvkleloQu+N2aL6vznjDNhEZiLMhm8d2YiXZJmSwE
	 LF/WptDGOADfJFGZ1KLF5Bud3QyN0UsmyRBHVhJTPyeAF0zYYtnf+jDhGQMA3GIhjo
	 nUoC+w8o93Gmh5hHKPYPtx8ByCQ1Qz0HybaTDf24q0oxL4ZT8i9xX4m7poXJS7WtqU
	 VRbfwIVF7EL2w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Leo Stone <leocstone@gmail.com>,
	syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v3 RESEND] f2fs: add check for deleted inode
Date: Tue, 11 Feb 2025 15:17:25 +0800
Message-ID: <20250211071725.457343-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Stone <leocstone@gmail.com>

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

[Chao Yu: rebase the code]
Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Signed-off-by: Leo Stone <leocstone@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
- no logic change, just rebase the code to last dev-test branch
 fs/f2fs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index d6ad7810df69..543fb942bec1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -386,6 +386,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
+	if (inode->i_nlink == 0) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.48.1.502.g6dc24dfdaf-goog

