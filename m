Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D12F1FDF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031672; cv=none; b=ZD+RpKbeu5h9lwHA20UzM8uxhHzrxd+NpbiU0RVf591CycYwtqAzRvsHj+7srTSlaMh+dRCjK091EBNtnt1M+Arj/6+c0xDv0dSkvej923AutjOnt0v/EEBNsmDJWoVu5h/8yrYp6wimeHHyDJ2jBb9rN8PVx/i+/Pk+HWZjzDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031672; c=relaxed/simple;
	bh=ULq1DJwzGpMuZMcy1U/DCfdo43tBSvu66bXzUv0ll4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qY1c52QPpAbI16Nk3gMl2U/GOZ6BNhW8Lbyn8vCsSOZA3fhUay9zy8ajJHiunnyR0WO3edEAfxM8z8ZIqijFHmHKTLyvG5n2Haq7o9aeDbp2izgt90nSWzRSWFVICddVMYdpC+Nm+DK02sRkHeA4Ww25ssRyFWjssld80+87vbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsUXhWkV; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsUXhWkV"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso22806236d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751031670; x=1751636470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZIpAGWj/y0UyMFYtff0PzG8j+UXSjPMsKCQ4iUUGxI=;
        b=QsUXhWkVlMHKI2OpopBFWKLgyXD3DElNtQVTulyVsV54mosMljSiCVAWAHDq4S2ZSY
         yWn+4xL9ALm5GIT/ySy2hdq0VeaCCEeBY9yrEg0tN8/2BQYHVjytEH3cFdz/KhzjjVla
         YInf9B2javBIn7qw9nEod85ZoPcAsJPyGsLhq26CXIjSXGSyJuoPJzsW1p7uo0wNHfeW
         gBNBMUq+JNqeHa4QCWWvjLctC15PbuaxM9q+Fw11LWcBodRbfPP/Gw19X8U3G89MORHs
         r1RxUe2U8DZFNaolA6jaC85ulHTLLcWvgHM6tqBVLu6/zSTJPI/fd+bl/d0/72+QCW0I
         ++jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031670; x=1751636470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZIpAGWj/y0UyMFYtff0PzG8j+UXSjPMsKCQ4iUUGxI=;
        b=ARj0FL/IfrjFzzI0tWOZXgxLub57X3dPFJUkuRoHue76D+J6kInU2bIplz5HmzIQXu
         UwZkhQNFBkiLa1DmJyZIpNuBkdabPiCYN9mLW6BSLDIudPv0MUDQltzkE0tKDW0jzbDz
         u1E0tq9ZhfvXiQUlM6PajS3gYDzJB7VNk0jTbH3bQXwvC+SVGigJw9myLEAlaS+El2SI
         nZwQqWtT0U738S6XqyHmMY9yTw3l5/e0P6pInDNrykJKCR38nb1XVDyydJyo2x+TGNft
         aZc5g5ocZAWn8N+cYoOINbUydWGTstzNgLYPpb6XhzI1g0gl4/pgwndN71GRTvO13u9w
         g1tg==
X-Gm-Message-State: AOJu0YwpCjckWKcRYjBJCoNRp66/C/IEJVTEZO/rfmatzanZGF1kqVgf
	ALULijRyic08bilbvNPbs7rDatw+5OhI+7aR9bL0T5z7030tVSWVw+cBUyTfSYJeZpYBzTe6CPi
	6E5scT39AlAIxNzQE4tHWkGgtBZrR2yaQ2sEj
X-Gm-Gg: ASbGnctdx9K0AbFlHl0/nMLPJqiTpP71aZSqaDqyohsc2gZVlPUspxMH8QCkxMCLiHs
	BEtCrxCsOCvKSKKfHl9lpTwcMRoY+LKcZp0z5NS2WPy+LrpbGm4Em0e6fMyYm9P0jM2NAwNmUcM
	PHaG8XcsGhHOqNmtHEMzJGj2jmccTu2nqrlzdJHUHPmnzNxsjZNGoS7ouP7A==
