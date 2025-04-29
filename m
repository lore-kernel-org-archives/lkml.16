Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883A29AF4A;
	Tue, 29 Apr 2025 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970733; cv=none; b=VvltP5Fya3xFzGHP9FBG6pdx5ZPf3/HJZETO+JcnxK6pnuc1bEL7xqVz9HBIjllvqwyx0fPmQ4zFb1R97N/n7zxNw6/CsVvnPFPjwecGKtLsPyj7KmxCmE+JGWL07+4gjJVR/xd+Jfkfvf5et/vpVEaxGC7h+u8FEv1Im3GYNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970733; c=relaxed/simple;
	bh=LcjfoIfZlvgn2q83gmgEcqDBHna+BQIgBH2iRobVtz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jtVwUY9FqJ1ZzyStrc+1WryOfe3wW4/+3s8XpSRYzfLmwxFCEfwFvf4ioP9gKw1F4vGKCcQ0HM3qQh/yEX25Ikx5Vyz5aFTiyz2eCJS1QEiwIxV+9FqRRhOrVulizNfZlzAy7RNKxqvi5iz81xqI2ZEHQ9Do7s5RFV4HOll8GAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eI1wgThA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eI1wgThA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1897C4CEEB;
	Tue, 29 Apr 2025 23:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970732;
	bh=LcjfoIfZlvgn2q83gmgEcqDBHna+BQIgBH2iRobVtz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eI1wgThAHOBwSq/pn1CAfAeWNkmC+2CCH6EXRjPVJ1fA7YL2MdcGFyr3gGM9gcovK
	 UIRA/CEqGwUpCyXPIeSQaNA32dnf+NDLDaHTScBV2J/UZ1xaV/S1vhiffwwHbXsF/9
	 ycaf/f80QTubtTQXxH5iXt7EEWUBcewMYviRoYi1q4/pWiKmsQSX9RAm4aJUfrMAw2
	 lALIvTuHtcO0NJy7Z2KtWgZYQWvFgpdCxVW94vVIBdYnRRoI3TGP/SjUUHepebwu+V
	 077ggTGAMFTnGcCDUMLS1/d3b0DburInYZdrIq+zEnDVnfHELXamQszq2BSDepHeDG
	 UDH1DTZ41XW9w==
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
Subject: [PATCH AUTOSEL 6.12 27/37] fs/buffer: use sleeping version of __find_get_block()
Date: Tue, 29 Apr 2025 19:51:12 -0400
Message-Id: <20250429235122.537321-27-sashal@kernel.org>
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

[ Upstream commit 5b67d43976828dea2394eae2556b369bb7a61f64 ]

Convert to the new nonatomic flavor to benefit from potential performance
benefits and adapt in the future vs migration such that semantics
are kept.

Convert write_boundary_block() which already takes the buffer
lock as well as bdev_getblk() depending on the respective gpf flags.
There are no changes in semantics.

Suggested-by: Jan Kara <jack@suse.cz>
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://kdevops.org/ext4/v6.15-rc2.html # [0]
Link: https://lore.kernel.org/all/aAAEvcrmREWa1SKF@bombadil.infradead.org/ # [1]
Link: https://lore.kernel.org/20250418015921.132400-4-dave@stgolabs.net
Tested-by: kdevops@lists.linux.dev # [0] [1]
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/buffer.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index b04705eb6cc57..e9e84512a027a 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -658,7 +658,9 @@ EXPORT_SYMBOL(generic_buffers_fsync);
 void write_boundary_block(struct block_device *bdev,
 			sector_t bblock, unsigned blocksize)
 {
-	struct buffer_head *bh = __find_get_block(bdev, bblock + 1, blocksize);
+	struct buffer_head *bh;
+
+	bh = __find_get_block_nonatomic(bdev, bblock + 1, blocksize);
 	if (bh) {
 		if (buffer_dirty(bh))
 			write_dirty_buffer(bh, 0);
@@ -1446,7 +1448,12 @@ EXPORT_SYMBOL(__find_get_block_nonatomic);
 struct buffer_head *bdev_getblk(struct block_device *bdev, sector_t block,
 		unsigned size, gfp_t gfp)
 {
-	struct buffer_head *bh = __find_get_block(bdev, block, size);
+	struct buffer_head *bh;
+
+	if (gfpflags_allow_blocking(gfp))
+		bh = __find_get_block_nonatomic(bdev, block, size);
+	else
+		bh = __find_get_block(bdev, block, size);
 
 	might_alloc(gfp);
 	if (bh)
-- 
2.39.5

