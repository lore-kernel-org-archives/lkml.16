Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C7290098
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045956; cv=none; b=LEGHw30XUxVftp2hmR+ULDsINlYVZh1mCPc29MWW00v3HCsN1RMuWxh/vHh7+fFgWCr+S4uKrW6/6D8fVMFohTM9P+ekASboWo2o3zUWec0VbBFILU+gjcA0ilzGSsA3KH9sEYN6ugE800meZ4DLGZn/19D8LFhrvWTApYmgPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045956; c=relaxed/simple;
	bh=gVK2x7ewP/8uQNxMtsG5EaKhriyU7xBAW3layZKbYN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OC1ecYkxERgHLIpijry4GGDLg8HYlATxIM7bhgr3f6DK5tZmfI5ThvxDl+immVcway97aHmd3Z2bAuim2h83WeFXQqoOqLcL6HRL8ksU9acSCxWUvdRn1Uls1f7IBJrzsBR/rDD3xq0tEL3b+k1WvHjT31xAuYiDu1WjQWQYGT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dTqimwbu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dTqimwbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749045950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ceQ8MrBEyOYSLsVlLloLQm5cGgLaPimBF5PhfObg4oc=;
	b=dTqimwbuJRJzSctTKOxTGmPqh8h/fp3TfK9niShpcZ/AzxOhCHjq2AeaQNhmLDj0swFICc
	zu+GsDNyFo3QpRIVKMRUV8DMy5Rs/uei1asBZ4iTdQ4KzMK+OXJxK9NreAC3mI/bx7bV0Y
	Z/RltqlFRVfTRHmxSHLMP3ovv1zMErI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-UGTFNHICOcSxrTo_1N6BJQ-1; Wed, 04 Jun 2025 10:05:47 -0400
X-MC-Unique: UGTFNHICOcSxrTo_1N6BJQ-1
X-Mimecast-MFC-AGG-ID: UGTFNHICOcSxrTo_1N6BJQ_1749045947
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d50eacafso37990645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045947; x=1749650747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceQ8MrBEyOYSLsVlLloLQm5cGgLaPimBF5PhfObg4oc=;
        b=LB5Rv7PrPO8M3MYg8Pa0nWJkjlxYFWn+3ExzAZMAjiu2FL7lXWcEhX6moFLYGxlkvc
         lI5HPVDfo/LtS25V2I7FJaGAv6lAfQfs28MBc4kyp2/K+VUl6UW1cqB84xNvwQiTsIPk
         teXl8sNPaXt1PSD+J8kKX6aynvhcTtcgLw1vtjshax9Frk+kU0kgahx7OiIqSSku4nRq
         /clMb9sSe5c1yG4h4rPF94qahWiehefJrAlP3NykNvTnEvVDfJtok3Bpa6baIFkem+YH
         SzxJkXxm07Xu9TNMfzURFTDFAItIcWaNX/hXs3oojc2jlD33WrzTsx5B2zw/CixxDcuu
         YV1g==
X-Gm-Message-State: AOJu0YyPyShrUYxAd6Ufj75yFwD+Wt5st9b3iLe57Fnr0KSJD/fYtmcj
	nHeew3ELgIUL0ny4iIKYOsaOoChvScSOG1/lbenJP0Ik4jGP/3kaP0Di4bffmDAj3TinW8kgaQm
	SseWNDW6XDZAkAiYpG0I3+jzFD+qz0Inm2godgkZpFpT/28ZL/R7fdD4Q6QTleTpi4D+7Oa4fkV
	60YSjoTBCX3QV9CgX1Lk/JshT6Zahl6iUbkzYXKLTHmX0AkhJ/
X-Gm-Gg: ASbGncvl4uDe5vfWrl+MI2hSkSTrypSREFNnZzHYISgMW+XwgFXBUOkvg6wCzyEjIp0
	8XkpAWauxi1ESkq9f4DYFUcYtvHXQVlCRtAgCREo/QiCEKN9oAb441qpKjp8gnrfIK98V7eBfdZ
	+kYDPbzT/atIj5NE9plNifrbhbQt1KY1/nU56tIK9WCDtIf79yjFoUX4mUFfhgr3NO/m2/w5zAr
	jRaQuPcKLeG1IeetYjrc2ZSJsIZNW7AnxmNb7M/87tQkIk1p4C5Y2R2Qd72xx7GmbQRo/a8/l6n
	LNRSkr92Q0z+jNmmTZ6AeCTBUBOB55sA9QjoxWRjsgUb6cmSQ/iGEch65D+01kdUpn5RhXRm
X-Received: by 2002:a05:600c:4a27:b0:450:d614:cb with SMTP id 5b1f17b1804b1-451f0e547a4mr16907085e9.33.1749045946528;
        Wed, 04 Jun 2025 07:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYe6tbzgwHaqVnJry21P3Q8c38NZTtjrZN6NtysuRTvfJy+CJBRQzZRfgenFSVCPefI/EKxA==
