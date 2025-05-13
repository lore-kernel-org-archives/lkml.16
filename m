Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA41E8328
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115853; cv=none; b=CRmu0kwv5Fa5gpKGYA9tElxWjmS8mwB8LtPaPFOKULO3ZcgEX3MxCqvjRzbMhRdihI/3lwRd/ORX4EL74of4qJ6AcWiZwdYfsUK646zdUDbGbiqtbw+u8D7mBLVKyy06yqev5B8m2oc0NmZjAhb6Bp0/xQ0h1GAR3ta2LczxdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115853; c=relaxed/simple;
	bh=6JdgKPvcId4fCWzb6BG+UUXHnkY1ko2PixZoQLW9HDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGTH+1BtUAWyuB7xNT5nwCHH60eFbrG1w7whGoUOOa7QBo22UZI8zEyUGK42k+kt/88wjFayOL8+WI7nRUQV9vHaTSyBW4BXeJywLPwIwLa1O7s2KBeaSKwNlaV6nTCwfbPiCpcXhycK/Z5vvlaf7wXEy/8Ud51byGaQGlvuSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abvSqW+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abvSqW+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D13C4CEEF;
	Tue, 13 May 2025 05:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747115853;
	bh=6JdgKPvcId4fCWzb6BG+UUXHnkY1ko2PixZoQLW9HDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=abvSqW+yGARp0WlPZZp1A7KWCPolmDsob66HnuAcjSJhvdTWNIWA16VxXx6liEkbA
	 0WHASlMZFtFiJ5Sl7nOiX7ix4sYmNjGfOeMjOzP2kHsyCkcyEYGyl1rBaSPYJEmLfp
	 R7vRqgZ9eDM8YPj29i1Az6b6Hf2tNGROFzJIEA8UaQvo7vEknra9V0U4nN5uR7V4lS
	 6i5JZdvZFYIrjAQFXF0ePUkO7ZxPAlp3yUTZSzU1LbxPD3MHHuwpbcrVoNDgAPNwJc
	 PfQBq4YqeZ8qm3PHWWBY9VcN9QCGR2uUgdjdjYw2FMFBggxIGrvpevAx1ucPSIzFQ+
	 S5l1M7f4e0HUA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: introduce FAULT_VMALLOC
Date: Tue, 13 May 2025 13:57:21 +0800
Message-ID: <20250513055721.2918793-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250513055721.2918793-1-chao@kernel.org>
References: <20250513055721.2918793-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new fault type FAULT_VMALLOC to simulate no memory error in
f2fs_vmalloc().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/compress.c                      | 9 +++++----
 fs/f2fs/f2fs.h                          | 6 +++++-
 fs/f2fs/super.c                         | 1 +
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index e060798f9fc1..bf03263b9f46 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -736,6 +736,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_NO_SEGMENT                 0x00100000
 		FAULT_INCONSISTENT_FOOTER        0x00200000
 		FAULT_TIMEOUT                    0x00400000 (1000ms)
+		FAULT_VMALLOC                    0x00800000
 		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 724fc5e2889a..440e4ae74e44 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -208,6 +208,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_NO_SEGMENT                 0x00100000
 			 FAULT_INCONSISTENT_FOOTER        0x00200000
 			 FAULT_TIMEOUT                    0x00400000 (1000ms)
+			 FAULT_VMALLOC                    0x00800000
 			 ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 37d18e2a3327..2a9f7b68a6c6 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -180,7 +180,8 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
 #ifdef CONFIG_F2FS_FS_LZO
 static int lzo_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_vmalloc(LZO1X_MEM_COMPRESS);
+	cc->private = f2fs_vmalloc(F2FS_I_SB(cc->inode),
+					LZO1X_MEM_COMPRESS);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -247,7 +248,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 		size = LZ4HC_MEM_COMPRESS;
 #endif
 
-	cc->private = f2fs_vmalloc(size);
+	cc->private = f2fs_vmalloc(F2FS_I_SB(cc->inode), size);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -343,7 +344,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	params = zstd_get_params(level, cc->rlen);
 	workspace_size = zstd_cstream_workspace_bound(&params.cParams);
 
-	workspace = f2fs_vmalloc(workspace_size);
+	workspace = f2fs_vmalloc(F2FS_I_SB(cc->inode), workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
@@ -423,7 +424,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	workspace_size = zstd_dstream_workspace_bound(max_window_size);
 
-	workspace = f2fs_vmalloc(workspace_size);
+	workspace = f2fs_vmalloc(F2FS_I_SB(dic->inode), workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6e9615b5cdc3..bf6056aa09d8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -64,6 +64,7 @@ enum {
 	FAULT_NO_SEGMENT,
 	FAULT_INCONSISTENT_FOOTER,
 	FAULT_TIMEOUT,
+	FAULT_VMALLOC,
 	FAULT_MAX,
 };
 
@@ -3540,8 +3541,11 @@ static inline void *f2fs_kvzalloc(struct f2fs_sb_info *sbi,
 	return f2fs_kvmalloc(sbi, size, flags | __GFP_ZERO);
 }
 
-static inline void *f2fs_vmalloc(size_t size)
+static inline void *f2fs_vmalloc(struct f2fs_sb_info *sbi, size_t size)
 {
+	if (time_to_inject(sbi, FAULT_VMALLOC))
+		return NULL;
+
 	return vmalloc(size);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1860edc2a8fb..32f2abac19cf 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -68,6 +68,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_NO_SEGMENT]		= "no free segment",
 	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
 	[FAULT_TIMEOUT]			= "timeout",
+	[FAULT_VMALLOC]			= "vmalloc",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.49.0

