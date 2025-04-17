Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92B254846
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905368; cv=none; b=hE4fRg6HMQadsusScVX7KCAPdu76lKPXPG8ORILSUWXLhsC1PCBds0UF4To7zNk6icGB39stWVF6t2V65kySwRgttT8FIZy8f7UIIIKYqI5MhB8AHDfE69kxk8ByOidggTdirLdOcGGGMA27UTsf5lqUQC232eap8dtpyykrmaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905368; c=relaxed/simple;
	bh=XIy1TETct7ceQFwt/R5rYqGgneBGQXVAVFHkIGpP8EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2c/TawFje4E05s2ybMFLeQzHL01Avoi2ym1Lu0TavhxFZDq/99QakPr3d0EawNyXl2G/fQKTqbAriMcmJwq47Ow0GgYJGHUIUcJlz2Ac3wCTrlC2QJQpLckCIVIP297CmvQBB3eYuNyIM6TJbTu5P1CR5Pq8nTMntGkvHIThH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiZSKqc1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiZSKqc1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2241053582dso14870375ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744905366; x=1745510166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNo4trKsSrAblzJZ1AtMfvORrQgIvx7kTybovwOHbKI=;
        b=EiZSKqc12oQgDZp36xpbx5Sk/bcuHWCJBJUGhVN7My7f2i6EeWnllbPBXmKcZvsOzM
         Ju1gfT0LZBaB8HL89qOXWIh5GA4w65nN8v9u56o+0vcuZhXRzrQYkq0/bIsA/Ppnjit2
         lyEIdB00OZm701mQvGDqS1r1W+YYBMY6Tt+xnA+1aNI4XMBNv5g/2kO/SJ9MkaZXWUfk
         Dg2UDlrY4dOLiBGqcjjInVqfmTW7kGuC7GW9pNnRkQHnD2TLjP83ShsyNYwjoFdBqPh1
         SUKEr/K70gFuxtQaqwQ8FgEEnsGieVTAsQ35W6wEmZY3ekY7FkWNYVk/UmNQLVVW6Bz9
         6b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744905366; x=1745510166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNo4trKsSrAblzJZ1AtMfvORrQgIvx7kTybovwOHbKI=;
        b=miT0GxOvK+xH3PmUp4DqMGR5KwnkbUG412HOwywbD4r6bMcZJW+hMbb+HUcmgCJJuh
         tClDnsg1Oakkn58CV48JJcE8sYCWph0TG1JNtxMESNt//iHeFmVMEzBQY+ZFAdI7rpAN
         tK/j6p02KZFvAe0GjxArYKMhptc+tnZUienp27EcZP3w5DS1YZhaXipRd8AwFME3dY1j
         sKz4nZxKWt70IXjb1kovvrpePnEzyBJtri1sYSL+2yaBjksQCWVoj8vV6xZa1nbLUYmd
         B3oK049rhbYbDDD4u2juFjwy54Je3LoWeIWanuTEqLHCOr7sTi/Ct0HtG5EgSGPUiYWR
         APHA==
X-Forwarded-Encrypted: i=1; AJvYcCWdwYMaRRnOhb5Iy6psQwUFfXpfgxtNkPkhFK7WtjT0X2k0RZRmlqwpTSTTU3ojaBIdaGRfY3MhnBPlKTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dMMTMY7pIqnko5GKo30+OqWPAEDidsJvMBsF9Q4132ILQVZQ
	qBPfV8C5z0G9KFglzL9Z4MtGza4mZjzYLNNl0nAZCbsA2PmD/ki7
X-Gm-Gg: ASbGnctXeaCiVkchiVeczpFYszLO9V2QjMwxHybvR8i/K8H3Ylx5erkRmstFcDa+rnw
	pDx9uQOmfekUoovcqmwLfbrpQx0TnkSbgVC+4Zupt01c510CX4B2fzNaBmkV3GdQCCxrh7Oir5M
	FCQjqEngdpSiPI5RSD5dDehvAJN0hK6P1+uC+23dJRFFmXD7v7UhQPnYxPFb529TzmntvIlLyjO
	vOD7qwnr1ks4kJrCf0Xq+74FWsCb8ZL2OWbeQqWLqzG0QntLIp/2iBx2rlGHbE5fgT1E7TmOA8L
	6aKHEf66kYX6towRPx/3kLgJi6oSkY6eR2s4qBAVWSx3zJtElfJZfiGkEQ==
X-Google-Smtp-Source: AGHT+IH6hPLhTkRRuAmzXBkZvtr/mvV00mkfy9wR3j+cWFOfhtUSnXbr8ajdUurTGsVz18KRAbX+mQ==
X-Received: by 2002:a17:902:d491:b0:216:3c36:69a7 with SMTP id d9443c01a7336-22c359a2687mr85665945ad.45.1744905366545;
        Thu, 17 Apr 2025 08:56:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaae7sm1636085ad.36.2025.04.17.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:56:06 -0700 (PDT)
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
Subject: [PATCH 3/3] mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of page
Date: Thu, 17 Apr 2025 08:43:15 -0700
Message-ID: <20250417155530.124073-3-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417155530.124073-1-nifan.cxl@gmail.com>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
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

Question: If the change in the patch makes sense, should we try to convert all
"page" uses in __unmap_hugepage_range() to folio?

---
 include/linux/hugetlb.h |  2 +-
 mm/hugetlb.c            | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index b7699f35c87f..d6c503dd2f7d 100644
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

