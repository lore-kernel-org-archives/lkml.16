Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24251D5AB5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115851; cv=none; b=DWg081SgT06NuLZivyi9rCs79ovnlJn+ah6KoFEZnFzl7Lhf1cRnzvUxOW4nqtnzASap1kPHXZaIya9tuaYewu1JOhbNf2T9SIC7btwbYNwJOcX2A/2TYDn9LMRE/g/sbKWMmZd/waS+j9LpxaHbQAA9Zr9se13wD1mpeB+gR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115851; c=relaxed/simple;
	bh=iq+7sAV+6RDxSZB8XPVBWlfciYrmYjDZSlRq1eox6e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMa2+em9Qxdhv08f8+RhOiFzvkmJPcFbrDx7SVK+tn8bSiIFaSrVkEjy9A4k4J32FxDWL/cUVveLc/0FKbqVGAlQxrrUnzcOEZrsiLnPTshxaWp2sgUkWNFNXUm5CAfZsET/zrhsGw+h9dGJXs6Hi7QxphrKfc9YdY2fUIK5em8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR2208kO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR2208kO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978D4C4CEE4;
	Tue, 13 May 2025 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747115851;
	bh=iq+7sAV+6RDxSZB8XPVBWlfciYrmYjDZSlRq1eox6e4=;
	h=From:To:Cc:Subject:Date:From;
	b=jR2208kOy0lCeh+X47FR2M8P9fE9KStEbZUUjbjlXlSv9LVScQ0jbyvuppU2Qcd3K
	 iM+RVstu/TxTT7/W5Ontn+zw2rpev2eXY9XE1CEypXI9QsTlbhUnTiJNTfyKJAstGo
	 UyfWiUxtPG1EBVLT/PVoqcFAZq78jkCH64UgrTNoY2FpCAU3XXCBoaq1U2oWrE8UVM
	 X/rHAMWgnBxfHMb2Zlwxzy6KObNe8qSV+OZ8krk15ZAblldjCx8z6axCxZmfexF9DZ
	 s3OupRs0x/BBPeTaueXzedqiWwLXwO36MYc1UrdisLtzX64GbNjhtalP9y/u/T106I
	 VbhfVyMdPJzlw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in .init_{,de}compress_ctx
Date: Tue, 13 May 2025 13:57:20 +0800
Message-ID: <20250513055721.2918793-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

.init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
to allocate physically continuous page first, it may cause more memory
allocation pressure, let's use vmalloc instead to mitigate it.

[Test]
cd /data/local/tmp
touch file
f2fs_io setflags compression file
f2fs_io getflags file
for i in $(seq 1 10); do sync; echo 3 > /proc/sys/vm/drop_caches;\
time f2fs_io write 512 0 4096 zero osync file; truncate -s 0 file;\
done

[Result]
Before		After		Delta
21.243		21.694		-2.12%

For compression, we recommend to use ioctl to compress file data in
background for workaround.

For decompression, only zstd will be affected.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 23 ++++++++++-------------
 fs/f2fs/f2fs.h     |  5 +++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1e62fdffda07..37d18e2a3327 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -180,8 +180,7 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
 #ifdef CONFIG_F2FS_FS_LZO
 static int lzo_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-				LZO1X_MEM_COMPRESS, GFP_NOFS);
+	cc->private = f2fs_vmalloc(LZO1X_MEM_COMPRESS);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -191,7 +190,7 @@ static int lzo_init_compress_ctx(struct compress_ctx *cc)
 
 static void lzo_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	vfree(cc->private);
 	cc->private = NULL;
 }
 
@@ -248,7 +247,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 		size = LZ4HC_MEM_COMPRESS;
 #endif
 
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);
+	cc->private = f2fs_vmalloc(size);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -263,7 +262,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 
 static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	vfree(cc->private);
 	cc->private = NULL;
 }
 
@@ -344,8 +343,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	params = zstd_get_params(level, cc->rlen);
 	workspace_size = zstd_cstream_workspace_bound(&params.cParams);
 
-	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-					workspace_size, GFP_NOFS);
+	workspace = f2fs_vmalloc(workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
@@ -353,7 +351,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	if (!stream) {
 		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
 				"%s zstd_init_cstream failed", __func__);
-		kvfree(workspace);
+		vfree(workspace);
 		return -EIO;
 	}
 
@@ -366,7 +364,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 
 static void zstd_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	vfree(cc->private);
 	cc->private = NULL;
 	cc->private2 = NULL;
 }
@@ -425,8 +423,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	workspace_size = zstd_dstream_workspace_bound(max_window_size);
 
-	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
-					workspace_size, GFP_NOFS);
+	workspace = f2fs_vmalloc(workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
@@ -434,7 +431,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 	if (!stream) {
 		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
 				"%s zstd_init_dstream failed", __func__);
-		kvfree(workspace);
+		vfree(workspace);
 		return -EIO;
 	}
 
@@ -446,7 +443,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 static void zstd_destroy_decompress_ctx(struct decompress_io_ctx *dic)
 {
-	kvfree(dic->private);
+	vfree(dic->private);
 	dic->private = NULL;
 	dic->private2 = NULL;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9432fd15766a..6e9615b5cdc3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3540,6 +3540,11 @@ static inline void *f2fs_kvzalloc(struct f2fs_sb_info *sbi,
 	return f2fs_kvmalloc(sbi, size, flags | __GFP_ZERO);
 }
 
+static inline void *f2fs_vmalloc(size_t size)
+{
+	return vmalloc(size);
+}
+
 static inline int get_extra_isize(struct inode *inode)
 {
 	return F2FS_I(inode)->i_extra_isize / sizeof(__le32);
-- 
2.49.0