X-Google-Smtp-Source: AGHT+IHA2JlMf+ZdWpIxOrEJ38y6SQPYt6c9PoM/6RnGp9KXrYgTIpoS8k+HvmAvFixP2JQcNSJV7pqmmDLZ1PmJDrU=
X-Received: by 2002:a05:6214:234e:b0:6fd:75ef:3dc3 with SMTP id
 6a1803df08f44-70002ee7e82mr61898646d6.28.1751031669845; Fri, 27 Jun 2025
 06:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627115510.3273675-1-david@redhat.com> <20250627115510.3273675-2-david@redhat.com>
In-Reply-To: <20250627115510.3273675-2-david@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 27 Jun 2025 21:40:53 +0800
X-Gm-Features: Ac12FXygmukaPYXRW-7CXUKcIKAmlaRH58xf8GpgMjINQwR8gwYQYg4AJC9gJb8
Message-ID: <CABzRoyars6VimBfsqZiHxUPB38cYKs8WTXykFwrOxUt+NzTvDw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
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
> Honoring these PTE bits is the exception, so let's invert the meaning.
>
> With this change, most callers don't have to pass any flags.
>
> No functional change intended.
>

LGTM. Feel free to add:
Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks,
Lance

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h  | 16 ++++++++--------
>  mm/madvise.c   |  3 +--
>  mm/memory.c    | 11 +++++------
>  mm/mempolicy.c |  4 +---
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  7 files changed, 18 insertions(+), 25 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index e84217e27778d..9690c75063881 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct =
*vma)
>  /* Flags for folio_pte_batch(). */
>  typedef int __bitwise fpb_t;
>
> -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
> -#define FPB_IGNORE_DIRTY               ((__force fpb_t)BIT(0))
> +/* Compare PTEs honoring the dirty bit. */
> +#define FPB_HONOR_DIRTY                ((__force fpb_t)BIT(0))
>
> -/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bi=
t. */
> -#define FPB_IGNORE_SOFT_DIRTY          ((__force fpb_t)BIT(1))
> +/* Compare PTEs honoring the soft-dirty bit. */
> +#define FPB_HONOR_SOFT_DIRTY           ((__force fpb_t)BIT(1))
>
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
> -       if (flags & FPB_IGNORE_DIRTY)
> +       if (!(flags & FPB_HONOR_DIRTY))
>                 pte =3D pte_mkclean(pte);
> -       if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
> +       if (likely(!(flags & FPB_HONOR_SOFT_DIRTY)))
>                 pte =3D pte_clear_soft_dirty(pte);
>         return pte_wrprotect(pte_mkold(pte));
>  }
> @@ -236,8 +236,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t p=
te, fpb_t flags)
>   * pages of the same large folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the=
 PFN,
> - * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
> - * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
> + * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is =
set) and
> + * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
>   *
>   * start_ptep must map any page of the folio. max_nr must be at least on=
e and
>   * must be limited by the caller so scanning cannot exceed a single page=
 table.
