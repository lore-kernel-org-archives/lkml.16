Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554B2F1FD0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033994; cv=none; b=SWJ7p9Wt4ik1cZFMZkkr+H8BAmX0UVYabvJsdbg4pzJDqN36qKtWWkzEHk/Vi8ZpQo6CXM1L9bVJ8wcxUaBpxEDI3wlXoHpTzFJYbHFEXn+cWKooDWbiPPPicW/C8sPTsSWRMO2xe9w4VYyBVHjBkCEDBPqThg7Xnhc2E8BBLNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033994; c=relaxed/simple;
	bh=5GG0zjyvtXrWaMZOXel9Di8twk1AucFyk3j9CJ4NYY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJxII3B2erNpCam3jF/hyY2lQENqmG2DpAxiL8eiXEZg2nGvju2dfondz2dPXVHl/y5j49bSJ5IPkCjMb9U8qYz061wEVGgpm7BgWjyCFO7v7iP2nTpGlSKv+jDpKg1y+hO2NxDlFbOcCyFO37KEVfYw/Sqx/RJ7fOX8q07Xx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsUUy+dP; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsUUy+dP"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6facba680a1so24707436d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033991; x=1751638791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeiLvBeCyMccIVYG3MCR2a7PippxdtExjyMZVApEjXE=;
        b=GsUUy+dPp6oMJBTRQrv0twHQf1IuowsVdQC9+IIotxdvvaPQLtmnvXbqpl54YAyTe6
         +8+l+FIT+k1kk6jTYWiCd5GExE3L6IQvRYSWc1sswd02Wc0aroxpGFb+0YGAvJy1Er4A
         v5+qQZUHt6qX284s8jZn4Fcc0feWSKivAInt6vS59Onbl9NRZ0t1E7Kf99ZZr05Jnd6t
         XKRGbDxxbvhn8kmOOxrEXq6kRmJRgHBQZsO/M/V5NPDim/rVoiKNhVMScQkypWsjlny1
         xJdZzbCjUKNnGh2Uh0Qi26ka4npGtuHn+ay8SWd3ElcBF3qk3pheHj+Akyk5SJi3n05F
         Qj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033991; x=1751638791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeiLvBeCyMccIVYG3MCR2a7PippxdtExjyMZVApEjXE=;
        b=nxwZW7jFgE1evNtLwH56PLqTxr7qaabKrB3ECPl1No1MxeixTa1NNcWJyXNNpkn0MJ
         1mHFWIGl2liKe5Q6/e8E9j0LTWgPPPOyZE/G8D5Su3xHCdOqI9B4DlncDPUMY7FYqgFz
         /NGystGJ9Sg4bCrLNZE+K49UXicCi5836/qYFYuOLn6l7/e2pZH8189H6L2p3Fn9OiOg
         AaRN1uA9kpgL4FOHKNSP390jn7yGpj/Js58Jzu8jplk4dm38Neqt8uGSLsYNXw72f7eY
         DhStuBaIksd+05hyUd31AYG2k62xnr920Dp59dvyLe+ZcYXsqT3c8M8L1ZHng8PA3ehn
         TzZA==
X-Gm-Message-State: AOJu0Yxkt6I1BFqLw7z/S1JyTxZ6Z8eHQjYuBxXWWo5txQC5zFxQL+pb
	AAxkWYamzx49JEOpzBUrmT9kGL1Bb+WPFE/jeGCRUWNBgEk4E+qUwxDmY63hxjpb7DnB7V5Dn78
	au6i2zR9YatsMHuEGmhsJiU75kb/g+CY=
X-Gm-Gg: ASbGncsvtxUg4FXIKmDmxBo9KwtpuPSXYA17JJF+UU8jinttgeuW+axfOBJjwFyFX/O
	MnIbnBolOID7fT7jaK/RZluu74B+vJXXl7zS4eFoQ9xftydPk95Wtuh7Nxl6TDSagLVHVQMCL2+
	ypmnxHtVmL/egXR+bG55/QDRRz+9fUluFHXxAilRndQN5QKGLJOGUGdGqgrg==
