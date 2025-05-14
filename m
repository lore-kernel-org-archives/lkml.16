Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01E21A447
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253928; cv=none; b=rR4gzD3YeXsxsFQi2zbBZ9Up94+LFkwRH5u2S2wUNTeo+U6si+oDWv5LW3NNRcESNUVshZH6DSUyLFxZAFN+MiRn50bfnXJFb5xrc645aUSgylyfamnTJuyr78q64iNrdJSY/xLHVGIcuNnfidFgcSj9qYqtCBvEt8ks2pKDWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253928; c=relaxed/simple;
	bh=KlE4b+EI1LOh4QdgXOSj4k3XJNcRjERleThgAZC+MCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5D6nTNT4qZDBplI4wp+4bnP9ruibaUCw+6Hlf6vcWiMTU6NysQGXQ0ljzVB6sLHQ76jljXQIth0bgFBhulP+ZKC5UIkCY45ymd8qfDwqmjHnhVIaMfEF3wzfNU4zwUzOJ23FbZz1qMPogITmB/QZ/Ths14gGF4LvxM57AQH3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiK3c7AN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiK3c7AN"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b200047a6a5so1199207a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253927; x=1747858727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4s/QmsKTTQmLGkqDLjmzfFJeHGtuBXIefOE3w5RFPpw=;
        b=KiK3c7AN1tGG8mbjcY1JqKN5KI45C2IdzwKv/x6WEN48ZLlL7qeUp5bWnN+9BLyzUU
         IxqfZPgo4pXHHuj25gT7hDtH1wpFPRp7aWGdE+ch6FseQh9g2YkGnhDcO4YVJRNTY8cp
         nnxE22DCnxYIVJ1BT2bo8iQGhrzQz2PA4wqtzMmxHmUpLD1az698PpaB9kwghsh+TGKW
         07DPezZhec8hFQ08/KCqBJYZRt3OjIKhEbX+E8uOTmFCMeLRcidH1w9ulebcMdgFH/TO
         2x6ivC+uOvLCNNBAM0MNxndbdQKVAOSHQtk5mqhk7NsnMOW5ow3Fj20N+6hpulSz7ZCC
         IuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253927; x=1747858727;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4s/QmsKTTQmLGkqDLjmzfFJeHGtuBXIefOE3w5RFPpw=;
        b=V1T78a5Y45n/R3IBOVphuVVY+9xsp6pK80hw9GcTqPR4uvYGjEETxB8eGvJcVMCZwf
         oB1fEoY67k7tzETA1x5Zxsvcqk8LidaFEdLQJpW6CNw/2EGbDvZAYu94etr0VTf5icu8
         mbuLGmKQm0WLY9l4576yy173UGSp9rV270xsGxzMVgDaDltQCM4eXexR8vs7P8iRNjkW
         heQSabqHnK5lpZAu0EzpCqaCbK2a0qP7vLLefKppTDBd3W/Htuo50SdnLLn7f2PljP+F
         TNRwRQhqabHr7ORzM8T1sucQgd92HAv3Cj4wMrRDRNZ48fIr8H/LLRz3t4Y7UQh/XzJ+
         5a3g==
X-Forwarded-Encrypted: i=1; AJvYcCU9qUt0M4uqQC8kzXhw4DvzQE69op8vWwqXAdQSgaqP7VOF+XlANXRymRAErH2sLsblR6dRn0nPQBtOWgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzppiZMUYvVk0PFA+AE5vVy/fxLqtq1blD5cbNl0kUs+SH7GuOL
	eHGyWoQTf1Szq1TSBFdPc3eY9C2w5sjgG/nzqi+WL+a0c2ildH7W
X-Gm-Gg: ASbGncsQt5yRAjwGZgEQFARDj82HF6N4ts5QfowfK5+DBPXizKoNINoQZBM6PNFVLU4
	VVQjPtY9LGwQ/rfqfsGS2hO/G8s6YghzFtUige3acFkNzKF10SV7Xh8pvPs2Xsji7RO6AhA8PnQ
	d4KeqSj64M7ezybZt7gwqvRLZnvKXh3HajS5SAgyncDuKrKUOIwUZ0IVOtZMAfHLEhYXTuyGVRL
	+kIvZYKVgYQe0i0D3cuAKed617IFvQiuM6VWLFxhK1P3kDeHoS3otXkpx1NI7MMaP2ObLJ4agxS
	njPRWEjNMINm/ODledpnQSSO5wY6UmycLPIdwQHIRlupLDPdiio9SlfdSbp3z8yps97ArIMZ
