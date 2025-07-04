Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D242E0930
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653117; cv=none; b=k9V8j3KxZ0zKBY7yf3EyFiBmFT0YgSdp9Q3GqLLaSXcn7S/O7orufMlNxtBSLMP2Hgi72FUMXCphMCIHAhk+/15Kh1FO2OdkmAy/sW6HOLIys+ph17LMEX1b8EujsprMCd1t+R6jafgYSoo2CEAcrfyAc8RBqjBmUR3FZPiotfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653117; c=relaxed/simple;
	bh=CtSDpT85CFG5ng5SEZoFLiGtPGa/AzU9x1e2bZjTrG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtTQDbHwI7mjwhYD6drIW5hV7Xu2O/cUvAPmc2dFCG1aSGxZcGA4sczta+jGNMutBKeRVln0SO66XPBVOUUirZ/zkZvoqnVqCaCitzdgvUxKZwOBA2WPudVysbeVwBuIW2WecEfDAeB1Q3hlNqhHUEKEqRmLHkffzW8sJV/Tr5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRqW9Ny4; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRqW9Ny4"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d44c6774e7so73089785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653115; x=1752257915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E8faw6sAX+Ml82MO55gj9R3m/gUe9viz373aFcWSXcQ=;
        b=TRqW9Ny4YPPxkLVxnU/xUv6txWQgejKnvtXJjhrjY2I749NI6b3My9P/8lW4Anoeko
         w6uR62r4rwRGeRuLqPKpDFG+kfW/PiCkyYvyFEnTg2HFFYbdxNNTn63R9RKoAqKLWQfG
         ydzvo8Mqq5AGOZZ58033UKobEP10dU64nUgqOWMp8q2DnA28OAVCDal/TW5QDEMATekY
         ur82FigQXq+1hwYtu3kinbWStBZKZy39ZsCI6JAhz6f6nRu7g+ehkAvnmhavfthdGIVo
         goDl0p0h4o8qNo0R5RN7RW6UHVtgCYG0dxSSFGS6w+3musv78WT26Qf38U7pGEGLZTFJ
         F64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653115; x=1752257915;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8faw6sAX+Ml82MO55gj9R3m/gUe9viz373aFcWSXcQ=;
        b=cs9ZiMDDix2N7MlFOrmUhjX4LvBvec5i51zdXMfeS6lD7w9yJHtDlQzk1GEcrEGATi
         Grytthc/dfg9VbF50BgWLrm635Q2sen+Fsv7s+bO3VlRT5KT/GULFC38/Ya0/oGe9/Xr
         AwRTxa7xWOEGs4J6hqfOq+8uhfaJrvdQSQqXa4fXWK/DcypHI9A0woKY20bWQkkGolTv
         zrreB5VWVj8KHnx9egSQHW0wXvy+flfZ1Mm6L9N7FXr0w2SG51hHjdba84N8AOy7U545
         4d+kT4kFKgMHw015P5Wql4kfiVp/gcd7cXhDjI64dZhKbCkvasYKhbyzK0lWEocWEHJx
         4v/g==
X-Forwarded-Encrypted: i=1; AJvYcCX5liiIo8na5TN1njjbSj5v65kDhxsF3k20kJBLC1fsYYqRhqz23Se+8BQcB0T8o9oYHuu4oCug0sLYF3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjxZKGz7xzaD6r86YsbK8zE0puVJodwjyzRFdZtKDZTIvIDp4C
	2T4KBh83NMYeiuuLSpLiA6XjKlOzFCEDBZNyfxcoITzyCQRFytyot9Y4
X-Gm-Gg: ASbGncuZKdQ2C9PnkSrGkOO/ObITt3zOysZ9NTwH6y/I80+apLodO797UpImpn3pg4l
	5Utg4OwVIf5HP4vQ2w2MB4KbXg8bbh/juuJ/CSI2QoLdgWtoQMfAFIuJXujSfI2eJNSVtkk0U+U
	5wAc+9lIWV8mAH/qRBZogSCKN2itbLJEvrNJJz65gYlO2BRithAiWoeVULFk+OtV9TyY+rRwt6+
	fEQ7NDbytPBjcNratQCBX+C+mV9O/v2dDfd9G8uRCERtiWq052x1pI9XYV5z1642M19pGWSWIGX
	M3p4HPVz3ShOQifcMBvp9UGwHC2IfSKt3hNmk6jlvxlMMRN1qji/xo+dn33AGqKNcro=