X-Google-Smtp-Source: AGHT+IF+SXK9jE+jGxIGSSPYHvm7ImFijF4HgpUMkxyA2joMWTh/O49aWFB8KJqW0UmxHss58UkBUll0Mx951JecDqA=
X-Received: by 2002:a05:6214:3bc2:b0:6f2:a4cf:5fd7 with SMTP id
 6a1803df08f44-700147fea74mr66123936d6.45.1751033990960; Fri, 27 Jun 2025
 07:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627115510.3273675-1-david@redhat.com> <20250627115510.3273675-4-david@redhat.com>
In-Reply-To: <20250627115510.3273675-4-david@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 27 Jun 2025 22:19:32 +0800
X-Gm-Features: Ac12FXx8oaRXdpoubH6t8VIlasdHGnQUvbUOT86RSA4npLMwJPCzHnWjPFYfjQI
Message-ID: <CABzRoya5n6ChTnjfsoYpQuQ6Gtuu61kpH5fc_iXv2cAQHS-KKg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 7:55=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> Many users (including upcoming ones) don't really need the flags etc,
> and can live with a function call.
>
> So let's provide a basic, non-inlined folio_pte_batch().
>
> In zap_present_ptes(), where we care about performance, the compiler
> already seem to generate a call to a common inlined folio_pte_batch()
> variant, shared with fork() code. So calling the new non-inlined variant
> should not make a difference.

It's always an interesting dance with the compiler when it comes to inlinin=
g,
isn't it? We want the speed of 'inline' for critical paths, but also a comp=
act
binary for the common case ...

This split is a nice solution to the classic 'inline' vs. code size dilemma=
 ;p

Thanks,
Lance

