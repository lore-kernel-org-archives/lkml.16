Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB226FD87
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469526; cv=none; b=taI4F9Qsj/mkvlCTwW9sHhBm1EcuaaeWB9akphUDUhFuZo60gTfew/cmrb1urPjcWWNIUsZ9ot4A+uVo6FeZifs+xPv2CVAQYWQ7IS845CqE9+c6+e/2finDIpI6Ba9/DbvaVJ2TlXyD1cbTwW7Cr0DZwxrLgEvEF1zr+0gnei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469526; c=relaxed/simple;
	bh=rpHxyb0DLYYyztziMIbQjAgIVXs+GZVjWh0HN3QaywQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+FOZOVqs3J3s2H6QTWMOd4nUNXi3log54STeUkMXIIjAk/ILIApSpaJJlobw5xMbW3Q3G4p6i0Lq48gKfZkFanr8sGqnGNfpkoNVS78baIKy+UpMlomWfNuqHts/kQwQhy8XOlEcy2EJEpxLjYSi+3Ai/sTpR26RvKnUR66m28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1XQBGo0; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1XQBGo0"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e743bffc234so3793834276.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746469524; x=1747074324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwqgkNEYXyHkWyB1qk5+iP2RABWt8GbLuKvUfRd5GZM=;
        b=R1XQBGo0nAQoQkKWlJCrBoD0oLwh+xYbk7fayKi5sn8Q0U323XPlb5266MP+v5l+IF
         NZGxnUVgLwZlqKYNRo+ek7mh1KBsjEQNlPB8u3IBNXHGThH4CcNeIJ37otCecHCsKhFo
         OvVvN02e2gytJN7r0Qz014/gu1yfSEAA+MwTQ47vKco8KBtYXA2p8NRRrQL7sktQvmZg
         s8+plIFkJ7UAMuUcYs3Dd3/d+sNGu1LRPC1C0MGCbV6aJUfvvQ6DqRBBfTO4T+rZ2c3s
         XZXXCufadodUyRlekwh/7LCo12qVUVct9ysMIqxKsw+bNeq3B9ahB1trXdEVvrcelEWJ
         EIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469524; x=1747074324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwqgkNEYXyHkWyB1qk5+iP2RABWt8GbLuKvUfRd5GZM=;
        b=Axn3Y1tfRcN69P17LWicYHA2lKxYeyxPKqVRnuQ8u7N7MthO0T8GNsxove91kzJP/9
         1dkIwLb7FNc83qQ9Pf3L/wIslx7A9pfLu54RWdrtR2F6iokNjbCSEjlPgzI/juZaYnMU
         IkG3DDn/vy4F2pv9B/W9HRC9a76i7O5mOtuQZOdDtUhprzhNM8hKJayPwOmJPAikcASB
         W5JpaiiFt4QW+FJD04VVD9DcK9MxNupH338DZn5rdp9WyUW/vuFWdd5tfUTErmrZFGtw
         aNsXCPhotYMph9RTHcvrMESFZzCMVT8hUfD97rwCvWq4jGGP1I+y0nCIoVYccgZZ3UUz
         qUHw==
X-Forwarded-Encrypted: i=1; AJvYcCWWo7EzYcgzE7sB7+9GKdYsyS5p1wfXe6G5q7AW791SEb8s7zh02XA0hRdYZoojLgqk+fJ3+oGtzKGOk/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJJrO2ZXA0cJ1ZB0xockv2tmaeQH5I7C2FX7V4/yNCVFez0qN
	ulVzoiCD5kStPNKIgQ5tTynx77ft1CB8+yNCULteuqn4ylP9lCWX
