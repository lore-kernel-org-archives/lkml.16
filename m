Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BFB28DF1D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355755; cv=none; b=CUej1wlcyPf6UV0j+VLqMZ0uJA86du8BtTFd1Q1U08olocDMZ8BUhjso46q5XISitCqDkb7q1jdYRpEUHNijGDhWl0Q7+MsbOwhcb9Ny/hCQHihAcIkwb8aR82iukPzshwEutw5wLVtNDUKy06eP2Slz11j5olrGbmFiA7tWnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355755; c=relaxed/simple;
	bh=JzMTjZB49BCjwvIcUPEM+HFWvW8HtJQKVeXy4jJnSio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHHM8njO8MxIRFIeBXWd3Iu1ITQUVr311bZzIh7LG+LVS4nUQOJgYf85xge0FodCMX9wtK/8Fj9tQe6onHMDIB9d+nxLdZ4bXi3PnSo5uisikGrXbJkWSo5Q0QDFR2Ryf4V+eaKmJlAaUkCBhJ3IRDz9VQKn19p/PTWXSugzhy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLZBQ8Jd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLZBQ8Jd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33677183so9255845ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750355753; x=1750960553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qhxEiBYif/YKCDyTxEvEnwXoCgIUrrgaAQ2W3uziJ+o=;
        b=RLZBQ8JdnxFU1+RdyTpkk3UHGvjkojg7YhbwbkJ/xvkhKXma1s/CEgMylNNq5fhQ6d
         0yFjnXKEq+Q6EsppRNHD9MIw1d6Z31CUURvQfrN5+zh0aRgUiyoV7vJLkGwNKSopOJed
         oSLvWD+T7pgH59qRxovZmY9mjtJLwBWz0fDc/4Ly6B/LCJTlqb37mILW1gYCeoUB0TIW
         VQprnKsF7gQYAdhv2KCks41VH73IljMIQAfWDGWVDrrMWnG5rvDXZFekZ1tZsDFRvDB0
         R+4aNymTKQYK2TqxmDLGQt0/bK5A+qDeAO4Cy6fG+kUO53I2F+l7MSokVmFbbOMcjRUG
         8+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355753; x=1750960553;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhxEiBYif/YKCDyTxEvEnwXoCgIUrrgaAQ2W3uziJ+o=;
        b=ZBfaY478eJVrm1nfZPydZhrb2OOP0Nf6b0j+qhghsCgf6142UkvvKxm5qkPi/trKnJ
         QVhgXfZ0P3rT4TN8OrJ90RdyETKV5ZjCdc/1scstXE8EgWHr+oW04o0XkEXS3uuV3rFJ
         ogwR9N5W/IRIkQVIdp9IHsuOEssK21Y9V988cAjFrHgj7h6gelLFRYwkhayL49alho60
         Xf4wSbZ4gn5E1oTIPUpZL4G9JEaponoG+g8Xq8a2+jZuBu2A6UYJjZ9NuJ+BJY5gxMIM
         G18tb2CcK9N2bUSRh4keGqAqAYrLzDYZ3H+QXbgkp8pXnwLln4JSMxRAWJSyFpAFXYdr
         bWkw==
X-Forwarded-Encrypted: i=1; AJvYcCW0OjjOz9rMuCdSTR5n0uL06KkXwe86Yqp+0k6zY6ZkBR0BDMIZaw2XnSZwrbcFrHTPZMsPHKEKhqFQk3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPPrc6kdYMY57XyWDK7W0TP+zlCjlcFcPZR9j3hbr9jgjYO+Y
	p9qaivzapo1dDNea8kyH1kDH2nFeRj6yhzVCoLaSuKJeWscwMtwplNoq
