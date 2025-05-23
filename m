Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A47D098
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985590; cv=none; b=trqt6To6aECCXo+rMjE5II7oPw/OCFkoQwIBfPzAjMpk5/coYf+AFYbxqaIoPgRNrzR8mizQi3ZhW94eh2GYbXXxijtBJpyY4R2yRZCcHl8TrC7T8mgVeBUPpwoP3QJwT83RYVBw4z7V5O9z9sDkzLFpsTF09eLnokOZKxNe1oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985590; c=relaxed/simple;
	bh=pFnEr6hyNcgHZPVE1y0sFt2psdOkxyQ/M8O3rUFymBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQkKb20RaY+nmdgiT23k0C83yjxwN1qfWGMeLGQ41NFJWb1l6B1KJqRdAh2O0aPtiPmY/8kMosC1B6dg1HlOIOm777CJzrGBte3+6Ez32jJQKBQu5PIxT5HnUo2r9Jw0zgzEfow/aWoOJH+sLgfQsex2TlN+UHlmlsYxywoLfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUEN732j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUEN732j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF43C4CEE9;
	Fri, 23 May 2025 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747985589;
	bh=pFnEr6hyNcgHZPVE1y0sFt2psdOkxyQ/M8O3rUFymBw=;
	h=From:To:Cc:Subject:Date:From;
	b=QUEN732j9i1x60vsIJjbh9rh/IJSccpyrHjJwLMrPXePPEuaL1gwosehnYT4YHNFY
	 ++D2TPKIKMSssN30c2/Ly+v9zfEsOSHruTEOBBHsjqT9cLTscnZumxmvuHsNwJG6Qu
	 qBpijUzM/gEcYGaznXhgVdJRAXX2Dr22pZuzzAWjGvbRlusVwyiSwVYm/QIGB/WFf1
	 yx/9Mjk/+sXwc6VSikqgvXoLIwukl6wVyex07XdtaGn1LPuU0TkvLo4BtYAlaExe0a
	 l0xhTRGqPffBPEl08ezAHgrobHHBPsaAh60oeBeS4046cJ61XdjHMN5yZ6maT2miKr
	 xGP78/E5WF4RQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/2] f2fs: introduce is_{meta,node}_folio
Date: Fri, 23 May 2025 15:33:03 +0800
Message-ID: <20250523073304.1454247-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just cleanup, no changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/data.c       |  2 +-
 fs/f2fs/f2fs.h       | 13 +++++++++++--
 fs/f2fs/gc.c         |  2 +-
 fs/f2fs/node.c       | 18 +++++++++---------
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 164b7719f365..f149ec28aefd 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -93,7 +93,7 @@ static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
 	f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE);
 
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping)) {
+	if (unlikely(!is_meta_folio(folio))) {
 		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
@@ -439,7 +439,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != mapping)) {
+			if (unlikely(!is_meta_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8d8018083c31..1be38186076d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -354,7 +354,7 @@ static void f2fs_write_end_io(struct bio *bio)
 						STOP_CP_REASON_WRITE_FAIL);
 		}
 
-		f2fs_bug_on(sbi, folio->mapping == NODE_MAPPING(sbi) &&
+		f2fs_bug_on(sbi, is_node_folio(folio) &&
 				folio->index != nid_of_node(&folio->page));
 
 		dec_page_count(sbi, type);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e0196c285ad1..9333a22b9a01 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2088,6 +2088,16 @@ static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
 	return sbi->node_inode->i_mapping;
 }
 
+static inline bool is_meta_folio(struct folio *folio)
+{
+	return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
+}
+
+static inline bool is_node_folio(struct folio *folio)
+{
+	return folio->mapping == NODE_MAPPING(F2FS_F_SB(folio));
+}
+
 static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	return test_bit(type, &sbi->s_flag);
@@ -3738,8 +3748,7 @@ struct node_info;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi,
-		const struct folio *folio);
+bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
 void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3ff74267b52a..8b8025772340 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1382,7 +1382,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 							F2FS_BLKSIZE);
 
 		folio_lock(mfolio);
-		if (unlikely(mfolio->mapping != META_MAPPING(fio.sbi) ||
+		if (unlikely(!is_meta_folio(mfolio) ||
 			     !folio_test_uptodate(mfolio))) {
 			err = -EIO;
 			f2fs_folio_put(mfolio, true);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 88d3032236cb..1cb4cba7f961 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -310,10 +310,10 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 							start, nr);
 }
 
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, const struct folio *folio)
+bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	return NODE_MAPPING(sbi) == folio->mapping &&
-			IS_DNODE(&folio->page) && is_cold_node(&folio->page);
+	return is_node_folio(folio) && IS_DNODE(&folio->page) &&
+					is_cold_node(&folio->page);
 }
 
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
@@ -1222,7 +1222,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 			goto fail;
 		if (offset[1] == 0 && get_nid(&folio->page, offset[0], true)) {
 			folio_lock(folio);
-			BUG_ON(folio->mapping != NODE_MAPPING(sbi));
+			BUG_ON(!is_node_folio(folio));
 			set_nid(folio, offset[0], 0, true);
 			folio_unlock(folio);
 		}
@@ -1507,7 +1507,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 
 	folio_lock(folio);
 
-	if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+	if (unlikely(!is_node_folio(folio))) {
 		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
@@ -1625,7 +1625,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(!is_node_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
@@ -1834,7 +1834,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(!is_node_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
@@ -1969,7 +1969,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi)))
+			if (unlikely(!is_node_folio(folio)))
 				goto unlock;
 			if (!folio_test_dirty(folio))
 				goto unlock;
@@ -2041,7 +2041,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			else if (!folio_trylock(folio))
 				continue;
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(!is_node_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
-- 
2.49.0

