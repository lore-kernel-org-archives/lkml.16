Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5D134AC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 05:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745128328; cv=none; b=pydRax3UDDwLoUdCgjMr2KLafIVgsFOpMtA/KJofktTFk8PGYOLGCleBvebSvjk+wrbzD8hBSjWYfLrrS5xusHekd8sOp4XPYxV3tcgaWXMJFlBIxHSR7eaCYl31cSM7CYdxFBF5Q6sV4l5OXBzIuLix4nosS9t2xWpCEur7ygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745128328; c=relaxed/simple;
	bh=HCgaxnfn+Tp+WsF29tOMlEzQ5sDEhPtkaMDrsjM6Lu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQgAmFEum24GSERpstqywkcHM62/Wvje6oeKVJ7Om44c77r5RIMcLdVa3SxYy08jbvrbrE1AGws3IeGlkzSg4PS0CkU+G4j66XI037XHclQnX+Xr1UZBg4EcULdiqOS+GI1jvk+Xbw5xhHwyXMv7+eCZdMqu7gg1vqW2mwRA74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaaBDUmI; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaaBDUmI"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b09c090c97eso1978807a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745128326; x=1745733126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlR1Cl/7Pf+X4fiHaZz55r1eEkogd8TlZyAeSyaqNBM=;
        b=iaaBDUmIgpWepB5q0cCH7BCyXY4WnwIc46cNqyb9df1lJsS8Ip1yul2qsW7hFsQ+eO
         7JceSYIImb3mIbYnHNz+1+s8zE82IaLaWfvUtK5tiuDivjJIrf4b7rdCAsCmwX3lp7io
         clhGMw59U0FxIzDlTNhwM+sjwiFd+vKejLtWkjdU6yTJWPztY8GU7PkhfzCRbCDl8grb
         fnEJW5Z4weyBet97h00d6+71wEHXEnN4qji84+smDIQJIum/CVSKZw32ZPJhwP9WjQTa
         n1lwdiOE9Tefjhr97p+QVK3KrbB8K3hVD7Cjy5OoyxDMZxZVnWLS6G69b/LZQj7VkSkW
         yi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745128326; x=1745733126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlR1Cl/7Pf+X4fiHaZz55r1eEkogd8TlZyAeSyaqNBM=;
        b=AoWk2zlxRCIUsh1CvZlpFSofEsm3H4RU0TcRe6iLxLtA175XfIBfEkMTIjdYjnE3rj
         LPddz+DMv3O6/l0dZzVMPFt/efXRyy1MDoVdJrmZVoPjX/WB1SPb8F93nzIMlwe65yQv
         bWV40uoWlScmEMLLjfWVoPPG2ysuO/46XXx3BlfEA/y6WpCSoIRJIvsGa/mnwIlavAs1
         5V9txR9IdTOIU0e4/grNfXMxHjfhP+Dc/YUDqaEt0CVshz/qW6K0ZOzB6ZCkqOBJ0h4Y
         sAaV1vUc+QbqiWwYLTIPfnSX8eaEWeSLmNkehcZdjaXyR0rryavV1pKAlINVkuOaFVGy
         x4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWV8dottGLnOjEyz4SlcO6e7K8f++wkuLUNGp74IRVCRZhjBqnKEZYbI2wDG2GjHa2jWhKyMLwDFHF0lBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Okn/xwn98RkWT0pY4BjinNxvpqZzqpEjlfTMNsMeTGpzFmLg
	7l5nA5bkKuaRKdaUsqivzQsqNPQfcUoZ+lMpihqeDGT1mDBlgVzC
X-Gm-Gg: ASbGnctI1rIeAsbbMgDAaoVWpUwU248PW7w0l1Zqr3Evgm++hOwx4ACDbheT0lEaJLB
	YFqUokKr9Cq66xx2dkhb6q81xMofgC0HT2fmMy6BZ1nXWQsV3zfmRSNULoUnpTzguFdilbdSvzL
	603iBGbzqXVoBOc25RLgGOzPoHnsPr60dG6EMP2nWlRRZNY85EZI19H26oKeMopenqBLSkxajbf
	VsChrtXjH/Se78VIL8epETN1PlkX7aRwqRqpAXvHNpY8gv3R2UdW7ZqnrzZrEhInQtbwBf17JSd
	ygMvh44onZzR6H1UegLqUG+W5Iu0dNYDjmBWF4vLZrtMDyhRfQ==
X-Google-Smtp-Source: AGHT+IF3cll38uRyxsB2kcUfmP59mZlO2KBDMq2EIAY6WmBp89fc1amrCvru7mMoZVUbqHrL11MH6w==
X-Received: by 2002:a17:90b:498d:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-3087bbaeb22mr10719705a91.27.1745128326453;
        Sat, 19 Apr 2025 22:52:06 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4e12asm4062534a91.37.2025.04.19.22.52.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Apr 2025 22:52:06 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com,
	ioworker0@gmail.com,
	david@redhat.com,
	willy@infradead.org,
	ziy@nvidia.com,
	mhocko@suse.com,
	vbabka@suse.cz,
	surenb@google.com,
	linux-mm@kvack.org,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mm/rmap: optimize MM-ID mapcount handling with union
