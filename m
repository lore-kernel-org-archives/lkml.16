Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA52747B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498045; cv=none; b=jCjMDtkxU3M4NwMzSymNjgGZ8fFL4hdrTXWYDhC8NmLCk19Rc1u0j12yvjmf2KYuRA1CysRs0AOAEEmH6MDYUaBh0zx2JpEgNPxUZAurIhMbieFDVHrVeknE+tqmiW8rOrVMzy+B3tsrgrE71KoYJvx7FvwwxJPwxON6xAt4mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498045; c=relaxed/simple;
	bh=AbD6HRQHZbOeEByjzfFLk6SMpoTEoM9mVfr1xJ/Limg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHGX/3mF75bToCm+02dRcMBCSzC1gmxykYYQUDvxx8p6JWWo0G9wSJHBrVM+9b9dQRnW4Wz+8Lnc90Lh/lCLyLkb+BWP5DvTX87vyHK2COk555F3+tbC93xmKe7fBnpuSYikNyxYmdZ4WbHTTDbqcPHZvlKahyLl35hI0v7qOw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/JoRhEv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/JoRhEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745498041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u4GFmuuLv/LOwOVBxLps2Zonp5pjnhjHSEuLoZpjfM4=;
	b=b/JoRhEvPOVknTNS/W+mBypFKL41qFoHMtuBSpLHYDSFfnQbantAQQK5gy5M5nW8XFxdkG
	Mf01FqiLygy9JAXU16NW/wtWoBJEVKsTx4qSRhY8yjxjXiOfJqBVkJcJ3ti0gPM6yE4LTI
	oMLdXqzw6C6o9Er5Q94sYGpw1hxhJ80=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-l2b-aFcnPJOvsr_gHPEOSQ-1; Thu, 24 Apr 2025 08:33:58 -0400
X-MC-Unique: l2b-aFcnPJOvsr_gHPEOSQ-1
X-Mimecast-MFC-AGG-ID: l2b-aFcnPJOvsr_gHPEOSQ_1745498037
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so4847935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498037; x=1746102837;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u4GFmuuLv/LOwOVBxLps2Zonp5pjnhjHSEuLoZpjfM4=;
        b=hRvPfWJIuGa98AfXSs5DE1vEhfCY4fGZ/p/6ugO3VNd985I0R/qY+yXMtABHWO202o
         0DxSvu6cJ71IHQpCkdHAoOx0CsU7+IkSVMBSdYv14kPrVRpCiqwqAW2kec868+QftkTO
         mqvIdJ7qu8m/wHVGjRKLi2Sbb7W0llxHRUXlLXPXCbSGf0lYSbKKvBm3+G2nQlU1vMEG
         ZHYaWtVXp+4eBgAW35gW+2QpBbWkmP5Jp/TKkIqBFC601JPEYJezxRL4QnTJ2vAjebtv
         CqTDaZbdl3s+9WTsw2FyM7ktXzQh3DMi/UNsY+o0j6eCLkdUcAb7uXJ7mAtwH0wf+A+y
         EgwQ==
X-Gm-Message-State: AOJu0YyEk2jwb0MFlfDQtFTMV5Xo/O7+IptHTX/iTWGBwL5wWbjllJYk
	+Iu5B7eR3/KSpLfv4RMapRXmJ8dUxA9AspcfZYGj2AS6q/srEH9SwDGG5uuBvOhqjH9yjb46mPa
	sZyphobOyslImwDYtZuiSZAr8jPNPS2n5X+XEfKDjWGQ8XSfF9BpPvzkhL3PfoA==
