Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7692EA17A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039233; cv=none; b=U9UqtdP7LRVun+Fhch9SRChlpSRnkBLaE4fGxqeGXZP9zkrf9zK1RMMXLMil7J7ml0vCY7TokAMWn83xZzgaGq7YC1ZkjHxDXExTRe/796aKS2iepMprSb6KM4HmsNlew/dynBZ768+E3FSkDSsvvYX4mNo6hxOFlRgu80ZXkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039233; c=relaxed/simple;
	bh=z8GNQk3+sk95gdkiVFgy62ht5PcY+SiZcplsrJNNKNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtmNLigBhOvvHOwFHaKi9TmoeYCPv36Nnd1QEns2JYRDnUKmQTeA0YSGjYJUN+fILofJ7m/yXQ6dZnwNS2L3G7UJXt5r8bKAV8fWZxmsXrTJr8I/07tqr+hJId9ImTNaaojPBBcGB3OvENSVv1AnqZuPmFLQFik6l9HSdi15390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BIIiExSc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BIIiExSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLsEBLaMb/b3Vgp2d6YxUIW6WEnZzDk0PEHjsGDj8XY=;
	b=BIIiExScSgxMcRFvDKPlKo1tnesEORVjkd4mbnZSyDvInB12E1R8xz38vOr4a+LJQfb4xK
	Zqf1vufHcEb1OiebljAnuCQ2eX2t+xlN+dPk10nACeSZUKCoWpQBRiEImNnD4r2a6L+at0
	QnVa/mGY83JU2R/pv7qYAHW6isfUyQY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-jj0mYc3zNIa7gsWxyV2w4w-1; Fri, 27 Jun 2025 11:47:09 -0400
X-MC-Unique: jj0mYc3zNIa7gsWxyV2w4w-1
X-Mimecast-MFC-AGG-ID: jj0mYc3zNIa7gsWxyV2w4w_1751039229
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb2910dd04so41369966d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039229; x=1751644029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLsEBLaMb/b3Vgp2d6YxUIW6WEnZzDk0PEHjsGDj8XY=;
        b=XY9C8h2WxJyZMcRW9ANqbHCpywGFBgddwqCmJcmKZYwHED7PGq/owWCt3PgWevoxSS
         +RKtzsqQluShIcleiCViDmSaArrQPAk7NMNfK3zw23joST54q0z2NAylEWtssu43S1nD
         YklV2LLciXuh4HZnSZesgj5h+GkYZ5MJsx7H81GxD/35IGNf37XNp5aq7K7gYJMj4/Ce
         5GFifWJpgLYra+2EUenPxEWXIoXGAy8/4g3FVB1KDkKtqrzVWyRGlqAb6/H3dkedJtv7
         2QfLGoPsFkppknk0cQ+BEKKUqow0Gz+voYCwW9wSFujtltmwUPhXDoG1TXjCs5Jm4h9u
         ZmIg==
X-Forwarded-Encrypted: i=1; AJvYcCUTfidgAv2vSyWghQF3ySlpJhYjA0YeGcQWr48MlwmTZg7mqtc48UafdBa0Ubnsf0s0J6c5XqvWEGj0w54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNk7ePiWWjGz3Z4fsQRCv3ug9OS0TuSu7x+pvaaD9OnzCynXN
	bzBBcWofx4czP47EsENwACekH0CmDjHkcaCmcg5Q4O5ZAdVVy1cwcozv6ezzWnsjy5ejybKEUWg
	D1474TLjqwPhm4OUGQTCQPlypdQw4BaYNE6DwTgiUuTkcQShtlj+oanYK2aMkd6czPQ==
X-Gm-Gg: ASbGnctVo+Ay5dVcxabrwytdP/p9agnS7sZ08XjUL4aqWZVsDKVCgqH5RgrXZTHcYiy
	YMr4GARUgDIF8FOdE5CChKBGdw4PUwXoRlIVV45C30hNE+Lpp40oZJAsNVqQpnCe8WABRdzap9B
	uJQK3PoQYUlZw8dCZPnG5YGdbIfFfulNNefo4ybCJ2wVN4rQxSMufUIQ6G6rb+CHLnB++HukOpj
	+vMdminD1PazGgFbFgPxv9x45IXS2sZzOrpBqqRiJ1WNEornhZpKDG022j6HwT8xT/uLMVMUZsu
	fOhIltvmvXU=