X-Gm-Gg: ASbGnctwMisVy/LFHh3EtdsymLrVXL3vc0CA3LaBFHnRUedPsKkeYgeB/Yalnz4kXgj
	P1hYa99YK3aevTB6xan9GHCjYsY2VW0OHumltwvabYZLqy9hyIBlLY4wGOcmPNvVum49RZHeiRC
	rD3GcVlBPeyNVODqf/1miXjoO5yK0d4X4Nl+ePFULwDt1c2SmgqHT21PQ8Kgt1EP5r1w8JDsacX
	y1tMT+AY8OHgxqw9jUEvF9AoWxK5Xe04jSN7RNXafLrX9t1IHlKjvP3puS09hMS5GxzY1DBaOd9
	Lwm8Fu57N4ZxtlXtcYLsMOurnH4tYQBshMsOYHsLaziL6uFeLXbkJbiPA84nY2NXYgBCzA/W7KZ
	cdS1bWAKq1Hsrq2oFkw==
X-Google-Smtp-Source: AGHT+IEJFgdALACITfgwxqQ56cWatjSGdDaAunvgPQAqa+5FC5hRIuAlEC9S5QqI+0+fDBmHXigCPQ==
X-Received: by 2002:a17:903:22c8:b0:234:8a4a:adad with SMTP id d9443c01a7336-2366b14d484mr326770805ad.26.1750355753431;
        Thu, 19 Jun 2025 10:55:53 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83efa44sm255215ad.77.2025.06.19.10.55.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 10:55:52 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v2 2/4] mm/shmem, swap: avoid redundant Xarray lookup during swapin
Date: Fri, 20 Jun 2025 01:55:36 +0800
Message-ID: <20250619175538.15799-3-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619175538.15799-1-ryncsn@gmail.com>
References: <20250619175538.15799-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Currently shmem calls xa_get_order to get the swap radix entry order,
requiring a full tree walk. This can be easily combined with the swap
entry value checking (shmem_confirm_swap) to avoid the duplicated
lookup, which should improve the performance.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/shmem.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 4e7ef343a29b..ce44d1da08cd 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_space *mapping,
 
 /*
  * Sometimes, before we decide whether to proceed or to fail, we must check
- * that an entry was not already brought back from swap by a racing thread.
+ * that an entry was not already brought back or split by a racing thread.
  *
  * Checking folio is not enough: by the time a swapcache folio is locked, it
  * might be reused, and again be swapcache, using the same swap as before.
+ * Returns the swap entry's order if it still presents, else returns -1.
  */
-static bool shmem_confirm_swap(struct address_space *mapping,
-			       pgoff_t index, swp_entry_t swap)
+static int shmem_confirm_swap(struct address_space *mapping, pgoff_t index,
+			      swp_entry_t swap)
 {
-	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
+	XA_STATE(xas, &mapping->i_pages, index);
+	int ret = -1;
+	void *entry;
+
+	rcu_read_lock();
+	do {
+		entry = xas_load(&xas);
+		if (entry == swp_to_radix_entry(swap))
+			ret = xas_get_order(&xas);
+	} while (xas_retry(&xas, entry));
+	rcu_read_unlock();
+	return ret;
 }
 
 /*
@@ -2256,16 +2268,20 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EIO;
 
 	si = get_swap_device(swap);
-	if (!si) {
-		if (!shmem_confirm_swap(mapping, index, swap))
+	order = shmem_confirm_swap(mapping, index, swap);
+	if (unlikely(!si)) {
+		if (order < 0)
 			return -EEXIST;
 		else
 			return -EINVAL;
 	}
+	if (unlikely(order < 0)) {
+		put_swap_device(si);
+		return -EEXIST;
+	}
 
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
-	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
 		int nr_pages = 1 << order;
 		bool fallback_order0 = false;
@@ -2415,7 +2431,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	*foliop = folio;
 	return 0;
 failed:
-	if (!shmem_confirm_swap(mapping, index, swap))
+	if (shmem_confirm_swap(mapping, index, swap) < 0)
 		error = -EEXIST;
 	if (error == -EIO)
 		shmem_set_folio_swapin_error(inode, index, folio, swap,
@@ -2428,7 +2444,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		folio_put(folio);
 	}
 	put_swap_device(si);
-
 	return error;
 }
 
-- 
2.50.0

