Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15102EBB98
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750446249; cv=none; b=ffTEeneoSJm9SfmdMhs00owH9ahiCA3Jei6r+utyNV6cMt5p0QbW6tDedn4EO6NXTWHjobklCOabxT7+aROvvu1DhPRYgGE50tYw2Mzd0qHmGOYlomCBLlkEO4Wd5tmmWd3Vc3ZFnlC+p9Vaj6sR9vln7lnhZWG0m+xeqmf4qhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750446249; c=relaxed/simple;
	bh=TMLlSM8BMqo775Gj2E0Dc8mxLrtlrK28d74l44KVCCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J38ZYdqNWue3bWTsbA1fcNank7pSmPS9WzFqsaSXTOphodtN3cpIFSM1My9t8rF8Kmwt4CxjfFKf3i8Ctuu1/uCSzTqtJ5l9+KgpIRahwhOVGQcMTqm/Pewc4h15vXcbGdr/14vbqp+/bdf7lvyTddwunWGC7T9ZHqum+a6MP2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=afJhF+xi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="afJhF+xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750446242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHY3BJ1O8Kmf60+iubBnseKb0MyvGjRBfhUw5+ZcMhs=;
	b=afJhF+ximxvLfbIxSCH4plQp6HfQ7QilKyy3FVLpouxLv6oGgB2fshWCmCLGisg/HETUAG
	2agbwX9jZRJI6uzQUj67v8tQPdNvnCdhmLj3JS/FY+hdm90geA4mQlGXZnFimDCrOp36Rx
	OjIzlJqDXyfRgaPBepRmh0E/EQeiwhQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-qmfgEOGsPryaSpCTzuP6Rw-1; Fri, 20 Jun 2025 15:04:00 -0400
X-MC-Unique: qmfgEOGsPryaSpCTzuP6Rw-1
X-Mimecast-MFC-AGG-ID: qmfgEOGsPryaSpCTzuP6Rw_1750446239
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d13ac4d4so30058345ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446239; x=1751051039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHY3BJ1O8Kmf60+iubBnseKb0MyvGjRBfhUw5+ZcMhs=;
        b=mdXAvNf9k7fmy9YFqS0f7Y+XeVJ3I2GqnSBAF30KIhTKll0k2pt0vmf5BFgrONWjy2
         Q2cJJr+qEjlZ73r0SrdPuklAmeLRXpfuTg5ntRqTP8v20eRN6rr0kLBV1pghqrMKHGzF
         ONHo+vDhoZYDUU9peWSnbDv9JFWARhqTdZvo+NtgBYiJHD1UVWX/0il81ogAgsa1Htgk
         Gma703bNoyn0P3oTtANXCh0FFKMGR65AfbneoFliZyivVX1fmqiMilEPV8p/hnGw7Y0t
         XXXQo4jWkbO3JWcr+KwXRn/6TC9dA+CSKlVnofhwNjTkNbjXpDtocM9Pp/5xAMIXdFo3
         InCg==
X-Forwarded-Encrypted: i=1; AJvYcCU0NeviaYJy0O/OxRQSXCd4gOdI/usIjxWUUcikIroNYIw9jzbDzKCzzSaKAn1z+JbpPrhZCXvV0Tt1fkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyisrCw/KL30mnPengxxXiV4pxVg85O92gbB8YErd84EJbvnVBj
	7ldnIAQahi38nSDj7Ra5WwI5Fm9OXgiEmjvFULzYpLjgipwLuTlflLV381MCSFeBW5JEMXoDq4H
	9NP92SMQ0Axm574HU1VdMTcQeFTd4QjuAvHVidlz0u6OOti54cTHWp9KgpTxAWm+cOg==
X-Gm-Gg: ASbGncthtCATYBujWd0PMn7VkiWHvhcA5l713YQzQTP5ryT6/0W7Y4GUHIIu1NLmiK7
	jjgoOD9l85zgJDmlFqyxI6ZszVSmJXIPpyp6+1VVEZhMM3ItcLVneLKNSXrF7EvuCo2v4kdqHpF
	osDeZTOVsI7OkImLBvuL/lduA2TNu0Xp4yXPpvI52rZhERsaqG4qDxJFeYROmBZO+51ydNDF38D
	7QXi5MtcCTF7QVIQ9PhKCNFi3107fId+A8vm91OEAEdAOtlVxMrLgua9KskiA50lMgThlhnY3Hv
	xk+ZjxG/a8U=
X-Received: by 2002:a17:902:c941:b0:235:779:ede3 with SMTP id d9443c01a7336-237d9a74d3fmr63714675ad.41.1750446239089;
        Fri, 20 Jun 2025 12:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExmitzxGaktnhz9QmbqTtnlFfBEk+Ufz7lYfnEFxYhJCludK4ajrFoYpJZXCG/xUHyP5XbWg==
X-Received: by 2002:a17:902:c941:b0:235:779:ede3 with SMTP id d9443c01a7336-237d9a74d3fmr63714195ad.41.1750446238652;
        Fri, 20 Jun 2025 12:03:58 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8609968sm24235535ad.136.2025.06.20.12.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:03:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
	peterx@redhat.com,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
Date: Fri, 20 Jun 2025 15:03:42 -0400
Message-ID: <20250620190342.1780170-5-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620190342.1780170-1-peterx@redhat.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
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
be an issue.

This will also remove quite some hard-coded checks for either shmem or
hugetlbfs.  Now all the old checks should still work but with vm_uffd_ops.

Note that anonymous memory will still need to be processed separately
because it doesn't have vm_ops at all.

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
index e79c724b3b95..4e56ad423a4a 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -85,9 +85,14 @@ extern vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason);
 #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
 #define MFILL_ATOMIC_MODE_MASK ((__force uffd_flags_t) (MFILL_ATOMIC_BIT(0) - 1))
 
+static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
+{
+	return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
+}
+
 static inline bool uffd_flags_mode_is(uffd_flags_t flags, enum mfill_atomic_mode expected)
 {
-	return (flags & MFILL_ATOMIC_MODE_MASK) == ((__force uffd_flags_t) expected);
+	return uffd_flags_get_mode(flags) == expected;
 }
 
 static inline uffd_flags_t uffd_flags_set_mode(uffd_flags_t flags, enum mfill_atomic_mode mode)
@@ -196,41 +201,16 @@ static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 	return vma->vm_flags & __VM_UFFD_FLAGS;
 }
 
-static inline bool vma_can_userfault(struct vm_area_struct *vma,
-				     unsigned long vm_flags,
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
index bd0a29000318..4d71fc7be358 100644
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
index 879505c6996f..61783ff2d335 100644
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
 
+bool vma_can_userfault(struct vm_area_struct *vma,
+		       unsigned long vm_flags, bool wp_async)
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