X-Gm-Gg: ASbGncuzZTsOPfGFtYhTcvndr8azBXuvhrbGOxmEn7aFO5TQCeJlUb6r7JpBnxVjlRs
	qNCzqYMoL1KCaS/FuFAqmVskS6nTwODCIeatgS9NEchrotyG1+21/AZ3onuNria7oCfVHkE2X+L
	H6J5KzpUPgN2p8F0AkMyGLD+7xqCP03afMqWax28Qa1Pkr+V+XV3ugLcqIF6RgbHDOU7JJoWPFz
	rlGlPhn7CmlNjkzPIVLYRrwhCpp8ilFnyAWCR8bM4UjWNk9r0VoRVtu6OWQQhRf6HTp4ZMVl0a2
	mjx/W1+ui90n9bJGYeo3/M5crA8frkzyhfM6yqXHuPN4mxKUNX0SJy1ZKcVxlIKYfodhxKSpBK1
	yMLisGNIcIctsIfbCvZlAu8Ru2vRF15BpyC6c
X-Received: by 2002:a05:6000:2512:b0:397:8ef9:a143 with SMTP id ffacd0b85a97d-3a06cf5f3aemr2086190f8f.23.1745498036970;
        Thu, 24 Apr 2025 05:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEbHNJfLUtRpgrbrlkmtzjqTJGmHafmYSuNMlGhSZkOGn7lG+ir1jLwtRFWK785XfGXuTdfw==
X-Received: by 2002:a05:6000:2512:b0:397:8ef9:a143 with SMTP id ffacd0b85a97d-3a06cf5f3aemr2086148f8f.23.1745498036331;
        Thu, 24 Apr 2025 05:33:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d569b38sm1925540f8f.100.2025.04.24.05.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:33:55 -0700 (PDT)
Message-ID: <9f78fd5e-a785-4473-8c6b-8267821db446@redhat.com>
Date: Thu, 24 Apr 2025 14:33:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
 <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
 <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
 <0101d903-af59-478d-b0e6-af5ba6619eff@redhat.com>
 <7aeaa30d-3fa6-4edf-82a0-e0c494ef3df8@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7aeaa30d-3fa6-4edf-82a0-e0c494ef3df8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> ... and I think we still have space in vm_area_struct without increasing it
>> beyond 192 bytes.
> 
> Hm, so you're thinking of a general field in the VMA? I thought this would
> belong to the PAT object somehow?

It's glued to a VMA. The only alternative to using a VMA field would be looking it
up for a VMA, storing it in an xarray etc ... ends up complicating stuff when there
is no need to right now.

> 
> Though getting rid of VM_PAT would be fantastic...
> 
> I wonder if a _general_ VMA ref count would be a bit much just for this
> case.

I don't think it would be helpful for this case. It's much more similar to the anon
VMA name (that also has its own kref)

> 
> But maybe I misunderstand your approach :) Happy to obviously look and if
> not like some crazy thing just for PAT (you can understand why I would not
> like this) will be supportive :>)

This is something quick (well, longer than I wish it would take) that seems to
work. There are smaller pat-internal cleanups to be had on top of this, and
the new functions shall be documented.


Observe how:
* We remove VM_PAT and that weird VM flags manipulation + "locked" flag
* We remove any traces of the nasty tracking handling from mremap+fork code
* Just like anon_vma_name, it hooks into vm_area_dup()/vm_area_free().
* We remove the page table lookup via get_pat_info()->... completely
* We remove the VMA parameter from PAT code completely
* We reduce the track/untrack/sanitize interface to 3 functions

 From 4cf8b2a2e60220c5b438adf920d75cba3af50ab4 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Thu, 24 Apr 2025 12:06:15 +0200
Subject: [PATCH] mm: rewrite pfnmap tracking

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  arch/x86/mm/pat/memtype.c      | 155 ++-------------------------------
  drivers/gpu/drm/i915/i915_mm.c |   4 +-
  include/linux/mm.h             |   4 +-
  include/linux/mm_inline.h      |   2 +
  include/linux/mm_types.h       |  11 +++
  include/linux/pgtable.h        |  71 ++-------------
  include/trace/events/mmflags.h |   4 +-
  kernel/fork.c                  |  54 ++++++++++--
  mm/huge_memory.c               |   7 +-
  mm/io-mapping.c                |   2 +-
  mm/memory.c                    |  93 +++++++++++++++-----
  mm/memremap.c                  |   8 +-
  mm/mremap.c                    |   4 -
  13 files changed, 162 insertions(+), 257 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc611583..237c7e5e9d9aa 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -932,124 +932,14 @@ static void free_pfn_range(u64 paddr, unsigned long size)
  		memtype_free(paddr, paddr + size);
  }
  