X-Gm-Gg: ASbGncuLz2HUQkd6ft+4CFaKzkB8KjS2QsD62KMOmBBF3z9cvJ/X0uW1z5Tpvm26HXE
	COOyKHxGWC7VgzAa75qHkV9OfcuPWvOkVALiD1IfsqUEHjq0qzBfl/Rz2hRM+KZaxeN+6PNJmr0
	eS98uZzMaVvQzL6VqacbfMQ7CXTctwXDFLwukI4zYhiWRia3AOZG5JXDatbCVL333EoVThUA4sK
	jpjfbrmgdJUGE4YatD9kt332AaQeg/XboJdhR/FLzxIFD3qW9Hl6mdDvS8YayJteH8e2f6lZbpw
	0pCTjnJvY0r0aJRBF9K3zigLS5sd9p2H0ujxY8OO/6dIFi37yTQ=
X-Google-Smtp-Source: AGHT+IE2+UpQqJEfjCrdtdiWhaN6CoBtUcm6sMMIYpKWlJ/i479Wjm6/BZbUBkpHYu7GG5xJuDO0gw==
X-Received: by 2002:a05:6902:2183:b0:e72:8957:328d with SMTP id 3f1490d57ef6-e757d350a3cmr9673327276.34.1746469524067;
        Mon, 05 May 2025 11:25:24 -0700 (PDT)
Received: from localhost.localdomain ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7a897asm2113429276.38.2025.05.05.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:25:23 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org,
	osalvador@suse.de
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	nifan.cxl@gmail.com,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH v4 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of page
Date: Mon,  5 May 2025 11:22:43 -0700
Message-ID: <20250505182345.506888-5-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505182345.506888-2-nifan.cxl@gmail.com>
References: <20250505182345.506888-2-nifan.cxl@gmail.com>
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
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index f6d5f24e793c..eb21619206af 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -134,7 +134,7 @@ void unmap_hugepage_range(struct vm_area_struct *,
 void __unmap_hugepage_range(struct mmu_gather *tlb,
 			  struct vm_area_struct *vma,
 			  unsigned long start, unsigned long end,
-			  struct page *ref_page, zap_flags_t zap_flags);
+			  struct folio *, zap_flags_t zap_flags);
 void hugetlb_report_meminfo(struct seq_file *);
 int hugetlb_report_node_meminfo(char *buf, int len, int nid);
 void hugetlb_show_meminfo_node(int nid);
@@ -455,7 +455,7 @@ static inline long hugetlb_change_protection(
 
 static inline void __unmap_hugepage_range(struct mmu_gather *tlb,
 			struct vm_area_struct *vma, unsigned long start,
-			unsigned long end, struct page *ref_page,
+			unsigned long end, struct folio *folio,
 			zap_flags_t zap_flags)
 {
 	BUG();
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index c339ffe05556..443b75e116cf 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5840,7 +5840,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 
 void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			    unsigned long start, unsigned long end,
-			    struct page *ref_page, zap_flags_t zap_flags)
+			    struct folio *folio, zap_flags_t zap_flags)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long address;
@@ -5913,12 +5913,12 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 		page = pte_page(pte);
 		/*
-		 * If a reference page is supplied, it is because a specific
-		 * page is being unmapped, not a range. Ensure the page we
-		 * are about to unmap is the actual page of interest.
+		 * If a folio is supplied, it is because a specific
+		 * folio is being unmapped, not a range. Ensure the folio we
+		 * are about to unmap is the actual folio of interest.
 		 */
-		if (ref_page) {
-			if (page != ref_page) {
+		if (folio) {
+			if (page_folio(page) != folio) {
 				spin_unlock(ptl);
 				continue;
 			}
@@ -5982,9 +5982,9 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 		tlb_remove_page_size(tlb, page, huge_page_size(h));
 		/*
-		 * Bail out after unmapping reference page if supplied
+		 * If we were instructed to unmap a specific folio, we're done.
 		 */
-		if (ref_page)
+		if (folio)
 			break;
 	}
 	tlb_end_vma(tlb, vma);
@@ -6059,7 +6059,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
 	__unmap_hugepage_range(&tlb, vma, start, end,
-			       &folio->page, zap_flags);
+			       folio, zap_flags);
 
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
-- 
2.47.2