X-Google-Smtp-Source: AGHT+IG+B1slZQN6/w3ohnuP01AT9ckSlzci2YrvggjzzrH+zdTqUHxw2hQl8e1yDQGhoEt4iqhExw==
X-Received: by 2002:a17:90b:3bce:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-30e4db4a0b9mr1071062a91.10.1747253926545;
        Wed, 14 May 2025 13:18:46 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:45 -0700 (PDT)
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
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 13/28] mm/shmem, swap: avoid redundant Xarray lookup during swapin
Date: Thu, 15 May 2025 04:17:13 +0800
Message-ID: <20250514201729.48420-14-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514201729.48420-1-ryncsn@gmail.com>
References: <20250514201729.48420-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Currently shmem calls xa_get_order multiple times to get the swap radix
entry order. This can be combined with the swap entry value checking
(shmem_confirm_swap) to avoid the duplicated lookup, which should
improve the performance.

This also provides the helper need for later commits.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 67 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 0da9e06eaee8..da80a8faa39e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -509,11 +509,26 @@ static int shmem_replace_entry(struct address_space *mapping,
  *
  * Checking folio is not enough: by the time a swapcache folio is locked, it
  * might be reused, and again be swapcache, using the same swap as before.
+ *
+ * Check if the swap entry is still in the shmem mapping and get its order,
+ * return -1 if it's no longer valid.
  */
-static bool shmem_confirm_swap(struct address_space *mapping,
-			       pgoff_t index, swp_entry_t swap)
+static int shmem_check_swap_entry(struct address_space *mapping, pgoff_t index,
+				  swp_entry_t swap)
 {
-	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
+	XA_STATE(xas, &mapping->i_pages, index);
+	int order = -1;
+	void *entry;
+
+	rcu_read_lock();
+	do {
+		entry = xas_load(&xas);
+		if (entry == swp_to_radix_entry(swap))
+			order = xas_get_order(&xas);
+	} while (xas_retry(&xas, entry));
+	rcu_read_unlock();
+
+	return order;
 }
 
 /*
@@ -2238,16 +2253,17 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EIO;
 
 	si = get_swap_device(swap);
-	if (!si) {
-		if (!shmem_confirm_swap(mapping, index, swap))
-			return -EEXIST;
-		else
-			return -EINVAL;
+	order = shmem_check_swap_entry(mapping, index, swap);
+	if (order < 0) {
+		if (si)
+			put_swap_device(si);
+		return -EEXIST;
 	}
+	if (!si)
+		return -EINVAL;
 
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap);
-	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
 		bool fallback_order0 = false;
 
@@ -2303,7 +2319,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 */
 		if (split_order > 0) {
 			pgoff_t offset = index - round_down(index, 1 << split_order);
-
 			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
 		}
 
@@ -2325,25 +2340,20 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			error = split_order;
 			goto failed;
 		}
-
-		/*
-		 * If the large swap entry has already been split, it is
-		 * necessary to recalculate the new swap entry based on
-		 * the old order alignment.
-		 */
-		if (split_order > 0) {
-			pgoff_t offset = index - round_down(index, 1 << split_order);
-
-			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
-		}
 	}
 alloced:
 	/* We have to do this with folio locked to prevent races */
 	folio_lock(folio);
-	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
-	    folio->swap.val != swap.val ||
-	    !shmem_confirm_swap(mapping, index, swap) ||
-	    xa_get_order(&mapping->i_pages, index) != folio_order(folio)) {
+	if (!skip_swapcache && !folio_swap_contains(folio, swap)) {
+		error = -EEXIST;
+		goto unlock;
+	}
+
+	nr_pages = folio_nr_pages(folio);
+	index = round_down(index, nr_pages);
+	swap = swp_entry(swp_type(swap), round_down(swp_offset(swap), nr_pages));
+
+	if (folio_order(folio) != shmem_check_swap_entry(mapping, index, swap)) {
 		error = -EEXIST;
 		goto unlock;
 	}
@@ -2354,7 +2364,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		goto failed;
 	}
 	folio_wait_writeback(folio);
-	nr_pages = folio_nr_pages(folio);
 
 	/*
 	 * Some architectures may have to restore extra metadata to the
@@ -2368,8 +2377,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			goto failed;
 	}
 
-	error = shmem_add_to_page_cache(folio, mapping,
-					round_down(index, nr_pages),
+	error = shmem_add_to_page_cache(folio, mapping, index,
 					swp_to_radix_entry(swap), gfp);
 	if (error)
 		goto failed;
@@ -2392,7 +2400,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	*foliop = folio;
 	return 0;
 failed:
-	if (!shmem_confirm_swap(mapping, index, swap))
+	if (shmem_check_swap_entry(mapping, index, swap) < 0)
 		error = -EEXIST;
 	if (error == -EIO)
 		shmem_set_folio_swapin_error(inode, index, folio, swap,
@@ -2405,7 +2413,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		folio_put(folio);
 	}
 	put_swap_device(si);
-
 	return error;
 }
 
-- 
2.49.0