-static int follow_phys(struct vm_area_struct *vma, unsigned long *prot,
-		resource_size_t *phys)
-{
-	struct follow_pfnmap_args args = { .vma = vma, .address = vma->vm_start };
-
-	if (follow_pfnmap_start(&args))
-		return -EINVAL;
-
-	/* Never return PFNs of anon folios in COW mappings. */
-	if (!args.special) {
-		follow_pfnmap_end(&args);
-		return -EINVAL;
-	}
-
-	*prot = pgprot_val(args.pgprot);
-	*phys = (resource_size_t)args.pfn << PAGE_SHIFT;
-	follow_pfnmap_end(&args);
-	return 0;
-}
-
-static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
-		pgprot_t *pgprot)
-{
-	unsigned long prot;
-
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_PAT));
-
-	/*
-	 * We need the starting PFN and cachemode used for track_pfn_remap()
-	 * that covered the whole VMA. For most mappings, we can obtain that
-	 * information from the page tables. For COW mappings, we might now
-	 * suddenly have anon folios mapped and follow_phys() will fail.
-	 *
-	 * Fallback to using vma->vm_pgoff, see remap_pfn_range_notrack(), to
-	 * detect the PFN. If we need the cachemode as well, we're out of luck
-	 * for now and have to fail fork().
-	 */
-	if (!follow_phys(vma, &prot, paddr)) {
-		if (pgprot)
-			*pgprot = __pgprot(prot);
-		return 0;
-	}
-	if (is_cow_mapping(vma->vm_flags)) {
-		if (pgprot)
-			return -EINVAL;
-		*paddr = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;
-		return 0;
-	}
-	WARN_ON_ONCE(1);
-	return -EINVAL;
-}
-
-int track_pfn_copy(struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, unsigned long *pfn)
-{
-	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
-	resource_size_t paddr;
-	pgprot_t pgprot;
-	int rc;
-
-	if (!(src_vma->vm_flags & VM_PAT))
-		return 0;
-
-	/*
-	 * Duplicate the PAT information for the dst VMA based on the src
-	 * VMA.
-	 */
-	if (get_pat_info(src_vma, &paddr, &pgprot))
-		return -EINVAL;
-	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
-	if (rc)
-		return rc;
-
-	/* Reservation for the destination VMA succeeded. */
-	vm_flags_set(dst_vma, VM_PAT);
-	*pfn = PHYS_PFN(paddr);
-	return 0;
-}
-
-void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
-{
-	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
-	/*
-	 * Reservation was freed, any copied page tables will get cleaned
-	 * up later, but without getting PAT involved again.
-	 */
-}
-
-/*
- * prot is passed in as a parameter for the new mapping. If the vma has
- * a linear pfn mapping for the entire range, or no vma is provided,
- * reserve the entire pfn + size range with single reserve_pfn_range
- * call.
- */
-int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
-		    unsigned long pfn, unsigned long addr, unsigned long size)
+int pfnmap_sanitize(unsigned long pfn, unsigned long size, pgprot_t *prot)
  {
  	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
  	enum page_cache_mode pcm;
  
-	/* reserve the whole chunk starting from paddr */
-	if (!vma || (addr == vma->vm_start
-				&& size == (vma->vm_end - vma->vm_start))) {
-		int ret;
-
-		ret = reserve_pfn_range(paddr, size, prot, 0);
-		if (ret == 0 && vma)
-			vm_flags_set(vma, VM_PAT);
-		return ret;
-	}
-
  	if (!pat_enabled())
  		return 0;
  
-	/*
-	 * For anything smaller than the vma size we set prot based on the
-	 * lookup.
-	 */
  	pcm = lookup_memtype(paddr);
  
  	/* Check memtype for the remaining pages */
@@ -1066,51 +956,18 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
  	return 0;
  }
  
