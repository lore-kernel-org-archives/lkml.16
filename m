Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81982191F84
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822085; cv=none; b=YuqBhSGBaHHcHqWrF5tHy658u/O8Hl4R/FGXmmQ+eKJ6PrnwUYsu1QES+W2QZFwunbblIwhR8avvaNIIqSEvRLIKZWRHBvP60tlUmkSJVGy/qrjx+zsyieYypBHI82g6AnjEzDAKj66fFTadgdJwaWPxJDQ+cfU8bZI4oQeu9A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822085; c=relaxed/simple;
	bh=oBujyHW3fR3UArBsFd0eQdvuPTosgfHx6P9PRFKYox8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwR3ugaP99JggYq2Zr228jvcTtM4uKxNwODcYBIp0UIW2ySU0yqblY0rBmNGYcMoMWYLY/Hi/SrDoQsSr1KqdQVeLYHam9WThyHg8jrd1xtiQcVJ5nThjdG93P+LPEj7d18/+vg6PLhRQ+VpWQv17UcEDl0K0WWmhje6TzIU2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LuubT669; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LuubT669"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CurRk13BLi453FdNUVmvRv3/1kchAf7liLqepSAurz8=;
	b=LuubT669ueDH/xKrJFloiM00Z9RVEWMQ+DYwBJW+PkN4UWUbkjK9mDQA1y04bySSLHTipq
	GPZG++dULivASt9Lf7maMkjfFC052twrT/+FqM+239BPt+LKGlrdM7QXhDqo+A6d9gElaX
	DIVWbJCwJczl5YnsRCehZtOtyn4A4Cs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-dvUiS6ZNNq-tQB227trzew-1; Fri, 13 Jun 2025 09:41:20 -0400
X-MC-Unique: dvUiS6ZNNq-tQB227trzew-1
X-Mimecast-MFC-AGG-ID: dvUiS6ZNNq-tQB227trzew_1749822080
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so480348985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822079; x=1750426879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CurRk13BLi453FdNUVmvRv3/1kchAf7liLqepSAurz8=;
        b=UKddhGJB3P6yHkoiGHd2IfO6YrhLq5AYIavu1xoAJZQmYg5YMwODwkY0qIO04JY+9d
         11o7OnMG6PQW0TJlNCCv5xEB8GBENq1e3NVhLE99gp2+Y5lKygAnNX1gMghRziIMa4If
         S1QNiNZd3ehqjcElhe0QPfhjXHMAPV+y4Zxc6pr/uISn1FIfWu/IPJZRObXsx071e592
         GMIsXUhXBDn7YJ8M7xrk2bREgVKGhb5ZD9tx9/U454ETAe42RiKaEnt08eh0N/b9DjzX
         rMZicZhX+VZgdyBR8xHoOWbGHHOQeY1PAgmmc2b8pIpiAk3V9WVElHSfzwl+us6El5DR
         0k8g==
X-Gm-Message-State: AOJu0Yzmmkeme10VmfcY8B2op7gc3+B8S/HgH2Cogpjkzl3v8+mfJOxQ
	YRSL1a/YmQAL7u+EVFLEPTzMv+rDxh+IaTtXMvOeUApE6de8p6ugCh1Xcqio606kb9WUQzLvZ+8
	ch+4t2Cnu8+yK2gPuBk8VwRIFeVnK9IPwEKlQd/mLkBNaGteG2ohBjGlpy3/f73Rhr1uqdVClua
	Q3KTqE41vOJp/fCtJvXNeBr949BcCgUkoSEItZnolOvDlPMmU=
X-Gm-Gg: ASbGncvjvzbwk2EH6GHuh0M373UqFIIXTJ0Mr7NQ3+s1NItAc10EGHgNAyai4juxxcb
	iYNYAaWIRE7iq0TLlOg0qwhNjw9tNfAmTI2KqO0fz18uMfO+D/QzNielMLDcVbOjBHUROfX8vgi
	3+vqezHu2WE9WvCiYFg25sGgT1AnwvQUyOs4gktPUNPGlBUSD4iMYkbT+jDihnBDx9rq63zxM+O
	87Mf7lavXnkhmKOcfAN5Cmt4Z02zqkxlEM3Ft9ckfiplY4gYj0D9JIm3p/XkGFc+hngM8TCBuO5
	NI+EnCCfpv4=
