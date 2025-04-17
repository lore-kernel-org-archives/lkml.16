Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AB2253FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880174; cv=none; b=dtGfH6aaMHXPW8dGd5k5i0ycCuzGc827nDsRZkJcgqGE/uD15bbgIbDPcySgWioq2p99VpbGAsgTiejocVdHCfXiiWdTSDhuSybGf7ajGY82OkmTiAEiblvB1yLr1Q81rHTve3u3Ou6DOADw3sdMufqXDQfjNDWbJu+Nf2KJlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880174; c=relaxed/simple;
	bh=FmBCh4hXzIghh7X/nX0s2oJrtYeP4j0WG1LzRzQY8Lw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JJIUKH1XI74635oY2U/iNRt01PjdKOu/tCM+TlJpel/3U3UMwtr9zhOlq4r2J+SVO42u4C8Tp2hQj6NHOAbi1ZlFqJGQEO3CdpvhbqFbCllmhGqDCVohfv2DDSU0j1VuOk2nx5ZsI/4fXNrzEExNI/NfSP/nW11uMoPkPvphj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=emHnNaeW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="emHnNaeW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30828fc17adso474745a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744880169; x=1745484969; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=efcj6vWtk37SkWclqX9qLRQV+dZoYr5AI7grQeYeqEo=;
        b=emHnNaeWtbqDYZ3y5lC/7ZfnWtiYKu5xk2DUnBzhuLtm++GuLcjZz4xZYOPu5PJjUX
         lhTHSUoGwcRwGt1XvUci1yQ1L9rgN5MQGL1aDWcX3hQKFHNTpN9J98vQhTCgGZgS2024
         UmsLjmA3QrTwrswOoCPRS8HoiqomRoSGIQr1mt4dGcxqW0Kx+h87HHuIpGtpIVvbWJXV
         jIU1xZzVNEkBar1vwcPJVb/yVvRk+QUgwO3U3ejqh4nakV5WClIx3+Yp9UidC05CShpf
         mTUPTA7B4uIx4OIzqbh56DYD6K3u35bG7LTWGe1Di3QnEStfFVha9y0UEFeZ8aOxIe6G
         J8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880169; x=1745484969;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efcj6vWtk37SkWclqX9qLRQV+dZoYr5AI7grQeYeqEo=;
        b=oKFJIXkTK01n1AZw7kzqAlrt2A1QfgmRuVMMiLwFLwdvS960uyS4KG8fcaR3ROQVKl
         /ji4A75pyK6xl6gkgUkJyZOd5dNwahahM1gxZENdFds36nkMdhEahDCubPgdDXsIFmcf
         cpPMB13GwFId63X93Ai/rFPoUDm4jzyVnYJEoEKfAQCo91mEUIpt2aOYhqRuDHdLQyyY
         UHHr9qGFcSkcY2yoQy6OsBRQrjynJvqkZx0eqjlPRuoAr1LO4rZ1OF7dAcEgyB2oNWgP
         oSBcqQm9DNl/aJhvsAU35qy8UOtyi+wE2FMORLQTtZhPeNuzM65Mr6Jj9kFVqVQm4an0
         +9BA==
X-Forwarded-Encrypted: i=1; AJvYcCWdpvPFAQIamkvdQLPPNigoaywuzucXPQXcdnYjGjwGCi1zS69tqhh9tYl9LGGmjMD20vFS5TlN/cNyd0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXhw7IxVD92GHGaj7xwX2mIftKcFE5gixsESf/PRwdiYjSIj36
	wHyp9VKKyOT8iuGUoAxuOi6ZBLgnU1+JePv+XyVTNMcOp46JiM5XOT+keUd4kw==
X-Gm-Gg: ASbGncv330tTDRgpX6FzvcTd/KwrwR9bdmjEtfK2Rewdh+L59kvLbXOd71kYeFUNiAp
	gAvXQeRRIGaT+pn6Rlb+v3ivoEmjWzNz5uPfkaLgGbRO7UmJHoIPt3eKZJf5rth2VzVbc8iCZS4
	Th3+480FhJ30+G6YBXUqT3Ty01nhtLs9lXIrjZn/7rbL9blwUhudY975ViI5GryxuVCGvhHY48q
	dK1dwqDe9tF3E+5J6SkJO+No9LXrmeO3STtZQxnhaYBDqlLh0m1/FazuMsQxkuk/eQcV6BAl2HB
	ZTV8BVGwI3AkZcqODY395HBFE/clWIXtXM6vGssKBhOvh7f0WETSf/V5AUmO4ab7LNzsbP3AwOK
	3+JWVjExN6xyQeiRU98ypuQ+x
X-Google-Smtp-Source: AGHT+IHjDeiSaw/M3LU4aS8JzNJOh+g4/SSzXupIaI91vW+xXz6rwzm4LXBZfujOCargbQhV7m5Y/w==
X-Received: by 2002:a17:90b:28c6:b0:2ff:7031:e380 with SMTP id 98e67ed59e1d1-30863f1b67bmr8001145a91.10.1744880169069;
        Thu, 17 Apr 2025 01:56:09 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308545c894fsm2438265a91.1.2025.04.17.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:56:08 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:55:54 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: David Hildenbrand <david@redhat.com>
