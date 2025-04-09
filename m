Received: from sxb1plsmtpa01-03.prod.sxb1.secureserver.net (sxb1plsmtpa01-03.prod.sxb1.secureserver.net [188.121.53.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A684A3E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 03:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744169645; cv=none; b=Ynxb3dvdQpRx/kFv8Ap+hfOvSsZ4MmNighPgnEA4ihBcT82qRo1g1EHqLxT15u/cG7AUSGlRwgQImZwBrvBP63ietl5uGIqgLff1dg6s8olAdF74cC1lXI1vKT3YQZq9QGWzunV0tCp5t/XaK4SCzgrt0++bDv6AaFMZTOzbiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744169645; c=relaxed/simple;
	bh=toW3KA9+TmBF/9NBpleTzpxkjhMfYyM4G4UYJkmYawM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shoLreh6knFQ6GD6rfQvroqB9pGP7VA7Se1fIYCr7gowoA83wlMfg3bYruHBnCi+e9K2RwMmA3NKyqk+J5gbiJWxLG/s3kjwIkP7j6QzVET880Wk5mYwmqreslKxyZJxn2J8cGFSblbZ8r5+69X/w8zGnlxo7cL5VhyBELnRYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from phoenix.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id 2LUruEW75rx2R2LV2uPJ13; Tue, 08 Apr 2025 19:49:13 -0700
X-CMAE-Analysis: v=2.4 cv=fqYmZE4f c=1 sm=1 tr=0 ts=67f5e02a
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=hSkVLCK3AAAA:8 a=FXvPX3liAAAA:8 a=bXcLvHvqEZcXFsVHyC0A:9
 a=cQPPKAXgyycSBL8etih5:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
	syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com
Subject: [PATCH] Squashfs: check return result of sb_min_blocksize
Date: Wed,  9 Apr 2025 03:47:47 +0100
Message-Id: <20250409024747.876480-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKDx+p3FQwcKVnUhI8GKRy8ZRCFp7zzz8AlvfLP53Y8sgSMAX7ziXIRWI4vHcU/f0a4tnkGSM6rDUCzkyLPkBLPKMHg4Jaq4ZKeG3lfsbowlvhQ7WMxr
 31psyHeNOXxQT8K5jNyo/JaOMWaob82EjIkj9JAbJvceLXaSf5z2nqLnR/XwPBtV/KIetdVtlTFdxj/o0TW9jkjC016hRFnW0D8QuT4y//UZl4bvrY2x/7SZ
 bm11cDhBbq4rV5cS7Z8qEHKuN9jEBbpwFicHlGqKBcJeKR1x7cXjKLtEiCxQ8EVFZx19xfHnxqK4SxN9uNO/0PeS38HpL/1NWO05YzatKkbIbBQnbGd/YR03
 EoxN/xcxOHwh7dthHIA2QYKzLOrpnSF2f6/GIbyYTlYhQuDdEIA=

Syzkaller reports an "UBSAN: shift-out-of-bounds in squashfs_bio_read" bug.

Syzkaller forks multiple processes which after mounting the Squashfs
filesystem, issues an ioctl("/dev/loop0", LOOP_SET_BLOCK_SIZE, 0x8000).
Now if this ioctl occurs at the same time another process is in the
process of mounting a Squashfs filesystem on /dev/loop0, the failure
occurs.   When this happens the following code in squashfs_fill_super()
fails.

----
msblk->devblksize = sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE);
msblk->devblksize_log2 = ffz(~msblk->devblksize);
----

sb_min_blocksize() returns 0, which means msblk->devblksize is set to 0.

As a result, ffz(~msblk->devblksize) returns 64, and msblk->devblksize_log2
is set to 64.

This subsequently causes the

UBSAN: shift-out-of-bounds in fs/squashfs/block.c:195:36
shift exponent 64 is too large for 64-bit type 'u64' (aka
'unsigned long long')

This commit adds a check for a 0 return by sb_min_blocksize().

Reported-by: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67f0dd7a.050a0220.0a13.0230.GAE@google.com/
Fixes: 0aa666190509 ("Squashfs: super block operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 67c55fe32ce8..d8256b23ad9a 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -202,6 +202,11 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	msblk->panic_on_errors = (opts->errors == Opt_errors_panic);
 
 	msblk->devblksize = sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE);
+	if (!msblk->devblksize) {
+		errorf(fc, "squashfs: unable to set blocksize\n");
+		return -EINVAL;
+	}
+
 	msblk->devblksize_log2 = ffz(~msblk->devblksize);
 
 	mutex_init(&msblk->meta_index_mutex);
-- 
2.39.2

