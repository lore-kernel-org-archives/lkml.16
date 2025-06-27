Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922F2E7184
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034900; cv=none; b=t3jKVg7vvap0o8P5Nt2guJ9LwMCccA1XtS3MThuQQPuRm+nWrh3xYJZWRSjnTLE4QpRIuHczMmNNr685pqC9BI2NzFsvQ6zF228svmBHuPcqsESKLh6MBSiSYwqvPU6XtFM5UF1fki9Z78AEpqGydJTS5xbzIGY5VI/t9ETxKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034900; c=relaxed/simple;
	bh=ptw5/n4Yq68flNkb1+LUzM1uwhmYfc8ueadjeSu+36A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1XzqnLMLTqtiVDBbA/d68QCVz2pFUpwrj0ZbTZCxycrJxD7/PNpkyD6TsAPLwnLpaFbkRGXmOipM5qlSw1hXY3HNuQl7oZiDva1S9mrsCbHyr/NLg0bcPZRBehPc5C4T+JUZ0L+BtXkF6FSHxq21qtpYS0yzjhJuznD2zJKX3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7/ETzmQ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7/ETzmQ"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fac7147cb8so37094246d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034897; x=1751639697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUWRSrhW18inrM2U55/15P9xJCvGAZ8/b4I9nG6Q2rs=;
        b=M7/ETzmQYA7a/N0tFTES+UPUOFzQEWoy/1WLwwCVCI7MG2w6HMUo3Wt8gD8aPIqlNF
         ac60y8n4dXsElZljW8TGaHxzAbS6u5Nvlowegfxo8YgiabwT8IlyxY4EkivEXvqvKCCo
         Qi7cJogLxYgTxw5bkgE5mfgsWFb/M7w34f8f4GK8Fqk02BMwbSETg334laIq384aDg1r
         l+n/MHxN9TIMHfbhgF9gw+frUnpCd86lSV5BajhrR8XbiJux1XMSuo5dpMjZZff6LTxE
         T5pSnFaILn4SqWYphHonI5n+/HIuDHmuiUw1TTt2MPaJv0AHtOQZewvXBWf6rQANjOZL
         I1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034897; x=1751639697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUWRSrhW18inrM2U55/15P9xJCvGAZ8/b4I9nG6Q2rs=;
        b=CYjxntXMDF3t36094zj5Ef5PjraB3DYtysRzaIh7QP5gh4nJt9mi5bVplgra3OkH6e
         nx0gWuFO8t3vCne6nViqXEn8fGCrmTeY07q837WISe1gJ1hj/Aig7MvDiAwCTWXyNnOF
         zKQ9xARWQEJOs3NMJDTW7WSN1IuPWtXtrYwwjWWublmuKLQLU3dMzZjBKBJerQbNK7tz
         a8tBPokPmZO5DYXX0kuYilhD7KQ/BtR215q5yuh3MQ+NS8MIDAG/i3dNffylvrDZOb2E
         XN8xZEYDmv00GkeFle//hjstJ+smXtMdYInj+s6Dc0Da6wju50LrvShBG8m7vv0T7lEm
         dQuQ==
X-Gm-Message-State: AOJu0YyQqgAdYjYrenELWQ9iDTLQqLmPqt2oWoEt0VIFLmXxXF/LAZUc
	iMO05vnKBcOeaHsCmNsgOWPBruO0ggVY9kNCZkRtBME+ZE1uWJNuKeWOPpLzJa/wdAdKwzgRkxg
	qzys5tDIk04eJT1LDgJ630vAe09esosg=
X-Gm-Gg: ASbGncuDJo1CUlkd754id+uXuVR3UKtRfmsZ7vtvDhn2ULimOdC0Sv9rwtFQ7uD/CSO
	0CeFspIolWyL68jXEMSU9aizJsdjaiPtED6eMdzXYarzYFpUPjc3aIneVJin9BMYuIpK8YUaV/8
	45MS8/m5Dq3llCP3nF6bKw0py0kXTI8spFncmEq3E8zpNSYm+u8bhCeb0aIw==
X-Google-Smtp-Source: AGHT+IHOAtB2bfJJ+OBxDpC50T5Yf6mq7R0xq/g2hcK5EODQbk489K8wapErIHNZN1aBexXDwQCdR9sEqXbd6EFIgUs=
X-Received: by 2002:a05:6214:2f90:b0:6fa:c2a4:f806 with SMTP id
 6a1803df08f44-700029155eamr56151186d6.29.1751034897174; Fri, 27 Jun 2025
 07:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627115510.3273675-1-david@redhat.com> <20250627115510.3273675-5-david@redhat.com>
In-Reply-To: <20250627115510.3273675-5-david@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 27 Jun 2025 22:34:44 +0800
X-Gm-Features: Ac12FXzCpNegqkO37t2dgAKJKb6-obTMh0G-SuUe8uFTcIhWOpR4z4mbSRbmI6Y
Message-ID: <CABzRoyarK=NnwXis3PUAC_x4YpULUQv_jq-upNpnNQhAPypR1w@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from folio_pte_batch_ext()
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
> Instead, let's just allow for specifying through flags whether we want
> to have bits merged into the original PTE.
>
> For the madvise() case, simplify by having only a single parameter for
> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
> dirty bit is not required, but also not harmful. This code is not that
> performance critical after all to really force all micro-optimizations.

