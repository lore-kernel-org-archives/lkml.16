Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC82D320D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927440; cv=none; b=d4Fn3YS/SYhK+ZMzEsLpga1MjDvq3ZTRfpSkOHeGcir+HsD8qXOBts7s/x+e9n9DKulhbeOe2vEM8dz9yjt7gzcbyG9gRj+ZRadqTCr9H3RykA5BRYMbmTdcmaq1swfCp6MLTDERsm1PImkJljh8LXd3MzyLXvok83gB5YOyaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927440; c=relaxed/simple;
	bh=CyuOl5dUOpPE3FgxRFFEujoSPjD+a5dfayQwGeEpAAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzvlZfSQ3ZvauFJjJFdWN+y8CiUOVtC2rRoUCTZHZHDZZTjP9G5j8Ec2xkdU2jpJkYk/Rt1nSTp8IpxKZgcc0NBHYhrVXFDiMKx8RroA/w1J2HIabThLcplsDVk6diRw5fpeBV9yE54vgmYOaQ3+Lx0sOnOXJUPY/DSkrBRTtwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWja6KF2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWja6KF2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b07d607dc83so5145076a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927438; x=1746532238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gj9JA1kBvneMSULxD4kUsNOIWEoG1iJn7hfWXbxwfws=;
        b=XWja6KF2MmhTjbMAteSJyqwhFPF7QrEZFE5h+Bh3kasbXsMoH6Lb2V9kBxSP5109vn
         BwFAe+ic2rzMgwd2hjF6jio20BUMKFD7SJeACUfWNo7fc+jFZKjKpRDAZne0S5Ji1hop
         0RDuQnOLqmzDx++VCMNmo6aIzvGDk7eSV5AFlBKNo41Jh3TvwdDh8UFNo1UfdRycYRDl
         5kd9CGSiDl3vu6p5JWcIugk6gyrSP59EkZ0xJdG91FNMls1v1jnRNrBc0W2X8uqGaJAs
         RGjtZo7RGVkvnH8reKjKsizmssm44VJT4+nleIJ7oedE1rA9B6DE78U5AsiUx7K8kvHc
         fVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927438; x=1746532238;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gj9JA1kBvneMSULxD4kUsNOIWEoG1iJn7hfWXbxwfws=;
        b=WeZWYNG8bkLZ+jyro6XKkwyaa8sE+qVLpUF6UxyhyvIZFLbL52yYNbEqixkzlIX7w7
         k9ZWgeV28MdOa4CBxkYlXM42SSuf9i+nwynU20GcoLgGfmbTgFE97ZqcPNSs9/93MyQt
         pI6ZnXQnBMbr26xfG5HB1I+XdGwigiCBuX9BaEqVHkt0sMPIwgf4dPhzw/HSskaANWO2
         d0nwuS18p3UPAp3ls95snZ51a3rOrnnvM0vQZb0sSxLzpzwc/627OoGVSL4WhLU5FVyZ
         xA8NYx9dTcIr65+AJ959pejxECYBnIS9HC+Opf2VSQCuc6x3uyan9LYWYy0RsrE8t5No
         5YAg==
X-Forwarded-Encrypted: i=1; AJvYcCU57C68kkz5g7Bmz2fzsSVNbphQi7pCsmlWIm6rR6E5VLDlU4q/5DVPCg7DlREorv1yeEOZnyEfVk7xx+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmMxwMlSte8nZWb08saQkKQpSH6Ih9OFEe0CJvkpxuXT8IXNF
	vhi1BZyZqrA1um98qJzwSsKDrG+FbeMfrvNESptP/GiMKsPjFUHw
X-Gm-Gg: ASbGncvs/XdNy7TPNOAIq4CbMlZgRohI/iGB61UL+Q1ioLIDLE48oxIN79+ODrt4vcx
	Bmit7QMctIYvxBuuXZQ92eBhuez2ww2q/qge9lMQ4V1fmkAgmU8sjtIGi1LxXixdsc/hyg6M9Ko
	Sc5A1nuXsSg6GfnpKsN84I22fvqhvezw43tcyCKn2dylgjzpipbSKS+uXIA5refJvwv1zilonpE
	fFm3EEbnN2Og8kEnpcTNfvhI177M/5qQW+zAa8L/dHtvNTYSRO5MCtIRl2+UgVUOiP2BDKuCHDE
	VDIwKWtAwbSQwg1rdOHPckYAG1Y7FMn/WUgJZ10jCS1xSyCvjx6EEUThRuYEyVc1ly6AQ2s=
X-Google-Smtp-Source: AGHT+IHj9qGPv/p54I4MS1ZWEdAc90KEjY3jnt+sV2pdAdAUoixcCXG6v2JruSOG9j4TkciJNOBmZw==
X-Received: by 2002:a05:6a21:1789:b0:1f5:5b2a:f641 with SMTP id adf61e73a8af0-2093e123c5cmr4842650637.28.1745927438475;
        Tue, 29 Apr 2025 04:50:38 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm9661644b3a.167.2025.04.29.04.50.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Apr 2025 04:50:37 -0700 (PDT)
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
Subject: [PATCH v2 5/6] mm: move folio_index to mm/swap.h and remove no longer needed helper
Date: Tue, 29 Apr 2025 19:49:48 +0800
Message-ID: <20250429114949.41124-6-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429114949.41124-1-ryncsn@gmail.com>
References: <20250429114949.41124-1-ryncsn@gmail.com>
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
 mm/swap.h               | 23 +++++++++++++++++++++++
 mm/swapfile.c           |  6 ------
 5 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 1dc3416a9c0d..47b5746d5a65 100644
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
index 6f4a3f927edb..91439d0ce50b 100644
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
 void show_swap_cache_info(void);
 void *get_shadow_from_swap_cache(swp_entry_t entry);
 int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
@@ -125,6 +143,11 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
 	return 0;
 }
 
+static inline pgoff_t folio_index(struct folio *folio)
+{
+	return folio->index;
+}
+
 static inline void show_swap_cache_info(void)
 {
 }
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

