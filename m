Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DF19D8B2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985591; cv=none; b=q/mgDqweWKarakjJZwvBx0GhN+DPcz8kKHDOlN4Rdf/EAlrRLW1ZXVPy+z5laNB4USnToTrUigYG0bUtN0auZYVC724y1k+MPV0I2c+kJjxmBIVbr5bmixP6KjqzqlMqiMq1fnRs8i2hHHpHFKHUUotOHYpAH0vMleowGJVgPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985591; c=relaxed/simple;
	bh=Hd0gSY4BrbsvkvJ25VLQRBMFsp5HZ45eDTPk810HP3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRTE0EGuC90uS+JoBmVpLZ2fTS/UGUmQgI0urGmuHMpK2OLP8KfuHCnq9r09Mf7qM9LJJQFo84rOFA+QiuLVpfPV+PsPJ4RyM10uxvUwMdOURhEAYNDx3D6yodV5c98RXf6QFTSt0gxM+9jmc5iv+AR/bN/ihP2+k5PT93qeXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZvtBVxT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZvtBVxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCACC4CEF0;
	Fri, 23 May 2025 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747985591;
	bh=Hd0gSY4BrbsvkvJ25VLQRBMFsp5HZ45eDTPk810HP3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZvtBVxTk0e0/OQnhpqUSRnlqkRZNCcsEbaEoXs+WsEcCe5VmZ2bjuZ5Z+7mp7wfQ
	 595vhB1mXwK1nsFFC5V7PPivH0zTAlLSMkCetuYjvbQKaz9cV6If/T2+1bxs4XOB2B
	 8HY7zAKYFkYxOJv4ikymmqzukNyX1MGMkKsLb753aWeAh9hVsMhMazfSrJ7QMhA8jb
	 F9cbeN4DzH4DVOifu30AjStRfLX5Ys01ACYYhaX72pAMt4B5GdnnX6jb5W3oSoL/Yf
	 5SCq932yJzP+r4M0X30Vb2A2up2Y+vkbtjSawq4uiDxPeZbWRIubE2WEguCj1uZ6KO
	 AMJ2M0g6cp63Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: clean up to check bi_status w/ BLK_STS_OK
Date: Fri, 23 May 2025 15:33:04 +0800
Message-ID: <20250523073304.1454247-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
In-Reply-To: <20250523073304.1454247-1-chao@kernel.org>
References: <20250523073304.1454247-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check bi_status w/ BLK_STS_OK instead of 0 for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 2 +-
 fs/f2fs/data.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 0dc65634cc61..b3c1df93a163 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1483,7 +1483,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 				f2fs_is_compressed_page(page));
 	int i;
 
-	if (unlikely(bio->bi_status))
+	if (unlikely(bio->bi_status != BLK_STS_OK))
 		mapping_set_error(cic->inode->i_mapping, -EIO);
 
 	f2fs_compress_free_page(page);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1be38186076d..31e892842625 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -151,7 +151,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		}
 
 		dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
-		folio_end_read(folio, bio->bi_status == 0);
+		folio_end_read(folio, bio->bi_status == BLK_STS_OK);
 	}
 
 	if (ctx)
@@ -290,7 +290,7 @@ static void f2fs_read_end_io(struct bio *bio)
 	if (time_to_inject(sbi, FAULT_READ_IO))
 		bio->bi_status = BLK_STS_IOERR;
 
-	if (bio->bi_status) {
+	if (bio->bi_status != BLK_STS_OK) {
 		f2fs_finish_read_bio(bio, intask);
 		return;
 	}
@@ -347,7 +347,7 @@ static void f2fs_write_end_io(struct bio *bio)
 
 		type = WB_DATA_TYPE(&folio->page, false);
 
-		if (unlikely(bio->bi_status)) {
+		if (unlikely(bio->bi_status != BLK_STS_OK)) {
 			mapping_set_error(folio->mapping, -EIO);
 			if (type == F2FS_WB_CP_DATA)
 				f2fs_stop_checkpoint(sbi, true,
-- 
2.49.0

