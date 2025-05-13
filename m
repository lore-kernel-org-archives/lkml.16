Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8328D8D9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135550; cv=none; b=RpHfM4kLCXwZhGNDwReZYPSDvbVuJH73M7jW7/GSJF6ab2XCvHd8pKHAWaJ40qwHMpOqf1biM+40YB5CvdRqm4jjVO6tpSKU8xYkh0Lg5IOZASW+CrLmq69Vk/iu3a4cUiGDExJSKXXq2dkRfOgibBr11BlPhR018sZLcDbdYsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135550; c=relaxed/simple;
	bh=0J3AmpgxrgdihS47fcOtQKkWG6kAzIX6hHAOFnABgjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5xb6BoaVrcB6kxJ6Zj3/iH9oxWo41gWOC3N1U/84FGL22GeMwQ2aL8TZ9eRdQIVvxN5yPEfiujTgkfJA7O0dzwOMf5zdPiaa//ujnYVifGtRY+YWLvzy+XqxT5lCmJq1hZkkhh+c2cgMT2nMqFWAZmOGxApJcxdhQxIgY5LCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv7AnWOn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv7AnWOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B1BC4CEE4;
	Tue, 13 May 2025 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747135549;
	bh=0J3AmpgxrgdihS47fcOtQKkWG6kAzIX6hHAOFnABgjs=;
	h=From:To:Cc:Subject:Date:From;
	b=nv7AnWOn3KDpGOErXfMiQXqw3XPiFemukNgTp2oJ6mQW0N00GCsqickpFLsm1tRQC
	 kGKxp9w0NOIH7QV3js5sNOkkzZ+YUVr0KNq0kN/Kul3D9O9AICYm/pp/WqkzwGfs5x
	 om+cjrv+s1+QdgWTiCeb2/xWoEJIg/dTEPivNKwMMjKnkiITGURGCrjNDIMImtyW3o
	 qUIsnCXryaASPU+VNHgTL7PTzwB9v343TXM7BWhDbTUStZogqGfWId8tr7XzrFpBCj
	 CrjJPDqVh15FlPjX9ekDDthbibf/sjkkcua1kKwHqFkLjQAU8nEJg0Vi4KN6iPT3AO
	 tQ6TyWTkfa02w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: don't over-report free space or inodes in statvfs
Date: Tue, 13 May 2025 19:25:38 +0800
Message-ID: <20250513112538.2999915-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes an analogus bug that was fixed in modern filesystems:
a) xfs in commit 4b8d867ca6e2 ("xfs: don't over-report free space or
inodes in statvfs")
b) ext4 in commit f87d3af74193 ("ext4: don't over-report free space
or inodes in statvfs")
where statfs can report misleading / incorrect information where
project quota is enabled, and the free space is less than the
remaining quota.

This commit will resolve a test failure in generic/762 which tests
for this bug.

generic/762       - output mismatch (see /share/git/fstests/results//generic/762.out.bad)
    --- tests/generic/762.out   2025-04-15 10:21:53.371067071 +0800
    +++ /share/git/fstests/results//generic/762.out.bad 2025-05-13 16:13:37.000000000 +0800
    @@ -6,8 +6,10 @@
     root blocks2 is in range
     dir blocks2 is in range
     root bavail2 is in range
    -dir bavail2 is in range
    +dir bavail2 has value of 1539066
    +dir bavail2 is NOT in range 304734.87 .. 310891.13
     root blocks3 is in range
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/762.out /share/git/fstests/results//generic/762.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      XXXXXXXXXXXXXX xfs: don't over-report free space or inodes in statvfs

Cc: stable@kernel.org
Fixes: ddc34e328d06 ("f2fs: introduce f2fs_statfs_project")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 32f2abac19cf..da64760af74b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2069,26 +2069,32 @@ static int f2fs_statfs_project(struct super_block *sb,
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
 					dquot->dq_dqb.dqb_bhardlimit);
-	if (limit)
-		limit >>= sb->s_blocksize_bits;
+	limit >>= sb->s_blocksize_bits;
+
+	if (limit) {
+		uint64_t remaining = 0;
 
-	if (limit && buf->f_blocks > limit) {
 		curblock = (dquot->dq_dqb.dqb_curspace +
 			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
-		buf->f_blocks = limit;
-		buf->f_bfree = buf->f_bavail =
-			(buf->f_blocks > curblock) ?
-			 (buf->f_blocks - curblock) : 0;
+		if (limit > curblock)
+			remaining = limit - curblock;
+
+		buf->f_blocks = min(buf->f_blocks, limit);
+		buf->f_bfree = min(buf->f_bfree, remaining);
+		buf->f_bavail = min(buf->f_bavail, remaining);
 	}
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_isoftlimit,
 					dquot->dq_dqb.dqb_ihardlimit);
 
-	if (limit && buf->f_files > limit) {
-		buf->f_files = limit;
-		buf->f_ffree =
-			(buf->f_files > dquot->dq_dqb.dqb_curinodes) ?
-			 (buf->f_files - dquot->dq_dqb.dqb_curinodes) : 0;
+	if (limit) {
+		uint64_t remaining = 0;
+
+		if (limit > dquot->dq_dqb.dqb_curinodes)
+			remaining = limit - dquot->dq_dqb.dqb_curinodes;
+
+		buf->f_files = min(buf->f_files, limit);
+		buf->f_ffree = min(buf->f_ffree, remaining);
 	}
 
 	spin_unlock(&dquot->dq_dqb_lock);
-- 
2.49.0

