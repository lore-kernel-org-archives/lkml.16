Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B23326656F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036687; cv=none; b=h2zNMnhw3/XyA3nse4S4Dfc8LvaElBIdYH1uyFQGtQpS9Y+zcT1c5l9nIu0jNhNuMk3Da1nvxYutdO8arUpHt8blpCtBClTcJfy1Rgq8I35IozfyQY4BI/cfsHvHjUrW8y75GkJkvPSjoNjiSpPm/O39VlRuEsw3zpIizbHtNBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036687; c=relaxed/simple;
	bh=CQu6NY+XXCjQ0pDoxIrTBz6qrVh4Glx1z3jLOwt79bY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0C2gnNC6PpQWjH71bKEMJpBLD9Ft4gOeeHLxBSg5Oz+bPgQYmzGi6sWvAdU1dlG/FXgHzNfa8S/gJcO5z9hYBt35jddtXPnZbp67Ce4IUpJn9vfB/2+nyR5wzT6plei4R0+gM7F0iyQBi01dPoNAoDqUZ5ayhqotP+wMc+ldB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLnpInnA; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLnpInnA"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so107889a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036685; x=1746641485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ABVuvP5TNG4tVYGMuC//l3k1Ki5yFOjDY70WGpcFOzo=;
        b=VLnpInnAmXiY75sDp4x75brDKpRp/VGCeuXCb3IeAjhh/V67LOb8l18bihH1iKpEco
         flNbfgGzco2Ekgw+2mpkIv8PLoDEeXwxYCVg37JyBUPhpfH1U+jlBfNkOwmGbnyLelzb
         u/K1W/66z76c9ZbuE+DNdGiTRcLbKi9kzNM9tHPAuFVgNiJQdJ8KTNJ8WukGyVt7TYMF
         oy5NXkjcIFzvle2WO5CmN7glrhzBlrBNudelnDjEIRpv/Z1abyoNTzapY9ukt7OcFR5w
         QL684UTmmo4bBFWOTiqoF+No9Cttf5vfg0bNHNXRa4O2L9zwckt8V22D7eQ07IHZgV0V
         ZSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036685; x=1746641485;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABVuvP5TNG4tVYGMuC//l3k1Ki5yFOjDY70WGpcFOzo=;
        b=M3hRi3F9Yh8064hEGD5myNuFjJq0H+o3fPPIdAr9zaczSVTH7f1GA74UAjJz/GKNPR
         cUEWjyO411B9yqNwEbq5vuhQFs8JG7aVY408SuSzONcKKmHMddtakfBzCADV/mq+dWn5
         7T6KBVLsY+cSxzsolfXDsXK8hBQq3rhcMg5BO98PCOwSFPUs6/E3zpq37sAvEa10eAgT
         UbISXV78peOvVQdT8ZgSHL++pxRw2VvBEypu2SwKNzEHNzvHrjjp2OCQDV91BbcEHm3R
         sqd15AHuqxGFMgwTK5C4TgBltgxA9rKNQOOGq0TACgtHq10WeSi7J1zNujM7krG/ebN3
         E4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWexNsuIOiW+BDTc5QqliUa+2vcAbtR6/5i0e5nVcmWIaj8iKiAx79tbh5VgOVHbkkR7qT4xrbHm6sJ9/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnf0LBeMyrSfbyYc6TOSqGaZQe79Z3xmWMfTKNJ38pzc/T9SS
	zXifhZPjCuGPABSosv0lVi64cjPqusCkjaJrtkombxYr/ka1pTM8
X-Gm-Gg: ASbGncvArXKga33eHe/dULns1k1wOz0jM+q3I0WNXC37fwlijaLziteiQTPt9a+wi3q
	0qXefaHFb1M8aP1LqLakenye26x00LPLJ7j+hMPFgtB0XDSaHj+UGsWn25O9GSmFCLTvoA/JP85
	mVnlRvMNeTUE+FcLLqZ2zES6o+7s3cdjYgitc5veV5M2UyXcMBeG/jyJ0kpGh4WOfOlRhyWXl1P
	OmgzS0YlmcETD22H/sDoAQCH/EP9JSqPZA3qCBCVr/AFxIUWu4CGYQCfVf3yPo4qNXgoi3U+4lz
	yAlpbGkXNDpvHYmXRbNozBPP6p8ZPsow2NMeAHUwR18SDJox6modvUwWto9Ayw==
