Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C62B27C873
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185335; cv=none; b=nYYp+ymHGmfrzQQuqlo7K7PA1uVsaS2DVS18i4OpXLI+bgq7GXxMNBO1vT+VJjjeja89HWHSIhwOqiqp0gxfCO6YSFc3owQ46J+66jEmH2s9xDdBmQYWe2NXNWCcmbPQh+YbAi5tQ5U0lOOJDidj5sFDIlzxPtecujjlEh9vGAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185335; c=relaxed/simple;
	bh=Bo25oI0Qz2JUnbyDkKjXxJzy4KM8ejzXvgXTGt7TOSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IltEhXXIZHb71zDQn7MdT13B4WMDb/BNMHxgYtego2dsbavQoQaoAw1oswuYBnPVNY7maJzdNfKajlvV4204gT1ct50l/sndxNWbNeDuqCNszVUtOMOgWL/n0V3w4bQIy+2PL7Rhu6iHMYC4z4B70e3ukdjmE0ODk6CKWym26bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJu9sgXu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJu9sgXu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2353a2bc210so54031685ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750185333; x=1750790133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1y6Vpeow9ypGvWf8u47quO+HQeuFr+2+BZOOkcyGh+o=;
        b=dJu9sgXuz5vlOq22mBbupApRT5aIS6LytR7EnzOscLuBCkYWMFUjUj+cipKZDESVOS
         9Rb++3TMQabmEuyDR2oR7RxGNUrTcIFOIvptd9KPawclgIVKcuZTXXnIySVVuNtD7zv1
         5g7nJ19V5cQB5G/oWCUgfnllfjfdsEoiN73akKcH6x2WZLLhQAzbC6bbNnn/+I/E+701
         hTeCnn9VGphITHt2mhPiVxt1W++t8hzKiPRISIuTrFlftNgw9oLV8nTiqhzu5B6oc7gM
         UnaMoJhlSBtsGZzGL3llEuwwHF1n2JaEaCk9BKTwIU3FR5ls2KJOidhRnbbCuNj/yUFq
         AITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750185333; x=1750790133;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1y6Vpeow9ypGvWf8u47quO+HQeuFr+2+BZOOkcyGh+o=;
        b=euvmKyVnJYkgXWevk1zKJy1b6kQkGGPC5i9o/WZm4SBIC8Qq8uEt0VWPvHaOtP/++m
         UlTkXRzV802fIYNHNxMuEFIR2Okgj7uD69aQz7dU/GqOOhB1RQBzmYmH9sKM4upt7zO7
         6RsWqrJpwzR2DAKyvkUFoQsyLm5+pbObFPVqW6CME41ZtW8yLHnxqiIe4sBYNisFAg6T
         YXQU82BlfFd6Apql8j0lZ12AZ21gwyouukcvpK+0n9SOFMcRFwT5C7BbJ5HNDLX+/S51
         1Zu0WdOx8Msmy7QPvyc25JxBgwR8ztc/u9/2UthQlVQsfokH3SUKP6QMmpIzHahHazKG
         kr7g==
X-Forwarded-Encrypted: i=1; AJvYcCVJAQciGkU4a0JaOjE6+lQp6nnFI5FyojGK+MQYxKxmYoDEjrsqi1xRtLgIJ8wERdmziGgpk1grsyARivg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrcutt99mDxS22wzU+46oWZTU5cNI5a4AR4OKEsM6bNt119orP
	bv+i87npw4Yn210P42m+YAzJa/y2dT2CAN5KS0AF4S5MBQbb+BD8jvxq
X-Gm-Gg: ASbGncsmGogSvfEJF0ZTrxzXnXQl9Y8CGl8dcj96Y1LRYzCHyX0sB9Fpr9T6W5hbmLQ
	8Z/Cph2H8NEY7JigkL9S6uZbnSSQmNFmzlkF9YjvPyWaweNUTQf7SnhZkc1aivMWDcPnZhYNe0U
	C4fZGnHMLYo2I8n5wH3zSvjiQ+FK6P0LzKeWX/R9KjI5Y1oxXLol2k4Bwr6xL61dow18XAYIv6y
	wApMWbhfZ5JQRYXSLDBx+W/9hPPMoZIW5FqUCSZzhLY3xxczEoz4m6Dp+H4gzP/OlhpZqeu3/vS
	MzoUpPsxwNxJOfpW3CFGq2OgjTevxYT6H2C7GGLLQy3Qw97DQoo8MyljIu/lqRyUxa3hSKeWS8Q
	4GYianvzCmJWvluC7rQ==
X-Google-Smtp-Source: AGHT+IEhcH1Eh2sxuz2dhf/9qQbdYl9KrMk1DSJaqjlnZ4S/lSOuKNutG0tXdGufHO/DVYbnkNGULg==
X-Received: by 2002:a17:902:e949:b0:235:1962:1c13 with SMTP id d9443c01a7336-2366b34426cmr230449935ad.14.1750185332656;
        Tue, 17 Jun 2025 11:35:32 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.123.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm83753715ad.128.2025.06.17.11.35.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 11:35:32 -0700 (PDT)
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
Subject: [PATCH 2/4] mm/shmem, swap: avoid redundant Xarray lookup during swapin
Date: Wed, 18 Jun 2025 02:35:01 +0800
Message-ID: <20250617183503.10527-3-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250617183503.10527-1-ryncsn@gmail.com>
References: <20250617183503.10527-1-ryncsn@gmail.com>
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
---
 mm/shmem.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 4e7ef343a29b..0ad49e57f736 100644
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
+static int shmem_swap_check_entry(struct address_space *mapping, pgoff_t index,
+				  swp_entry_t swap)
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
+	order = shmem_swap_check_entry(mapping, index, swap);
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
+	if (shmem_swap_check_entry(mapping, index, swap) < 0)
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

