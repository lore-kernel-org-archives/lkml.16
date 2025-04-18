Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E584219E9E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996199; cv=none; b=e4251pXxC0Z8iDQHclYA48zWv/6JTiwCYu8oXgz5hsGKuhJsgoPPSgoa8C68bNvYIlCA2maTKMc3I0dILC6gthkBEzE+Vinx7jL7z1sgcdgeoGQrHd4IsjF/EjIx9/Zw9WecPvWWIsL6IeQ+rnerDFkKmblAXPWr+CqGfvoygzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996199; c=relaxed/simple;
	bh=ELPnDAx3/1W+bWew1ejffkovNnrgbrMaQDk5i3kzzdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miKfObb/MPq5PUPBS8fz+onrtqDT6GhJy68KoKV1v4Cr9AKKVPQGLB8Atkbgd9j17tPM1dnoqM2A9HDwRCQp6GoGiMr1igZECRv67Yc+7weJIxd0zf1/WigoPoIj8iwvxedrBcRNi1U8c1WdnSEW5vVHHkoR5ud/04mkhCvA1Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccI3FQby; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccI3FQby"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2070637b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744996197; x=1745600997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsTdqsYgwhibA932I5tR8o+Lh0DhDirBiJnZYsrDEio=;
        b=ccI3FQbyjhn2XjIM0NkBGRf8MOGg06WBXXeEab0wOsolc+dh5YwHc6QWmDiuvE/F+d
         abC6vK+r7crypZ4QzlaSrcIuwLjvabnlWn9rrwp98d7Lj/FbUbTafDDCJM9fuoi0bGNi
         ZvGwm8rlWfx1hunq5KyCk8C1rYq9nlvZ/3Z0x+tmDbtiCa/OKGtpI2N8CUkDXhQsEkBX
         jA39Q4nuqLDbwZfbdNuJFljMc8PHGbqUIXXgwB9tw7HRhUy1oA4VVrXHy/DjDaIqvUkw
         QaQ6GhX7oQAKvCdjgs2/7/c7iajB85kqtYmpw2GQawietmLqVkZhw3c6YscCBHN6lZ5V
         VnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996197; x=1745600997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsTdqsYgwhibA932I5tR8o+Lh0DhDirBiJnZYsrDEio=;
        b=vi/7dyEmgqfsZF4591rIpLsSF7xmynEXe6pd480brtKKT8bxlztvPDcTUb4ef/ec9A
         Ugk2iD7OHd23aqNkSztLsN2PsUly49PICQJbNQqmf74MwOe+b7/IR6CmhFwOyZcZZ+cC
         t15Hq3SSQz7Xofak0F9fD300Mxv00EF7z21kHP6lmRPwJ+IwTmuhJwNY3fpn5inTQD82
         ClhdojFAmMeUFYGAdq8gJOUtjo053RznHEsYDa3mKs8B3tlpti9L90FN3tyMlJ/9LzO5
         k0/PuIe4yPupnB9XFZLeA3Tn0CyHnCxMWcVarkxsg8Ze8Mv2oj9/JH6TqaPUwvf0QCH5
         U7sw==
X-Forwarded-Encrypted: i=1; AJvYcCUdzTz3E6YOqV93gyo12nDXbvsi39Zvu3G5p50gw2S8k6Zej4ojba797JGsr4it6xZekMXilYnb7su6xnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd92N4Lu8zEnP7JDo57UqBcfcapNk9Y392RG9KtwYqdVQxxRI2
	lO47IohQYgtmqXPPw6dipaBCgMZnmXxtb/g7y63OOX7FqH6RaaOJ