X-Received: by 2002:a05:600c:4a27:b0:450:d614:cb with SMTP id 5b1f17b1804b1-451f0e547a4mr16906525e9.33.1749045945863;
        Wed, 04 Jun 2025 07:05:45 -0700 (PDT)
Received: from localhost (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fc2725sm201643215e9.37.2025.06.04.07.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:05:45 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Date: Wed,  4 Jun 2025 16:05:44 +0200
Message-ID: <20250604140544.688711-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Especially once we hit one of the assertions in
sanity_check_pinned_pages(), observing follow-up assertions failing
in other code can give good clues about what went wrong, so use
VM_WARN_ON_ONCE instead.

While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
well. Add one comment for the pfn_valid() check.

We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.

Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
something > 0 we're in bigger trouble. Convert the other BUG_ON's into
VM_WARN_ON_ONCE as well, they are in a similar domain "should never
happen", but more reasonable to check for during early testing.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Wanted to do this for a long time, but my todo list keeps growing ...

Based on mm/mm-unstable

---
 include/linux/mmdebug.h | 12 ++++++++++++
 mm/gup.c                | 41 +++++++++++++++++++----------------------
 2 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
index a0a3894900ed4..14a45979cccc9 100644
--- a/include/linux/mmdebug.h
+++ b/include/linux/mmdebug.h
@@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 	}								\
 	unlikely(__ret_warn_once);					\
 })
+#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
+	static bool __section(".data..once") __warned;			\
+	int __ret_warn_once = !!(cond);					\
+									\
+	if (unlikely(__ret_warn_once && !__warned)) {			\
+		dump_vma(vma);						\
+		__warned = true;					\
+		WARN_ON(1);						\
+	}								\
+	unlikely(__ret_warn_once);					\
+})
 #define VM_WARN_ON_VMG(cond, vmg)		({			\
 	int __ret_warn = !!(cond);					\
 									\
@@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
 #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
 #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
+#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
 #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
 #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
 #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
diff --git a/mm/gup.c b/mm/gup.c
index e065a49842a87..3c3931fcdd820 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
 		    !folio_test_anon(folio))
 			continue;
 		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
-			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
+			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
 		else
 			/* Either a PTE-mapped or a PMD-mapped THP. */
-			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
-				       !PageAnonExclusive(page), page);
+			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
+					     !PageAnonExclusive(page), page);
 	}
 }
 
@@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
 		return ERR_PTR(-EMLINK);
 
-	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
-			!PageAnonExclusive(page), page);
+	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
+			     !PageAnonExclusive(page), page);
 
 	ret = try_grab_folio(page_folio(page), 1, flags);
 	if (ret)
@@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		goto out;
 	}
 
-	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
-		       !PageAnonExclusive(page), page);
+	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
+			     !PageAnonExclusive(page), page);
 
 	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
 	ret = try_grab_folio(folio, 1, flags);
@@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vma,
 	if (unshare) {
 		fault_flags |= FAULT_FLAG_UNSHARE;
 		/* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatible */
-		VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
+		VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
 	}
 
 	ret = handle_mm_fault(vma, address, fault_flags, NULL);
@@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 		}
 
 		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
-		if (!*locked) {
-			BUG_ON(ret < 0);
-			BUG_ON(ret >= nr_pages);
-		}
+		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));
 
 		if (ret > 0) {
 			nr_pages -= ret;
@@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 
 		ret = mmap_read_lock_killable(mm);
 		if (ret) {
-			BUG_ON(ret > 0);
 			if (!pages_done)
 				pages_done = ret;
 			break;
@@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 				       pages, locked);
 		if (!*locked) {
 			/* Continue to retry until we succeeded */
-			BUG_ON(ret != 0);
+			VM_WARN_ON_ONCE(ret != 0);
 			goto retry;
 		}
 		if (ret != 1) {
-			BUG_ON(ret > 1);
+			VM_WARN_ON_ONCE(ret > 1);
 			if (!pages_done)
 				pages_done = ret;
 			break;
@@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_struct *vma,
 	int gup_flags;
 	long ret;
 
-	VM_BUG_ON(!PAGE_ALIGNED(start));
-	VM_BUG_ON(!PAGE_ALIGNED(end));
-	VM_BUG_ON_VMA(start < vma->vm_start, vma);
-	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
+	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
+	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
+	VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
+	VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
 	mmap_assert_locked(mm);
 
 	/*
@@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, unsigned long start,
 	int gup_flags;
 	long ret;
 
-	VM_BUG_ON(!PAGE_ALIGNED(start));
-	VM_BUG_ON(!PAGE_ALIGNED(end));
+	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
+	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
 	mmap_assert_locked(mm);
 
 	/*
@@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 		} else if (pte_special(pte))
 			goto pte_unmap;
 
-		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
+		/* If it's not marked as special it must have a valid memmap. */
+		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
 		page = pte_page(pte);
 
 		folio = try_grab_folio_fast(page, 1, flags);

base-commit: 2d0c297637e7d59771c1533847c666cdddc19884
-- 
2.49.0

