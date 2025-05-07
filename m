Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE228189B8C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617075; cv=none; b=RmcALlJPnCK0TE4lpXJ9xZUzlgg1ytTjtFzq5BCkiOBF836EEPqnzHLoeX7uyLt374rP1+lFvz0XY6sbx6LxTORKaNjpoa6IrMTux+LOkUv93DmIecGAMBxi8wNSEYT/53aXXqQO1rbf7UQ3AkoynR6kYguNSEfz9RCdSG+KDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617075; c=relaxed/simple;
	bh=G1OpaFH341mKUya6UEBR/eabLctftXEu94N55ZxeP7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYerNZ79/jQqo5s+V5fsI6V3w1E3tOo0BLE+2iG1XpBUNv1DRUBMTfLopL9nw/RldfFOA2aGSD1SF3f5v9O/ZgyyWC/1SRo6dPih9er0QtCtD7/yfnVyhoPARLXgnesN/vyFrF+jViZ9xodiXjM0IJKiCo/WJ0+0VkfgiPRgJT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qU7YTo40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qU7YTo40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDBDC4CEE7;
	Wed,  7 May 2025 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617075;
	bh=G1OpaFH341mKUya6UEBR/eabLctftXEu94N55ZxeP7M=;
	h=From:To:Cc:Subject:Date:From;
	b=qU7YTo40uZpmbj+qAGAFSGVxiBARtad3AgWpiPQvhAozDP5+JrrczOupNRlpp8hKE
	 HnYsGCoYLXF7hYg48Co5nh5Q9LdVflSCIDZqeCYYSfnLXno7vgROV9DabsuayAzv4q
	 QSlxvotEGWWB7tVvDTuqy8E46zg32uJ7Ft9AoMWdJHTIHRHiRg9ky5+2z1WUXZKOX1
	 A0G/qAdyuTZ3/DU9dTeN00Ror1O9DhSCSguBj1UikUlp1iqHO01AfRZ/g5vNnxA3hL
	 QB2Yj7FMsqvwVDNMK7ijzPYHb6gQFWmUc2B7/Ol5WtV404rzpqQZqj44/2FPrQa+PA
	 kP+C/sk3UTojg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: use unsigned int type for severial mount option variables
Date: Wed,  7 May 2025 19:24:25 +0800
Message-ID: <20250507112425.939246-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

active_logs, inline_xattr_size, f2fs_fault_info.inject_rate in struct
f2fs_mount_info should never be negative, change its type from int to
unsigned int.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 12 ++++++------
 fs/f2fs/inode.c |  2 +-
 fs/f2fs/super.c |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6fa900600826..85d1c92aa6c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -77,7 +77,7 @@ enum fault_option {
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 struct f2fs_fault_info {
 	atomic_t inject_ops;
-	int inject_rate;
+	unsigned int inject_rate;
 	unsigned int inject_type;
 	/* Used to account total count of injection for each type */
 	unsigned int inject_count[FAULT_MAX];
@@ -173,8 +173,8 @@ struct f2fs_mount_info {
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
-	int active_logs;		/* # of active logs */
-	int inline_xattr_size;		/* inline xattr size */
+	unsigned int active_logs;	/* # of active logs */
+	unsigned int inline_xattr_size;	/* inline xattr size */
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	struct f2fs_fault_info fault_info;	/* For fault injection */
 #endif
@@ -498,7 +498,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
-static inline int get_inline_xattr_addrs(struct inode *inode);
+static inline unsigned int get_inline_xattr_addrs(struct inode *inode);
 #define MAX_INLINE_DATA(inode)	(sizeof(__le32) *			\
 				(CUR_ADDRS_PER_INODE(inode) -		\
 				get_inline_xattr_addrs(inode) -	\
@@ -890,7 +890,7 @@ struct f2fs_inode_info {
 
 	int i_extra_isize;		/* size of extra space located in i_addr */
 	kprojid_t i_projid;		/* id for project quota */
-	int i_inline_xattr_size;	/* inline xattr size */
+	unsigned int i_inline_xattr_size;/* inline xattr size */
 	struct timespec64 i_crtime;	/* inode creation time */
 	struct timespec64 i_disk_time[3];/* inode disk times */
 
@@ -3552,7 +3552,7 @@ static inline int get_extra_isize(struct inode *inode)
 	return F2FS_I(inode)->i_extra_isize / sizeof(__le32);
 }
 
-static inline int get_inline_xattr_addrs(struct inode *inode)
+static inline unsigned int get_inline_xattr_addrs(struct inode *inode)
 {
 	return F2FS_I(inode)->i_inline_xattr_size;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 747857a5b143..137e1458bbef 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -321,7 +321,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		f2fs_has_inline_xattr(inode) &&
 		(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
 		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
-		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %u, min: %zu, max: %lu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
 			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
 		return false;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b86e42b43ef1..ec296d5d0fd7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -79,10 +79,10 @@ int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 	}
 
 	if (fo & FAULT_RATE) {
-		if (rate > INT_MAX)
+		if (rate > UINT_MAX)
 			return -EINVAL;
 		atomic_set(&ffi->inject_ops, 0);
-		ffi->inject_rate = (int)rate;
+		ffi->inject_rate = (unsigned int)rate;
 		f2fs_info(sbi, "build fault injection rate: %lu", rate);
 	}
 
@@ -1379,7 +1379,7 @@ static int f2fs_default_check(struct f2fs_sb_info *sbi)
 #endif
 
 	if (test_opt(sbi, INLINE_XATTR_SIZE)) {
-		int min_size, max_size;
+		unsigned int min_size, max_size;
 
 		if (!f2fs_sb_has_extra_attr(sbi) ||
 			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
@@ -1396,7 +1396,7 @@ static int f2fs_default_check(struct f2fs_sb_info *sbi)
 
 		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
 				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
-			f2fs_err(sbi, "inline xattr size is out of range: %d ~ %d",
+			f2fs_err(sbi, "inline xattr size is out of range: %u ~ %u",
 				 min_size, max_size);
 			return -EINVAL;
 		}
-- 
2.49.0