-void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
  {
-	enum page_cache_mode pcm;
-
-	if (!pat_enabled())
-		return;
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
  
-	/* Set prot based on lookup */
-	pcm = lookup_memtype(pfn_t_to_phys(pfn));
-	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
-			 cachemode2protval(pcm));
+	return reserve_pfn_range(paddr, size, prot, 0);
  }
  
-/*
- * untrack_pfn is called while unmapping a pfnmap for a region.
- * untrack can be called for a specific region indicated by pfn and size or
- * can be for the entire vma (in which case pfn, size are zero).
- */
-void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-		 unsigned long size, bool mm_wr_locked)
+void pfnmap_untrack(unsigned long pfn, unsigned long size)
  {
-	resource_size_t paddr;
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
  
-	if (vma && !(vma->vm_flags & VM_PAT))
-		return;
-
-	/* free the chunk starting from pfn or the whole chunk */
-	paddr = (resource_size_t)pfn << PAGE_SHIFT;
-	if (!paddr && !size) {
-		if (get_pat_info(vma, &paddr, NULL))
-			return;
-		size = vma->vm_end - vma->vm_start;
-	}
  	free_pfn_range(paddr, size);
-	if (vma) {
-		if (mm_wr_locked)
-			vm_flags_clear(vma, VM_PAT);
-		else
-			__vm_flags_mod(vma, 0, VM_PAT);
-	}
-}
-
-void untrack_pfn_clear(struct vm_area_struct *vma)
-{
-	vm_flags_clear(vma, VM_PAT);
  }
  
  pgprot_t pgprot_writecombine(pgprot_t prot)
diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 76e2801619f09..c33bd3d830699 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
  
  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
  
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
  	r.mm = vma->vm_mm;
  	r.pfn = pfn;
  	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
@@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
  	};
  	int err;
  
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
  
  	while (offset >= r.sgt.max >> PAGE_SHIFT) {
diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c46..1dc7df6ff38e9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -356,9 +356,7 @@ extern unsigned int kobjsize(const void *objp);
  # define VM_SHADOW_STACK	VM_NONE
  #endif
  
-#if defined(CONFIG_X86)
-# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
-#elif defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64)
  # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
  #elif defined(CONFIG_PARISC)
  # define VM_GROWSUP	VM_ARCH_1
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f9157a0c42a5c..89b518ff097e6 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
  
  #endif  /* CONFIG_ANON_VMA_NAME */
  
+void pfnmap_track_ctx_release(struct kref *ref);
+
  static inline void init_tlb_flush_pending(struct mm_struct *mm)
  {
  	atomic_set(&mm->tlb_flush_pending, 0);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f91..91124761cfda8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -764,6 +764,14 @@ struct vma_numab_state {
  	int prev_scan_seq;
  };
  
+#ifdef __HAVE_PFNMAP_TRACKING
+struct pfnmap_track_ctx {
+	struct kref kref;
+	unsigned long pfn;
+	unsigned long size;
+};
+#endif
+
  /*
   * This struct describes a virtual memory area. There is one of these
   * per VM-area/task. A VM area is any part of the process virtual memory
@@ -877,6 +885,9 @@ struct vm_area_struct {
  	struct anon_vma_name *anon_name;
  #endif
  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
+#ifdef __HAVE_PFNMAP_TRACKING
+	struct pfnmap_track_ctx *pfnmap_track_ctx;
+#endif
  } __randomize_layout;
  
  #ifdef CONFIG_NUMA
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c921..941ef982e1b61 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1489,82 +1489,25 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
   * vmf_insert_pfn.
   */
  
-/*
- * track_pfn_remap is called when a _new_ pfn mapping is being established
- * by remap_pfn_range() for physical range indicated by pfn and size.
- */
-static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
-				  unsigned long pfn, unsigned long addr,
-				  unsigned long size)
+/* Cannot fail if size <= PAGE_SIZE. */
+int pfnmap_sanitize(unsigned long pfn, unsigned long size, pgprot_t *prot)
  {
  	return 0;
  }
  
-/*
- * track_pfn_insert is called when a _new_ single pfn is established
- * by vmf_insert_pfn().
- */
-static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
-				    pfn_t pfn)
-{
-}
-
-/*
- * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
- * tables copied during copy_page_range(). Will store the pfn to be
- * passed to untrack_pfn_copy() only if there is something to be untracked.
- * Callers should initialize the pfn to 0.
- */
-static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, unsigned long *pfn)
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
  {
  	return 0;
  }
  
