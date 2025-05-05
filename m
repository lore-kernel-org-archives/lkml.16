Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD326F46B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469525; cv=none; b=efdAC1SPU7uFR/SbyyDGbbmvtyfDA04TZ14W4MDSG0aCMOAwL8iSKMhBhQQLYKAlsrECc5V0FBO0RaUxs1rZxYv0CzlI5W6cUukPrZkecH/WO5e6V6bDMlpDmGFrXKkckM0O0f77Bymhlqrsv64fuG/aHwz6KDs6kUuGJwmp2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469525; c=relaxed/simple;
	bh=ISFM860UZkcW3JTMYZZ1JZfowN5QfHbHhsy1UnuEB3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKq7lff/U7McCcSIaY+IwQtCcnVb9vObEkmDMgm6o8DeyOPRLSvI/mgGgooTOyLrCbNvi+fygnNA07uCCJX5PLxPsi2ikfxst/YBsquIeMG/J/IxuEBcVIBAHBW9TGLEyjTrmX8sXacePeeGNjKhQOlnv4oP03AnaMSgjYBRjlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knt1k6zP; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knt1k6zP"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so4072524276.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746469522; x=1747074322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIawxaOA1yq3dDDPxvebCqxillGmdiJRaxJm+NUOk1E=;
        b=knt1k6zPnn7Cw6GpnXWo91WqnBdEuqnwauZEa74IXf32CVoq4KGPa2yK8W51pRUmba
         JKRYRDjudKJg7RI9pWmdRR7k6K46aD5rCb3YG9n955QUk332m47AEwY5qLCdXWcmEzsb
         f4EwtRiaaX3mby71cGiHNxPdAbvsTNwtZZSIARG+bMJbch+krhJMHfdt9Hj0RXRq/Z+G
         mNswptmoSXSLKRVGtxFgB/0+K7S0+7QeodNCuAxJZs411JAGqLXET41tZCWmHRhokCKH
         qLcvHu+KCGxsn+h/yEcF9Uv4LqOoIfviVA9XmgV0gaH7n6YcijybFEO1ursmwIDQaQcg
         ddNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469522; x=1747074322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIawxaOA1yq3dDDPxvebCqxillGmdiJRaxJm+NUOk1E=;
        b=ohbdTkeC0lGdCPihFBxCGLbIMoGfb8o5Zpvjit72ikN5Actx/mTGvG7jQXf1vzn/Nh
         4n0273bCHXDbsy1AhC+olkGcQR9qBwkNLuE2bqESStRxj6W0ho1VhftN45ssn2oF32G3
         U1OCEqOO4WYvdUQJtcWLMLIMhZF1+G9LZwKPF2WX8SsOyAHnBq5aL5FzHiyJfNzpMzHE
         NgwwZlxL+0lUcEdan3ZOPpLNB42rweKnoExyaRv+OR7kaQjfCEY+1d/5liWLWIYgaaxR
         /drfNO/akRhRqjUX2d12Ix6nBaUY9BGaEQAXYXwFzeNLBSiySnGD+eByZZ6p0+6sON6k
         67Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUXCJqFXUYEB3PLKFNbKISOUB3LhCxH5HlCsuvXI45yJCHcKobhpOtWqXrg/v3uX/O2z8zVHlAJTJJeOIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbn+BrDO2Suqu9W/Luxxj/tPO8xHBd8ICn5dGHFbrrMeVyi3bI
	pBaUFR3j8ou/OZPgicJYcG+VKY1cVnNpIynK9MR6yid8hBRew8I7
X-Gm-Gg: ASbGncstPoE2AL3hEVWDnyHrO1oRGG4H2A+q9+4kLPe2hqpQZO682JALBX7u8o9UPWW
	HMeZ/Fcf2UdxO7QnjV39VbcPFJcEH5abYxWhcFLkfOauKNpNthK67VQDO0btLjgOwm4RjUCKsZg
	6Qoz/VlRk8YNSBMBq9Kf110jmvV0posBw2lckgEQpBYo4xTbgb5qcAQ9gWFWRdqSLEdYr8wg/VW
	YALmWiIqfR1NZ4jQ/6uCISk3Y4hf/LOX4q038TsMGQ60Wpaz2jL/+NqgGPWdPhzE6TKUt/GeUuG
	5Wf8FlUEpoPp+X2IG4/2EbN5UBxA9QxbCqCJ0Lp9Pk5ZGj6I9Lg=
X-Google-Smtp-Source: AGHT+IGRFXsz8jbwnyUuTX30xB3c00jZI+IfJoxJduQHI3H6iannozkIKEv8GJlmkl+bwqv0hvnq4g==
X-Received: by 2002:a05:6902:2e0f:b0:e73:930:cc30 with SMTP id 3f1490d57ef6-e756555a7aamr16340605276.16.1746469522367;
        Mon, 05 May 2025 11:25:22 -0700 (PDT)
Received: from localhost.localdomain ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7a897asm2113429276.38.2025.05.05.11.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:25:21 -0700 (PDT)
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
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v4 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of page
Date: Mon,  5 May 2025 11:22:42 -0700
Message-ID: <20250505182345.506888-4-nifan.cxl@gmail.com>
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

The function unmap_hugepage_range() has two kinds of users:
1) unmap_ref_private(), which passes in the head page of a folio.  Since
   unmap_ref_private() already takes folio and there are no other uses
   of the folio struct in the function, it is natural for
   unmap_hugepage_range() to take folio also.
2) All other uses, which pass in NULL pointer.

In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
take folio.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/hugetlb.h | 4 ++--
 mm/hugetlb.c            | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 23ebf49c5d6a..f6d5f24e793c 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -129,8 +129,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
 void unmap_hugepage_range(struct vm_area_struct *,
-			  unsigned long, unsigned long, struct page *,
-			  zap_flags_t);
+			  unsigned long start, unsigned long end,
+			  struct folio *, zap_flags_t);
 void __unmap_hugepage_range(struct mmu_gather *tlb,
 			  struct vm_area_struct *vma,
 			  unsigned long start, unsigned long end,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0c2b264a7ab8..c339ffe05556 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6046,7 +6046,7 @@ void __hugetlb_zap_end(struct vm_area_struct *vma,
 }
 
 void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
-			  unsigned long end, struct page *ref_page,
+			  unsigned long end, struct folio *folio,
 			  zap_flags_t zap_flags)
 {
 	struct mmu_notifier_range range;
@@ -6058,7 +6058,8 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
-	__unmap_hugepage_range(&tlb, vma, start, end, ref_page, zap_flags);
+	__unmap_hugepage_range(&tlb, vma, start, end,
+			       &folio->page, zap_flags);
 
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
@@ -6116,7 +6117,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
 			unmap_hugepage_range(iter_vma, address,
 					     address + huge_page_size(h),
-					     &folio->page, 0);
+					     folio, 0);
 	}
 	i_mmap_unlock_write(mapping);
 }
-- 
2.47.2

