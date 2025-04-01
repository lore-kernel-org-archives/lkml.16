Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC2420408A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518857; cv=none; b=lq0nnN8jfaJ4HNrNiUwg9i9s2VSwPgqYBT5rzuCsNPOGYXAF6/wxEVA7l5d/qXuRCpXNTPBm5E3LwlDRmoiY1Ok8OjOhDEwri/SrjH7e3hFfjR7zHEu3unn2+gdRY6q6mgryI42lrbUMtLm2pp+5/wX8Ex0/7mhlKRuMQhjuYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518857; c=relaxed/simple;
	bh=qxxn22A+TWwz7W7O83WXc2hBsRRs8xbjPxTiDcaQkjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjOOHwXmdXcUU4yTgT/EIUca09/SsDMVroyL9yn2l8eR7vy/tGamaNwQbTmi6xdH4NYcv1rnAYR8CYysG7XPoNW6OzMb50rXQKb7niy8kXKT3MyCy3UxNvGqkOBThASg7Ojpt++ea5TvJXH4XGsQOPWQCIpPCFYpNeE8P7EvF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKF6fG8h; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKF6fG8h"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so7498306a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743518856; x=1744123656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8oI6DPpyJYi5fACjQLTchVPFFOS5/gnF91U27CkBiJc=;
        b=gKF6fG8hLbWnd93mNbXAfiWygyswlfjj4HpUj6OsAO2sNleyHKCNgwQ6WVGwhEGDyh
         3YWxy3jfLHqKLuDIFWZwfe725zaLikinl6RSLA1cLGa+8zeA6xrCyzZp68w2/d1KktbW
         aUe7OSlP2pKfKshix2+1ZL7jJUwstJkXi6GQ5wZ9t7Q/Y9GqgM51/QrPwT3lBQ9wPnPc
         AOOoPI09MX4F5IMQxA3cuXy/WPztAOG5DXkA7v/uA5xQT0joI+QhuA7t/HbvBoETeONz
         D60NwmhkNXjr1ulthD81QWygDJd6tN5RFfvtPcTSDCvzuMlxdD9DQDA7/rcsgve4KTp+
         rtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518856; x=1744123656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oI6DPpyJYi5fACjQLTchVPFFOS5/gnF91U27CkBiJc=;
        b=HbqiHWHI3prYR+lNhOMlVbcY0ngfC8XA4FadMnBsVwVD4do3lltD0zqV4P8S0pRNjo
         oL1i/3m2GLNwMhQA3I/eJuEyTzvU+wp6q1N95yUfvtZPOfbyrHg5lcMVU5Qr0bWjIMta
         cYZlTRMqyIuB2zMsp0MQ+3AgvrFw1q5ZKHzm4NnPvZfHDq438fJRReYJlmO3hjUQZzbT
         IjWrLgOLhSRLvRQVrF4PjbntY++TOdpXkgSKwGw9+MP2un/PFxE5xcVPEeXxSxm808vG
         jj5cEzUS+qN9nGvY+9/5gbA84aDY/PcnmOitWXeMcFveJQ4ZC+tZI0xF0CnwOGTWLntx
         a+iw==
X-Gm-Message-State: AOJu0YxSEDarb/2RdgddF+11mIupBb1yQClEzYtym7yPSe2smOIYtj86
	1F2TbUOQywUd4YsC6nJIC0yZ/LRS82rl0HQ11l3pepZ6n4bI7wqQxcXADQ==
X-Gm-Gg: ASbGncvOU5+tPnur3bP0yNjmWgHMZIr/yCs5wgF+N5V26FfpiDOfGXXVCFR4uyafFrP
	gYQ5WqtSwT4n14geTTvJ6S8b7WQehwvmVcolSS4DM6ouctaIUExhzqEckNi/EA4gz3gR9uw8PgB
	0pAIx9swTBVLUWRgegFD0syaewqTCZ1R4O50guUqi+Y605RgQD8QNOUmpwUrd32tQm83AlQyIjp
	0H4TnU3cUGib+RiKGyR38FUvP9+lzCIcvhvmqQ4tYPcH5/PlUXznR9HE2O3xwyQ9I6C/0+ZFEER
	9F6eqXH7f2WbQoM3r6ftOBNhP5GbhebQwWg0qPUI3/Y0980+//BU1Sz6FVwsww==