> diff --git a/mm/madvise.c b/mm/madvise.c
> index e61e32b2cd91f..661bb743d2216 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -347,10 +347,9 @@ static inline int madvise_folio_pte_batch(unsigned l=
ong addr, unsigned long end,
>                                           pte_t pte, bool *any_young,
>                                           bool *any_dirty)
>  {
> -       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
>         int max_nr =3D (end - addr) / PAGE_SIZE;
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>                                any_young, any_dirty);
>  }
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b7..ab2d6c1425691 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -990,10 +990,10 @@ copy_present_ptes(struct vm_area_struct *dst_vma, s=
truct vm_area_struct *src_vma
>          * by keeping the batching logic separate.
>          */
>         if (unlikely(!*prealloc && folio_test_large(folio) && max_nr !=3D=
 1)) {
> -               if (src_vma->vm_flags & VM_SHARED)
> -                       flags |=3D FPB_IGNORE_DIRTY;
> -               if (!vma_soft_dirty_enabled(src_vma))
> -                       flags |=3D FPB_IGNORE_SOFT_DIRTY;
> +               if (!(src_vma->vm_flags & VM_SHARED))
> +                       flags |=3D FPB_HONOR_DIRTY;
> +               if (vma_soft_dirty_enabled(src_vma))
> +                       flags |=3D FPB_HONOR_SOFT_DIRTY;
>
>                 nr =3D folio_pte_batch(folio, addr, src_pte, pte, max_nr,=
 flags,
>                                      &any_writable, NULL, NULL);
> @@ -1535,7 +1535,6 @@ static inline int zap_present_ptes(struct mmu_gathe=
r *tlb,
>                 struct zap_details *details, int *rss, bool *force_flush,
>                 bool *force_break, bool *any_skipped)
>  {
> -       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
>         struct mm_struct *mm =3D tlb->mm;
>         struct folio *folio;
>         struct page *page;
> @@ -1565,7 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gathe=
r *tlb,
>          * by keeping the batching logic separate.
>          */
>         if (unlikely(folio_test_large(folio) && max_nr !=3D 1)) {
> -               nr =3D folio_pte_batch(folio, addr, pte, ptent, max_nr, f=
pb_flags,
> +               nr =3D folio_pte_batch(folio, addr, pte, ptent, max_nr, 0=
,
>                                      NULL, NULL, NULL);
>
>                 zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent,=
 nr,
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 1ff7b2174eb77..2a25eedc3b1c0 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -675,7 +675,6 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_wa=
lk *walk)
>  static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>                         unsigned long end, struct mm_walk *walk)
>  {
> -       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
>         struct vm_area_struct *vma =3D walk->vma;
>         struct folio *folio;
>         struct queue_pages *qp =3D walk->private;
> @@ -713,8 +712,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigne=
d long addr,
>                         continue;
>                 if (folio_test_large(folio) && max_nr !=3D 1)
>                         nr =3D folio_pte_batch(folio, addr, pte, ptent,
> -                                            max_nr, fpb_flags,
> -                                            NULL, NULL, NULL);
> +                                            max_nr, 0, NULL, NULL, NULL)=
;
>                 /*
>                  * vm_normal_folio() filters out zero pages, but there mi=
ght
>                  * still be reserved folios to skip, perhaps in a VDSO.
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 3cb72b579ffd3..2238cdc5eb1c1 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -307,14 +307,13 @@ void munlock_folio(struct folio *folio)
>  static inline unsigned int folio_mlock_step(struct folio *folio,
>                 pte_t *pte, unsigned long addr, unsigned long end)
>  {
> -       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
>         unsigned int count =3D (end - addr) >> PAGE_SHIFT;
>         pte_t ptent =3D ptep_get(pte);
>
>         if (!folio_test_large(folio))
>                 return 1;
>
> -       return folio_pte_batch(folio, addr, pte, ptent, count, fpb_flags,=
 NULL,
> +       return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
>                                NULL, NULL);
>  }
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 36585041c760d..d4d3ffc931502 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -173,7 +173,6 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>  static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned l=
ong addr,
>                 pte_t *ptep, pte_t pte, int max_nr)
>  {
> -       const fpb_t flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>         struct folio *folio;
>
>         if (max_nr =3D=3D 1)
> @@ -183,7 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_stru=
ct *vma, unsigned long addr
>         if (!folio || !folio_test_large(folio))
>                 return 1;
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NUL=
L,
> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>                                NULL, NULL);
>  }
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..a29d7d29c7283 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1849,7 +1849,6 @@ void folio_remove_rmap_pud(struct folio *folio, str=
uct page *page,
>  static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>                         struct folio *folio, pte_t *ptep)
>  {
> -       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
>         int max_nr =3D folio_nr_pages(folio);
>         pte_t pte =3D ptep_get(ptep);
>
> @@ -1860,7 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsig=
ned long addr,
>         if (pte_pfn(pte) !=3D folio_pfn(folio))
>                 return false;
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>                                NULL, NULL) =3D=3D max_nr;
>  }
>
> --
> 2.49.0
>
>
