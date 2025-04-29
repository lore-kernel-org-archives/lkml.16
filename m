Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854342DCB73;
	Tue, 29 Apr 2025 23:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970728; cv=none; b=jOVc2/A6Gxx1NPUbpE6hYW87d8MlS9BC0cGkB9xO2A3VMxxtyP5bO5X2paPFnQ6syWynko1WPF8WjlZC7oV0lk+OIErT7V8ev4rJT8gPggSXyx96JnbLp/TosoLQcCir6JKJmnNTu76qFsMU+7rOKvYUcOtbC2gcd3Aqmsv3ARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970728; c=relaxed/simple;
	bh=9GZ+vxjCbKjfLJYpJPDKB0xTTbXKzGOY4cwM6aKY8Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SPojHFLQh8acr43I0lEv4iWkWzRrAqwkDstv0x9ny5UiDPk/DQxCRX9bftBi53PH8PrzCdN2W+wvWaPvV9mBxDQiVKzir7TO42Ch91kaj6QxyU1YBF/DPLJdDzFJbo/NHmyork3jJEaH2mLEWZGue2+qmv5z74CqHMtgiCCPEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYspbFMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYspbFMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF49C4CEED;
	Tue, 29 Apr 2025 23:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970728;
	bh=9GZ+vxjCbKjfLJYpJPDKB0xTTbXKzGOY4cwM6aKY8Fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VYspbFMcknclmm1GlJRBnNvtEe+c8X8Z7OJsGF5WuxM4bFfjzUk1EeXWFHAqMR2+j
	 WVjJKnyJb2YNFKehYwRtC0RURbgdiNpnonq+pkWHlicUL501762QgGpnsCc++Sf0qV
	 wOvEyoKfnoSIegcYRr+s3fl+XnqOz7qdtIkv4I1RNoN/6zGOoeWRpbm1APCGy8HKsd
	 9i0ReITumFNoL9xtSsJk7PkY/+HAoTnAESDzFGDnz5zw/2+GdIwGj2wIak2tIOTXWy
	 hhzASwJXMQwlgtQUZja67v/DZIMO7wS45lMnu+CIXQWOlgUu8jmxOpE1aIA55yOlY8
	 d+Iuz5BClLtBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jan Kara <jack@suse.cz>,
	kdevops@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 25/37] fs/buffer: split locking for pagecache lookups
Date: Tue, 29 Apr 2025 19:51:10 -0400
Message-Id: <20250429235122.537321-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
Content-Transfer-Encoding: 8bit

From: Davidlohr Bueso <dave@stgolabs.net>

[ Upstream commit 7ffe3de53a885dbb5836541c2178bd07d1bad7df ]

Callers of __find_get_block() may or may not allow for blocking
semantics, and is currently assumed that it will not. Layout
two paths based on this. The the private_lock scheme will
continued to be used for atomic contexts. Otherwise take the
folio lock instead, which protects the buffers, such as
vs migration and try_to_free_buffers().

Per the "hack idea", the latter can alleviate contention on
the private_lock for bdev mappings. For reasons of determinism
and avoid making bugs hard to reproduce, the trylocking is not
attempted.

No change in semantics. All lookup users still take the spinlock.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://kdevops.org/ext4/v6.15-rc2.html # [0]
Link: https://lore.kernel.org/all/aAAEvcrmREWa1SKF@bombadil.infradead.org/ # [1]
Link: https://lore.kernel.org/20250418015921.132400-2-dave@stgolabs.net
Tested-by: kdevops@lists.linux.dev
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/buffer.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 32bd0f4c42236..ba464c2002061 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -176,18 +176,8 @@ void end_buffer_write_sync(struct buffer_head *bh, int uptodate)
 }
 EXPORT_SYMBOL(end_buffer_write_sync);
 
-/*
- * Various filesystems appear to want __find_get_block to be non-blocking.
- * But it's the page lock which protects the buffers.  To get around this,
- * we get exclusion from try_to_free_buffers with the blockdev mapping's
- * i_private_lock.
- *
- * Hack idea: for the blockdev mapping, i_private_lock contention
- * may be quite high.  This code could TryLock the page, and if that
- * succeeds, there is no need to take i_private_lock.
- */
 static struct buffer_head *
-__find_get_block_slow(struct block_device *bdev, sector_t block)
+__find_get_block_slow(struct block_device *bdev, sector_t block, bool atomic)
 {
 	struct address_space *bd_mapping = bdev->bd_mapping;
 	const int blkbits = bd_mapping->host->i_blkbits;
@@ -204,7 +194,16 @@ __find_get_block_slow(struct block_device *bdev, sector_t block)
 	if (IS_ERR(folio))
 		goto out;
 
-	spin_lock(&bd_mapping->i_private_lock);
+	/*
+	 * Folio lock protects the buffers. Callers that cannot block
+	 * will fallback to serializing vs try_to_free_buffers() via
+	 * the i_private_lock.
+	 */
+	if (atomic)
+		spin_lock(&bd_mapping->i_private_lock);
+	else
+		folio_lock(folio);
+
 	head = folio_buffers(folio);
 	if (!head)
 		goto out_unlock;
@@ -236,7 +235,10 @@ __find_get_block_slow(struct block_device *bdev, sector_t block)
 		       1 << blkbits);
 	}
 out_unlock:
-	spin_unlock(&bd_mapping->i_private_lock);
+	if (atomic)
+		spin_unlock(&bd_mapping->i_private_lock);
+	else
+		folio_unlock(folio);
 	folio_put(folio);
 out:
 	return ret;
@@ -1394,14 +1396,15 @@ lookup_bh_lru(struct block_device *bdev, sector_t block, unsigned size)
  * it in the LRU and mark it as accessed.  If it is not present then return
  * NULL
  */
-struct buffer_head *
-__find_get_block(struct block_device *bdev, sector_t block, unsigned size)
+static struct buffer_head *
+find_get_block_common(struct block_device *bdev, sector_t block,
+			unsigned size, bool atomic)
 {
 	struct buffer_head *bh = lookup_bh_lru(bdev, block, size);
 
 	if (bh == NULL) {
 		/* __find_get_block_slow will mark the page accessed */
-		bh = __find_get_block_slow(bdev, block);
+		bh = __find_get_block_slow(bdev, block, atomic);
 		if (bh)
 			bh_lru_install(bh);
 	} else
@@ -1409,6 +1412,12 @@ __find_get_block(struct block_device *bdev, sector_t block, unsigned size)
 
 	return bh;
 }
+
+struct buffer_head *
+__find_get_block(struct block_device *bdev, sector_t block, unsigned size)
+{
+	return find_get_block_common(bdev, block, size, true);
+}
 EXPORT_SYMBOL(__find_get_block);
 
 /**
-- 
2.39.5