-/*
- * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
- * copy_page_range(), but after track_pfn_copy() was already called. Can
- * be called even if track_pfn_copy() did not actually track anything:
- * handled internally.
- */
-static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
-		unsigned long pfn)
+void pfnmap_untrack(unsigned long pfn, unsigned long size)
  {
  }
  
-/*
- * untrack_pfn is called while unmapping a pfnmap for a region.
- * untrack can be called for a specific region indicated by pfn and size or
- * can be for the entire vma (in which case pfn, size are zero).
- */
-static inline void untrack_pfn(struct vm_area_struct *vma,
-			       unsigned long pfn, unsigned long size,
-			       bool mm_wr_locked)
-{
-}
-
-/*
- * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
- *
- * 1) During mremap() on the src VMA after the page tables were moved.
- * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
- */
-static inline void untrack_pfn_clear(struct vm_area_struct *vma)
-{
-}
  #else
-extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
-			   unsigned long pfn, unsigned long addr,
-			   unsigned long size);
-extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
-			     pfn_t pfn);
-extern int track_pfn_copy(struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, unsigned long *pfn);
-extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
-		unsigned long pfn);
-extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-			unsigned long size, bool mm_wr_locked);
-extern void untrack_pfn_clear(struct vm_area_struct *vma);
+int pfnmap_sanitize(unsigned long pfn, unsigned long size, pgprot_t *prot);
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
+void pfnmap_untrack(unsigned long pfn, unsigned long size);
  #endif
  
  #ifdef CONFIG_MMU
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 15aae955a10bf..aa441f593e9a6 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -172,9 +172,7 @@ IF_HAVE_PG_ARCH_3(arch_3)
  	__def_pageflag_names						\
  	) : "none"
  
-#if defined(CONFIG_X86)
-#define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
-#elif defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64)
  #define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
  #elif defined(CONFIG_PARISC)
  #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b8..a6c54dde5f05c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -481,7 +481,50 @@ static void vm_area_init_from(const struct vm_area_struct *src,
  #ifdef CONFIG_NUMA
  	dest->vm_policy = src->vm_policy;
  #endif
+#ifdef __HAVE_PFNMAP_TRACKING
+	dest->pfnmap_track_ctx = NULL;
+#endif
+}
+
+#ifdef __HAVE_PFNMAP_TRACKING
+static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
+		struct vm_area_struct *new)
+{
+	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
+
+	if (likely(!ctx))
+		return 0;
+
+	/*
+	 * We don't expect to ever hit this. If ever required, we would have
+	 * to duplicate the tracking.
+	 */
+	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
+		return -ENOMEM;
+	kref_get(&ctx->kref);
+	new->pfnmap_track_ctx = ctx;
+	return 0;
+}
+
+static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
+{
+	struct pfnmap_track_ctx *ctx = vma->pfnmap_track_ctx;
+
+	if (likely(!ctx))
+		return;
+
+	kref_put(&ctx->kref, pfnmap_track_ctx_release);
+	vma->pfnmap_track_ctx = NULL;
+}
+#else
+static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
+		struct vm_area_struct *new)
+{
+}
+static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma);
+{
  }