cc: Hugh Dickins <hughd@google.com>, Gavin Guo <gavinguo@igalia.com>, 
    linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org, 
    ziy@nvidia.com, linmiaohe@huawei.com, revest@google.com, 
    kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
In-Reply-To: <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
Message-ID: <7d0ef7b5-043b-beca-72a9-6ae98b0d55fb@google.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com> <27d13454-280f-4966-b694-d7e58d991547@redhat.com> <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com> <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
 <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, David Hildenbrand wrote:
> On 17.04.25 09:18, David Hildenbrand wrote:
> > On 17.04.25 07:36, Hugh Dickins wrote:
> >> On Wed, 16 Apr 2025, David Hildenbrand wrote:
> >>>
> >>> Why not something like
> >>>
> >>> struct folio *entry_folio;
> >>>
> >>> if (folio) {	
> >>>  if (is_pmd_migration_entry(*pmd))
> >>>  	entry_folio = pfn_swap_entry_folio(pmd_to_swp_entry(*pmd)));
> >>>  else
> >>>   entry_folio = pmd_folio(*pmd));
> >>>
> >>>  if (folio != entry_folio)
> >>> 		return;
> >>> }
> >>
> >> My own preference is to not add unnecessary code:
> >> if folio and pmd_migration entry, we're not interested in entry_folio.
> >> But yes it could be written in lots of other ways.
> > 
> > While I don't disagree about "not adding unnecessary code" in general,
> > in this particular case just looking the folio up properly might be the
> > better alternative to reasoning about locking rules with conditional
> > input parameters :)
> > 
> 
> FWIW, I was wondering if we can rework that code, letting the caller to the
> checking and getting rid of the folio parameter. Something like this
> (incomplete, just to
> discuss if we could move the TTU_SPLIT_HUGE_PMD handling).

Yes, I too dislike the folio parameter used for a single case, and agree
it's better for the caller who chose pmd to check that *pmd fits the folio.

I haven't checked your code below, but it looks like a much better way
to proceed, using the page_vma_mapped_walk() to get pmd lock and check;
and cutting out two or more layers of split_huge_pmd obscurity.

Way to go.  However... what we want right now is a fix that can easily
go to stable: the rearrangements here in 6.15-rc mean, I think, that
whatever goes into the current tree will have to be placed differently
for stable, no seamless backports; but Gavin's patch (reworked if you
insist) can be adapted to stable (differently for different releases)
more more easily than the future direction you're proposing here.

(Hmm, that may be another reason for preferring the reasoning by
folio lock: forgive me if I'm misremembering, but didn't those
page migration swapops get renamed, some time around 5.11?)

Hugh

> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2a47682d1ab77..754aa3103e8bf 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3075,22 +3075,11 @@ static void __split_huge_pmd_locked(struct
> vm_area_struct *vma, pmd_t *pmd,
>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>                            pmd_t *pmd, bool freeze, struct folio *folio)
>  {
> -       VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>         VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -       VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
> -       VM_BUG_ON(freeze && !folio);
>  -       /*
> -        * When the caller requests to set up a migration entry, we
> -        * require a folio to check the PMD against. Otherwise, there
> -        * is a risk of replacing the wrong folio.
> -        */
>         if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
> -           is_pmd_migration_entry(*pmd)) {
> -               if (folio && folio != pmd_folio(*pmd))
> -                       return;
> +           is_pmd_migration_entry(*pmd))
>                 __split_huge_pmd_locked(vma, pmd, address, freeze);
> -       }
>  }
>  
>  void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80d..bf0320b03d615 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2291,13 +2291,6 @@ static bool try_to_migrate_one(struct folio *folio,
> struct vm_area_struct *vma,
>         if (flags & TTU_SYNC)
>                 pvmw.flags = PVMW_SYNC;
>  -       /*
> -        * unmap_page() in mm/huge_memory.c is the only user of migration with
> -        * TTU_SPLIT_HUGE_PMD and it wants to freeze.
> -        */
> -       if (flags & TTU_SPLIT_HUGE_PMD)
> -               split_huge_pmd_address(vma, address, true, folio);
> -
>         /*
>          * For THP, we have to assume the worse case ie pmd for invalidation.
>          * For hugetlb, it could be much worse if we need to do pud
> @@ -2326,6 +2319,14 @@ static bool try_to_migrate_one(struct folio *folio,
> struct vm_area_struct *vma,
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>                 /* PMD-mapped THP migration entry */
>                 if (!pvmw.pte) {
> +                       if (flags & TTU_SPLIT_HUGE_PMD) {
> +                               split_huge_pmd_locked(vma, pmvw.address,
> pvmw.pmd,
> +                                                     true, NULL);
> +                               ret = false;
> +                               page_vma_mapped_walk_done(&pvmw);
> +                               break;
> +                       }
> +
>                         subpage = folio_page(folio,
>                                 pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
>                         VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
