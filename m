Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D196B27FB07
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844317; cv=none; b=NpLDSF0+ubDztR3ySjbiixxfqw0VZ+kxIMBMJMGUmF3x5N86tX8bhCqKH67Ctz7J7uwjs+BmoEG5vfSNbWZtfOvvxY3kHcSpyf4/sTJYObqQxrFD+ZpzcMuy737Q8XSyDzAEJuMNQbl7qkR/OC3DWlo75P6RpD/CE6u52EvT5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844317; c=relaxed/simple;
	bh=jk4Hhh427Dopn8B/4mWSQYIGFRTAUvXboyajkL1+37o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apnk0fgMga+RsFJe1A2bI8SJKupek+SY1eGqbezHnZDrSvn+BARIHHlS9uprdhJOQhHpPXHE+52XpBIwsy7oLNbic7lkKQSM3IFdF1OstQV9T/rfx7ey/5GdR59H81BSXKWiagygsGTuEtKPSAXDGnSP7Sk9AyGl4xlM7ch3Hwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1hc0nf5; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1hc0nf5"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-531b4da8189so1484151e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750844313; x=1751449113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=;
        b=b1hc0nf53oD80hoYVnnpcZEp2egs/u2pkricymLmDGYC4SWI6kI/hK5mX0kqbUmZye
         rjOBm43PPJi/u459coiZY2+7dqHTWgS37+u/lTHelKRyeVKMNjQJc/tJYLi/6nD6RjXX
         J6E37QzFd+GwqHz7zI5qHiYSEF9zHRKgI17DhDm0XNv/dbMQsJqI2XdM8ORJepw9KPUT
         OGwZSoCxjhioUm2Z4geyaHqa56xdm7El5X2f+W37k0rFHX73tMaVJEGF/gWfW6WxbsOm
         6yxENUBzAdsn+4mnQh1GKzRiVyt6dG2S7T0blGUccAH3Re5UbejN7sk9VfE29c34HpLT
         zmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750844313; x=1751449113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=;
        b=B+Htk1eMDmdyJj23a3lqTCTYcfKJuhV6v/rKnPZwNxpQF8WS8ekveUbRfk2PkVLNu2
         iFffW4Xv9g4OamJ7Hakjd1J6M3LbBmbqQD+0hEC51U0NMj9ChRDNBcvurxqxQGHBs/M+
         CCxqo2iC3rmxSpV/zwmHva/1A5M7Nn5RURZBBTT36zohlW155r5uryknNtc6R6sQYjep
         seAD6MZmcnmy7OgMf1rkRPKgU/BAUaRFq+txOYldMb0WxAy8YZ0d2chUFERHrxVN0gWb
         Rz7JIE7koKJ0heELlzjoUUEW7usNvxu3hE96aGd2J5iqwyM/uAznHdNzVAECMCHT5O7C
         VAWw==
X-Forwarded-Encrypted: i=1; AJvYcCWhFcNhBzrbGBw0oNxj8bhYwvgITUQX5uxB4KwCb1KSG9mFa2xTOqj5XcS0fITmBrFQLuue6p8N76qFSCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWQTBlh+oc2uWEnrdppSofSg6rNsz2qnx0DCy2QMkEwMO4uGv
	Wu/AhcBS+8sRjr9z/bjPv9d953QNF4bGntL4LdNfCdyfdUJ50zP4rO1tCMVzO34BJXhWNXWmt+j
	Gt6+5/Qn/FlFIkFjhwKQPxjxNnEU+wm4=
X-Gm-Gg: ASbGncv3CxWbeUIuMtYQzquIh1k/gP9rQYPK4ujol414qJh3W8C9u3q49fOe0oOV1Ju
	dqkhmrxCFITmszjmZk7vr58EStpypJskMSqZJT718wQDHTcxXBfuszNLGF61FXTvEydpmRmrZk4
	A/iBA5VWVamgynyxdHCpJjH/Q1K9doBEVxdSxgW+cRnXg=
X-Google-Smtp-Source: AGHT+IHFsEjf8mVqrGJlOglZXBqK+LXUAHLKDnHRegX9xwHltPGn1BuflQtnpCujXSYlVduWzyct2ogezPY53n9zi2Q=
X-Received: by 2002:a05:6122:2516:b0:530:81ac:51be with SMTP id
 71dfb90a1353d-532ef6cc1e4mr985532e0c.8.1750844313457; Wed, 25 Jun 2025
 02:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com> <20250624162503.78957-1-ioworker0@gmail.com>
