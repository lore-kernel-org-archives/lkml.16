Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298221F3BAC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107460; cv=none; b=nww9taiLyBN/VzVhhz2a2AY3WWgvfiReSZwBFfIycRM/o0XD8MMQxZytBg7W4OoLY925x56I78tVpBtU4x01b89rDAhB8vT+UBxaBXiFZ41RyugnWP26M+989Umn/PIMoWeAsjTJt9e/ymkLCQnUeGvH5XiFqQ6vZ3i4c0DB2N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107460; c=relaxed/simple;
	bh=885VIx6kzDrf0KfKwiUVuXwoWV8wBIF7oAVVVxA10zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSCcjX4yWIpUzeMogWY4krJGsjT6mI/fBMVVglAjExM1wp6vVaHU6FO/rSf5J96RyqWTmHBEHvwCmPJnvf6GjFvEOYEz7SMR+wB1ciEDP3EqEEjndfXzqH9BEYELIdyhcErxNpokFb1UVbTKbcyKF+95iSkqdVk3MkEj1YSCPRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fI+FwC4h; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fI+FwC4h"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso1121614a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749107456; x=1749712256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbmofZAA3TlXbKhnQqtXMU8CfPLcrFe6uu6tYmuI958=;
        b=fI+FwC4hbRwbdiq7Lxk+KWDfSbWKhofZ0IhG4i4J3cbuZtzzdTLXNGtYmeWk5OvkP7
         YitJftn597O7+K636zBl4klbidooa7cQc6gOOHOVNbtSdZWwKSOf0CpfnurnfwcZGdbE
         63UJWpefcBQR4EWRSAN61E9GKORF8UbuD21KMjYo2eCx5fFpQB4CaC4mfC2M3MsJTGUU
         f76TY63YHlNW9EV0t4WBa3vGPx2p3iqCyoxMNc6eZEuwFwN3wprU4bhR9zMm6+5i6ePI
         CwqvxpS5fCCU2gf8F2lU/z19VouJZkQGOWFusOIziJ4CsS/MIlGo53efvegDb5kxQsBk
         bVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107456; x=1749712256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbmofZAA3TlXbKhnQqtXMU8CfPLcrFe6uu6tYmuI958=;
        b=BVMdc9SsQLFoFM7vw0bWLGkYoVK1ATrXxEDy+zW5npnDDYDpg8r5WwDTLGTs1MfKch
         UUed9r1F2E2ma78NOWCHZthu5ulqWBtO3mbn/2vDhyybWEnlL1p26nTenJp/HRGAzaL2
         2/F0cWkXpnVygXQMoVbfZ1RyMQof/ofjcW4q6Jn96oYKXXiDqgPlDsKVvgAt5/+73yqx
         bkFHoJlzaCGGMMHg48Nrmi/ZoLAxo0w/zlF5fYBXY5t918Ha+7gcos4Nf7qPauJmVCvM
         CITKBRVVfuL7FeQqVIdn6I7i9vZBJWf5ghldQ9m+GShoQvhUPPx7tZKk5uD/pFAk4b0Y
         EIlQ==
X-Gm-Message-State: AOJu0YxzWCtX7fjWH2/xiIz0kIgy9Ssts/aI59v/s/Y/3X+3jQObG87l
	yxxfqtB3iVHlHpuj320Frr1L91aTxitq72rRhSK8xjX+mOhQnhjEUBNeueKLE2VaNUY=
X-Gm-Gg: ASbGncsZEt8JUHO7OfHdm8O+/KTwzZWuzqRHWqI3TA4COweypnHXHE6WSqne15vo20/
	AkWLnTe91I4Qyc2uN4xByBXrZPIsVonqDjg4Ksp0nUHODlSiKN8wf++XkytHBgCOZ0+sY02eeGH
	+actfjiTzLGm+cn1RpxojaQMf0bI+UM8sZIoqV8DyYxn+AMEDRMo1s5Aiq5HYJ9SDriv/G27pmM
	Aw9RI85iC74zl0z/WFt4NvTYCfxYjP9b0ZRt6LBA5uLIt9RPS/Jkpz6Q+wYH8Di7OTy0WiWDhKS
	37g14hp4kK751+nqvThOG9VT14b8pKccf56O03Z+HNGxJdfFuSKO6kwbgC2CBQWmmmqSw/jBCNQ
	=