X-Received: by 2002:a05:620a:44d0:b0:7d2:27ff:2133 with SMTP id af79cd13be357-7d3bc3b0704mr463530385a.1.1749822079373;
        Fri, 13 Jun 2025 06:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmKoTuxvL7ffTQWjIUtdV/ylXkzGCctDnDjUG//mfabF7LSk4R8g8f8pkMatkvnCJNdWJBNQ==
X-Received: by 2002:a05:620a:44d0:b0:7d2:27ff:2133 with SMTP id af79cd13be357-7d3bc3b0704mr463525385a.1.1749822078879;
        Fri, 13 Jun 2025 06:41:18 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ee3f72sm171519285a.94.2025.06.13.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:41:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	peterx@redhat.com,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/5] mm/hugetlb: Remove prepare_hugepage_range()
Date: Fri, 13 Jun 2025 09:41:08 -0400
Message-ID: <20250613134111.469884-3-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134111.469884-1-peterx@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only mips and loongarch implemented this API, however what it does was
checking against stack overflow for either len or addr.  That's already
done in arch's arch_get_unmapped_area*() functions, hence not needed.

It means the whole API is pretty much obsolete at least now, remove it
completely.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/loongarch/include/asm/hugetlb.h | 14 --------------
 arch/mips/include/asm/hugetlb.h      | 14 --------------
 fs/hugetlbfs/inode.c                 |  8 ++------
 include/asm-generic/hugetlb.h        |  8 --------
 include/linux/hugetlb.h              |  6 ------
 5 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
index 4dc4b3e04225..ab68b594f889 100644
--- a/arch/loongarch/include/asm/hugetlb.h
+++ b/arch/loongarch/include/asm/hugetlb.h
@@ -10,20 +10,6 @@
 
 uint64_t pmd_to_entrylo(unsigned long pmd_val);
 
-#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
-static inline int prepare_hugepage_range(struct file *file,
-					 unsigned long addr,
-					 unsigned long len)
-{
-	unsigned long task_size = STACK_TOP;
-
-	if (len > task_size)
-		return -ENOMEM;
-	if (task_size - len < addr)
-		return -EINVAL;
-	return 0;
-}
-
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 				  pte_t *ptep, unsigned long sz)
diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index fbc71ddcf0f6..8c460ce01ffe 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -11,20 +11,6 @@
 
 #include <asm/page.h>
 
-#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
-static inline int prepare_hugepage_range(struct file *file,
-					 unsigned long addr,
-					 unsigned long len)
-{
-	unsigned long task_size = STACK_TOP;
-
-	if (len > task_size)
-		return -ENOMEM;
-	if (task_size - len < addr)
-		return -EINVAL;
-	return 0;
-}
-
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pte_t *ptep,
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index fc03dd541b4d..32dff13463d2 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -179,12 +179,8 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 
 	if (len & ~huge_page_mask(h))
 		return -EINVAL;
-	if (flags & MAP_FIXED) {
-		if (addr & ~huge_page_mask(h))
-			return -EINVAL;
-		if (prepare_hugepage_range(file, addr, len))
-			return -EINVAL;
-	}
+	if ((flags & MAP_FIXED) && (addr & ~huge_page_mask(h)))
+		return -EINVAL;
 	if (addr)
 		addr0 = ALIGN(addr, huge_page_size(h));
 
diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 3e0a8fe9b108..4bce4f07f44f 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -114,14 +114,6 @@ static inline int huge_pte_none_mostly(pte_t pte)
 }
 #endif
 
-#ifndef __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
-static inline int prepare_hugepage_range(struct file *file,
-		unsigned long addr, unsigned long len)
-{
-	return 0;
-}
-#endif
-
 #ifndef __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		unsigned long addr, pte_t *ptep)
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 42f374e828a2..85acdfdbe9f0 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -359,12 +359,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
 {
 }
 
-static inline int prepare_hugepage_range(struct file *file,
-				unsigned long addr, unsigned long len)
-{
-	return -EINVAL;
-}
-
 static inline void hugetlb_vma_lock_read(struct vm_area_struct *vma)
 {
 }
-- 
2.49.0