IIRC, this work you've wanted to do for a long time - maybe even a year ago=
?

Less conditional logic is always a good thing ;)

Thanks,
Lance

>
> As we now have two pte_t * parameters, use PageTable() to make sure we
> are actually given a pointer at a copy of the PTE, not a pointer into
> an actual page table.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
>  mm/madvise.c  | 26 +++++------------------
>  mm/memory.c   |  8 ++-----
>  mm/util.c     |  2 +-
>  4 files changed, 43 insertions(+), 51 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 6000b683f68ee..fe69e21b34a24 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
>  /* Compare PTEs honoring the soft-dirty bit. */
>  #define FPB_HONOR_SOFT_DIRTY           ((__force fpb_t)BIT(1))
>
> +/*
> + * Merge PTE write bits: if any PTE in the batch is writable, modify the
> + * PTE at @ptentp to be writable.
> + */
> +#define FPB_MERGE_WRITE                        ((__force fpb_t)BIT(2))
> +
> +/*
> + * Merge PTE young and dirty bits: if any PTE in the batch is young or d=
irty,
> + * modify the PTE at @ptentp to be young or dirty, respectively.
> + */
> +#define FPB_MERGE_YOUNG_DIRTY          ((__force fpb_t)BIT(3))
> +
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
>         if (!(flags & FPB_HONOR_DIRTY))
> @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t=
 pte, fpb_t flags)
