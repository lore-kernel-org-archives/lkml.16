Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061192D9ED2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848612; cv=none; b=HsyDYLv2vbhh30mFffYCHg2jq3zq4uf/dZ9LA7qsgG+vBdZJSLVfyPdHNAM7Pp9kk9E9ifD7gRWqKXHmAI1u7xrMq1BYvRM4GoDK7U2ixX9tHlud4/Ir4F/qs3y7Tvl3HCqmXamKAY6wbvE6uXW1lVw+igrKzEI4W5Cd6MlOznQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848612; c=relaxed/simple;
	bh=Hfw6Wv3qC8JKZmB/iY5bd/ySsIIzGlY3PAyQM698alo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkaHQZiSpPdV3T98KM5o+Qj1kS5uHyNIUqiDwF+8DOaoLXL1e6ScBKO9VZrWYWzKYaFZhlqVSjWqSmYVdKlAkoZqHvQcTs9LwKyRHXDGSIXDQKpHXU9QuLqkd6ER8AC4kVHEdkQsd+280UnXx+wfW9Rbi8jfbDSg7QXlJObI7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu9DQBx6; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu9DQBx6"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7eefcbf08so1333413137.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848610; x=1751453410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=;
        b=Uu9DQBx6LxPbU0Tq50mtrYNqjwZeu7k3dxXKQOtKNEGSpQxeqQwNdpg8d7G8uy34of
         GISfNek/+ZRgD2lrC+4ITs+abL7CfcsmhWZboidae+lGbu7Kes3v55T/GF3CzlQhZBaK
         3L42dwFEeQBGOKeanXwEJLU+nrLVk7m1oA0QayXHn3n3By3JQddqBJJI6bsfXiC+AmMG
         gIB84FJJ9VVbUmdg+QXWiQrH/4P3RpQFifmyT7QJMHK679uiUxEiYgJ2nQME81n0KLij
         t9xLslrNhWivzlxk4f66HK8lRQlaDlxTJ6hmopWZk10SQc35Qbrf38lESliJOsIBJPlN
         lCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848610; x=1751453410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=;
        b=OW9YRMX6FQP6y1EBZxb28Lq9hTsjdke+IORRGHOWCO5E+DcF47cuOW2Yu30T4WcHER
         G9AOBW3Bt/X8jlh09Ol1hKg69rKSATOLhD0cKcdK2l793wTAHWVIRS5DxTNGmnOUkJUv
         btWBZ1IT2w04ovQVeKRVVGXLqYg1OJPtluUy4s1NTND2xokNe+yrGXkCrFa6xNtbZa+z
         jUTaJLP/+c2P/ziRvI/YA/6yw28v+nspjrGPTx8KYAh98DPX/vHO0PDpuCNj7i8RiYtZ
         NyvFwANHWJ5+DQD55q+h0u9LVJ6aHLUU13Bl+akwyqtMu8RYikp8WsvMsJcQF1RcllC7
         osAg==
X-Forwarded-Encrypted: i=1; AJvYcCUjkNYNMSv/U/Qn1zYTaNGZjJ/8GnnvUOsU8e+XULjhbcGiuS8BYYjAdLjmHechG3BUZ0OrknKPDJzlvIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz7svWxf6rlPcIiTHnrwgGgQ3TfcorU3SGuA1H07ub/MTuil0V
	OUbhe/zqMvn2m2Oy6cqufsjEf63Ik0RZiDiGzuwA96ZuQHu0qpD1wzeh/kDK0Kl63MsnFzEJIB6
	CVmSKp/3nYhhUljCl2ETBO68Or+Fqf+g=
X-Gm-Gg: ASbGncudhxV/sjoOGD3GwX2HfOSMFu8ql4CwP+XKCuiSutt0gORSGtxRBhO3+X1pZ9Y
	tn8i31y9MHXou4qjF88FNUm8rSszh7zSbAxj/NPRsEDcqOF6BOSuV2bzoS7TII6DI0gAdBoiIXF
	8HEzfo9ihuFiFYHat1x0enHH9ZE6+NZUbzj44CH8eSD8E=
X-Google-Smtp-Source: AGHT+IFIGWbS74JzjCEZUb4i5VKaQ/aFUR/LkXTomtH2wQ2EWDeymwBSyFo8o2yIrCkV5HClVkxBQa8gvmUemUzz4AI=
X-Received: by 2002:a05:6102:4193:b0:4e9:968b:4416 with SMTP id
 ada2fe7eead31-4ecc76a9296mr1213988137.24.1750848609825; Wed, 25 Jun 2025
 03:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com> <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
In-Reply-To: <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:49:57 +1200
X-Gm-Features: Ac12FXxMNCsiYUkQXXJTm07hkaCKzJuFJqJgjEbwhAVFd_yNyGUFpCyPyMLyoy8
Message-ID: <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
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

