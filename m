Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9D1C3306
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823782; cv=none; b=pT8GVxFg3H+06pQdphUsFG6q/vMAwf/n4ubBqkteR6wXGirwOTlHRlDL2uslLb7q00S9GLm+eejifFSMgv6h66tFi/JdI3OSLsIODyuqwqH/5WoBOC47hCUDV5wC5cHdqyrhJpDwvMHF8Yv1co8fllUrjZ1Q+bBAF8+eQatIckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823782; c=relaxed/simple;
	bh=t4Khpx8hn2lo70annBZ9O4ySJAXErt3B6azoxo+lUWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sO64bRJhEc6q63HjwoePxtl3qYbA98KXxuTX4XLdmOxtFU+8EF4gYg1SxJITj8GTLlfFOlb8DE/9GGj5s7Agpw3J1kkCUG2S+vD1FJ2amWtkb2h7g2R7gfDZlMBIUiHQ6BTtNo1td96ZV50Oi5Hahw+6gry4R3CzbjWHcSqPWnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=N5UdO1p/; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="N5UdO1p/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HcWpkWScFNwzU6aVkYjAiVBMgx2kahsBntXsipuyiz4=; b=N5UdO1p/XHbQX0d65roC68sd6z
	TOe6vygEjYbZ296gjX4NPFYHbFC6EvALybWM4RXcL5ZGoUlCFj6+H17TzurVTm9GMgPFJ13gRMZ/e
	UjZcp7zoRnSt/YQ9eAeCUj5VWEpQx4+mfI4yd3HDM2sBUEP4K3npcRFb3cj2K9xhYcGLbs+am7sF0
	g99qJBC31Q5cWuPut7s7bVj2nQzA/Sw6q/r2CwhLJltAJNH4XaHYMgyiIA4GAF6u18bwcpk643EqF
	7uEDfIPH/7UC0Vboa89KosTEkOvs7c1/euGIHAiDejAvhDTZCMh4BcluX45MYKnF4Xav+ubqg/Lwm
	yARImijQ==;
Received: from host-90-233-217-8.mobileonline.telia.com ([90.233.217.8]:64578 helo=localhost.localdomain)
	by server4.hayhost.am with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u9IJc-000000006yu-1kPD;
	Mon, 28 Apr 2025 10:50:08 +0400
From: Igor Belousov <igor.b@beldev.am>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	minchan@kernel.org,
	nphamcs@gmail.com,
	senozhatsky@chromium.org,
	shakeel.butt@linux.dev,
	yosry.ahmed@linux.dev,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCH mm-new v2] mm/zblock: add debugfs
Date: Mon, 28 Apr 2025 08:49:24 +0200
Message-ID: <20250428064924.53496-1-igor.b@beldev.am>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am

Add debugfs entry to monitor number of blocks allocated for different
block sizes.

Signed-off-by: Igor Belousov <igor.b@beldev.am>

---
 mm/zblock.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/mm/zblock.c b/mm/zblock.c
index 6afe6986260d..e2036a6e1617 100644
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
+			i, block_list->block_count, 1 << block_desc[i].order,
+			block_list->block_count << block_desc[i].order);
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