X-Google-Smtp-Source: AGHT+IE8sHHRwQar+3CLp0koW1FVTyH3vEN2IdU9qg5bSpsv++Z5rRrVGAZDYPz5dOS2nyQtefp2bg==
X-Received: by 2002:a05:6402:26d0:b0:604:5cae:4031 with SMTP id 4fb4d7f45d1cf-606ea191815mr6085467a12.28.1749107456276;
        Thu, 05 Jun 2025 00:10:56 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60566c5a758sm9856845a12.19.2025.06.05.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:10:55 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:10:55 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <aEFC_12om2UHFGbu@tiehlicka>
References: <20250604140544.688711-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604140544.688711-1-david@redhat.com>

On Wed 04-06-25 16:05:44, David Hildenbrand wrote:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.
> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.

The patch itself makes sense and I think it is good time to revisit old
discussion [1] and finally drop VM_BUG_ON altogether and replace it by
VM_WARN_ON which could be still a useful debugging aid.

[1] https://lore.kernel.org/all/c9abf109-80f2-88f5-4aae-d6fd4a30bcd3@google.com/T/#u
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
> 
> Wanted to do this for a long time, but my todo list keeps growing ...
> 
> Based on mm/mm-unstable
> 
> ---
>  include/linux/mmdebug.h | 12 ++++++++++++
>  mm/gup.c                | 41 +++++++++++++++++++----------------------
>  2 files changed, 31 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index a0a3894900ed4..14a45979cccc9 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	}								\
>  	unlikely(__ret_warn_once);					\
>  })
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
> +	static bool __section(".data..once") __warned;			\
> +	int __ret_warn_once = !!(cond);					\
> +									\
> +	if (unlikely(__ret_warn_once && !__warned)) {			\
> +		dump_vma(vma);						\
> +		__warned = true;					\
> +		WARN_ON(1);						\
> +	}								\
> +	unlikely(__ret_warn_once);					\
> +})
>  #define VM_WARN_ON_VMG(cond, vmg)		({			\
>  	int __ret_warn = !!(cond);					\
>  									\
> @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a87..3c3931fcdd820 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
>  		    !folio_test_anon(folio))
>  			continue;
>  		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
>  		else
>  			/* Either a PTE-mapped or a PMD-mapped THP. */
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
> -				       !PageAnonExclusive(page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
> +					     !PageAnonExclusive(page), page);
>  	}
>  }
>  
> @@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
>  	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
>  		return ERR_PTR(-EMLINK);
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -			!PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	ret = try_grab_folio(page_folio(page), 1, flags);
>  	if (ret)
> @@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		goto out;
>  	}
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -		       !PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
>  	ret = try_grab_folio(folio, 1, flags);
> @@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vma,
>  	if (unshare) {
>  		fault_flags |= FAULT_FLAG_UNSHARE;
>  		/* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatible */
> -		VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
> +		VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
>  	}
>  
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  		}
>  
>  		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
> -		if (!*locked) {
> -			BUG_ON(ret < 0);
> -			BUG_ON(ret >= nr_pages);
> -		}
> +		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));
>  
>  		if (ret > 0) {
>  			nr_pages -= ret;
> @@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  
>  		ret = mmap_read_lock_killable(mm);
>  		if (ret) {
> -			BUG_ON(ret > 0);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  				       pages, locked);
>  		if (!*locked) {
>  			/* Continue to retry until we succeeded */
> -			BUG_ON(ret != 0);
> +			VM_WARN_ON_ONCE(ret != 0);
>  			goto retry;
>  		}
>  		if (ret != 1) {
> -			BUG_ON(ret > 1);
> +			VM_WARN_ON_ONCE(ret > 1);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_struct *vma,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> -	VM_BUG_ON_VMA(start < vma->vm_start, vma);
> -	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
> +	VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, unsigned long start,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  		} else if (pte_special(pte))
>  			goto pte_unmap;
>  
> -		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> +		/* If it's not marked as special it must have a valid memmap. */
> +		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
>  		page = pte_page(pte);
>  
>  		folio = try_grab_folio_fast(page, 1, flags);
> 
> base-commit: 2d0c297637e7d59771c1533847c666cdddc19884
> -- 
> 2.49.0

-- 
Michal Hocko
SUSE Labs