X-Gm-Gg: ASbGnctE80rRNP9Rk7kg5yk9pnVs1FtuJzwX8Lb4Dx8Y6LPwUei0L+Mttub0S2rUKT8
	BTq+WFQkypFcpvMxBtdhnY40GKfmAweBYytzmFqJ2DBzBKkQFr5oyxy1SC2upZo7jDcLBfcgoKj
	krRTz3v7e00MPOrElHtlGfExULtFItNfnL3t451rmlfnN/SV68Nm0d3H0aGx9uEaUnFQlETJmrl
	DYDIxDbcMvh31e7vmW8XD182Zwp+RXtnbOu2G+aKWSKBflxLHX6cDtFDe+6eF4uNykxU1gasqod
	djWIK2hLtN4ypZzz80XKm8RVdMc1tD/aiwgb56XK7DyiOaQzWoF7oV+/hA==
X-Google-Smtp-Source: AGHT+IHSvLp7xjrutlovDlb6Cd2121SALH2AYdmlJW33uOknBUVUuhOpoIUEZNHkILgFO6AID+VXrQ==
X-Received: by 2002:a05:6a00:a91:b0:737:6d4b:f5f8 with SMTP id d2e1a72fcca58-73dc1568775mr4256597b3a.17.1744996197143;
        Fri, 18 Apr 2025 10:09:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59176sm1834069b3a.113.2025.04.18.10.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:09:56 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH v2 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of page
Date: Fri, 18 Apr 2025 09:57:41 -0700
Message-ID: <20250418170834.248318-4-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250418170834.248318-2-nifan.cxl@gmail.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

The function __unmap_hugepage_range() has two kinds of users:
1) unmap_hugepage_range(), which passes in the head page of a folio.
   Since unmap_hugepage_range() already takes folio and there are no other
   uses of the folio struct in the function, it is natural for
   __unmap_hugepage_range() to take folio also.
2) All other uses, which pass in NULL pointer.

In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
take folio.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
v2: fixed issue mentioned here:
https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m2b9cc1743e1907e52658815b297b9d249474f387

v1:
https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m738e9e7f7d7fe4aab6b21782b4658dd65abf8fc4
---

 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index b7699f35c87f..ebaf95231934 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -133,7 +133,7 @@ void unmap_hugepage_range(struct vm_area_struct *,
 void __unmap_hugepage_range(struct mmu_gather *tlb,
 			  struct vm_area_struct *vma,
 			  unsigned long start, unsigned long end,
-			  struct page *ref_page, zap_flags_t zap_flags);
+			  struct folio *ref_folio, zap_flags_t zap_flags);
 void hugetlb_report_meminfo(struct seq_file *);
 int hugetlb_report_node_meminfo(char *buf, int len, int nid);
 void hugetlb_show_meminfo_node(int nid);
@@ -452,7 +452,7 @@ static inline long hugetlb_change_protection(
 
 static inline void __unmap_hugepage_range(struct mmu_gather *tlb,
 			struct vm_area_struct *vma, unsigned long start,
-			unsigned long end, struct page *ref_page,
+			unsigned long end, struct folio *ref_folio,
 			zap_flags_t zap_flags)
 {
 	BUG();
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3181dbe0c4bb..7d280ab23784 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5833,7 +5833,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 
 void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			    unsigned long start, unsigned long end,
-			    struct page *ref_page, zap_flags_t zap_flags)
+			    struct folio *ref_folio, zap_flags_t zap_flags)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long address;
@@ -5910,8 +5910,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 * page is being unmapped, not a range. Ensure the page we
 		 * are about to unmap is the actual page of interest.
 		 */
-		if (ref_page) {
-			if (page != ref_page) {
+		if (ref_folio) {
+			if (page != folio_page(ref_folio, 0)) {
 				spin_unlock(ptl);
 				continue;
 			}
@@ -5977,7 +5977,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		/*
 		 * Bail out after unmapping reference page if supplied
 		 */
-		if (ref_page)
+		if (ref_folio)
 			break;
 	}
 	tlb_end_vma(tlb, vma);
@@ -6052,7 +6052,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
 	__unmap_hugepage_range(&tlb, vma, start, end,
-			       folio_page(ref_folio, 0), zap_flags);
+			       ref_folio, zap_flags);
 
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
-- 
2.47.2

