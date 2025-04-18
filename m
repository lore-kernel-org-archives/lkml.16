Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786EC218E99
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996198; cv=none; b=dqYnRVY9/0aIPEskh5NbLgwIZv/EvGfF8l2bGr1xlajHITLwzW+T1wec6fcfP5o+hPd8ikudZ00MMqMcXjr93T86LMWyxkLiVVHPgAZucO2wFiRLR2Onj81KIhb7Noh7x0ZXhK7uPINQQLxezCcmlVmxcw6RzI4KOwJkp/zju3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996198; c=relaxed/simple;
	bh=vTE4UJ9hj3v3QrmqhCmfxDC1YUxtLmDUN51bGARTE4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPXlPWRZvc9MD7G6dC9+oryBwllr1Wv7Od14+Y8O7Hzb3tv8lHGAV+6lgCPiTPECyds3iALeR+hQceSSPPptLNg8+4+uACA1TJsByLf3z3D4FzkV6pJUxievDow0yxRTsQFnRuWbsVdZHbZvvmxBQRTvhHvTJVhwfE+Aowx1bS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TORwVbgY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TORwVbgY"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736aaeed234so1802574b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744996196; x=1745600996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dORA6h0/+ces654lrs2Yc6m0QPEnXEtlk4fV98OxVqk=;
        b=TORwVbgYORiPV7YvbxB2gRjg3Eb8taREmpmCHuVWP0iEHsEdf6KQUNiq2ngkqF7Js+
         s1XZqXbbCLBc076XG9kgRgdl0Dzn3HmXlvHzOhFocVYW8nhYiJXxna25mH8IBLBmv1G0
         NV35HGR052C3KiAmERUl5MeOe8hJVQPyvbkWwOqL+3kZv7BjlA5WUWthz+Sl1TyE2MxK
         YvC333WZroq0ePxcBgdaGUr8IN8A+tkpvTswmIXM3fEgZddEoWKuMu44JlChwVa8aIn3
         HG5ACzSWPeu05pfdPJaDarsSWOv/eiBTKeLI/ksl/T9SeeK+d0eaBp5WACkv3gDax2GG
         JwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996196; x=1745600996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dORA6h0/+ces654lrs2Yc6m0QPEnXEtlk4fV98OxVqk=;
        b=dfSLDMf4Zi0ki4VQvQ07n9Y8SM0VcO0xKlAYP9idcxqtk/PRKAC8NgnC2lDOFM0dGY
         AZ3MIMRZJCFX36rYjHKCeAJvTNBU4y7aGP1aKWq22Zw5W84V+4T2FZam83Ize2cAisds
         8+lZgc3UxiyyvHqQkI18w/+5uIuIB+0h0cM3bxgAosJ2ln/l1UKwpwoSl5PE8UU7jOZ/
         hTXBQdUlIznKrQI/EHxlNKtisJalSVfDHTmGLdjenyoTIIc13QNwcyymOnTnhHEewf/U
         ac/tc9/EmEuh7gAuJUxPwuLun9TwAgAUuG/WOJGl3SIQ9ApLqV2zmggKEXW4rvWymuEp
         Hwuw==
X-Forwarded-Encrypted: i=1; AJvYcCVT3qkB8pv6MI1ILEkwk1u53sDLlP/O/RGQ5/4jGKnwvGkhbY2LB7snGqxkwa6oVfTcg3lpC1/JBHm2Oao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXELMAU6N+BkHVXryMN583J/9eBJzVBvh5bE5chMQfwyx9bp48
	3hEX/KbQFv7tbhoyBg5nUu2EYx004AKd+gTePmROGYiQ7FKJ42tq
X-Gm-Gg: ASbGncsWzpPCwXJoWepRQjVxrNaja/OjwH5P3R4wvOS7aW1bgAkJ0Hq9seyMXWvnrQe
	cKhgd8R5t/9BYxL5ey9Y4BKff63IKw7Wj7dV0fd4sSBcZGpBIqM9kq0XJXfvhI4Hug0IN2SR8+z
	mLuYwevVdXHK8l1SxSvgIzQMeW4pv0NRufmiiFBzYvwKjlF0NUkxn7E/Ig8ENc2ynyNvmKsCBtx
	SGg62WfTlq1uOD5fKAjOwUFC/vGqpATqN2in+SOQh9MMNLu1o0beAPLarLw9PjLinp2kYLaTcuY
	YCKpjQTDHycJx7XwfjAfhtRbp9imbY5f/Pbb/t8QQUQ6JI2otdAdC6JdMw==
X-Google-Smtp-Source: AGHT+IHe47+XozfXlstD4wDnTplU1ezUObVgQzHvnY/0V70xzfLWwjEmiGf1MJ9togB+8xEfuiChvA==
X-Received: by 2002:a05:6a20:2d0b:b0:1f5:5ed0:4d75 with SMTP id adf61e73a8af0-203cbd213c1mr5795554637.31.1744996195645;
        Fri, 18 Apr 2025 10:09:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59176sm1834069b3a.113.2025.04.18.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:09:55 -0700 (PDT)
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
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v2 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of page
Date: Fri, 18 Apr 2025 09:57:40 -0700
Message-ID: <20250418170834.248318-3-nifan.cxl@gmail.com>
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
---
v2: 
Picked up Reviewed-by tags;

v1:
https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m7ba630d783e08ae708453279579093d481c6e721
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

