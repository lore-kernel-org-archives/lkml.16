Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81C2522F;
	Sun, 11 May 2025 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988355; cv=none; b=tlmYasbqn9MKwJY7Vrk6EBJG8/nANPdDRVOGCzjyqU0G74HQ/x3Uz1i5D6Gy/yEYQ8G5oJSVNEj7UnqURCVL5N/8UZT9ERBg3QQxMYd7cEfWEX99M9M5o9bUbPLZ86p324mJvM9ZsQIKkEbD9keqxTMmkVrQMUzC7ARQG03t+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988355; c=relaxed/simple;
	bh=UG7/YuDkyzGW6ndn/SB6QhN2P6Uhqu2k0jfvfG1L1fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nudc8jB4mn7mQOcnS5SLRp/lftoQ0KSmLTSexkhI9QTaQD+i2EX5RSlYTEgJDiHmg44/S95jz8apldkitWH/b8Ywsy8enYW3GpDLskRYWVKwBYJq2XN3ZdTiy9T5Z42V4wAVtUn2fWIKmYo58SX5AQsiLkuf8MH7XtYGlQzcfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y75UCJwp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y75UCJwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CA1C4CEE4;
	Sun, 11 May 2025 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988355;
	bh=UG7/YuDkyzGW6ndn/SB6QhN2P6Uhqu2k0jfvfG1L1fg=;
	h=From:To:Cc:Subject:Date:From;
	b=Y75UCJwp/Lid/AgPxPYfhdtjZykP77TJ2TEtyLWWMHlg5lEQ/E8wAQUg5Awi7Dl5H
	 L1gZsfpqKvwIQ+f64/4Vy4k7wLNPmt6JaEwpUKckrOYmKbqL4s+utEDfG47LT2PJRq
	 WPp1P2xMLro13vR85Z3FYjQj1+fyrnv6qfm1BVFvpZUEwTtH4IqIt8LJi7j87e2eOh
	 l7nwrcyZJ0RMhA4a5xD34dlJJ4J45FMyob9hFErnJ4++aWXVtF5+Fd4QLko1PiT30b
	 dyjHxMBV/MRFXgZN3dO06h+23rsySY1wKP1NOJX5AjE4MdMqGAxoyL+xrKFPvs+RiM
	 cb2b+NXy+bYDw==
From: Eric Biggers <ebiggers@kernel.org>
To: gfs2@lists.linux.dev,
	Andreas Gruenbacher <agruenba@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] gfs2: avoid inefficient use of crc32_le_shift()
Date: Sun, 11 May 2025 11:31:33 -0700
Message-ID: <20250511183133.31544-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

__get_log_header() was using crc32_le_shift() to update a CRC with four
zero bytes.  However, this is about 5x slower than just CRC'ing four
zero bytes in the normal way.  Just do that instead.

(We could instead make crc32_le_shift() faster on short lengths.  But
all its callers do just fine without it, so I'd like to just remove it.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Please consider this patch for the gfs2 tree for 6.16.  If it doesn't
get picked up, I'll take it through the crc tree.

 fs/gfs2/recovery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index f4fe7039f725b..9080f1b5f434d 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -116,19 +116,20 @@ void gfs2_revoke_clean(struct gfs2_jdesc *jd)
 }
 
 int __get_log_header(struct gfs2_sbd *sdp, const struct gfs2_log_header *lh,
 		     unsigned int blkno, struct gfs2_log_header_host *head)
 {
+	const u32 zero = 0;
 	u32 hash, crc;
 
 	if (lh->lh_header.mh_magic != cpu_to_be32(GFS2_MAGIC) ||
 	    lh->lh_header.mh_type != cpu_to_be32(GFS2_METATYPE_LH) ||
 	    (blkno && be32_to_cpu(lh->lh_blkno) != blkno))
 		return 1;
 
 	hash = crc32(~0, lh, LH_V1_SIZE - 4);
-	hash = ~crc32_le_shift(hash, 4); /* assume lh_hash is zero */
+	hash = ~crc32(hash, &zero, 4); /* assume lh_hash is zero */
 
 	if (be32_to_cpu(lh->lh_hash) != hash)
 		return 1;
 
 	crc = crc32c(~0, (void *)lh + LH_V1_SIZE + 4,

base-commit: 3ce9925823c7d6bb0e6eb951bf2db0e9e182582d
-- 
2.49.0