On Wed, Jun 25, 2025 at 10:43=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 12:38, Barry Song wrote:
> >>> diff --git a/mm/rmap.c b/mm/rmap.c
> >>> index fb63d9256f09..241d55a92a47 100644
> >>> --- a/mm/rmap.c
> >>> +++ b/mm/rmap.c
> >>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *foli=
o, struct page *page,
> >>>
> >>>    /* We support batch unmapping of PTEs for lazyfree large folios */
> >>>    static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> >>> -                     struct folio *folio, pte_t *ptep)
> >>> +                                           struct folio *folio, pte_=
t *ptep,
> >>> +                                           struct vm_area_struct *vm=
a)
> >>>    {
> >>>        const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_D=
IRTY;
> >>> +     unsigned long next_pmd, vma_end, end_addr;
> >>>        int max_nr =3D folio_nr_pages(folio);
> >>>        pte_t pte =3D ptep_get(ptep);
> >>>
> >>> +     /*
> >>> +      * Limit the batch scan within a single VMA and within a single
> >>> +      * page table.
> >>> +      */
> >>> +     vma_end =3D vma->vm_end;
> >>> +     next_pmd =3D ALIGN(addr + 1, PMD_SIZE);
> >>> +     end_addr =3D addr + (unsigned long)max_nr * PAGE_SIZE;
> >>> +
> >>> +     if (end_addr > min(next_pmd, vma_end))
> >>> +             return false;
> >>
> >> May I suggest that we clean all that up as we fix it?
> >>
> >> Maybe something like this:
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index 3b74bb19c11dd..11fbddc6ad8d6 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio=
, struct page *page,
> >>    #endif
> >>    }
> >>
> >> -/* We support batch unmapping of PTEs for lazyfree large folios */
> >> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> >> -                       struct folio *folio, pte_t *ptep)
> >> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> >> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flag=
s,
> >> +               pte_t pte)
> >>    {
> >>           const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT=
_DIRTY;
> >> -       int max_nr =3D folio_nr_pages(folio);
> >> -       pte_t pte =3D ptep_get(ptep);
> >> +       struct vm_area_struct *vma =3D pvmw->vma;
> >> +       unsigned long end_addr, addr =3D pvmw->address;
> >> +       unsigned int max_nr;
> >> +
> >> +       if (flags & TTU_HWPOISON)
> >> +               return 1;
> >> +       if (!folio_test_large(folio))
> >> +               return 1;
> >> +
> >> +       /* We may only batch within a single VMA and a single page tab=
le. */
> >> +       end_addr =3D min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), v=
ma->vm_end);
> >
> > Is this pmd_addr_end()?
> >
>
> Yes, that could be reused as well here.
>
> >> +       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >>
> >> +       /* We only support lazyfree batching for now ... */
> >>           if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >> -               return false;
> >> +               return 1;
> >>           if (pte_unused(pte))
> >> -               return false;
> >> -       if (pte_pfn(pte) !=3D folio_pfn(folio))
> >> -               return false;
> >> +               return 1;
> >> +       /* ... where we must be able to batch the whole folio. */
> >> +       if (pte_pfn(pte) !=3D folio_pfn(folio) || max_nr !=3D folio_nr=
_pages(folio))
> >> +               return 1;
> >> +       max_nr =3D folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr=
, fpb_flags,
> >> +                                NULL, NULL, NULL);
> >>
> >> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_fla=
gs, NULL,
> >> -                              NULL, NULL) =3D=3D max_nr;
> >> +       if (max_nr !=3D folio_nr_pages(folio))
> >> +               return 1;
> >> +       return max_nr;
> >>    }
> >>
> >>    /*
> >> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >>                           if (pte_dirty(pteval))
> >>                                   folio_mark_dirty(folio);
> >>                   } else if (likely(pte_present(pteval))) {
> >> -                       if (folio_test_large(folio) && !(flags & TTU_H=
WPOISON) &&
> >> -                           can_batch_unmap_folio_ptes(address, folio,=
 pvmw.pte))
> >> -                               nr_pages =3D folio_nr_pages(folio);
> >> +                       nr_pages =3D folio_unmap_pte_batch(folio, &pvm=
w, flags, pteval);
> >>                           end_addr =3D address + nr_pages * PAGE_SIZE;
> >>                           flush_cache_range(vma, address, end_addr);
> >>
> >>
> >> Note that I don't quite understand why we have to batch the whole thin=
g or fallback to
> >> individual pages. Why can't we perform other batches that span only so=
me PTEs? What's special
> >> about 1 PTE vs. 2 PTEs vs. all PTEs?
> >>
> >>
> >> Can someone enlighten me why that is required?
> >
> > It's probably not a strict requirement =E2=80=94 I thought cases where =
the
> > count is greater than 1 but less than nr_pages might not provide much
> > practical benefit, except perhaps in very rare edge cases, since
> > madv_free() already calls split_folio().
>
> Okay, but it makes the code more complicated. If there is no reason to
> prevent the batching, we should drop it.

It's not necessarily more complex, since page_vma_mapped_walk() still
has to check each PTE individually and can't skip ahead based on nr.
With nr_pages batched, we can exit the loop early in one go.

Thanks
Barry