X-Google-Smtp-Source: AGHT+IGEl8jKR2TlZ4n+3yLyyMozyoKc99DvoeWJCrCkBYUgU9He1oJ+ddvGlfVppqxhmA8PRgOQCQ==
X-Received: by 2002:a05:620a:60db:b0:7d4:604c:31bd with SMTP id af79cd13be357-7d5df194ae3mr349988085a.56.1751653114688;
        Fri, 04 Jul 2025 11:18:34 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:34 -0700 (PDT)
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
Subject: [PATCH v4 8/9] mm/shmem, swap: simplify swap entry and index calculation of large swapin
Date: Sat,  5 Jul 2025 02:17:47 +0800
Message-ID: <20250704181748.63181-9-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704181748.63181-1-ryncsn@gmail.com>
References: <20250704181748.63181-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Noticing large shmem swapin have already calculated the right swap value
to be used before the swap cache look up, simply rounding it down against
the size of the folio brought in the swapin is simple and effective
enough to get the swap value to be verified. A folio's swap entry is
always aligned by its size.

Any kind of parallel split or race is fine, because the final
shmem_add_to_page_cache always ensures entries covered by the folio
are all correct, and there won't be any data corruption.

This shouldn't cause any increased repeated fault too, instead, no
matter how the shmem mapping is split in parallel, as long as the
mapping still contains the right entries, the swapin will succeed.

This reduced both the final object size and stack usage:

./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
add/remove: 0/0 grow/shrink: 1/1 up/down: 5/-214 (-209)
Function                                     old     new   delta
shmem_read_mapping_page_gfp                  143     148      +5
shmem_swapin_folio                          4020    3806    -214
Total: Before=33478, After=33269, chg -0.62%

Stack usage (Before vs After):
shmem.c:2279:12:shmem_swapin_folio     280    static
shmem.c:2279:12:shmem_swapin_folio     264    static

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 782162c0c4e0..646b1db9501c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2267,7 +2267,7 @@ static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
 	if (xas_error(&xas))
 		return xas_error(&xas);
 
-	return entry_order;
+	return 0;
 }
 
 /*
@@ -2288,7 +2288,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct swap_info_struct *si;
 	struct folio *folio = NULL;
 	bool skip_swapcache = false;
-	int error, nr_pages, order, split_order;
+	int error, nr_pages, order;
 	pgoff_t offset;
 
 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
@@ -2336,8 +2336,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 				folio = NULL;
 				goto failed;
 			} else {
-				if (folio_test_large(folio))
-					swap = index_entry;
 				skip_swapcache = true;
 			}
 		} else {
@@ -2349,6 +2347,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			}
 		}
 	}
+
 	if (order > folio_order(folio)) {
 		/*
 		 * Swapin may get smaller folios due to various reasons:
@@ -2358,23 +2357,25 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 * large swap entries. In such cases, we should split the
 		 * large swap entry to prevent possible data corruption.
 		 */
-		split_order = shmem_split_large_entry(inode, index, index_entry, gfp);
-		if (split_order < 0) {
-			error = split_order;
+		error = shmem_split_large_entry(inode, index, index_entry, gfp);
+		if (error)
 			goto failed_nolock;
-		}
+	}
 
-		/*
-		 * If the large swap entry has already been split, it is
-		 * necessary to recalculate the new swap entry based on
-		 * the old order alignment.
-		 */
-		if (split_order > 0) {
-			offset = index - round_down(index, 1 << split_order);
-			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
-		}
-	} else if (order < folio_order(folio)) {
-		swap.val = round_down(swap.val, 1 << folio_order(folio));
+	/*
+	 * If the folio is large, round down swap and index by folio size.
+	 * No matter what race occurs, the swap layer ensures we either get
+	 * a valid folio that has its swap entry aligned by size, or a
+	 * temporarily invalid one which we'll abort very soon and retry.
+	 *
+	 * shmem_add_to_page_cache ensures the whole range contains expected
+	 * entries and prevents any corruption, so any race split is fine
+	 * too, it will succeed as long as the entries are still there.
+	 */
+	nr_pages = folio_nr_pages(folio);
+	if (nr_pages > 1) {
+		swap.val = round_down(swap.val, nr_pages);
+		index = round_down(index, nr_pages);
 	}
 
 	/* We have to do this with folio locked to prevent races */
@@ -2389,7 +2390,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		goto failed;
 	}
 	folio_wait_writeback(folio);
-	nr_pages = folio_nr_pages(folio);
 
 	/*
 	 * Some architectures may have to restore extra metadata to the
@@ -2403,8 +2403,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			goto failed;
 	}
 
-	error = shmem_add_to_page_cache(folio, mapping,
-					round_down(index, nr_pages),
+	error = shmem_add_to_page_cache(folio, mapping, index,
 					swp_to_radix_entry(swap), gfp);
 	if (error)
 		goto failed;
-- 
2.50.0

