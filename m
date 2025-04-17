Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBF253B7E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905366; cv=none; b=i6wGzm1zPDWK7FkOdoxiDB8+BPb72Mc5YiSJMkZiGbLMLJwLhc89elIGpJqpXRb9q0YG/KV0jVpYW1GzkgiGU0kESI9JAczCIL4fz5eAhvSJmFbK4rzLnfqexdUiS/NAQUxa1/Nf4OZjqqXdkpHb1TCTwSoOokf4zTvCjlK/1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905366; c=relaxed/simple;
	bh=cglmHNvZ8r5E0j/Phkt+cDETnp5cQeP+d6bnKmyWuog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bddA2hYoaokixXtfaQNc+rf5rOFWLfA2vL3q2Om8NWslfpM7fl4KTTWRCGPvsmQFW38DDdgDi9MJPujamAkfqwJ/H9kRt0dVllfcf8WyngopRd6Nj4e8GPhCteOWWqxH4VTbeSZmQqH+0ez0VG1VTSubqqA8qnBFR8jh9VQFrsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+KtSTh+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+KtSTh+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224019ad9edso16211645ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744905364; x=1745510164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSEcAr/Nninfs8xf/2CKsjzTEjL1N076YIJRTQ8WFqg=;
        b=f+KtSTh+JXooFoIAJDioMzjAd7LU/snOC7D+8tYF5B2M6jTvKahTnFDNxMU9rCCb1V
         +R70TIFqw97xjsfoS//NinQJgGjSqXvTfxysjUPrlsgNcd5CsN4lIz8+zsKZ2YpVFyM4
         ayulSm9BLuuDv9DTIUnK7mUnHMvhXRuRDqEGOKewPUJD2sHAt0mAKP5lGAno38sszEzU
         MkYFiXa9rNOQEtMSGv0Q0zvW/otkJPpeisjFXWAF7TtMcrqNBdsufjBwBnHHM06LtT2I
         v49QaAJdPAnyPkaTzlNJiVHAirA36c1QeFHYYQpHwFbtc5u7A4KIyvEmBtkOzMkp7uz9
         Qm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744905364; x=1745510164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSEcAr/Nninfs8xf/2CKsjzTEjL1N076YIJRTQ8WFqg=;
        b=D0vw1a6L/9hiYNvBzwwRnDZTGFIg6GqeBRJtqmS69E1mkun3c64/zN///tzz/ds/nN
         +rqO+tKdOUpkVQGbSZmoMz9C0HwILhY92hVI503qL4zL9fG5wTGaLF7qFYzxNcxA5N9r
         WERxuBB40iFq7ICqVF460CySMrHf/BQAb62I1J2xIkO/kZvjxZDzW4G1Z/9lfjxy8KJY
         kXhq6QXJK3PTVePcf8ygDRD5Xy4TX1PuuDE9I1oP7vu5HAY4fKnaTvB+HC9Iy3YkuX/f
         UBT5IotDof9unhRQvPQr6wxaqftYYpsEy0cRv5LlTWhfgDvpF5Wdgc5JfEG0u3deQwP1
         Q2ag==
X-Forwarded-Encrypted: i=1; AJvYcCXXDs7059khSx8SIAg6ciHi/adr5/bC2f+GvyVgK5y/rj+0tVOui2LZ4Ivd3gY3VMjGD3QFxSt1fpDLLvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrkfE8QxsEqlwPFwbkS3kYQ4FpZ1DcL/pvmMMeT5dmJjB4Az+d
	1hTc2AHFoReJOLgdtqHFqg7yicsk9Hg6/CyJq59e5ZghZ5DgdyMB
X-Gm-Gg: ASbGnct/bMqM6d6GtyC+QaFi4D5JmjmNxwpEJRoDphE/tcAx1mG9e+Sst4b1kKYz4Ev
	Z85XLVS3t+/ySjLpPwWtS3KRuzFYvjsMmpbuJcb7HeNB3CHSS12AWIDtYPVNO3/Tu23Tq0Gmbel
	Ji8x1WqIYb87dEZusYyoX1kpK+e22GX98GTd7u6lI/dkRD5yGULt38deibCeXT4vTvL9dAvjBqR
	Cm1C8gdyVkkR9wHKmdhs9eWZkmN4acNMwr25BW/4jPzjYTbon5s+xPQo4WgjYm/3QVGY6ho0DwL
	5CBPR4rvKHp1x3mgGiDji95uCs7+p+lQPfEsrEdn88dOTeLQ4xXX6jdA1TBxOSO/AJDg
X-Google-Smtp-Source: AGHT+IFJwKldYasU+o6JJFWYYy0XlsU/CWvQYjmAL/nLwbGDvCRVFchUBxwoQWEx+LafDXC37seMbQ==
X-Received: by 2002:a17:902:e542:b0:224:7a4:b2a with SMTP id d9443c01a7336-22c358c50e6mr100309045ad.11.1744905363815;
        Thu, 17 Apr 2025 08:56:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaae7sm1636085ad.36.2025.04.17.08.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:56:03 -0700 (PDT)
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
Subject: [PATCH 2/3] mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of page
Date: Thu, 17 Apr 2025 08:43:14 -0700
Message-ID: <20250417155530.124073-2-nifan.cxl@gmail.com>
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

The function unmap_hugepage_range() has two kinds of users:
1) unmap_ref_private(), which passes in the head page of a folio.  Since
   unmap_ref_private() already takes folio and there are no other uses
   of the folio struct in the function, it is natural for
   unmap_hugepage_range() to take folio also.
2) All other uses, which pass in NULL pointer.

In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
take folio.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 include/linux/hugetlb.h | 2 +-
 mm/hugetlb.c            | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index a57bed83c657..b7699f35c87f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -128,7 +128,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
 void unmap_hugepage_range(struct vm_area_struct *,
-			  unsigned long, unsigned long, struct page *,
+			  unsigned long, unsigned long, struct folio *folio,
 			  zap_flags_t);
 void __unmap_hugepage_range(struct mmu_gather *tlb,
 			  struct vm_area_struct *vma,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b5d1ac8290a7..3181dbe0c4bb 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6039,7 +6039,7 @@ void __hugetlb_zap_end(struct vm_area_struct *vma,
 }
 
 void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
-			  unsigned long end, struct page *ref_page,
+			  unsigned long end, struct folio *ref_folio,
 			  zap_flags_t zap_flags)
 {
 	struct mmu_notifier_range range;
@@ -6051,7 +6051,8 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
-	__unmap_hugepage_range(&tlb, vma, start, end, ref_page, zap_flags);
+	__unmap_hugepage_range(&tlb, vma, start, end,
+			       folio_page(ref_folio, 0), zap_flags);
 
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
@@ -6109,7 +6110,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
 			unmap_hugepage_range(iter_vma, address,
 					     address + huge_page_size(h),
-					     folio_page(folio, 0), 0);
+					     folio, 0);
 	}
 	i_mmap_unlock_write(mapping);
 }
-- 
2.47.2

