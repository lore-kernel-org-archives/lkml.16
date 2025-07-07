Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485921C177
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878092; cv=none; b=uzTonkvHopJCWesQifqYEjoiod4yZkqAwz8A0Jqc+gWJLx5Tfb321K1mwHqhrw8CKmsKOwTe6JjglI+mp7o0DhaE/bK+54PRK4M5WXAJyvQLje9HE9dMRL42MALXkUXXuwqK9JYphM9Wg04nWt8c0Ae35gSyqE3AdG5B6ZThUh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878092; c=relaxed/simple;
	bh=oVV3xpo31SuKpKGf6jP/JxKf852sahckvpzf6m9nad4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5O714weBW5OPpxkg8DTQfFVZk3uaYJGUgMe9AYWhzWZAtPyakvKv9BBh/uILvxk4Q69pYh7rFIeBoWRW4cxnX/bSMr4oDBr/0pPN7f2la3rBxq6oKBTgNb+IYfBS7xpenlKAjHtA4w+mNHAUj3kpYBT4zpg5a/YHRqdRZtd59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md5D2fuY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md5D2fuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D371C4CEE3;
	Mon,  7 Jul 2025 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751878091;
	bh=oVV3xpo31SuKpKGf6jP/JxKf852sahckvpzf6m9nad4=;
	h=From:To:Cc:Subject:Date:From;
	b=Md5D2fuYyaOC/J7VhAHxffG3HFIHZzoc4oa63FZXEH9pndvWVnIaM2aCvbrl0C5UT
	 r2TJ4zhTDQ/XVUDS90XObwjcjHgvJuNmlHYzp6zTN4Djjfz8mgrpDSNcI7QEOW2Sg4
	 A8cpCv2whmrZ+O8Q6w6twWJi5vR4gF+FhcavFhREJapa3i+V9uU4/HJjhYNsCn1Q2h
	 4qUjXx6atFA7JmLO0a+ZeGKMHD7cv79QvgWclwrCOzSxA30GSU+qIQbUNXZBpEXf6w
	 jVGbwlJXEA5XOACSsGy6Cdsxsb3959ib2bkdzgpmOIq4R8Jabsms24EdmilkQSy/VN
	 cxzlzfeC/yvlA==
From: Chao Yu <chao@kernel.org>
To: xiang@kernel.org
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] erofs: do sanity check on m->type in z_erofs_load_compact_lcluster()
Date: Mon,  7 Jul 2025 16:47:23 +0800
Message-ID: <20250707084723.2725437-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All below functions will do sanity check on m->type, let's move sanity
check to z_erofs_load_compact_lcluster() for cleanup.
- z_erofs_map_blocks_fo
- z_erofs_get_extent_compressedlen
- z_erofs_get_extent_decompressedlen
- z_erofs_extent_lookback

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/erofs/zmap.c | 60 ++++++++++++++++++-------------------------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 0bebc6e3a4d7..e530b152e14e 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -240,6 +240,13 @@ static int z_erofs_load_compact_lcluster(struct z_erofs_maprecorder *m,
 static int z_erofs_load_lcluster_from_disk(struct z_erofs_maprecorder *m,
 					   unsigned int lcn, bool lookahead)
 {
+	if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
+		erofs_err(m->inode->i_sb, "unknown type %u @ lcn %u of nid %llu",
+				m->type, lcn, EROFS_I(m->inode)->nid);
+		DBG_BUGON(1);
+		return -EOPNOTSUPP;
+	}
+
 	switch (EROFS_I(m->inode)->datalayout) {
 	case EROFS_INODE_COMPRESSED_FULL:
 		return z_erofs_load_full_lcluster(m, lcn);
@@ -265,12 +272,7 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
 		if (err)
 			return err;
 
-		if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
-			erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
-				  m->type, lcn, vi->nid);
-			DBG_BUGON(1);
-			return -EOPNOTSUPP;
-		} else if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
+		if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
 			lookback_distance = m->delta[0];
 			if (!lookback_distance)
 				break;
@@ -333,17 +335,13 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
 		}
 		if (m->compressedblks)
 			goto out;
-	} else if (m->type < Z_EROFS_LCLUSTER_TYPE_MAX) {
-		/*
-		 * if the 1st NONHEAD lcluster is actually PLAIN or HEAD type
-		 * rather than CBLKCNT, it's a 1 block-sized pcluster.
-		 */
-		m->compressedblks = 1;
-		goto out;
 	}
-	erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
-	DBG_BUGON(1);
-	return -EFSCORRUPTED;
+
+	/*
+	 * if the 1st NONHEAD lcluster is actually PLAIN or HEAD type rather
+	 * than CBLKCNT, it's a 1 block-sized pcluster.
+	 */
+	m->compressedblks = 1;
 out:
 	m->map->m_plen = erofs_pos(sb, m->compressedblks);
 	return 0;
@@ -379,11 +377,6 @@ static int z_erofs_get_extent_decompressedlen(struct z_erofs_maprecorder *m)
 			if (lcn != headlcn)
 				break;	/* ends at the next HEAD lcluster */
 			m->delta[1] = 1;
-		} else {
-			erofs_err(inode->i_sb, "unknown type %u @ lcn %llu of nid %llu",
-				  m->type, lcn, vi->nid);
-			DBG_BUGON(1);
-			return -EOPNOTSUPP;
 		}
 		lcn += m->delta[1];
 	}
@@ -429,10 +422,7 @@ static int z_erofs_map_blocks_fo(struct inode *inode,
 	map->m_flags = EROFS_MAP_MAPPED | EROFS_MAP_ENCODED;
 	end = (m.lcn + 1ULL) << lclusterbits;
 
-	switch (m.type) {
-	case Z_EROFS_LCLUSTER_TYPE_PLAIN:
-	case Z_EROFS_LCLUSTER_TYPE_HEAD1:
-	case Z_EROFS_LCLUSTER_TYPE_HEAD2:
+	if (m.type != Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
 		if (endoff >= m.clusterofs) {
 			m.headtype = m.type;
 			map->m_la = (m.lcn << lclusterbits) | m.clusterofs;
@@ -443,7 +433,7 @@ static int z_erofs_map_blocks_fo(struct inode *inode,
 			 */
 			if (ztailpacking && end > inode->i_size)
 				end = inode->i_size;
-			break;
+			goto map_block;
 		}
 		/* m.lcn should be >= 1 if endoff < m.clusterofs */
 		if (!m.lcn) {
@@ -455,19 +445,13 @@ static int z_erofs_map_blocks_fo(struct inode *inode,
 		end = (m.lcn << lclusterbits) | m.clusterofs;
 		map->m_flags |= EROFS_MAP_FULL_MAPPED;
 		m.delta[0] = 1;
-		fallthrough;
-	case Z_EROFS_LCLUSTER_TYPE_NONHEAD:
-		/* get the corresponding first chunk */
-		err = z_erofs_extent_lookback(&m, m.delta[0]);
-		if (err)
-			goto unmap_out;
-		break;
-	default:
-		erofs_err(sb, "unknown type %u @ offset %llu of nid %llu",
-			  m.type, ofs, vi->nid);
-		err = -EOPNOTSUPP;
-		goto unmap_out;
 	}
+
+	/* get the corresponding first chunk */
+	err = z_erofs_extent_lookback(&m, m.delta[0]);
+	if (err)
+		goto unmap_out;
+map_block:
 	if (m.partialref)
 		map->m_flags |= EROFS_MAP_PARTIAL_REF;
 	map->m_llen = end - map->m_la;
-- 
2.49.0