Date: Sun, 20 Apr 2025 13:51:59 +0800
Message-ID: <20250420055159.55851-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

This patch moves '_mm_id_mapcount' into a union with an unsigned long
'_mm_id_mapcounts'. In that way, we can zap both slots to -1 at once via
-1UL, which is compatible with both 32/64-bit systems and makes compiler
happy without any memory/performance overhead.

Also, we remove the two MM_ID_DUMMY checks for each '_mm_id' slot and only
validate '_mm_ids' once.

Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 include/linux/mm_types.h |  6 +++++-
 include/linux/rmap.h     |  3 +--
 mm/internal.h            |  9 +++++++--
 mm/page_alloc.c          | 11 +++++------
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f9..0ac80eaa775e 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -363,6 +363,7 @@ typedef unsigned short mm_id_t;
  * @_mm_id: Do not use outside of rmap code.
  * @_mm_ids: Do not use outside of rmap code.
  * @_mm_id_mapcount: Do not use outside of rmap code.
+ * @_mm_id_mapcounts: Do not use outside of rmap code.
  * @_hugetlb_subpool: Do not use directly, use accessor in hugetlb.h.
  * @_hugetlb_cgroup: Do not use directly, use accessor in hugetlb_cgroup.h.
  * @_hugetlb_cgroup_rsvd: Do not use directly, use accessor in hugetlb_cgroup.h.
@@ -435,7 +436,10 @@ struct folio {
 					atomic_t _entire_mapcount;
 					atomic_t _pincount;
 #endif /* CONFIG_64BIT */
-					mm_id_mapcount_t _mm_id_mapcount[2];
+					union {
+						mm_id_mapcount_t _mm_id_mapcount[2];
+						unsigned long _mm_id_mapcounts;
+					};
 					union {
 						mm_id_t _mm_id[2];
 						unsigned long _mm_ids;
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 6b82b618846e..99c0518c1ad8 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -231,8 +231,7 @@ static __always_inline void folio_set_large_mapcount(struct folio *folio,
 {
 	__folio_large_mapcount_sanity_checks(folio, mapcount, vma->vm_mm->mm_id);
 
-	VM_WARN_ON_ONCE(folio_mm_id(folio, 0) != MM_ID_DUMMY);
-	VM_WARN_ON_ONCE(folio_mm_id(folio, 1) != MM_ID_DUMMY);
+	VM_WARN_ON_ONCE(folio->_mm_ids != MM_ID_DUMMY);
 
 	/* Note: mapcounts start at -1. */
 	atomic_set(&folio->_large_mapcount, mapcount - 1);
diff --git a/mm/internal.h b/mm/internal.h
index 838f840ded83..1505174178f4 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -772,8 +772,13 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
 		atomic_set(&folio->_nr_pages_mapped, 0);
 	if (IS_ENABLED(CONFIG_MM_ID)) {
 		folio->_mm_ids = 0;
-		folio->_mm_id_mapcount[0] = -1;
-		folio->_mm_id_mapcount[1] = -1;
+		/*
+		 * One-shot initialization of both mapcount slots to -1.
+		 * Using 'unsigned long' ensures cross-arch compatibility:
+		 * - 32-bit: Fills both short slots (0xFFFF each)
+		 * - 64-bit: Fills both int slots (0xFFFFFFFF each)
+		 */
+		folio->_mm_id_mapcounts = -1UL;
 	}
 	if (IS_ENABLED(CONFIG_64BIT) || order > 1) {
 		atomic_set(&folio->_pincount, 0);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index bbfd8e4ce0df..f5c5829c4bfa 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -976,12 +976,11 @@ static int free_tail_page_prepare(struct page *head_page, struct page *page)
 			goto out;
 		}
 		if (IS_ENABLED(CONFIG_MM_ID)) {
-			if (unlikely(folio->_mm_id_mapcount[0] != -1)) {
-				bad_page(page, "nonzero mm mapcount 0");
-				goto out;
-			}
-			if (unlikely(folio->_mm_id_mapcount[1] != -1)) {
-				bad_page(page, "nonzero mm mapcount 1");
+			if (unlikely(folio->_mm_id_mapcounts != -1UL)) {
+				if (folio->_mm_id_mapcount[0] != -1)
+					bad_page(page, "nonzero mm mapcount 0");
+				if (folio->_mm_id_mapcount[1] != -1)
+					bad_page(page, "nonzero mm mapcount 1");
 				goto out;
 			}
 		}
-- 
2.49.0