+#endif
  
  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
  {
@@ -493,15 +536,15 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
  	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
  	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
  	vm_area_init_from(orig, new);
+
+	if (vma_pfnmap_track_ctx_dup(orig, new)) {
+		kmem_cache_free(vm_area_cachep, new);
+		return NULL;
+	}
  	vma_lock_init(new, true);
  	INIT_LIST_HEAD(&new->anon_vma_chain);
  	vma_numab_state_init(new);
  	dup_anon_vma_name(orig, new);
-
-	/* track_pfn_copy() will later take care of copying internal state. */
-	if (unlikely(new->vm_flags & VM_PFNMAP))
-		untrack_pfn_clear(new);
-
  	return new;
  }
  
@@ -511,6 +554,7 @@ void vm_area_free(struct vm_area_struct *vma)
  	vma_assert_detached(vma);
  	vma_numab_state_free(vma);
  	free_anon_vma_name(vma);
+	vma_pfnmap_track_ctx_release(vma);
  	kmem_cache_free(vm_area_cachep, vma);
  }
  
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2a47682d1ab77..9ad6a0a8f0089 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1456,7 +1456,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
  			return VM_FAULT_OOM;
  	}
  
-	track_pfn_insert(vma, &pgprot, pfn);
+	/* TODO: we should check the whole range and handle errors. */
+	pfnmap_sanitize(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot);
+
  	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
  	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
  			pgtable);
@@ -1578,7 +1580,8 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
  	if (addr < vma->vm_start || addr >= vma->vm_end)
  		return VM_FAULT_SIGBUS;
  
-	track_pfn_insert(vma, &pgprot, pfn);
+	/* TODO: we should check the whole range and handle errors. */
+	pfnmap_sanitize(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot);
  
  	ptl = pud_lock(vma->vm_mm, vmf->pud);
  	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
diff --git a/mm/io-mapping.c b/mm/io-mapping.c
index 01b3627999304..7266441ad0834 100644
--- a/mm/io-mapping.c
+++ b/mm/io-mapping.c
@@ -21,7 +21,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
  	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
  		return -EINVAL;
  
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
  	return remap_pfn_range_notrack(vma, addr, pfn, size,
  		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
  			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
diff --git a/mm/memory.c b/mm/memory.c
index ba3ea0a82f7f7..fdbba7261af4d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
  	struct mm_struct *dst_mm = dst_vma->vm_mm;
  	struct mm_struct *src_mm = src_vma->vm_mm;
  	struct mmu_notifier_range range;
-	unsigned long next, pfn = 0;
+	unsigned long next;
  	bool is_cow;
  	int ret;
  
@@ -1371,12 +1371,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
  	if (is_vm_hugetlb_page(src_vma))
  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
  
-	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
-		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
-		if (ret)
-			return ret;
-	}
-
  	/*
  	 * We need to invalidate the secondary MMU mappings only when
  	 * there could be a permission downgrade on the ptes of the
@@ -1418,8 +1412,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
  		raw_write_seqcount_end(&src_mm->write_protect_seq);
  		mmu_notifier_invalidate_range_end(&range);
  	}
-	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
-		untrack_pfn_copy(dst_vma, pfn);
  	return ret;
  }
  
@@ -1914,9 +1906,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
  	if (vma->vm_file)
  		uprobe_munmap(vma, start, end);
  
-	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn(vma, 0, 0, mm_wr_locked);
-
  	if (start != end) {
  		if (unlikely(is_vm_hugetlb_page(vma))) {
  			/*
@@ -2525,7 +2514,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
  	if (!pfn_modify_allowed(pfn, pgprot))
  		return VM_FAULT_SIGBUS;
  
-	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
+	pfnmap_sanitize(pfn, PAGE_SIZE, &pgprot);
  
  	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
  			false);
@@ -2588,7 +2577,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
  	if (addr < vma->vm_start || addr >= vma->vm_end)
  		return VM_FAULT_SIGBUS;
  
-	track_pfn_insert(vma, &pgprot, pfn);
+	pfnmap_sanitize(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot);
  
  	if (!pfn_modify_allowed(pfn_t_to_pfn(pfn), pgprot))
  		return VM_FAULT_SIGBUS;
@@ -2833,6 +2822,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
  	return error;
  }
  
+#ifdef __HAVE_PFNMAP_TRACKING
+static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
+		unsigned long size, pgprot_t *prot)
+{
+	struct pfnmap_track_ctx *ctx;
+
+	if (pfnmap_track(pfn, size, prot))
+		return ERR_PTR(-EINVAL);
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (unlikely(!ctx)) {
+		pfnmap_untrack(pfn, size);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ctx->pfn = pfn;
+	ctx->size = size;
+	kref_init(&ctx->kref);
+	return ctx;
+}
+
+void pfnmap_track_ctx_release(struct kref *ref)
+{
+	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
+
+	pfnmap_untrack(ctx->pfn, ctx->size);
+	kfree(ctx);
+}
+#endif /* __HAVE_PFNMAP_TRACKING */
+
  /**
   * remap_pfn_range - remap kernel memory to userspace
   * @vma: user vma to map to
@@ -2845,20 +2864,54 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
   *
   * Return: %0 on success, negative error code otherwise.
   */
