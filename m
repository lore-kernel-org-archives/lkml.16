Received: from mailrelay1-3.pub.mailoutpod2-cph3.one.com (mailrelay1-3.pub.mailoutpod2-cph3.one.com [46.30.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3E198A2F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745785279; cv=none; b=rlWQwKxi2NzkLupm0n02CF2Nex0YpEuqKB9ZZbnwfJ4nCmeDPpzksa8IWXvgBmstAlJCDbTQA+0MTBeO3NwYPwNzeA9kuDtxArOhH6rb3GU1Z4wrjbPtE0e5jVK3rY3WhRY5oK4wumuKUrVshTM1t+9iEpOLvsa7ujogWDrc8so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745785279; c=relaxed/simple;
	bh=eLRslRB7s5810Rx/NxtJKXu+MAnkzRe2TiRahEzc9sI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gAl8dHwB28y9x9Nc/Sw8BkFhIvps6Z2HhtnC/NWI9clJJajD9/8K3O6uFkXPSYTs02SwBRnRo90KqsryPsthV7HH4YHtgGKBtvM2Y9gw1oNRZmc320lWI4kz/kIMbWEDLMiHHyNH3XrHGXn2yMfp2OOadvBRxC+QuF9vysDQ4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=g/Er9Wek; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=4jm8heKT; arc=none smtp.client-ip=46.30.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="g/Er9Wek";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="4jm8heKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1745785204; x=1746390004;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=shcxpfrjccaKCRDXtBOgbh/oAMtnscrtDvkyx1+IXRA=;
	b=g/Er9WekUwpmWcDDy3sjuBAS4CpG+Trb9s1Ooq7jm/ATKBsNilGE1e+46f0gVrlUsq5f/UyuvVH2i
	 hfzZKNnm2to6ykEl8BFet6g+qbSio/MDuSJEwAqzl5T0sL3zdf9fTXVh0708AvOYtzgHxP3HrBX5WP
	 d50pZgLFuuW4yiEFtahHggZ7WvaOZPe4jbrOmoFJnu9LG1G/i/aAUSyiUVdpPHRvkvd5XXp8BEMC3t
	 09t97HRss4SRqK52go4mdBz7jskbhQtK3nYr3s9YFi096Ua4lAj5zqO3z6VAELXjVN/vMiF7mGenkA
	 UoKRsNhuoCOKc+0OB644pSOC/GhHxEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1745785204; x=1746390004;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=shcxpfrjccaKCRDXtBOgbh/oAMtnscrtDvkyx1+IXRA=;
	b=4jm8heKT72nmPUF6TliX6XalAWuXQAec98RL6agqhJvmtEukyGSBuOsbU3T51Wr/S/YINPFQ3IB48
	 thzFCGXAw==
X-HalOne-ID: fd90db7a-23a4-11f0-90b3-4d2191f5f3b5
Received: from localhost.localdomain (host-90-233-217-8.mobileonline.telia.com [90.233.217.8])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id fd90db7a-23a4-11f0-90b3-4d2191f5f3b5;
	Sun, 27 Apr 2025 20:20:04 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	minchan@kernel.org,
	nphamcs@gmail.com,
	senozhatsky@chromium.org,
	shakeel.butt@linux.dev,
	yosry.ahmed@linux.dev,
	Igor Belousov <igor.b@beldev.am>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH mm-new] mm/zblock: add debugfs
Date: Sun, 27 Apr 2025 22:19:58 +0200
Message-Id: <20250427201958.491806-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Igor Belousov <igor.b@beldev.am>

Add debugfs entry to monitor number of blocks allocated for different
block sizes.

Signed-off-by: Igor Belousov <igor.b@beldev.am>
Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

---

 mm/zblock.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/mm/zblock.c b/mm/zblock.c
index 6afe6986260d..7182b1ac85ad 100644
--- a/mm/zblock.c
+++ b/mm/zblock.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/atomic.h>
+#include <linux/debugfs.h>
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -27,6 +28,7 @@
 #include "zblock.h"
 
 static struct rb_root block_desc_tree = RB_ROOT;
+static struct dentry *zblock_debugfs_root;
 
 /* Encode handle of a particular slot in the pool using metadata */
 static inline unsigned long metadata_to_handle(struct zblock_block *block,
@@ -111,6 +113,22 @@ static struct zblock_block *alloc_block(struct zblock_pool *pool,
 	return block;
 }
 
+static int zblock_blocks_show(struct seq_file *s, void *v)
+{
+	struct zblock_pool *pool = s->private;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
+		struct block_list *block_list = &pool->block_lists[i];
+
+		seq_printf(s, "%d: %ld blocks of %d pages (total %ld pages)\n",
+			i, block_list->block_count, block_desc[i].num_pages,
+			block_list->block_count * block_desc[i].num_pages);
+	}
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(zblock_blocks);
+
 /*****************
  * API Functions
  *****************/
@@ -140,6 +158,9 @@ static struct zblock_pool *zblock_create_pool(gfp_t gfp)
 		INIT_LIST_HEAD(&block_list->active_list);
 		block_list->block_count = 0;
 	}
+
+	debugfs_create_file("blocks", S_IFREG | 0444, zblock_debugfs_root,
+			    pool, &zblock_blocks_fops);
 	return pool;
 }
 
@@ -426,12 +447,15 @@ static int __init init_zblock(void)
 		return ret;
 
 	zpool_register_driver(&zblock_zpool_driver);
+
+	zblock_debugfs_root = debugfs_create_dir("zblock", NULL);
 	return 0;
 }
 
 static void __exit exit_zblock(void)
 {
 	zpool_unregister_driver(&zblock_zpool_driver);
+	debugfs_remove_recursive(zblock_debugfs_root);
 	delete_rbtree();
 }
 
-- 
2.49.0