X-Received: by 2002:a05:6214:4587:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-70003c8d7fdmr69296826d6.38.1751039228822;
        Fri, 27 Jun 2025 08:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkTQ3X+dYDWCeaFKDWyYkyNZOuxb4Hf3+//g3kzB/Ownzy/PsHVMHjJ/Tpv6Rh1L1/WGJ+JQ==
X-Received: by 2002:a05:6214:4587:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-70003c8d7fdmr69296386d6.38.1751039228368;
        Fri, 27 Jun 2025 08:47:08 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm22296066d6.65.2025.06.27.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:47:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	peterx@redhat.com,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: [PATCH v2 4/4] mm: Apply vm_uffd_ops API to core mm
Date: Fri, 27 Jun 2025 11:46:55 -0400
Message-ID: <20250627154655.2085903-5-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627154655.2085903-1-peterx@redhat.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch completely moves the old userfaultfd core to use the new
vm_uffd_ops API.  After this change, existing file systems will start to
use the new API for userfault operations.

When at it, moving vma_can_userfault() into mm/userfaultfd.c instead,
because it's getting too big.  It's only used in slow paths so it shouldn't
be an issue.  Move the pte marker check before wp_async, which might be
more intuitive because wp_async depends on pte markers.  That shouldn't
cause any functional change though because only one check would take effect
depending on whether pte marker was selected in config.

This will also remove quite some hard-coded checks for either shmem or
hugetlbfs.  Now all the old checks should still work but with vm_uffd_ops.

Note that anonymous memory will still need to be processed separately
because it doesn't have vm_ops at all.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/shmem_fs.h      |  14 -----
 include/linux/userfaultfd_k.h |  46 ++++----------
 mm/shmem.c                    |   2 +-
 mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
 4 files changed, 101 insertions(+), 76 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 6d0f9c599ff7..2f5b7b295cf6 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -195,20 +195,6 @@ static inline pgoff_t shmem_fallocend(struct inode *inode, pgoff_t eof)
 extern bool shmem_charge(struct inode *inode, long pages);
 extern void shmem_uncharge(struct inode *inode, long pages);
 
-#ifdef CONFIG_USERFAULTFD
-#ifdef CONFIG_SHMEM
-extern int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
-				  struct vm_area_struct *dst_vma,
-				  unsigned long dst_addr,
-				  unsigned long src_addr,
-				  uffd_flags_t flags,
-				  struct folio **foliop);
-#else /* !CONFIG_SHMEM */
-#define shmem_mfill_atomic_pte(dst_pmd, dst_vma, dst_addr, \
-			       src_addr, flags, foliop) ({ BUG(); 0; })
-#endif /* CONFIG_SHMEM */
-#endif /* CONFIG_USERFAULTFD */
-
 /*
  * Used space is stored as unsigned 64-bit value in bytes but
  * quota core supports only signed 64-bit values so use that
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index c9a093c4502b..1aa9b246fb84 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -149,9 +149,14 @@ typedef struct vm_uffd_ops vm_uffd_ops;
 #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
 #define MFILL_ATOMIC_MODE_MASK ((__force uffd_flags_t) (MFILL_ATOMIC_BIT(0) - 1))
 
+static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
+{
+	return (__force enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
+}
+
 static inline bool uffd_flags_mode_is(uffd_flags_t flags, enum mfill_atomic_mode expected)
 {
-	return (flags & MFILL_ATOMIC_MODE_MASK) == ((__force uffd_flags_t) expected);
+	return uffd_flags_get_mode(flags) == expected;
 }
 
 static inline uffd_flags_t uffd_flags_set_mode(uffd_flags_t flags, enum mfill_atomic_mode mode)
@@ -260,41 +265,16 @@ static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 	return vma->vm_flags & __VM_UFFD_FLAGS;
 }
 
-static inline bool vma_can_userfault(struct vm_area_struct *vma,
-				     vm_flags_t vm_flags,
-				     bool wp_async)
+static inline const vm_uffd_ops *vma_get_uffd_ops(struct vm_area_struct *vma)
 {
-	vm_flags &= __VM_UFFD_FLAGS;
-
-	if (vma->vm_flags & VM_DROPPABLE)
-		return false;
-
-	if ((vm_flags & VM_UFFD_MINOR) &&
-	    (!is_vm_hugetlb_page(vma) && !vma_is_shmem(vma)))
-		return false;
-
-	/*
-	 * If wp async enabled, and WP is the only mode enabled, allow any
-	 * memory type.
-	 */
-	if (wp_async && (vm_flags == VM_UFFD_WP))
-		return true;
-
-#ifndef CONFIG_PTE_MARKER_UFFD_WP
-	/*
-	 * If user requested uffd-wp but not enabled pte markers for
-	 * uffd-wp, then shmem & hugetlbfs are not supported but only
-	 * anonymous.
-	 */
-	if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
-		return false;
-#endif
-
-	/* By default, allow any of anon|shmem|hugetlb */
-	return vma_is_anonymous(vma) || is_vm_hugetlb_page(vma) ||
-	    vma_is_shmem(vma);
+	if (vma->vm_ops && vma->vm_ops->userfaultfd_ops)
+		return vma->vm_ops->userfaultfd_ops;
+	return NULL;
 }
 
