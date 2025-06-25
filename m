Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A823ABAD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847952; cv=none; b=kvihNoNOXRIdQqybVAZ8x0bnDjYzJpfDYRk1gGrp4kUA4yNR7YoBUHiYolTq1/jAB5yNMEQKIK0dBBGTXkm+4ufRu1boQQnh1vpAD2UGZ4CZ6BGcA7i9oQX2UPmfIDxtjRvfTCVtwX4QXcR6COnXtIAUySYfjCk/kf14CuLlrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847952; c=relaxed/simple;
	bh=KBwftC+DyNIRznP9/1A+5JLuLywtJhkytAQ2NFiW+eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqeAWD9MWPgr+bdGJpv2m2l5T8dRn5zPeaZ07FugorDMU4z781atIbiXINlU7MeAIXbwHaG8AMMj16vLEijDMvVBWKsmRao0qXYYxGqd+wbtDBsg5TchBd2ho8306w8hIT06GxqhuW19y3A41yQSq4Lhnp4ZcLLF64vjZfFRmS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8StLzHC; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8StLzHC"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87f161d449dso4303976241.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750847950; x=1751452750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=;
        b=K8StLzHCwYCgJ0j79tBo2PfMEISdCTgoQSB1dMfyDSa3zKz7kjceXyN6wIo7IgP2g5
         +QZm/aWqfx64tZ9eAliGLmJ74bAJOUnPQMoPX5QocXxkODA61V7eRxRY93UVFj4qQPGk
         muDPqs48fKMbMjVjVImEP+TkfVOuP4BC5Gi8aagBtJk1iGZ5z/kI+joKY2o5J1O75T5U
         JWaXiuSUXV8FrPfXq5h+6ZQO5asJgnfzG0olVMFaHWE1QuC3XfAef338CXOPvrawweZU
         u0Qa+M9OpJZsNLA5fQ71wyzmXN8s9SZylOFD3WvrE9OL8ckm3uASiTMZnduY4ICADugE
         B7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847950; x=1751452750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=;
        b=f4f1qnAPXDkzUxtt0967EFNoMoSGz6/t/rbFj2iyma0PiomR5LvpbSBV+wS4Ws17eo
         iBiXuAevxDHbizSYjjOTZ5OIyn53Ff/ZGq0rYqMQI5yWxTWSRh1AoVwnHjuclc45N+7g
         PUBShJjRx8UXBR+2DpdZj/5zWDVqK5oaJHMFSylYXq72+Mn1ovIVxAxWL1YkO8sH+dIe
         ktjZqfg/+V6uGmSYKk1JJMhs6LUmvVviaatyn8iabilqp4m4axKQRP/0pw7M1BY890L6
         ADDsdF+80QwMFiaWkKq1KEd7kLVugGjLDj3vFz73Rvp8QdyVMOMqnEOpPUnKXbR6JidW
         8vNw==
X-Forwarded-Encrypted: i=1; AJvYcCW7nFPReOOADS4SCtY/WdtrI2it5GHlMMAqbzfZT1V2mKnx4CuYSct2/1CDyVwhJsMJndpBuyCpa27lhEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEsytqIBnr6k+M0+CW2qSE9S9Fi+oFEZ3ChZoyTZ7tEGPsEznS
	RPDw3BDW/D0Vfomkhy+/cj/ykO4MurVxu4es9BOz9vdCrMzDYkXEbDUkhE1vW/+6JkLWpZ0RdiZ
	I9//rL/zsxHYe0QmPW7UM8vsy2BwlG7g=
X-Gm-Gg: ASbGncv+rWym8iCWsNHNe9jWYQ/KA0gp/hHkSa5jQbl68KVCJUoASvCJREkO2DgE0lJ
	/mNaqR/UdwZL/ZGCcrz7HRH975fzUKM9TCxiEOkd4vSdfo1qG04oDogLuKSi0mImNIT58CiSBAO
	+ZjJSPEvVTgFCV1zOv14uTn0E8+u89kuwtw8uOHXmYZMO/ABCJ/jQcwA==
X-Google-Smtp-Source: AGHT+IG24obpqrnDUZOrsCnGBhTMkO5P7QnbH3Bpi0PqgrwKSJcAQukZsZf78Wd+0Bu3XZMIHzdxuYrYGefspIVUODE=
X-Received: by 2002:a05:6102:5107:b0:4e6:df73:f147 with SMTP id
 ada2fe7eead31-4ecc6a7a5e2mr1211118137.11.1750847949712; Wed, 25 Jun 2025
 03:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