In-Reply-To: <20250624162503.78957-1-ioworker0@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 21:38:21 +1200
X-Gm-Features: Ac12FXwzgBA5qA6Bu1rSIUYx-JEmY2u59OAGcqCQlCXMv4jDK2aouZ9-YNF9zfQ
Message-ID: <CAGsJ_4x+YaF3bVjMuNv2iJtdoD2-GgGsbJA__cpxb7U5YtK9ig@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 4:27=E2=80=AFAM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> On 2025/6/24 23:34, David Hildenbrand wrote:
> > On 24.06.25 17:26, Lance Yang wrote:
> >> On 2025/6/24 20:55, David Hildenbrand wrote:
> >>> On 14.02.25 10:30, Barry Song wrote:
> >>>> From: Barry Song <v-songbaohua@oppo.com>
> >> [...]
> >>>> diff --git a/mm/rmap.c b/mm/rmap.c
> >>>> index 89e51a7a9509..8786704bd466 100644
> >>>> --- a/mm/rmap.c
> >>>> +++ b/mm/rmap.c
> >>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *foli=
o,
> >>>> struct page *page,
> >>>>    #endif
> >>>>    }
> >>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
> >>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> >>>> +            struct folio *folio, pte_t *ptep)
> >>>> +{
> >>>> +    const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DI=
RTY;
> >>>> +    int max_nr =3D folio_nr_pages(folio);
> >>>
> >>> Let's assume we have the first page of a folio mapped at the last pag=
e
> >>> table entry in our page table.
> >>
> >> Good point. I'm curious if it is something we've seen in practice ;)
> >
> > I challenge you to write a reproducer :P I assume it might be doable
> > through simple mremap().
> >
> >>
> >>>
> >>> What prevents folio_pte_batch() from reading outside the page table?
> >>
> >> Assuming such a scenario is possible, to prevent any chance of an
> >> out-of-bounds read, how about this change:
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index fb63d9256f09..9aeae811a38b 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1852,6 +1852,25 @@ static inline bool
> >> can_batch_unmap_folio_ptes(unsigned long addr,
> >>       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIR=
TY;
> >>       int max_nr =3D folio_nr_pages(folio);
> >>       pte_t pte =3D ptep_get(ptep);
> >> +    unsigned long end_addr;
> >> +
> >> +    /*
> >> +     * To batch unmap, the entire folio's PTEs must be contiguous
> >> +     * and mapped within the same PTE page table, which corresponds t=
o
> >> +     * a single PMD entry. Before calling folio_pte_batch(), which do=
es
> >> +     * not perform boundary checks itself, we must verify that the
> >> +     * address range covered by the folio does not cross a PMD bounda=
ry.
> >> +     */
> >> +    end_addr =3D addr + (max_nr * PAGE_SIZE) - 1;
> >> +
> >> +    /*
> >> +     * A fast way to check for a PMD boundary cross is to align both
> >> +     * the start and end addresses to the PMD boundary and see if the=
y
> >> +     * are different. If they are, the range spans across at least tw=
o
> >> +     * different PMD-managed regions.
> >> +     */
> >> +    if ((addr & PMD_MASK) !=3D (end_addr & PMD_MASK))
> >> +        return false;
> >
> > You should not be messing with max_nr =3D folio_nr_pages(folio) here at
> > all. folio_pte_batch() takes care of that.
> >
> > Also, way too many comments ;)
> >
> > You may only batch within a single VMA and within a single page table.
> >
> > So simply align the addr up to the next PMD, and make sure it does not
> > exceed the vma end.
> >
> > ALIGN and friends can help avoiding excessive comments.
>
> Thanks! How about this updated version based on your suggestion:
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..241d55a92a47 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio, s=
truct page *page,
>
>  /* We support batch unmapping of PTEs for lazyfree large folios */
>  static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +                                             struct folio *folio, pte_t =
*ptep,
> +                                             struct vm_area_struct *vma)
>  {
>         const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
> +       unsigned long next_pmd, vma_end, end_addr;
>         int max_nr =3D folio_nr_pages(folio);
>         pte_t pte =3D ptep_get(ptep);
>
> +       /*
> +        * Limit the batch scan within a single VMA and within a single
> +        * page table.
> +        */
> +       vma_end =3D vma->vm_end;
> +       next_pmd =3D ALIGN(addr + 1, PMD_SIZE);
> +       end_addr =3D addr + (unsigned long)max_nr * PAGE_SIZE;
> +
> +       if (end_addr > min(next_pmd, vma_end))
> +               return false;
> +

I had a similar check in do_swap_page() for both forward and backward
out-of-bounds page tables, but I forgot to add it for this unmap path.

this is do_swap_page():

        if (folio_test_large(folio) && folio_test_swapcache(folio)) {
                int nr =3D folio_nr_pages(folio);
                unsigned long idx =3D folio_page_idx(folio, page);
                unsigned long folio_start =3D address - idx * PAGE_SIZE;
                unsigned long folio_end =3D folio_start + nr * PAGE_SIZE;

                pte_t *folio_ptep;
                pte_t folio_pte;

                if (unlikely(folio_start < max(address & PMD_MASK,
vma->vm_start)))
                        goto check_folio;
                if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)=
))
                        goto check_folio;
       }

So maybe something like folio_end > pmd_addr_end(address, vma->vm_end)?

Thanks
Barry