+bool vma_can_userfault(struct vm_area_struct *vma,
+		       unsigned long vm_flags, bool wp_async);
+
 static inline bool vma_has_uffd_without_event_remap(struct vm_area_struct *vma)
 {
 	struct userfaultfd_ctx *uffd_ctx = vma->vm_userfaultfd_ctx.ctx;
diff --git a/mm/shmem.c b/mm/shmem.c
index 9a8b8dd4709b..fc85002dd8af 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3158,7 +3158,7 @@ static int shmem_uffd_get_folio(struct inode *inode, pgoff_t pgoff,
 	return shmem_get_folio(inode, pgoff, 0, folio, SGP_NOALLOC);
 }
 
-int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
+static int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
 			   struct vm_area_struct *dst_vma,
 			   unsigned long dst_addr,
 			   unsigned long src_addr,
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index cbed91b09640..52d7d5f144b8 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -14,12 +14,48 @@
 #include <linux/userfaultfd_k.h>
 #include <linux/mmu_notifier.h>
 #include <linux/hugetlb.h>
-#include <linux/shmem_fs.h>
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
 #include "internal.h"
 #include "swap.h"
 
+bool vma_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags,
+		       bool wp_async)
+{
+	unsigned long supported;
+
+	if (vma->vm_flags & VM_DROPPABLE)
+		return false;
+
+	vm_flags &= __VM_UFFD_FLAGS;
+
+#ifndef CONFIG_PTE_MARKER_UFFD_WP
+	/*
+	 * If user requested uffd-wp but not enabled pte markers for
+	 * uffd-wp, then any file system (like shmem or hugetlbfs) are not
+	 * supported but only anonymous.
+	 */
+	if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
+		return false;
+#endif
+	/*
+	 * If wp async enabled, and WP is the only mode enabled, allow any
+	 * memory type.
+	 */
+	if (wp_async && (vm_flags == VM_UFFD_WP))
+		return true;
+
+	if (vma_is_anonymous(vma))
+		/* Anonymous has no page cache, MINOR not supported */
+		supported = VM_UFFD_MISSING | VM_UFFD_WP;
+	else if (vma_get_uffd_ops(vma))
+		supported = vma_get_uffd_ops(vma)->uffd_features;
+	else
+		return false;
+
+	return !(vm_flags & (~supported));
+}
+
 static __always_inline
 bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long dst_end)
 {
@@ -384,11 +420,15 @@ static int mfill_atomic_pte_continue(pmd_t *dst_pmd,
 {
 	struct inode *inode = file_inode(dst_vma->vm_file);
 	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
+	const vm_uffd_ops *uffd_ops = vma_get_uffd_ops(dst_vma);
 	struct folio *folio;
 	struct page *page;
 	int ret;
 
-	ret = shmem_get_folio(inode, pgoff, 0, &folio, SGP_NOALLOC);
+	if (WARN_ON_ONCE(!uffd_ops || !uffd_ops->uffd_get_folio))
+		return -EINVAL;
+
+	ret = uffd_ops->uffd_get_folio(inode, pgoff, &folio);
 	/* Our caller expects us to return -EFAULT if we failed to find folio */
 	if (ret == -ENOENT)
 		ret = -EFAULT;
@@ -504,18 +544,6 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 	u32 hash;
 	struct address_space *mapping;
 
-	/*
-	 * There is no default zero huge page for all huge page sizes as
-	 * supported by hugetlb.  A PMD_SIZE huge pages may exist as used
-	 * by THP.  Since we can not reliably insert a zero page, this
-	 * feature is not supported.
-	 */
-	if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
-		up_read(&ctx->map_changing_lock);
-		uffd_mfill_unlock(dst_vma);
-		return -EINVAL;
-	}
-
 	src_addr = src_start;
 	dst_addr = dst_start;
 	copied = 0;
@@ -686,14 +714,55 @@ static __always_inline ssize_t mfill_atomic_pte(pmd_t *dst_pmd,
 			err = mfill_atomic_pte_zeropage(dst_pmd,
 						 dst_vma, dst_addr);
 	} else {
-		err = shmem_mfill_atomic_pte(dst_pmd, dst_vma,
-					     dst_addr, src_addr,
-					     flags, foliop);
+		const vm_uffd_ops *uffd_ops = vma_get_uffd_ops(dst_vma);
+
+		if (WARN_ON_ONCE(!uffd_ops || !uffd_ops->uffd_copy)) {
+			err = -EINVAL;
+		} else {
+			err = uffd_ops->uffd_copy(dst_pmd, dst_vma,
+						  dst_addr, src_addr,
+						  flags, foliop);
+		}
 	}
 
 	return err;
 }
 
+static inline bool
+vma_uffd_ops_supported(struct vm_area_struct *vma, uffd_flags_t flags)
+{
+	enum mfill_atomic_mode mode = uffd_flags_get_mode(flags);
+	const vm_uffd_ops *uffd_ops;
+	unsigned long uffd_ioctls;
+
+	if ((flags & MFILL_ATOMIC_WP) && !(vma->vm_flags & VM_UFFD_WP))
+		return false;
+
+	/* Anonymous supports everything except CONTINUE */
+	if (vma_is_anonymous(vma))
+		return mode != MFILL_ATOMIC_CONTINUE;
+
+	uffd_ops = vma_get_uffd_ops(vma);
+	if (!uffd_ops)
+		return false;
+
+	uffd_ioctls = uffd_ops->uffd_ioctls;
+	switch (mode) {
+	case MFILL_ATOMIC_COPY:
+		return uffd_ioctls & BIT(_UFFDIO_COPY);
+	case MFILL_ATOMIC_ZEROPAGE:
+		return uffd_ioctls & BIT(_UFFDIO_ZEROPAGE);
+	case MFILL_ATOMIC_CONTINUE:
+		if (!(vma->vm_flags & VM_SHARED))
+			return false;
+		return uffd_ioctls & BIT(_UFFDIO_CONTINUE);
+	case MFILL_ATOMIC_POISON:
+		return uffd_ioctls & BIT(_UFFDIO_POISON);
+	default:
+		return false;
+	}
+}
+
 static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 					    unsigned long dst_start,
 					    unsigned long src_start,
@@ -752,11 +821,7 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 	    dst_vma->vm_flags & VM_SHARED))
 		goto out_unlock;
 
-	/*
-	 * validate 'mode' now that we know the dst_vma: don't allow
-	 * a wrprotect copy if the userfaultfd didn't register as WP.
-	 */
-	if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
+	if (!vma_uffd_ops_supported(dst_vma, flags))
 		goto out_unlock;
 
 	/*
@@ -766,12 +831,6 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 		return  mfill_atomic_hugetlb(ctx, dst_vma, dst_start,
 					     src_start, len, flags);
 
-	if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
-		goto out_unlock;
-	if (!vma_is_shmem(dst_vma) &&
-	    uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE))
-		goto out_unlock;
-
 	while (src_addr < src_start + len) {
 		pmd_t dst_pmdval;
 
-- 
2.49.0

