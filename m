Received: from out199-3.us.a.mail.aliyun.com (out199-3.us.a.mail.aliyun.com [47.90.199.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601F267F4F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112715; cv=none; b=n8TTe7HGUf6a/R3XS5MGc2tj7UqZU6VpuAQ8Fq4uqNfRifMXIP1w+07pP8UUK2I63NVW3FNw3GnxgLeb+Rbi+0Z71b8D4B+Wa/D4ZBKvePgnSnkzh5eWiGiIw3N4/Sguk1XotbnyqyspoEIXk9MkNS9zq+Qhos8kKgjqPnJJmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112715; c=relaxed/simple;
	bh=OxvsdwO5BJ0SGFz2h/H9piJywcIMuXB4a6lwWl8UWNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGgiMYsSr7Wq8aXMCaYIaAj49zB55KejAqqx9Dedm4cyTtzDbDJYZJ7zTe1N9bPjkuigLet+tQ9JuCwvvA7H6ieq5yENEmVY/BYRiXpMdlEylJEkJODOtwbg0HRjq5IJyaRGamDF9G8//VOqZqPaIC/TNq7PwDGAm4gr0h+4nHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SvXYPPVL; arc=none smtp.client-ip=47.90.199.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SvXYPPVL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744112695; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BqZWTIZ7e6ej2vIjCy7sCUZGfP06XjXg1jXPbyRYLgU=;
	b=SvXYPPVLlUlic+KIlKtwmOX+FaTYMIxj4RCTAB8W0+rG4vVo0BgloPJoq5+owWCqrTCNbFuWDNcxEcP3JcG8Q6CJjF9lg9SVdhQjCfY+gNh3Mi+52OUXXDuvUcrzsvaePUBoiPrRX1w0n0FNgXBzDdXR6aP/PEghrjmxhJPRl8U=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWFISUC_1744112689 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 19:44:54 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] erofs: add __packed annotation to union(__le16..)
Date: Tue,  8 Apr 2025 19:44:47 +0800
Message-ID: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm unsure why they aren't 2 bytes in size only in arm-linux-gnueabi.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202504051202.DS7QIknJ-lkp@intel.com
Fixes: 61ba89b57905 ("erofs: add 48-bit block addressing on-disk support")
Fixes: efb2aef569b3 ("erofs: add encoded extent on-disk definition")
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/erofs_fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/erofs_fs.h b/fs/erofs/erofs_fs.h
index 61a5ee11f187..94bf636776b0 100644
--- a/fs/erofs/erofs_fs.h
+++ b/fs/erofs/erofs_fs.h
@@ -56,7 +56,7 @@ struct erofs_super_block {
 	union {
 		__le16 rootnid_2b;	/* nid of root directory */
 		__le16 blocks_hi;	/* (48BIT on) blocks count MSB */
-	} rb;
+	} __packed rb;
 	__le64 inos;            /* total valid ino # (== f_files - f_favail) */
 	__le64 epoch;		/* base seconds used for compact inodes */
 	__le32 fixed_nsec;	/* fixed nanoseconds for compact inodes */
@@ -148,7 +148,7 @@ union erofs_inode_i_nb {
 	__le16 nlink;		/* if EROFS_I_NLINK_1_BIT is unset */
 	__le16 blocks_hi;	/* total blocks count MSB */
 	__le16 startblk_hi;	/* starting block number MSB */
-};
+} __packed;
 
 /* 32-byte reduced form of an ondisk inode */
 struct erofs_inode_compact {
@@ -369,9 +369,9 @@ struct z_erofs_map_header {
 			 * bit 7   : pack the whole file into packed inode
 			 */
 			__u8	h_clusterbits;
-		};
+		} __packed;
 		__le16 h_extents_hi;	/* extent count MSB */
-	};
+	} __packed;
 };
 
 enum {
-- 
2.43.5