>  /**
>   * folio_pte_batch_ext - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
> + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be N=
ULL.
>   * @ptep: Page table pointer for the first entry.
> - * @pte: Page table entry for the first page.
> + * @ptentp: Pointer at a copy of the first page table entry.
>   * @max_nr: The maximum number of table entries to consider.
>   * @flags: Flags to modify the PTE batch semantics.
> - * @any_writable: Optional pointer to indicate whether any entry except =
the
> - *               first one is writable.
> - * @any_young: Optional pointer to indicate whether any entry except the
> - *               first one is young.
> - * @any_dirty: Optional pointer to indicate whether any entry except the
> - *               first one is dirty.
>   *
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>   * pages of the same large folio in a single VMA and a single page table=
.
> @@ -242,28 +249,26 @@ static inline pte_t __pte_batch_clear_ignored(pte_t=
 pte, fpb_t flags)
>   * must be limited by the caller so scanning cannot exceed a single VMA =
and
>   * a single page table.
>   *
> + * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
> + * be modified.
> + *
>   * This function will be inlined to optimize based on the input paramete=
rs;
>   * consider using folio_pte_batch() instead if applicable.
>   *
>   * Return: the number of table entries in the batch.
>   */
>  static inline unsigned int folio_pte_batch_ext(struct folio *folio,
> -               pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
> -               bool *any_writable, bool *any_young, bool *any_dirty)
> +               struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
> +               unsigned int max_nr, fpb_t flags)
>  {
> +       bool any_writable =3D false, any_young =3D false, any_dirty =3D f=
alse;
> +       pte_t expected_pte, pte =3D *ptentp;
>         unsigned int nr, cur_nr;
> -       pte_t expected_pte;
> -
> -       if (any_writable)
> -               *any_writable =3D false;
> -       if (any_young)
> -               *any_young =3D false;
> -       if (any_dirty)
> -               *any_dirty =3D false;
>
>         VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>         VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) !=3D folio=
, folio);
> +       VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(pten=
tp)));
>
>         /* Limit max_nr to the actual remaining PFNs in the folio we coul=
d batch. */
>         max_nr =3D min_t(unsigned long, max_nr,
> @@ -279,12 +284,12 @@ static inline unsigned int folio_pte_batch_ext(stru=
ct folio *folio,
>                 if (!pte_same(__pte_batch_clear_ignored(pte, flags), expe=
cted_pte))
>                         break;
>
> -               if (any_writable)
> -                       *any_writable |=3D pte_write(pte);
> -               if (any_young)
> -                       *any_young |=3D pte_young(pte);
> -               if (any_dirty)
> -                       *any_dirty |=3D pte_dirty(pte);
> +               if (flags & FPB_MERGE_WRITE)
> +                       any_writable |=3D pte_write(pte);
> +               if (flags & FPB_MERGE_YOUNG_DIRTY) {
> +                       any_young |=3D pte_young(pte);
> +                       any_dirty |=3D pte_dirty(pte);
> +               }
>
>                 cur_nr =3D pte_batch_hint(ptep, pte);
>                 expected_pte =3D pte_advance_pfn(expected_pte, cur_nr);
> @@ -292,6 +297,13 @@ static inline unsigned int folio_pte_batch_ext(struc=
t folio *folio,
>                 nr +=3D cur_nr;
>         }
>
> +       if (any_writable)
> +               *ptentp =3D pte_mkwrite(*ptentp, vma);
> +       if (any_young)
> +               *ptentp =3D pte_mkyoung(*ptentp);
> +       if (any_dirty)
> +               *ptentp =3D pte_mkdirty(*ptentp);
> +
>         return min(nr, max_nr);
>  }
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 9b9c35a398ed0..dce8f5e8555cb 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -344,13 +344,12 @@ static inline bool can_do_file_pageout(struct vm_ar=
ea_struct *vma)
>
>  static inline int madvise_folio_pte_batch(unsigned long addr, unsigned l=
ong end,
>                                           struct folio *folio, pte_t *pte=
p,
> -                                         pte_t pte, bool *any_young,
> -                                         bool *any_dirty)
> +                                         pte_t *ptentp)
>  {
>         int max_nr =3D (end - addr) / PAGE_SIZE;
>
> -       return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL,
> -                                  any_young, any_dirty);
> +       return folio_pte_batch_ext(folio, NULL, ptep, ptentp, max_nr,
> +                                  FPB_MERGE_YOUNG_DIRTY);
>  }
>
>  static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> @@ -488,13 +487,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *=
pmd,
>                  * next pte in the range.
>                  */
>                 if (folio_test_large(folio)) {
> -                       bool any_young;
> -
> -                       nr =3D madvise_folio_pte_batch(addr, end, folio, =
pte,
> -                                                    ptent, &any_young, N=
ULL);
> -                       if (any_young)
> -                               ptent =3D pte_mkyoung(ptent);
> -
> +                       nr =3D madvise_folio_pte_batch(addr, end, folio, =
pte, &ptent);
>                         if (nr < folio_nr_pages(folio)) {
>                                 int err;
>
> @@ -724,11 +717,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsign=
ed long addr,
>                  * next pte in the range.
>                  */
>                 if (folio_test_large(folio)) {
> -                       bool any_young, any_dirty;
> -
> -                       nr =3D madvise_folio_pte_batch(addr, end, folio, =
pte,
> -                                                    ptent, &any_young, &=
any_dirty);
> -
> +                       nr =3D madvise_folio_pte_batch(addr, end, folio, =
pte, &ptent);
>                         if (nr < folio_nr_pages(folio)) {
>                                 int err;
>
> @@ -753,11 +742,6 @@ static int madvise_free_pte_range(pmd_t *pmd, unsign=
ed long addr,
>                                         nr =3D 0;
>                                 continue;
>                         }
> -
> -                       if (any_young)
> -                               ptent =3D pte_mkyoung(ptent);
> -                       if (any_dirty)
> -                               ptent =3D pte_mkdirty(ptent);
>                 }
>
>                 if (folio_test_swapcache(folio) || folio_test_dirty(folio=
)) {
> diff --git a/mm/memory.c b/mm/memory.c
> index 43d35d6675f2e..985d09bee44fd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -972,10 +972,9 @@ copy_present_ptes(struct vm_area_struct *dst_vma, st=
ruct vm_area_struct *src_vma
>                  pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long=
 addr,
>                  int max_nr, int *rss, struct folio **prealloc)
>  {
> +       fpb_t flags =3D FPB_MERGE_WRITE;
>         struct page *page;
>         struct folio *folio;
> -       bool any_writable;
> -       fpb_t flags =3D 0;
>         int err, nr;
>
>         page =3D vm_normal_page(src_vma, addr, pte);
> @@ -995,8 +994,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, str=
uct vm_area_struct *src_vma
>                 if (vma_soft_dirty_enabled(src_vma))
>                         flags |=3D FPB_HONOR_SOFT_DIRTY;
>
> -               nr =3D folio_pte_batch_ext(folio, src_pte, pte, max_nr, f=
lags,
> -                                    &any_writable, NULL, NULL);
> +               nr =3D folio_pte_batch_ext(folio, src_vma, src_pte, &pte,=
 max_nr, flags);
>                 folio_ref_add(folio, nr);
>                 if (folio_test_anon(folio)) {
>                         if (unlikely(folio_try_dup_anon_rmap_ptes(folio, =
page,
> @@ -1010,8 +1008,6 @@ copy_present_ptes(struct vm_area_struct *dst_vma, s=
truct vm_area_struct *src_vma
>                         folio_dup_file_rmap_ptes(folio, page, nr, dst_vma=
);
>                         rss[mm_counter_file(folio)] +=3D nr;
>                 }
> -               if (any_writable)
> -                       pte =3D pte_mkwrite(pte, src_vma);
>                 __copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, p=
te,
>                                     addr, nr);
>                 return nr;
> diff --git a/mm/util.c b/mm/util.c
> index d29dcc135ad28..19d1a5814fac7 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1197,6 +1197,6 @@ EXPORT_SYMBOL(compat_vma_mmap_prepare);
>  unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte=
,
>                 unsigned int max_nr)
>  {
> -       return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL, NUL=
L, NULL);
> +       return folio_pte_batch_ext(folio, NULL, ptep, &pte, max_nr, 0);
>  }
>  #endif /* CONFIG_MMU */
> --
> 2.49.0
>
>
