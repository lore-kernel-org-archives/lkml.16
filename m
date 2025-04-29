Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD929AF55;
	Tue, 29 Apr 2025 23:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970731; cv=none; b=sy/8RnbZjllgt70tiTig6fIdmauKGuaCkzWT0HG9fEF7/bIGEo2uerHq31kfP+Nf4jB/dynBPoL/8RS53cmVFO+8s9ob7uQMGGGX8rTL3mYh9hoaN2+WVN2KstAuv0w5qc/vXAmC6+AIEIgUZ5u8XU7TDSAH5DaxAty0qKwIaQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970731; c=relaxed/simple;
	bh=Y0vuwNjPWDENcA8FfJGZSv9ggem7S9Y8TiTp6wQKtbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PTR+4miApOSsIGj2ap+xrjrLL2tzO9D/tK+b+n9IvPNAHG/OHs+pBFR9bNDEKVFd2yOp0/B8wfEW1z7JitqieMenTyyhNj+buDX1UPxXU3HDuoiU/9th/8CAcabUfNLgQ7O9uJsjU3ellT15CG84kheeFDi90dl7qD8ASnTBrwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3sbUXXm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3sbUXXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB236C4CEE3;
	Tue, 29 Apr 2025 23:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970731;
	bh=Y0vuwNjPWDENcA8FfJGZSv9ggem7S9Y8TiTp6wQKtbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3sbUXXmECzE2YyLUHSp6OokR0AnwAMHmQHE/ax5pLdrbmXEO4xeiNDPGydIjcpKt
	 fhQOfT3vuc12bbAGTb92b6whg2Q3oaFp1Vd2i+ynSDafQzoKvAvjDXusTmZb5YDRbU
	 35WOeRf3MtzwpIr8CGtwz4XMwhMhLlKQsjeT/qweWGzVUebkoHqU9IkN239DPPKjbi
	 baA/j7XFIW/3A2x/1JWjDoO4Qkw6Lhtkkh4XN3G59WjOYLgbzSyk23EqTRa0s7rjlL
	 h5B2/tgBkkVgkEZDI4dJnkEZwKTCxe6zNT4hLe+iSyseOH3fnsWi33s3IsNe/7k2kl
	 EbGH6YlCmSdVg==
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
	willy@infradead.org,
	akpm@linux-foundation.org,
	josef@toxicpanda.com,
	mhocko@suse.com,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 26/37] fs/buffer: introduce sleeping flavors for pagecache lookups
Date: Tue, 29 Apr 2025 19:51:11 -0400
Message-Id: <20250429235122.537321-26-sashal@kernel.org>
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

[ Upstream commit 2814a7d3d2ff5d2cdd22936f641f758fdb971fa0 ]

Add __find_get_block_nonatomic() and sb_find_get_block_nonatomic()
calls for which users will be converted where safe. These versions
will take the folio lock instead of the mapping's private_lock.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://kdevops.org/ext4/v6.15-rc2.html # [0]
Link: https://lore.kernel.org/all/aAAEvcrmREWa1SKF@bombadil.infradead.org/ # [1]
Link: https://lore.kernel.org/20250418015921.132400-3-dave@stgolabs.net
Tested-by: kdevops@lists.linux.dev
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/buffer.c                 | 9 +++++++++
 include/linux/buffer_head.h | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/fs/buffer.c b/fs/buffer.c
index ba464c2002061..b04705eb6cc57 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1420,6 +1420,15 @@ __find_get_block(struct block_device *bdev, sector_t block, unsigned size)
 }
 EXPORT_SYMBOL(__find_get_block);
 
+/* same as __find_get_block() but allows sleeping contexts */
+struct buffer_head *
+__find_get_block_nonatomic(struct block_device *bdev, sector_t block,
+			   unsigned size)
+{
+	return find_get_block_common(bdev, block, size, false);
+}
+EXPORT_SYMBOL(__find_get_block_nonatomic);
+
 /**
  * bdev_getblk - Get a buffer_head in a block device's buffer cache.
  * @bdev: The block device.
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 932139c5d46f5..ffcd76d977703 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -223,6 +223,8 @@ void __wait_on_buffer(struct buffer_head *);
 wait_queue_head_t *bh_waitq_head(struct buffer_head *bh);
 struct buffer_head *__find_get_block(struct block_device *bdev, sector_t block,
 			unsigned size);
+struct buffer_head *__find_get_block_nonatomic(struct block_device *bdev,
+			sector_t block, unsigned size);
 struct buffer_head *bdev_getblk(struct block_device *bdev, sector_t block,
 		unsigned size, gfp_t gfp);
 void __brelse(struct buffer_head *);
@@ -398,6 +400,12 @@ sb_find_get_block(struct super_block *sb, sector_t block)
 	return __find_get_block(sb->s_bdev, block, sb->s_blocksize);
 }
 
+static inline struct buffer_head *
+sb_find_get_block_nonatomic(struct super_block *sb, sector_t block)
+{
+	return __find_get_block_nonatomic(sb->s_bdev, block, sb->s_blocksize);
+}
+
 static inline void
 map_bh(struct buffer_head *bh, struct super_block *sb, sector_t block)
 {
-- 
2.39.5