X-Google-Smtp-Source: AGHT+IGvk0oJWttNM6c0zFmz2EsnDvT1Lr3GHsue6PfHLv/bA327BK4ptz41QX/l91eCNpM4QRO2Ag==
X-Received: by 2002:a05:6a21:1583:b0:1f5:6d00:ba05 with SMTP id adf61e73a8af0-20a89a012bcmr5766473637.38.1746036685092;
        Wed, 30 Apr 2025 11:11:25 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.122.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039947976sm1983822b3a.84.2025.04.30.11.11.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Apr 2025 11:11:24 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 5/6] mm: move folio_index to mm/swap.h and remove no longer needed helper
Date: Thu,  1 May 2025 02:10:51 +0800
Message-ID: <20250430181052.55698-6-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181052.55698-1-ryncsn@gmail.com>
References: <20250430181052.55698-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

There are no remaining users of folio_index() outside the mm subsystem.
Move it to mm/swap.h to co-locate it with swap_cache_index(), eliminating
a forward declaration, and a function call overhead.

Also remove the helper that was used to fix circular header dependency
issue.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/pagemap.h | 20 --------------------
 mm/gup.c                |  1 +
 mm/memfd.c              |  1 +
 mm/migrate.c            |  1 +
 mm/page-writeback.c     |  1 +
 mm/swap.h               | 18 ++++++++++++++++++
 mm/swapfile.c           |  6 ------
 7 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 0c9aff5ec77f..627cb0338e5d 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -884,26 +884,6 @@ static inline struct page *grab_cache_page_nowait(struct address_space *mapping,
 			mapping_gfp_mask(mapping));
 }
 
-extern pgoff_t __folio_swap_cache_index(struct folio *folio);
-
-/**
- * folio_index - File index of a folio.
- * @folio: The folio.
- *
- * For a folio which is either in the page cache or the swap cache,
- * return its index within the address_space it belongs to.  If you know
- * the page is definitely in the page cache, you can look at the folio's
- * index directly.
- *
- * Return: The index (offset in units of pages) of a folio in its file.
- */
-static inline pgoff_t folio_index(struct folio *folio)
-{
-	if (unlikely(folio_test_swapcache(folio)))
-		return __folio_swap_cache_index(folio);
-	return folio->index;
-}
-
 /**
  * folio_next_index - Get the index of the next folio.
  * @folio: The current folio.
diff --git a/mm/gup.c b/mm/gup.c
index f32168339390..91bbf57579f0 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -26,6 +26,7 @@
 #include <asm/tlbflush.h>
 
 #include "internal.h"
+#include "swap.h"
 
 struct follow_page_context {
 	struct dev_pagemap *pgmap;
diff --git a/mm/memfd.c b/mm/memfd.c
index c64df1343059..ab367e61553d 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -20,6 +20,7 @@
 #include <linux/memfd.h>
 #include <linux/pid_namespace.h>
 #include <uapi/linux/memfd.h>
+#include "swap.h"
 
 /*
  * We need a tag: a new tag would expand every xa_node by 8 bytes,
diff --git a/mm/migrate.c b/mm/migrate.c
index f3ee6d8d5e2e..662e5dc44b33 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -50,6 +50,7 @@
 #include <trace/events/migrate.h>
 
 #include "internal.h"
+#include "swap.h"
 
 bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 {
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 20e1d76f1eba..9ff44b64d3d6 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -41,6 +41,7 @@
 #include <trace/events/writeback.h>
 
 #include "internal.h"
+#include "swap.h"
 
 /*
  * Sleep at most 200ms at a time in balance_dirty_pages().
diff --git a/mm/swap.h b/mm/swap.h
index 6f4a3f927edb..521bf510ec75 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -201,4 +201,22 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 
 #endif /* CONFIG_SWAP */
 
+/**
+ * folio_index - File index of a folio.
+ * @folio: The folio.
+ *
+ * For a folio which is either in the page cache or the swap cache,
+ * return its index within the address_space it belongs to.  If you know
+ * the folio is definitely in the page cache, you can look at the folio's
+ * index directly.
+ *
+ * Return: The index (offset in units of pages) of a folio in its file.
+ */
+static inline pgoff_t folio_index(struct folio *folio)
+{
+	if (unlikely(folio_test_swapcache(folio)))
+		return swap_cache_index(folio->swap);
+	return folio->index;
+}
+
 #endif /* _MM_SWAP_H */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index b86637cfb17a..9fe58284079d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3671,12 +3671,6 @@ struct address_space *swapcache_mapping(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(swapcache_mapping);
 
-pgoff_t __folio_swap_cache_index(struct folio *folio)
-{
-	return swap_cache_index(folio->swap);
-}
-EXPORT_SYMBOL_GPL(__folio_swap_cache_index);
-
 /*
  * add_swap_count_continuation - called when a swap count is duplicated
  * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's
-- 
2.49.0

