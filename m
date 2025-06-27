Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2FB1DFCB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040437; cv=none; b=CrVdih/avxdqf8DDNmcTDYYaElQHLRpMBVypOSd9WJAfzskFtg6ba0JGaae3PZOyMpqwinDGHhZMxHnUfWZYOC18RUlxtTGlY8cZ1ElBPYIZZLTC34ym0UiWFHzlDU30YZLeQWoOwA/1rWqVOnlTWcoVldMvqfhuys5wJ/k0R+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040437; c=relaxed/simple;
	bh=Tdpe6JDS+rR3v1xR5w42iqwYeD9PI+17P546Ndy04J8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXvktLi4kJJxV0StXKu2Tr09Bla+eFMLowPUQz1j3cLilQMVghu2F+x5y+nrta0qMrGXDZgHGkKPzFOoOfH0p3IcmFCVuxB9T+ZZsMR/vN8tlw5qZJIzwaUOWzNjaF4+WQfEzvR8NJV9ocghIW6MKBUWXGJA//ZlMBr9D3CFfHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LyEtm1Ao; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LyEtm1Ao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751040434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/xy96KI8UDKszt96CyDW7op5ryIeAmzp/OyFji+BJh8=;
	b=LyEtm1AoeOdOT51IS9/1yXfFxldqk9L1y5raEA47XaownHbxDVfKtsMF+wqz2b2FD0AQ9f
	ANFSzsvdNxny0pAHhNmsQVUTMs8DbGQfmcdVUhFJ+wi0CzY31Qc+L/6MwzhQ0aw3AXbcrm
	NGSW935W7Ll0z7Vc+Av4esGnTU9FQB0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-hZpAjPy1MIuKb-Tqr2KaQg-1; Fri, 27 Jun 2025 12:07:12 -0400
X-MC-Unique: hZpAjPy1MIuKb-Tqr2KaQg-1
X-Mimecast-MFC-AGG-ID: hZpAjPy1MIuKb-Tqr2KaQg_1751040432
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb4eed1914so77116d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040431; x=1751645231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xy96KI8UDKszt96CyDW7op5ryIeAmzp/OyFji+BJh8=;
        b=DTPlQwXRnsjMa2sc3E927j2OvdHBPaFyn5aaI17tl5vPWk5W/mXHTvid3TLgMUM5Xe
         1Q6Q4bpVg7/WtHhBP3ALPDTTz+/+iszJEZj6G7x5nLHvLkUq4tsSpx+ihIvRR7zBGGIU
         hfxj5peQ+xLvHwWgJ3GfTrGKFJnl2RdDnIl/q8GgQJIb+OJh2JwApK9r1pehV9aJH8VU
         dsHY874Ly7awV5Qv7D3pT8UvefDZi/aS62uc/e2h0kPb8mERah/hOrLp8GeorVprh5WC
         8rnYlbyY85Ib3fvtAtI0BlgtiiLSRvPITbmIAOQyKbikx3yAT36UP+rEOnrrNoSqjkfg
         570A==
X-Gm-Message-State: AOJu0YyaBU4R8NtT3CRmJlyvX66BrfxxkRJVL25X8O8FtP1xJ381BAT4
	W0gi32/rFe6DvP+mHNl2xybsMn4+t6xzwA6vs3RFwsYEN3veNw2M0eqkTkV2uhAm2z5s42b+ZjD
	xPGglYd7qIk5TcWBQ/23HOCaJpnr8wLGPw6ZHIo4suodP0POJUY4+1E94D3fAPxUZLto86poyTj
	bA6Z2VHLfjFpVzLvp8tqWANk6W3olH9LWCUnxJSTHgEfonIcY=
X-Gm-Gg: ASbGnctCg5LusNyfA8ka2LxQMyTSjrwWxQ6HgR9U8q0IAvlfFJLmrXz73821bGz4o27
	t8gwqN7XSy8Ai8T0+p90dhUtGeronWjtwvdiMoqnZz9lysxUfVF/dJYgTs4RQmGzFpDoICk9WHO
	Gw3vqdp0s5OmztCAMBlIJt2tzbzvyhp0s7S3PXjE0WXYlzcjtcJG6Wr2OEHx11eEEkWrF/RGVuT
	U9G0nwNeaFQHCMPooEe5pmLZWH712nXRzwx5IkRSALHmq9dlMBeogBfjCqDc1Urec4/DdEcuOEh
	bRPKR4jTlnY=
X-Received: by 2002:a05:6214:405:b0:6fd:24:b0e0 with SMTP id 6a1803df08f44-7000252f09fmr61586516d6.6.1751040431244;
        Fri, 27 Jun 2025 09:07:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpI3B+sCb86YFp8sTXjrVwNo2dAmF8TVfkL08aeMHEOdDuhipHJHbQBBG3CZhrBLuzvp45Qw==
X-Received: by 2002:a05:6214:405:b0:6fd:24:b0e0 with SMTP id 6a1803df08f44-7000252f09fmr61585916d6.6.1751040430641;
        Fri, 27 Jun 2025 09:07:10 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd76e74372sm22805016d6.0.2025.06.27.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:07:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	peterx@redhat.com,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
Date: Fri, 27 Jun 2025 12:07:07 -0400
Message-ID: <20250627160707.2124580-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only mips and loongarch implemented this API, however what it does was
checking against stack overflow for either len or addr.  That's already
done in arch's arch_get_unmapped_area*() functions, even though it may not
be 100% identical checks.

For example, for both of the architectures, there will be a trivial
difference on how stack top was defined.  The old code uses STACK_TOP which
may be slightly smaller than TASK_SIZE on either of them, but the hope is
that shouldn't be a problem.

It means the whole API is pretty much obsolete at least now, remove it
completely.

Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
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
index 00b2d1a032fd..81a6acddd690 100644
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
index c6c87eae4a8d..474de8e2a8f2 100644
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

