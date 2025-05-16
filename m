Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312A10E4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747372486; cv=none; b=Oiz+jHM6UVQDjIz1q35C2qIvlr6aPaKdRZ53yD4kyCslFMP1m/cXdVYqm8oS0ouhG08zONKTQvg1wqVuqpElkC2ohrDLDTK3GGdf1IUhwEEmAk65LBC9vmf0E2e3X2BDVuh8f8CniFaobeOYLOeIT7KuUhyQdO/Sp+lTsKmLrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747372486; c=relaxed/simple;
	bh=NUNLT9y7QhF3ydaG51x89MwzhZ2NMTPCJdDbabcUeUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M9jLm53rmpC0Qfo6feLAHVbgmxSP8dLqUg63QhJuzOgRC2eS4giMBGXwWAKycvfG/wtcFQLOtnPFMN/GudhbhuuFEOBw14+ehKCtKpOgTH8uxbU5DzDUrohApi3cnMcv803C+ogt12ns2KkeMubDw7fwWSIgAj/pW3wMc5XhcHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=O4+WRgQh; arc=none smtp.client-ip=207.54.90.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="O4+WRgQh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747372484; x=1778908484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NUNLT9y7QhF3ydaG51x89MwzhZ2NMTPCJdDbabcUeUM=;
  b=O4+WRgQh9Ligx72f0uATxaKApQ6gB6cOOp6hC/jaJC6uIFFxNf8zOwee
   tB5PBmU6P6lV63SB8+9UASndvQtsgvIIQ7PkuvLIXLotggEncOmQaFjff
   Fj2HKDlzekQQJJB4Cxaj2dJobnCKgwqEa0eeDFAr7fnE6IJ/PjS5yjzof
   y9+qTgDF+qfW7GjDXWL90Wl7v5Dp9LNeAQT/7QOGAMGiQbEz7EQqpR/pr
   ZZKVJUnNNyoWC5uyqgyah7l6JxpQu1Lr4q6wNh3Xje/ay4Dnb1DBpB0BG
   P22UaKyVsY8eJ5EWxjY1BVL03jWn1qKYzzm30v4wwEanhKcCGIycPrlKH
   g==;
X-CSE-ConnectionGUID: GjzR4YGST6GM4gdxt5l4tQ==
X-CSE-MsgGUID: PClvifyGQPmSi0d0wqwu/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="199624815"
X-IronPort-AV: E=Sophos;i="6.15,293,1739804400"; 
   d="scan'208";a="199624815"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 14:14:35 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC611D9363
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:14:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9996D9730
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:14:32 +0900 (JST)
Received: from iaas-rpma.. (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 91CE51A0078;
	Fri, 16 May 2025 13:14:31 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: nvdimm@lists.linux.dev
Cc: dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	linux-kernel@vger.kernel.org,
	Li Zhijian <lizhijian@fujitsu.com>
Subject: [PATCH 1/2] nvdimm/btt: Fix memleaks in discover_arenas()
Date: Fri, 16 May 2025 13:13:17 +0800
Message-Id: <20250516051318.509064-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmemleak reported a memleak after the ndctl_test
unreferenced object 0xffff88800e6cf2c0 (size 32):
  comm "modprobe", pid 969, jiffies 4294698691
  hex dump (first 32 bytes):
    03 00 00 00 a0 0a 00 00 00 b0 b4 00 00 c9 ff ff  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 807f3e24):
    __kmalloc_cache_noprof+0x331/0x410
    nvdimm_namespace_attach_btt+0xa9b/0xcc0 [nd_btt]
    platform_probe+0x45/0xa0
    ...
    load_module+0x21f9/0x22f0

faddr2line tells that (based on v6.15-rc4):
$ ./scripts/faddr2line drivers/nvdimm/nd_btt.o nvdimm_namespace_attach_btt+0xa9
nvdimm_namespace_attach_btt+0xa9b/0xcc0:
log_set_indices at linux/drivers/nvdimm/btt.c:719
(inlined by) discover_arenas at linux/drivers/nvdimm/btt.c:888
(inlined by) btt_init at linux/drivers/nvdimm/btt.c:1583
(inlined by) nvdimm_namespace_attach_btt at linux/drivers/nvdimm/btt.c:1680

It's believed that this was a false positive because the leaking size
didn't match any instance in an arena.

However during looking into this issue, it's noticed that it does not
release an initializing arena instance and instances in btt->arena_list
in some error paths.

Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 drivers/nvdimm/btt.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 423dcd190906..a11e4e7e9a52 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -801,17 +801,22 @@ static struct arena_info *alloc_arena(struct btt *btt, size_t size,
 	return arena;
 }
 
+static void free_arena(struct arena_info *arena)
+{
+	kfree(arena->rtt);
+	kfree(arena->map_locks);
+	kfree(arena->freelist);
+	debugfs_remove_recursive(arena->debugfs_dir);
+	kfree(arena);
+}
+
 static void free_arenas(struct btt *btt)
 {
 	struct arena_info *arena, *next;
 
 	list_for_each_entry_safe(arena, next, &btt->arena_list, list) {
 		list_del(&arena->list);
-		kfree(arena->rtt);
-		kfree(arena->map_locks);
-		kfree(arena->freelist);
-		debugfs_remove_recursive(arena->debugfs_dir);
-		kfree(arena);
+		free_arena(arena);
 	}
 }
 
@@ -848,7 +853,7 @@ static void parse_arena_meta(struct arena_info *arena, struct btt_sb *super,
 static int discover_arenas(struct btt *btt)
 {
 	int ret = 0;
-	struct arena_info *arena;
+	struct arena_info *arena = NULL;
 	size_t remaining = btt->rawsize;
 	u64 cur_nlba = 0;
 	size_t cur_off = 0;
@@ -861,8 +866,10 @@ static int discover_arenas(struct btt *btt)
 	while (remaining) {
 		/* Alloc memory for arena */
 		arena = alloc_arena(btt, 0, 0, 0);
-		if (!arena)
-			return -ENOMEM;
+		if (!arena) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		arena->infooff = cur_off;
 		ret = btt_info_read(arena, super);
@@ -921,7 +928,8 @@ static int discover_arenas(struct btt *btt)
 	return ret;
 
  out:
-	kfree(arena);
+	if (arena)
+		free_arena(arena);
 	free_arenas(btt);
 	return ret;
 }
-- 
2.47.0

