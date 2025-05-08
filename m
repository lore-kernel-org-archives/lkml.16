Received: from mailrelay4-3.pub.mailoutpod2-cph3.one.com (mailrelay4-3.pub.mailoutpod2-cph3.one.com [46.30.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE2223DDA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707391; cv=none; b=Ul4OOiA3+V1YEIT+F5itdPBDAyT9WChNO+EoHSgN3NyHsJdputPuOhKSltk+NtyJpbulHZcjKoKbPg2rZ/XYhlszxas8fhJSgzJWc49i574UZu4gemP8BL59NvgNTqhkaZoBFbU9khmUIwqCp/aTYyK0vQYI4tPUJCQos3lEwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707391; c=relaxed/simple;
	bh=cMaR6KSpXfnNmo4FGNJUVAwfr91+AsKeAMDz5hJurSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ktOrc39WbQV83Gz2HD74JwHQggzGM1bUYyN5HNfEEnNFYoSpXc4NWmJ9l0139IIxocuOa4Yz4Xajd2pjmlCp0zTVPkIops8HowwHodVimwA2WVCsz14PQ8OTfhDTwQ0uijEnLCBwBEx3Hc1DxJD1f7OzrfBiRUHFjBHNh5GPl5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=njOih3SX; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=SzRR/4f8; arc=none smtp.client-ip=46.30.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="njOih3SX";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="SzRR/4f8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746707378; x=1747312178;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=96RVUSvxcpMjcsgc3ji0TTbBKMPsPn4+zZf9dNSNmjA=;
	b=njOih3SXTUrkp9AA6sIMJwg0UB+8GChYeCDqHrCIeyaN6Bgm/NKX/5CVKU74Uc6AOhX5VW9Hx8lrw
	 JRdLgSWOFDc8xOHljdqmRAKkTHYF01ryUQc+IkpWaqvrkoRWqU7RYsMMFEMdTpakMx78acHMVG+eIe
	 Ep+DhmZwtbx4iywXLf474HeXAX7bzTiRogntTd1f+uyZBN1rB2HZQenW0xTXUvnietGsq0jxMrdFia
	 TvbDNm0POzyfwED/u8be02Xd1gsvZg5f3aKvly+IQtm/shjigqlaazHsF8reHyk+gdp/N/p+2OpMzo
	 5E7E25nLB7vGNblmpB6YLOUuxU8r9Hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746707378; x=1747312178;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=96RVUSvxcpMjcsgc3ji0TTbBKMPsPn4+zZf9dNSNmjA=;
	b=SzRR/4f87FpRMGC8I9UJ7QhBBcQIy+P9O8AVUEtE6vrIZzmLYdcEZ2Ksi+U3GhmjqEIAskYVcmlJ9
	 sdwrRMMDA==
X-HalOne-ID: 1a695b02-2c08-11f0-a5bc-e77cec7da75b
Received: from localhost.localdomain (host-90-233-217-8.mobileonline.telia.com [90.233.217.8])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 1a695b02-2c08-11f0-a5bc-e77cec7da75b;
	Thu, 08 May 2025 12:29:38 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCH] mm/zblock: make active_list rcu_list
Date: Thu,  8 May 2025 14:29:25 +0200
Message-Id: <20250508122925.2600217-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since it is okay for several concurrent threads to have read access to
the active_list's head for slot reservation, make active_list rcu_list.
This improves performance for heavy multi-thread loads.

E. g. for 'make -j55 bzImage' on a 12-core Ryzen:
* before:
real	8m52.194s
user	41m9.743s
sys	36m08.622s
Zswap:            303520 kB
Zswapped:         802004 kB
zswpin 18434225
zswpout 42848557

* after:
real	8m25.244s
user	40m10.184s
sys	31m55.413s
Zswap:            311020 kB
Zswapped:         842396 kB
zswpin 16984983
zswpout 38587329

* zsmalloc (for comparison):
real	9m5.550s
user	41m30.424s
sys	38m27.165s
Zswap:            204044 kB
Zswapped:         838176 kB
zswpin 20213653
zswpout 45038266

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
Tested-by: Igor Belousov <igor.b@beldev.am>
---
 mm/zblock.c | 36 +++++++++++++++++++++---------------
 mm/zblock.h |  2 ++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/mm/zblock.c b/mm/zblock.c
index d77eb98c042e..bd237c92e71e 100644
--- a/mm/zblock.c
+++ b/mm/zblock.c
@@ -18,10 +18,10 @@
 
 #include <linux/atomic.h>
 #include <linux/debugfs.h>
-#include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/preempt.h>
+#include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
@@ -53,13 +53,20 @@ static inline struct zblock_block *find_and_claim_block(struct block_list *b,
 {
 	struct list_head *l = &b->active_list;
 	unsigned int slot;
-
-	spin_lock(&b->lock);
-	if (likely(!list_empty(l))) {
-		struct zblock_block *z = list_first_entry(l, typeof(*z), link);
-
+	struct zblock_block *z;
+
+	rcu_read_lock();
+retry_claim:
+	z = list_first_or_null_rcu(l, typeof(*z), link);
+	if (z) {
+		spin_lock(&b->lock);
+		if (unlikely(!z->free_slots)) {
+			spin_unlock(&b->lock);
+			goto retry_claim;
+		}
 		if (--z->free_slots == 0)
-			__list_del_clearprev(&z->link);
+			list_bidir_del_rcu(&z->link);
+		spin_unlock(&b->lock);
 		/*
 		 * There is a slot in the block and we just made sure it will
 		 * remain.
@@ -74,13 +81,11 @@ static inline struct zblock_block *find_and_claim_block(struct block_list *b,
 			if (!test_and_set_bit(slot, z->slot_info))
 				break;
 		}
-		spin_unlock(&b->lock);
 
 		*handle = metadata_to_handle(z, slot);
-		return z;
 	}
-	spin_unlock(&b->lock);
-	return NULL;
+	rcu_read_unlock();
+	return z;
 }
 
 /*
@@ -100,6 +105,7 @@ static struct zblock_block *alloc_block(struct zblock_pool *pool,
 		return NULL;
 
 	/* init block data */
+	init_rcu_head(&block->rcu);
 	block->block_type = block_type;
 	block->free_slots = block_desc[block_type].slots_per_block - 1;
 	memset(&block->slot_info, 0, sizeof(block->slot_info));
@@ -107,7 +113,7 @@ static struct zblock_block *alloc_block(struct zblock_pool *pool,
 	*handle = metadata_to_handle(block, 0);
 
 	spin_lock(&block_list->lock);
-	list_add(&block->link, &block_list->active_list);
+	list_add_rcu(&block->link, &block_list->active_list);
 	block_list->block_count++;
 	spin_unlock(&block_list->lock);
 	return block;
@@ -263,12 +269,12 @@ static void zblock_free(struct zblock_pool *pool, unsigned long handle)
 	/* if all slots in block are empty delete the whole block */
 	if (++block->free_slots == block_desc[block_type].slots_per_block) {
 		block_list->block_count--;
-		__list_del_clearprev(&block->link);
+		list_bidir_del_rcu(&block->link);
 		spin_unlock(&block_list->lock);
-		vfree(block);
+		kvfree_rcu(block, rcu);
 		return;
 	} else if (block->free_slots == 1)
-		list_add(&block->link, &block_list->active_list);
+		list_add_tail_rcu(&block->link, &block_list->active_list);
 	spin_unlock(&block_list->lock);
 }
 
diff --git a/mm/zblock.h b/mm/zblock.h
index 267a23f1db62..3d702e983e9f 100644
--- a/mm/zblock.h
+++ b/mm/zblock.h
@@ -8,6 +8,7 @@
 
 #include <linux/mm.h>
 #include <linux/rbtree.h>
+#include <linux/rculist.h>
 #include <linux/types.h>
 
 #if PAGE_SIZE == 0x1000
@@ -42,6 +43,7 @@
 struct zblock_block {
 	DECLARE_BITMAP(slot_info, 1 << SLOT_BITS);
 	struct list_head link;
+	struct rcu_head rcu;
 	unsigned short block_type;
 	unsigned short free_slots;
 };
-- 
2.39.2

