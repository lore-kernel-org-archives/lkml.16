Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570CB2D3A84
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433485; cv=none; b=JsOAtY/3d2GIknkKQGvLurILXXpmeo+d5lD9lSUYfl1CedpeIwWzzR0KA6RzJxOOSqvO8qhDfJEe+b1aH6TgNABEg4z/Nz3S4khNt5kf6KvCMd2lsEBKv9Z8QlM/8l0MDkoWMiY6Vqk3pKjLzS1upEtZJ5HYRoyy+sTr2QtS6c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433485; c=relaxed/simple;
	bh=GydHBuRrmtx1wEMq4Bj86qRAduZ6MzQrb5B2m07coxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwyDrzk4YjyGQ70i9hPrvmWIrJ4+792aoWOVjUUxkBjB7k4ETpO9vT0bpnD43iqO9bL1ohw1ZBQeamoggYlA8/rtmPBS4U2waGzFWr0bALTDgQSo0HhiC74Xv4qn0gtwRGkXxMbHWUdxVrlrZqJ4H/JdI2X9poaszCLRFR8eDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ue2ccsMa; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ue2ccsMa"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750433473; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4b3junzA/3eGGOZfK804nE/zow3RypRUFyM0P4FTq5g=;
	b=ue2ccsMaU1qd7uy9xo3EaQnGJKwnUaq+0YGq7VNhxAWdv4NtqrKAqJV8wq3/Ad6liR7TDQeH6d8DA7dxvsHv/xhnYydCX/BH8e4TP6MT9Lzijrwurp+D56+FRfHrl8545reLkgrzaIImWgPfcFk69TKnPXdm6YkHFgqaVkT+/28=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WeLDrbC_1750433469 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 23:31:13 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH] erofs: remove a superfluous check for encoded extents
Date: Fri, 20 Jun 2025 23:31:08 +0800
Message-ID: <20250620153108.1368029-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible when an inode is split into segments for multi-threaded
compression, and the tail extent of a segment could also be small.

Fixes: 1d191b4ca51d ("erofs: implement encoded extent metadata")
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/zmap.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 6afcb054780d..0bebc6e3a4d7 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -639,12 +639,6 @@ static int z_erofs_map_blocks_ext(struct inode *inode,
 		}
 	}
 	map->m_llen = lend - map->m_la;
-	if (!last && map->m_llen < sb->s_blocksize) {
-		erofs_err(sb, "extent too small %llu @ offset %llu of nid %llu",
-			  map->m_llen, map->m_la, vi->nid);
-		DBG_BUGON(1);
-		return -EFSCORRUPTED;
-	}
 	return 0;
 }
 
-- 
2.43.5

