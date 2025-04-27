Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B119A202969
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780427; cv=none; b=XAngmS0aCH35L8zaRbWi4gDPWKGtMFsEsqHbbF+lCFYRmSpI5S6c724uPcE7YeTGP7ZZUjzlBPz3SMQTkkiSiPG7LXwGzdG1m7fjC6wx/bm49P+E6PkePSbSSjJ9ry2lFj9I43dw44+uNfDKGKvgXJYRYxPBEsPRVASuU+0+Jt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780427; c=relaxed/simple;
	bh=4nwoiXMW5Nhzqq1c47JZh0IYqvoVqtn+nAhCq+bVGLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Km7DIhLyk3Y3OxUlNuViaXlHCID0RiLk0v9BXjgmwDTZMEOOu6xsN+Hhu62NxsRt7xg/KFGYVuq4wZwmqLqYgdv8WMqQynO5ptkEOYX/vIZxfp2vJcjbZy2J8X9/eHvwy7f2sj328Inxg4++0fYZpFNR5GBO+RLWOoeyOP4dLNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkvthYyZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkvthYyZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c277331eso4751502b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745780425; x=1746385225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IDmeL4hx/iVNmF7D4U//Rj1ZUKsUj7xb6gC03dWplSo=;
        b=BkvthYyZ072AI+CtMlhEieWjsmrWEILvu42M9EIPFDyro3t6NxxDj/sMgdFPQaE5m1
         9l0A5nXPOGNaMrNF8yDkQzb7XBuaMpc2RreJPBEnHrvSdtw/eaUjbAK9a3k7bxz1xMq4
         pHBdGE7stqQ7dU0HYQZ8cd5mwS6be2lz60/gqrdmVoIqpDeqgYLmqkgcuO21pXE2J5Cg
         mfo2y1CHbJmF7cAPpxigB8c6GyTJrzzvRp8hsCTQHtPNZGne9Pugy4MJQq/Cik8Iugre
         6rW3REN72Vs47DBGYDGp1d+WzLAPLxeVAfWGHTp9UOzRtNllVGFJ9bG2mrHb+L8FOPpD
         cvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745780425; x=1746385225;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IDmeL4hx/iVNmF7D4U//Rj1ZUKsUj7xb6gC03dWplSo=;
        b=CM/itR+U+7VQagmz736aaBwEiHOglVlNoyuGngG1HxMI7ou0fYIUzX2QIm+qzD3nSC
         QABMTsQBrTIvO7OgTcbd4GQDqLAaJTBPsJqaJqDjrcAC/P53kXIcFnaYG5aW38+/Se2G
         b6yXxpYnZUmAcfWYqGWeJk3VFcI8ualbKOgPVIE0HFqwM0aKwwWBz6FIHIk0QhfMyXMf
         Xl6FxL/wNXceMGu/xIQCzr+tlMghhB5TnPdYbFqDDi7EgB3R20pPUT6m6ozReMlJOU1r
         wD54zB9vWa864Mf5D2lE6kYTvwma5UPasCok7AeLi96JvtFT8mh6yX+iPlVlFR+WXx9j
         Dgaw==
X-Forwarded-Encrypted: i=1; AJvYcCXN42WD9klPFM0kr2OrRzQIEfdsmccC6s5nFyCvA1c+T9V+30pGXaGkeRtcSn4FNItvD/Kduy+zfgjoH+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfxaps8z+ZWtZCK+2AfPT0o6aFvJktAUpst+XGuzFEpwl9stpN
	2h0nAaUZ50CWhCsuJZPL3WAhh9O4Tv8Hj1tjqmlONtG/naYJD0Mr
X-Gm-Gg: ASbGnctkoawZVsBRy+KGeTmULCyFTRi756fdb0mTwa+lxUvbPQ1iTPHgRqeCuVFS5bY
	MRRtJa00MQILXA30xYaOTCe87P/LJJalEYXZu3VGnSwMZqfcuJ/K4ff3gniUMBK5sFqpmHW2tI3
	Al5lIIlsEEkw6epw14TJdickvWjSeTEHaRqoGT90q6zME9G8xuvIR9B+tFKKr6md/rkYstm4FSY
	QL5CtnfLCONSDNty+OknouLNcnSKM6YYd95tI6a4CzVh4xpWUhd0rHw/4Ljo6Zr8z9VfiIquEmU
	bWKMNXKnUw2Llhqa8Ix2mTNqAveWCO/pqgKED6iA+3pHqtPk4MygAGrcZ3AZUA==
X-Google-Smtp-Source: AGHT+IFmqHyI30cpvwrLTTi9PNKbANg/76Q7YdrGeP4dTjEc5/oTjQAc7FEio1Ywcx1BN3zSAl8SqA==
X-Received: by 2002:a05:6a21:6d84:b0:1f0:e6db:b382 with SMTP id adf61e73a8af0-20445d6f33amr19304516637.8.1745780424787;
        Sun, 27 Apr 2025 12:00:24 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([115.171.40.102])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded554sm5862153a12.72.2025.04.27.12.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Apr 2025 12:00:24 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 5/6] mm: move folio_index to mm/swap.h and remove no longer needed helper
Date: Mon, 28 Apr 2025 02:59:07 +0800
Message-ID: <20250427185908.90450-6-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>
References: <20250427185908.90450-1-ryncsn@gmail.com>
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
 mm/memfd.c              |  1 +
 mm/migrate.c            |  1 +
 mm/swap.h               | 18 ++++++++++++++++++
 mm/swapfile.c           |  6 ------
 5 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a0bed4568c66..f61fdb8e165d 100644
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
diff --git a/mm/swap.h b/mm/swap.h
index 6f4a3f927edb..2f18d21c17fb 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -50,6 +50,24 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
 	return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
 }
 
+/**
+ * folio_index - File index of a folio.
+ * @folio: The folio.
+ *
+ * For a folio which is either in the page cache or the swap cache,
+ * return its index within the address_space it belongs to.  If you know
+ * the page is definitely in the page cache, you can look at the folio's
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
 void show_swap_cache_info(void);
 void *get_shadow_from_swap_cache(swp_entry_t entry);
 int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
diff --git a/mm/swapfile.c b/mm/swapfile.c
index e727021b8e2c..bf6c98009909 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3662,12 +3662,6 @@ struct address_space *swapcache_mapping(struct folio *folio)
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

