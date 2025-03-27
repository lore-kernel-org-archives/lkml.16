Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A110118027
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054973; cv=none; b=PQu7o+GTp9mWks/DFYA5uViKWsnKt1/AMtB55KVZMQ9cZctKufpmleRXYRKCWpyBqs0subc7voZw7iBbNhyBMquybEMCfnuQ6Od1pzQUzr9tnk1CzTmxUAe7dy7/qLWgoD8tX6yPDdnYymJpnU9ZlE+pYoiDBr+XeIWnh6YyEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054973; c=relaxed/simple;
	bh=kzVQuhM8HNq6HB+zH3zhK1FJCA9jLeLqGr1XbqTZzNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlgqN7rNk5yhT5nKafPQPQbQqTzEEIPdzqhbvwvfAEQZyyaZtVrIQqK7CB0w9UmgItStBbqQBEBp6Y59ZooLTY+99SwH3/rODMVU2/0eEv0px1pypRM2WAgWpvGWq83MyXjhNYmveMRt7Tudrz6K6mbDs4+qE/hyw8Hy9IvC02Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9/Qhrtd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9/Qhrtd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E22C4CEDD;
	Thu, 27 Mar 2025 05:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743054973;
	bh=kzVQuhM8HNq6HB+zH3zhK1FJCA9jLeLqGr1XbqTZzNY=;
	h=From:To:Cc:Subject:Date:From;
	b=q9/Qhrtd5LMnHY5gfIkFUKfLNOhMbXh0GQ4fIRWEhDExdG7ZKvbuLTTpjp8/4NVJ6
	 r6KgNugT1d9vVnReIma6LDZ9htDkBbgCAckc2q6LeC9pdpyFwlKl8jGZXt+bJjYjUY
	 ZKjZSGB3zGGGXKtzT5nTRkpuiBuSRJxwqJlYmBBYAFLtBLiPKvU16EAipHNo10dHYy
	 Jx2UlusCYOGEneJApbRT8sh9kRtGuEG/ESR34fr796I/67b98DhbMkoJ8KPGE8KJTL
	 ZRdANEKbpvp7sTBnV56xU+PEXI5YuYS/4b1N99m8Vp5pF4tRM2UPb9Vr0C+yJYGLKq
	 2FyDaHQkv/I8w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daehojeong@google.com>,
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: [PATCH] f2fs: fix to set atomic write status more clear
Date: Thu, 27 Mar 2025 13:56:06 +0800
Message-ID: <20250327055607.3829954-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. After we start atomic write in a database file, before committing
all data, we'd better not set inode w/ vfs dirty status to avoid
redundant updates, instead, we only set inode w/ atomic dirty status.

2. After we commit all data, before committing metadata, we need to
clear atomic dirty status, and set vfs dirty status to allow vfs flush
dirty inode.

Cc: Daeho Jeong <daehojeong@google.com>
Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c   | 4 +++-
 fs/f2fs/segment.c | 6 ++++++
 fs/f2fs/super.c   | 4 +++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 5c8634eaef7b..f5991e8751b9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -34,7 +34,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;
 
-	if (f2fs_is_atomic_file(inode))
+	/* only atomic file w/ FI_ATOMIC_COMMITTED can be set vfs dirty */
+	if (f2fs_is_atomic_file(inode) &&
+			!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
 		return;
 
 	mark_inode_dirty_sync(inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dc360b4b0569..7c113b446f63 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -376,7 +376,13 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
 		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
+
+		/*
+		 * inode may has no FI_ATOMIC_DIRTIED flag due to no write
+		 * before commit.
+		 */
 		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
+			/* clear atomic dirty status and set vfs dirty status */
 			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
 			f2fs_mark_inode_dirty_sync(inode, true);
 		}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9a42a1323f42..a5cc9f6ee16a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1532,7 +1532,9 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
 	}
 	spin_unlock(&sbi->inode_lock[DIRTY_META]);
 
-	if (!ret && f2fs_is_atomic_file(inode))
+	/* if atomic write is not committed, set inode w/ atomic dirty */
+	if (!ret && f2fs_is_atomic_file(inode) &&
+			!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
 		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
 
 	return ret;
-- 
2.49.0