X-Google-Smtp-Source: AGHT+IF0xi1C9KtgpWzs57BfZ+flnHBJZGfJE5KoTCEGX7/3wPYGkwpDSHZpMmM+KebA8Wi5wGLzZw==
X-Received: by 2002:a17:90b:1b08:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-305320af3aamr18886779a91.15.1743518855696;
        Tue, 01 Apr 2025 07:47:35 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ded6asm89445595ad.184.2025.04.01.07.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:47:35 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	vbabka@suse.cz
Cc: linux-kernel@vger.kernel.org,
	linux-mm@archiver.kernel.org,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v2] lib/iov_iter: fix to increase non slab folio refcount
Date: Tue,  1 Apr 2025 22:47:12 +0800
Message-ID: <20250401144712.1377719-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

When testing EROFS file-backed mount over v9fs on qemu, I encountered
a folio UAF issue. The page sanity check reports the following call
trace. The root cause is that pages in bvec are coalesced across a folio
bounary. The refcount of all non-slab folios should be increased to
ensure p9_releas_pages can put them correctly.

BUG: Bad page state in process md5sum  pfn:18300
page: refcount:0 mapcount:0 mapping:00000000d5ad8e4e index:0x60 pfn:0x18300
head: order:0 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
aops:z_erofs_aops ino:30b0f dentry name(?):"GoogleExtServicesCn.apk"
flags: 0x100000000000041(locked|head|node=0|zone=1)
raw: 0100000000000041 dead000000000100 dead000000000122 ffff888014b13bd0
raw: 0000000000000060 0000000000000020 00000000ffffffff 0000000000000000
head: 0100000000000041 dead000000000100 dead000000000122 ffff888014b13bd0
head: 0000000000000060 0000000000000020 00000000ffffffff 0000000000000000
head: 0100000000000000 0000000000000000 ffffffffffffffff 0000000000000000
head: 0000000000000010 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
Call Trace:
 dump_stack_lvl+0x53/0x70
 bad_page+0xd4/0x220
 __free_pages_ok+0x76d/0xf30
 __folio_put+0x230/0x320
 p9_release_pages+0x179/0x1f0
 p9_virtio_zc_request+0xa2a/0x1230
 p9_client_zc_rpc.constprop.0+0x247/0x700
 p9_client_read_once+0x34d/0x810
 p9_client_read+0xf3/0x150
 v9fs_issue_read+0x111/0x360
 netfs_unbuffered_read_iter_locked+0x927/0x1390
 netfs_unbuffered_read_iter+0xa2/0xe0
 vfs_iocb_iter_read+0x2c7/0x460
 erofs_fileio_rq_submit+0x46b/0x5b0
 z_erofs_runqueue+0x1203/0x21e0
 z_erofs_readahead+0x579/0x8b0
 read_pages+0x19f/0xa70
 page_cache_ra_order+0x4ad/0xb80
 filemap_readahead.isra.0+0xe7/0x150
 filemap_get_pages+0x7aa/0x1890
 filemap_read+0x320/0xc80
 vfs_read+0x6c6/0xa30
 ksys_read+0xf9/0x1c0
 do_syscall_64+0x9e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x71/0x79

Fixes: b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 lib/iov_iter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
v2:
  * update commit message
  * update coding style

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 8c7fdb7d8c8f..bc9391e55d57 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1191,7 +1191,7 @@ static ssize_t __iov_iter_get_pages_alloc(struct iov_iter *i,
 			return -ENOMEM;
 		p = *pages;
 		for (int k = 0; k < n; k++) {
-			struct folio *folio = page_folio(page);
+			struct folio *folio = page_folio(page + k);
 			p[k] = page + k;
 			if (!folio_test_slab(folio))
 				folio_get(folio);
-- 
2.43.0