In-Reply-To: <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:38:57 +1200
X-Gm-Features: Ac12FXxBwpebbLn5QzN4mzU9-3AOYto8c1Frvun91yLq31aKsLs2IVptkEujUM4
Message-ID: <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index fb63d9256f09..241d55a92a47 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio,=
 struct page *page,
> >
> >   /* We support batch unmapping of PTEs for lazyfree large folios */
> >   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> > -                     struct folio *folio, pte_t *ptep)
> > +                                           struct folio *folio, pte_t =
*ptep,
> > +                                           struct vm_area_struct *vma)
> >   {
> >       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
> > +     unsigned long next_pmd, vma_end, end_addr;
> >       int max_nr =3D folio_nr_pages(folio);
> >       pte_t pte =3D ptep_get(ptep);
> >
> > +     /*
> > +      * Limit the batch scan within a single VMA and within a single
> > +      * page table.
> > +      */
> > +     vma_end =3D vma->vm_end;
> > +     next_pmd =3D ALIGN(addr + 1, PMD_SIZE);
> > +     end_addr =3D addr + (unsigned long)max_nr * PAGE_SIZE;
> > +
> > +     if (end_addr > min(next_pmd, vma_end))
> > +             return false;
>
> May I suggest that we clean all that up as we fix it?
>
> Maybe something like this:
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..11fbddc6ad8d6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio, s=
truct page *page,
>   #endif
>   }
>
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
> +               pte_t pte)
>   {
>          const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIR=
TY;
> -       int max_nr =3D folio_nr_pages(folio);
> -       pte_t pte =3D ptep_get(ptep);
> +       struct vm_area_struct *vma =3D pvmw->vma;
> +       unsigned long end_addr, addr =3D pvmw->address;
> +       unsigned int max_nr;
> +
> +       if (flags & TTU_HWPOISON)
> +               return 1;
> +       if (!folio_test_large(folio))
> +               return 1;
> +
> +       /* We may only batch within a single VMA and a single page table.=
 */
> +       end_addr =3D min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma-=
>vm_end);

Is this pmd_addr_end()?

> +       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
>
> +       /* We only support lazyfree batching for now ... */
>          if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -               return false;
> +               return 1;
>          if (pte_unused(pte))
> -               return false;
> -       if (pte_pfn(pte) !=3D folio_pfn(folio))
> -               return false;
> +               return 1;
> +       /* ... where we must be able to batch the whole folio. */
> +       if (pte_pfn(pte) !=3D folio_pfn(folio) || max_nr !=3D folio_nr_pa=
ges(folio))
> +               return 1;
> +       max_nr =3D folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, f=
pb_flags,
> +                                NULL, NULL, NULL);
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> -                              NULL, NULL) =3D=3D max_nr;
> +       if (max_nr !=3D folio_nr_pages(folio))
> +               return 1;
> +       return max_nr;
>   }
>
>   /*
> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio, s=
truct vm_area_struct *vma,
>                          if (pte_dirty(pteval))
>                                  folio_mark_dirty(folio);
>                  } else if (likely(pte_present(pteval))) {
> -                       if (folio_test_large(folio) && !(flags & TTU_HWPO=
ISON) &&
> -                           can_batch_unmap_folio_ptes(address, folio, pv=
mw.pte))
> -                               nr_pages =3D folio_nr_pages(folio);
> +                       nr_pages =3D folio_unmap_pte_batch(folio, &pvmw, =
flags, pteval);
>                          end_addr =3D address + nr_pages * PAGE_SIZE;
>                          flush_cache_range(vma, address, end_addr);
>
>
> Note that I don't quite understand why we have to batch the whole thing o=
r fallback to
> individual pages. Why can't we perform other batches that span only some =
PTEs? What's special
> about 1 PTE vs. 2 PTEs vs. all PTEs?
>
>
> Can someone enlighten me why that is required?

It's probably not a strict requirement =E2=80=94 I thought cases where the
count is greater than 1 but less than nr_pages might not provide much
practical benefit, except perhaps in very rare edge cases, since
madv_free() already calls split_folio().

if (folio_test_large(folio)) {
                        bool any_young, any_dirty;
                        nr =3D madvise_folio_pte_batch(addr, end, folio, pt=
e,
                                                     ptent,
&any_young, &any_dirty);


                        if (nr < folio_nr_pages(folio)) {
                                ...
                                err =3D split_folio(folio);
                                ...
                       }
}

Another reason is that when we extend this to non-lazyfree anonymous
folios [1], things get complicated: checking anon_exclusive and updating
folio_try_share_anon_rmap_pte with the number of PTEs becomes tricky if
a folio is partially exclusive and partially shared.

[1] https://lore.kernel.org/linux-mm/20250513084620.58231-1-21cnbao@gmail.c=
om/

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
