Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83DB2918E1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050889; cv=none; b=CTOUvFT+huIeIl6UnecXoh8YmvmGJGD+r5ATd/2eqp5t6DRUE5K6t4QnSB9f+GqyU9WvNKssEHbeiQjblAePUYeS9vYgUK9KGL5MU6+xQ+ORARxd+25YXN6wfKKcNXtydm9DC9zBedC/yIu6yMhbHY8/rggWzwZwI9h/4S3eLvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050889; c=relaxed/simple;
	bh=imZd+snmvTi/00ygIwFHn0Eml64SD/qajsidfFNZM4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OltqncuQ/fkFQnralppplCC5oAShWr/dlvEOxcp4Redf9Jpv/zx+9SzgxykACcWUc+H0Fmwr7GXgUEudjtvskglOKbT4csbcxJ/l5X9I1wSix2j4d1h2xjEO9Frke9D6SEvNhh5LsjfJOyQc4kDRRevaqhMak2789ivnzuKbhZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db7OJiMs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db7OJiMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26715C4CEE7;
	Mon, 12 May 2025 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050889;
	bh=imZd+snmvTi/00ygIwFHn0Eml64SD/qajsidfFNZM4k=;
	h=From:To:Cc:Subject:Date:From;
	b=Db7OJiMscqVE2RR4NfabqtH95E6D6LEX+dBY3IFVJ4oBCFK1cti3wqTJ7EM1/FZZu
	 s/CJmgm1Z1yeN7Jc35YPD6b8IAjy84yy5WxNa1Zrh2w9Zu2rG9237ZtnZsaCBDKpaU
	 CU4Pjh24PkuyNTZ0w0jbAAEIw+ms5SZY+gS93mtYeTJG056cTg5qTrPlWXytnQMia7
	 nSR13UKupoR3f50L0+e1kP8AVa/SvNAwmJHI5q95QNxHx1ZclJxTGOKBUews5tcJX5
	 ge4x8w1jBtbzn+GK1k/zXMeFh3ev5ddq2/g12plwD10wCaiz1McTdlm2kOSHjInk8P
	 hMMaZ8x4PoJVQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/2] f2fs: add f2fs_bug_on() to detect potential bug
Date: Mon, 12 May 2025 19:54:41 +0800
Message-ID: <20250512115442.2640895-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add f2fs_bug_on() to check whether memory preallocation will fail or
not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 4 +++-
 fs/f2fs/node.c       | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index e7907858eb70..3f223bade520 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -504,6 +504,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
 {
 	struct inode_management *im = &sbi->im[type];
 	struct ino_entry *e = NULL, *new = NULL;
+	int ret;
 
 	if (type == FLUSH_INO) {
 		rcu_read_lock();
@@ -516,7 +517,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
 		new = f2fs_kmem_cache_alloc(ino_entry_slab,
 						GFP_NOFS, true, NULL);
 
-	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	f2fs_bug_on(sbi, ret);
 
 	spin_lock(&im->ino_lock);
 	e = radix_tree_lookup(&im->ino_root, ino);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3f6b8037d25f..88d3032236cb 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2309,7 +2309,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct free_nid *i, *e;
 	struct nat_entry *ne;
-	int err = -EINVAL;
+	int err;
 	bool ret = false;
 
 	/* 0 nid should not be used */
@@ -2323,7 +2323,10 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 	i->nid = nid;
 	i->state = FREE_NID;
 
-	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	err = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	f2fs_bug_on(sbi, err);
+
+	err = -EINVAL;
 
 	spin_lock(&nm_i->nid_list_lock);
 
-- 
2.49.0

