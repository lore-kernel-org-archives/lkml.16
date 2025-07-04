Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275F2DEA79
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653104; cv=none; b=dIAXwfPXmtCsg2j5n/7aRluA3s0bW7kLzQCu3IGdteVVhPext3Kbe7c4zYhCMybB63lIsicWGgmNOaXQbZ+UoWR31TreuFIVvopZ93/DNECYFfB7R5sn6Drz/Wsy4eXxDCTzbuR3PnNC88MjJxcmADdXf8HhqiyzoDmbis8iVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653104; c=relaxed/simple;
	bh=WFMgaPbe7/k/TJWVX1DTB5F8B8zvI68uO7UL8ILITxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjKa0AQylhYS8FP3xY4rAQ3vSqcncZ5my2rWaMkpd0SjUTooZcNARhMUA6ES9nAimNF/43udUYY97nbGGRA9dx0e/fAse/CGfcFrW5xL20XQCKAfZ5xQEM6qkbr+7auBCHfJmeBJOGvcAGNXpTv/CCWVocr8uhETszOGkqK9Ipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOSYIapr; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOSYIapr"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d412988b14so119417085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653101; x=1752257901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XC/4+8+y/JD3aw5ERJm3ttJpqS7kWZzM7x3+YpNqmRM=;
        b=TOSYIaprkYob/PWh05V7/5AlDCqSJqb5XWvpNzGC9cUyQyKt1NdLVrr0FDVRJxnCFy
         xbUfqkwK/oULSGwEz1NHus6DuPov1oNf2fx0CWNcABtdh/OsGIcQqXbbcZVgP1l1F8ip
         EEYKdhDzDYgT4EXxoBhcfv0drrYQ3ayl9pmC24sDVUWrhyBnrz1fzXZa5CzmqdZgwxeD
         GkwJBv6oR8k/yeVNcSLj/1X8+0iCcmTPZrCx3gG4zPXV2Jseb3w4W8XML8dGNC1Qr5FB
         GOVJWSbCVIwKZFkTiZ4JPlp/V61AuPcbZFk4Hhk/LAVhFtHJpy7Itv3oOv5OaetDZhpF
         pyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653101; x=1752257901;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XC/4+8+y/JD3aw5ERJm3ttJpqS7kWZzM7x3+YpNqmRM=;
        b=TQqBtct5gHIIdB6REzhRoqr72KwaLPdW/5Hl1izY1IhhkxUW5D0P1ibDHHq2pb7rmZ
         j1Pth9HXQCdDq3MvO4hPbW8Sfc72xFtTDKfBj73e5tWGN6/eNTWuG+VjVehzSDgG8oiW
         Gj1y/rXM3/M5vVIImFMvA7+1nc6cXMigi9LmO1iOGIFucdD0+FiODNLMkb5UbLKm5q/g
         PZjjl8JBS+XOMaS2L9gqofKM/m8f6BCLG8oKgAU6PqeAG5t1RPszRW9B8wlWT0tNVUVT
         AW6XGH2LYA5MJtPQy86x53tww5gbwSYqIUDuCim6DP3RRIYx4COUazIjRLJuyCqnShdH
         wDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTj8E2vu3uMUxjDnximrJi8f6wKoNqlb7a3uEkKBPNdEJ/Z64Hci+IFH0NGESlaZmFNPm9xEuC8AHfHQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuRO82hzV2GwvD2XGcrcEdfenKb1Ws00u0GsxFanrhdbWls0ly
	YfIZat0DRgpy3ZkYXzOT0fmOofKPL4l45TKSHQV2Ujf7nZYrlRpjTYsH