>
> While at it, drop the "addr" parameter that is unused.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h  | 11 ++++++++---
>  mm/madvise.c   |  4 ++--
>  mm/memory.c    |  6 ++----
>  mm/mempolicy.c |  3 +--
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  mm/util.c      | 29 +++++++++++++++++++++++++++++
>  8 files changed, 45 insertions(+), 17 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index ca6590c6d9eab..6000b683f68ee 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -218,9 +218,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t p=
te, fpb_t flags)
>  }
>
>  /**
> - * folio_pte_batch - detect a PTE batch for a large folio
> + * folio_pte_batch_ext - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
> - * @addr: The user virtual address the first page is mapped at.
>   * @ptep: Page table pointer for the first entry.
>   * @pte: Page table entry for the first page.
>   * @max_nr: The maximum number of table entries to consider.
> @@ -243,9 +242,12 @@ static inline pte_t __pte_batch_clear_ignored(pte_t =
pte, fpb_t flags)
>   * must be limited by the caller so scanning cannot exceed a single VMA =
and
>   * a single page table.
>   *
> + * This function will be inlined to optimize based on the input paramete=
rs;
> + * consider using folio_pte_batch() instead if applicable.
> + *
>   * Return: the number of table entries in the batch.
>   */
> -static inline unsigned int folio_pte_batch(struct folio *folio, unsigned=
 long addr,
> +static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>                 pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>                 bool *any_writable, bool *any_young, bool *any_dirty)
>  {
> @@ -293,6 +295,9 @@ static inline unsigned int folio_pte_batch(struct fol=
io *folio, unsigned long ad
>         return min(nr, max_nr);
>  }
>
> +unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte=
,
> +               unsigned int max_nr);
> +
>  /**
>   * pte_move_swp_offset - Move the swap entry offset field of a swap pte
>   *      forward or backward by delta
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 661bb743d2216..9b9c35a398ed0 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -349,8 +349,8 @@ static inline int madvise_folio_pte_batch(unsigned lo=
ng addr, unsigned long end,
>  {
>         int max_nr =3D (end - addr) / PAGE_SIZE;
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
> -                              any_young, any_dirty);
> +       return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL,
> +                                  any_young, any_dirty);
>  }
>
>  static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> diff --git a/mm/memory.c b/mm/memory.c
> index ab2d6c1425691..43d35d6675f2e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -995,7 +995,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, str=
uct vm_area_struct *src_vma
>                 if (vma_soft_dirty_enabled(src_vma))
>                         flags |=3D FPB_HONOR_SOFT_DIRTY;
>
> -               nr =3D folio_pte_batch(folio, addr, src_pte, pte, max_nr,=
 flags,
> +               nr =3D folio_pte_batch_ext(folio, src_pte, pte, max_nr, f=
lags,
>                                      &any_writable, NULL, NULL);
>                 folio_ref_add(folio, nr);
>                 if (folio_test_anon(folio)) {
> @@ -1564,9 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gathe=
r *tlb,
>          * by keeping the batching logic separate.
>          */
>         if (unlikely(folio_test_large(folio) && max_nr !=3D 1)) {
> -               nr =3D folio_pte_batch(folio, addr, pte, ptent, max_nr, 0=
,
> -                                    NULL, NULL, NULL);
> -
> +               nr =3D folio_pte_batch(folio, pte, ptent, max_nr);
>                 zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent,=
 nr,
>                                        addr, details, rss, force_flush,
>                                        force_break, any_skipped);
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 2a25eedc3b1c0..eb83cff7db8c3 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -711,8 +711,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigne=
d long addr,
>                 if (!folio || folio_is_zone_device(folio))
>                         continue;
>                 if (folio_test_large(folio) && max_nr !=3D 1)
> -                       nr =3D folio_pte_batch(folio, addr, pte, ptent,
> -                                            max_nr, 0, NULL, NULL, NULL)=
;
> +                       nr =3D folio_pte_batch(folio, pte, ptent, max_nr)=
;
>                 /*
>                  * vm_normal_folio() filters out zero pages, but there mi=
ght
>                  * still be reserved folios to skip, perhaps in a VDSO.
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 2238cdc5eb1c1..a1d93ad33c6db 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -313,8 +313,7 @@ static inline unsigned int folio_mlock_step(struct fo=
lio *folio,
>         if (!folio_test_large(folio))
>                 return 1;
>
> -       return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
> -                              NULL, NULL);
> +       return folio_pte_batch(folio, pte, ptent, count);
>  }
>
>  static inline bool allow_mlock_munlock(struct folio *folio,
> diff --git a/mm/mremap.c b/mm/mremap.c
> index d4d3ffc931502..1f5bebbb9c0cb 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -182,8 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_stru=
ct *vma, unsigned long addr
>         if (!folio || !folio_test_large(folio))
>                 return 1;
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
> -                              NULL, NULL);
> +       return folio_pte_batch(folio, ptep, pte, max_nr);
>  }
>
>  static int move_ptes(struct pagetable_move_control *pmc,
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a29d7d29c7283..6658968600b72 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1859,8 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsig=
ned long addr,
>         if (pte_pfn(pte) !=3D folio_pfn(folio))
>                 return false;
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
> -                              NULL, NULL) =3D=3D max_nr;
> +       return folio_pte_batch(folio, ptep, pte, max_nr);
>  }
>
>  /*
> diff --git a/mm/util.c b/mm/util.c
> index 0b270c43d7d12..d29dcc135ad28 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1171,3 +1171,32 @@ int compat_vma_mmap_prepare(struct file *file, str=
uct vm_area_struct *vma)
>         return 0;
>  }
>  EXPORT_SYMBOL(compat_vma_mmap_prepare);
> +
> +#ifdef CONFIG_MMU
> +/**
> + * folio_pte_batch - detect a PTE batch for a large folio
> + * @folio: The large folio to detect a PTE batch for.
> + * @ptep: Page table pointer for the first entry.
> + * @pte: Page table entry for the first page.
> + * @max_nr: The maximum number of table entries to consider.
> + *
> + * This is a simplified variant of folio_pte_batch_ext().
> + *
> + * Detect a PTE batch: consecutive (present) PTEs that map consecutive
> + * pages of the same large folio in a single VMA and a single page table=
.
> + *
> + * All PTEs inside a PTE batch have the same PTE bits set, excluding the=
 PFN,
> + * the accessed bit, writable bit, dirt-bit and soft-dirty bit.
> + *
> + * ptep must map any page of the folio. max_nr must be at least one and
> + * must be limited by the caller so scanning cannot exceed a single VMA =
and
> + * a single page table.
> + *
> + * Return: the number of table entries in the batch.
> + */
> +unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte=
,
> +               unsigned int max_nr)
> +{
> +       return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL, NUL=
L, NULL);
> +}
> +#endif /* CONFIG_MMU */
> --
> 2.49.0
>
>