+#ifdef __HAVE_PFNMAP_TRACKING
  int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
  		    unsigned long pfn, unsigned long size, pgprot_t prot)
  {
+	struct pfnmap_track_ctx *ctx = NULL;
  	int err;
  
-	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
-	if (err)
-		return -EINVAL;
+	size = PAGE_ALIGN(size);
+
+	/*
+	 * If we cover the full VMA, we'll perform actual tracking, and
+	 * remember to untrack when the last reference to our tracking
+	 * context from a VMA goes away.
+	 *
+	 * If we only cover parts of the VMA, we'll only lookup the prot
+	 * we can use without tracking.
+	 */
+	if (addr == vma->vm_start && addr + size == vma->vm_end) {
+		if (vma->pfnmap_track_ctx)
+			return -EINVAL;
+		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+	} else {
+		err = pfnmap_sanitize(pfn, size, &prot);
+		if (err)
+			return -EINVAL;
+	}
  
  	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
-	if (err)
-		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
-	return err;
+	if (err) {
+		if (ctx)
+			kref_put(&ctx->kref, pfnmap_track_ctx_release);
+		return err;
+	}
+
+	if (ctx)
+		vma->pfnmap_track_ctx = ctx;
+	return 0;
+}
+
+#else
+int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
+		    unsigned long pfn, unsigned long size, pgprot_t prot)
+{
+	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
  }
+#endif
  EXPORT_SYMBOL(remap_pfn_range);
  
  /**
diff --git a/mm/memremap.c b/mm/memremap.c
index 2aebc1b192da9..c417c843e9b1f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
  	}
  	mem_hotplug_done();
  
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
  	pgmap_array_delete(range);
  }
  
@@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
  	if (nid < 0)
  		nid = numa_mem_id();
  
-	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
-			range_len(range));
+	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
+			     &params->pgprot);
  	if (error)
  		goto err_pfn_remap;
  
@@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
  	if (!is_private)
  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
  err_kasan:
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
  err_pfn_remap:
  	pgmap_array_delete(range);
  	return error;
diff --git a/mm/mremap.c b/mm/mremap.c
index 7db9da609c84f..6e78e02f74bd3 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
  	if (is_vm_hugetlb_page(vma))
  		clear_vma_resv_huge_pages(vma);
  
-	/* Tell pfnmap has moved from this vma */
-	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn_clear(vma);
-
  	*new_vma_ptr = new_vma;
  	return err;
  }
-- 
2.49.0


-- 
Cheers,

David / dhildenb