X-Gm-Gg: ASbGncvTdasPgeEOzCDxVwQ2QtXcnmFJwl58G9swXpRW5siByQtFaCWTS8gyePl5Xzj
	tOWm1025VupD5cD645QiTL/9YT5fN5EU6mjSWSBfS+W19MfZ0k1l6uanU44q2C92MVrnHFqXKkQ
	FY5NjJ9EB0CuhMcw9eNgq/jfFveoRpeKsrKxAGATiGoziCDT5fii/04juB3NHsUoxcaFNiooj2e
	bJkTzK21CR6Ed+9NWIUUC3g8iIfSTVidsKKcebuc2BKZ0dFcircbYwv/lCThO3drynqWKiuwFFU
	qxITGKDXj2k68cyYcVtcYOuLq/7D3hNVTiHbXoJ6vC355OME56M6yDc3VQ//KzMDyNw=
X-Google-Smtp-Source: AGHT+IHIhs+aAYNm5nbtVGiYot+y4zzSvlKo3r5oS8teUGWvSp1aiRlv/9hyciyEEGHfYCfto31h6A==
X-Received: by 2002:a05:620a:2482:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5ddc2eb1fmr413391385a.28.1751653101143;
        Fri, 04 Jul 2025 11:18:21 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:20 -0700 (PDT)
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
Subject: [PATCH v4 5/9] mm/shmem, swap: avoid false positive swap cache lookup
Date: Sat,  5 Jul 2025 02:17:44 +0800
Message-ID: <20250704181748.63181-6-ryncsn@gmail.com>
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

If a shmem read request's index points to the middle of a large swap
entry, shmem swap in will try the swap cache lookup using the large
swap entry's starting value (which is the first sub swap entry of this
large entry).  This will lead to false positive lookup results, if only
the first few swap entries are cached but the actual requested swap
entry pointed by index is uncached. This is not a rare event as swap
readahead always try to cache order 0 folios when possible.

Currently, shmem will do a large entry split when it occurs, aborts
due to a mismatching folio swap value, then retry the swapin from
the beginning, which is a waste of CPU and adds wrong info to
the readahead statistics.

This can be optimized easily by doing the lookup using the right
swap entry value.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 217264315842..2ab214e2771c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2274,14 +2274,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	pgoff_t offset;
 
 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
-	swap = index_entry = radix_to_swp_entry(*foliop);
+	index_entry = radix_to_swp_entry(*foliop);
+	swap = index_entry;
 	*foliop = NULL;
 
-	if (is_poisoned_swp_entry(swap))
+	if (is_poisoned_swp_entry(index_entry))
 		return -EIO;
 
-	si = get_swap_device(swap);
-	order = shmem_confirm_swap(mapping, index, swap);
+	si = get_swap_device(index_entry);
+	order = shmem_confirm_swap(mapping, index, index_entry);
 	if (unlikely(!si)) {
 		if (order < 0)
 			return -EEXIST;
@@ -2293,6 +2294,12 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EEXIST;
 	}
 
+	/* index may point to the middle of a large entry, get the sub entry */
+	if (order) {
+		offset = index - round_down(index, 1 << order);
+		swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
+	}
+
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
@@ -2305,8 +2312,10 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 
 		/* Skip swapcache for synchronous device. */
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
-			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
+			folio = shmem_swap_alloc_folio(inode, vma, index,
+						       index_entry, order, gfp);
 			if (!IS_ERR(folio)) {
+				swap = index_entry;
 				skip_swapcache = true;
 				goto alloced;
 			}
@@ -2320,17 +2329,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			if (error == -EEXIST)
 				goto failed;
 		}
-
-		/*
-		 * Now swap device can only swap in order 0 folio, it is
-		 * necessary to recalculate the new swap entry based on
-		 * the offset, as the swapin index might be unalgined.
-		 */
-		if (order) {
-			offset = index - round_down(index, 1 << order);
-			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
-		}
-
+		/* Cached swapin with readahead, only supports order 0 */
 		folio = shmem_swapin_cluster(swap, gfp, info, index);
 		if (!folio) {
 			error = -ENOMEM;
-- 
2.50.0

