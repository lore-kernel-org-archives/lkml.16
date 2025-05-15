Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E43269880
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272963; cv=none; b=vFB9KFmi45ZwoEHipqNYOWjsd/fMX3v3lwm4c86QSiB2cneyKj2koUwFo9Mr3MVchkG7V45xL0NomZeqcndUjd2khvMzin40m0UP1zmwwlczBzNwkcU1XPS6nRdeHXZpXOdvabBf5fojFa3okP9c3TyHCjzo+wJSc9kfhvw9rZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272963; c=relaxed/simple;
	bh=IhkUV/6dp5ZOe96GwOFkwAME81FuiTR8lgC5qZKbjc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQTRguDp9KT6rRMyAASVH+LS8LkmhTPthoa/WWGbBzQe0TlwSoCx3XhV2gW1Bqj1H4TN+9sZ1U7n/oqAVZRcguTSSx6vDW6c140hvXdocrLGo5hJ/heg8H0+MBsbc6Y8N4It5LE4eW2aHLMU3zmTCixsBNLRCAF4tKQ8a6nifmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFJn22pd; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFJn22pd"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4deff18d67aso141444137.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747272957; x=1747877757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgaD7HAweNs3brMJWH+NGhPKATQslfQlG44KnOAmi6Y=;
        b=jFJn22pd3SDh3YxxGE14z/ynkROWx936WX7eyZcFZlrNAQNi/WYxnQh4dJp/rYxYv6
         Lmtlpg3aiaXE7SDxk9XppcjZXctisPOTrXL/U9d2p0A839ZjTXTSqUM1j0J/JvwSNSCY
         F2amNtGn7/N66hAspltSB3FuI0i50LO93R94qJKrSi/YePKyUnM+BYwIBDZxHKgTv1hq
         WWS2qeSZ2Drytm1vbmmWT7f8DQmbBCZEz/YHoPSiaXFXaPHZehPz8JM18pp2sFnYPNe7
         K7s3BFyB2bfA5r5XVEk58mjSiYax427Do3gGRm/rbQJji4vOqSCFmXkUeBVwHQk2YNIm
         EodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747272957; x=1747877757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgaD7HAweNs3brMJWH+NGhPKATQslfQlG44KnOAmi6Y=;
        b=RJO6UQaxJ/hATqsIUmg7dVFlIHtfJQsVhZ4znf8epv3wMvSdraTqImxqpY44m8WXlS
         9dYe8fyBrNVwbJhGVVPefeCmEuQOKyDKQ46scPwvGHudXLUk3TQqGJPZe9Y+/J3bHzjl
         OD+7e8Ckr4/g4HzRjzgatTiMQBCJPsFfWKE5WbWoWqt2tKEeOpL1SGa60AgaIV5cGI4z
         MBiXgX55azQT7gRWLpNk6rMaf1RKF37K723fnhZrESHD/IcNBkE+mUp8vPNhRhkmOLNY
         kzNGuh1Nn2r88bK+kHcO5eQ//23Dt7FIIUGiltwWxHkxtEfSgQIH59PVqXDCyo66clOd
         HY9w==
X-Forwarded-Encrypted: i=1; AJvYcCWuHBDcfrrylD4IFNV0kVZsotBThg9x3kMsKn+ge2R2vI4Y2Gr/RztqoVdNyeXp1sRH6Sm9j/a4Wu3MFlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8mrYE6dDjt9TdllNPkK999gpqdSb96eWyFZcZHiAbLTg6DPcU
	pl0lPryXJf6pjk43h2T9Rnk+SWRkLoC7pZ+6UxuWZeXeoskdkOe0BaKnZ6d+LDwwx6OByWD2loe
	yzyiScqAPGvT2TZPeAC1P8IhbmL0=
X-Gm-Gg: ASbGncsFimJVKb5xPG0h8swbeF6EMrRJCofN3VcbXWP+bbKhrp9b6F2vruU50n7wIq4
	OlgkUtCdOxEU9yWUbepEiP/rtIL8pd5IANdfzNoQnDvFwvnGD76Iatfcwi180C2C10K1oHy85ht
	IUbtSCxjihpHFRj3KiZHMh9y3UhDQf9PWnhg==
X-Google-Smtp-Source: AGHT+IHGDZZl1VR8k1O72jEOezzSW7gN2soVB84YkT0jXoLQnU3l1dTW5024shnTzSgUimP0Jvnj/xec8oVgWLb74XA=
X-Received: by 2002:a05:6102:4bc4:b0:4c2:20d6:c6c3 with SMTP id
 ada2fe7eead31-4df7dcb0380mr5648264137.10.1747272956941; Wed, 14 May 2025
 18:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513084620.58231-1-21cnbao@gmail.com> <dfdf06eb-faf5-487a-b0e6-57c1ceb58fcc@linux.alibaba.com>
In-Reply-To: <dfdf06eb-faf5-487a-b0e6-57c1ceb58fcc@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 15 May 2025 13:35:45 +1200
X-Gm-Features: AX0GCFvjHHea41a8MZi3E95xN4l8iR5U21kpGE_5DZvKUKI4R7XNXLIcOMphKjc
Message-ID: <CAGsJ_4yF-evyWCvF=aO_Y2UzpPMAb4zdOe3i5AtR_RBVDbuUZA@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: make try_to_unmap_one support batched unmap for
 anon large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, Baoquan He <bhe@redhat.com>, 
	Dan Schatzberg <schatzberg.dan@gmail.com>, Kaixiong Yu <yukaixiong@huawei.com>, 
	Fan Ni <fan.ni@samsung.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 8:11=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/5/13 16:46, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > My commit 354dffd29575c ("mm: support batched unmap for lazyfree large
> > folios during reclamation") introduced support for unmapping entire
> > lazyfree anonymous large folios at once, instead of one page at a time.
> > This patch extends that support to generic (non-lazyfree) anonymous
> > large folios.
> >
> > Handling __folio_try_share_anon_rmap() and swap_duplicate() becomes
> > extremely complex=E2=80=94if not outright impractical=E2=80=94for non-e=
xclusive
> > anonymous folios. As a result, this patch limits support to exclusive
> > large folios. Fortunately, most anonymous folios are exclusive in
> > practice, so this restriction should be acceptable in the majority of
> > cases.
> >
> > SPARC is currently the only architecture that implements
> > arch_unmap_one(), which also needs to be batched for consistency.
> > However, this is not yet supported, so the platform is excluded for
> > now.
> >
> > Using the following micro-benchmark to measure the time taken to perfor=
m
> > PAGEOUT on 256MB of 64KiB anonymous large folios.
> >
> >   #define _GNU_SOURCE
> >   #include <stdio.h>
> >   #include <stdlib.h>
> >   #include <sys/mman.h>
> >   #include <string.h>
> >   #include <time.h>
> >   #include <unistd.h>
> >   #include <errno.h>
> >
> >   #define SIZE_MB 256
> >   #define SIZE_BYTES (SIZE_MB * 1024 * 1024)
> >
> >   int main() {
> >       void *addr =3D mmap(NULL, SIZE_BYTES, PROT_READ | PROT_WRITE,
> >                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> >       if (addr =3D=3D MAP_FAILED) {
> >           perror("mmap failed");
> >           return 1;
> >       }
> >
> >       memset(addr, 0, SIZE_BYTES);
> >
> >       struct timespec start, end;
> >       clock_gettime(CLOCK_MONOTONIC, &start);
> >
> >       if (madvise(addr, SIZE_BYTES, MADV_PAGEOUT) !=3D 0) {
> >           perror("madvise(MADV_PAGEOUT) failed");
> >           munmap(addr, SIZE_BYTES);
> >           return 1;
> >       }
> >
> >       clock_gettime(CLOCK_MONOTONIC, &end);
> >
> >       long duration_ns =3D (end.tv_sec - start.tv_sec) * 1e9 +
> >                          (end.tv_nsec - start.tv_nsec);
> >       printf("madvise(MADV_PAGEOUT) took %ld ns (%.3f ms)\n",
> >              duration_ns, duration_ns / 1e6);
> >
> >       munmap(addr, SIZE_BYTES);
> >       return 0;
> >   }
> >
> > w/o patch:
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 1337334000 ns (1337.334 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 1340471008 ns (1340.471 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 1385718992 ns (1385.719 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 1366070000 ns (1366.070 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 1347834992 ns (1347.835 ms)
> >
> > w/patch:
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 698178000 ns (698.178 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 708570000 ns (708.570 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 693884000 ns (693.884 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 693366000 ns (693.366 ms)
> > ~ # ./a.out
> > madvise(MADV_PAGEOUT) took 690790000 ns (690.790 ms)
> >
> > We found that the time to reclaim this memory was reduced by half.
>
> Do you have some performance numbers for the base page?

We verified that folio_test_large(folio) needs to run in a batched context;
otherwise, nr_pages remains 1 for each folio.

                        if (folio_test_large(folio) && !(flags &
TTU_HWPOISON) &&
                            can_batch_unmap_folio_ptes(address, folio, pvmw=
.pte,
                            anon_exclusive))
                                nr_pages =3D folio_nr_pages(folio);

I didn't expect any noticeable performance change for base pages, but testi=
ng
shows the patch appears to make them slightly faster=E2=80=94likely due to =
test noise or
jitter.

W/o patch:

~ # ./a.out
madvise(MADV_PAGEOUT) took 5686488000 ns (5686.488 ms)
~ # ./a.out
madvise(MADV_PAGEOUT) took 5628330992 ns (5628.331 ms)
~ # ./a.out
madvise(MADV_PAGEOUT) took 5771742992 ns (5771.743 ms)
~ # ./a.out
madvise(MADV_PAGEOUT) took 5672108000 ns (5672.108 ms)


W/ patch:

~ # ./a.out
madvise(MADV_PAGEOUT) took 5481578000 ns (5481.578 ms)
~ # ./a.out
madvise(MADV_PAGEOUT) took 5425394992 ns (5425.395 ms)
~ # ./a.out
madvise(MADV_PAGEOUT) took 5522109008 ns (5522.109 ms)
~ # ./a.out
madvise(MADV_PAGEOUT) took 5506832000 ns (5506.832 ms)

>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Rik van Riel <riel@surriel.com>
> > Cc: Harry Yoo <harry.yoo@oracle.com>
> > Cc: Kairui Song <kasong@tencent.com>
> > Cc: Chris Li <chrisl@kernel.org>
> > Cc: Baoquan He <bhe@redhat.com>
> > Cc: Dan Schatzberg <schatzberg.dan@gmail.com>
> > Cc: Kaixiong Yu <yukaixiong@huawei.com>
> > Cc: Fan Ni <fan.ni@samsung.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   include/linux/swap.h |  4 +--
> >   mm/memory.c          |  2 +-
> >   mm/rmap.c            | 79 +++++++++++++++++++++++++++++--------------=
-
> >   mm/swapfile.c        | 10 ++++--
> >   4 files changed, 62 insertions(+), 33 deletions(-)
> >
> > diff --git a/include/linux/swap.h b/include/linux/swap.h
> > index bc0e1c275fc0..8fbb8ce72016 100644
> > --- a/include/linux/swap.h
> > +++ b/include/linux/swap.h
> > @@ -479,7 +479,7 @@ void put_swap_folio(struct folio *folio, swp_entry_=
t entry);
> >   extern swp_entry_t get_swap_page_of_type(int);
> >   extern int add_swap_count_continuation(swp_entry_t, gfp_t);
> >   extern void swap_shmem_alloc(swp_entry_t, int);
> > -extern int swap_duplicate(swp_entry_t);
> > +extern int swap_duplicate(swp_entry_t, int nr);
> >   extern int swapcache_prepare(swp_entry_t entry, int nr);
> >   extern void swap_free_nr(swp_entry_t entry, int nr_pages);
> >   extern void free_swap_and_cache_nr(swp_entry_t entry, int nr);
> > @@ -546,7 +546,7 @@ static inline void swap_shmem_alloc(swp_entry_t swp=
, int nr)
> >   {
> >   }
> >
> > -static inline int swap_duplicate(swp_entry_t swp)
> > +static inline int swap_duplicate(swp_entry_t swp, int nr)
> >   {
> >       return 0;
> >   }
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 99af83434e7c..5a7e4c0e89c7 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -803,7 +803,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struc=
t mm_struct *src_mm,
> >       swp_entry_t entry =3D pte_to_swp_entry(orig_pte);
> >
> >       if (likely(!non_swap_entry(entry))) {
> > -             if (swap_duplicate(entry) < 0)
> > +             if (swap_duplicate(entry, 1) < 0)
> >                       return -EIO;
> >
> >               /* make sure dst_mm is on swapoff's mmlist. */
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index fb63d9256f09..2607e02a0960 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1845,23 +1845,42 @@ void folio_remove_rmap_pud(struct folio *folio,=
 struct page *page,
> >   #endif
> >   }
> >
> > -/* We support batch unmapping of PTEs for lazyfree large folios */
> > +/*
> > + * We support batch unmapping of PTEs for lazyfree or exclusive anon l=
arge
> > + * folios
> > + */
> >   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> > -                     struct folio *folio, pte_t *ptep)
> > +             struct folio *folio, pte_t *ptep, bool exclusive)
> >   {
> >       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
> >       int max_nr =3D folio_nr_pages(folio);
> > +#ifndef __HAVE_ARCH_UNMAP_ONE
> > +     bool no_arch_unmap =3D true;
> > +#else
> > +     bool no_arch_unmap =3D false;
> > +#endif
> >       pte_t pte =3D ptep_get(ptep);
> > +     int mapped_nr;
> >
> > -     if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> > +     if (!folio_test_anon(folio))
> >               return false;
> >       if (pte_unused(pte))
> >               return false;
> >       if (pte_pfn(pte) !=3D folio_pfn(folio))
> >               return false;
> >
> > -     return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> > -                            NULL, NULL) =3D=3D max_nr;
> > +     mapped_nr =3D folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb=
_flags, NULL,
> > +                     NULL, NULL);
> > +     if (mapped_nr !=3D max_nr)
> > +             return false;
> > +     if (!folio_test_swapbacked(folio))
> > +             return true;
> > +
> > +     /*
> > +      * The large folio is fully mapped and its mapcount is the same a=
s its
> > +      * number of pages, it must be exclusive.
> > +      */
> > +     return no_arch_unmap && exclusive && folio_mapcount(folio) =3D=3D=
 max_nr;
> >   }
> >
> >   /*
> > @@ -2025,7 +2044,8 @@ static bool try_to_unmap_one(struct folio *folio,=
 struct vm_area_struct *vma,
> >                               folio_mark_dirty(folio);
> >               } else if (likely(pte_present(pteval))) {
> >                       if (folio_test_large(folio) && !(flags & TTU_HWPO=
ISON) &&
> > -                         can_batch_unmap_folio_ptes(address, folio, pv=
mw.pte))
> > +                         can_batch_unmap_folio_ptes(address, folio, pv=
mw.pte,
> > +                         anon_exclusive))
> >                               nr_pages =3D folio_nr_pages(folio);
> >                       end_addr =3D address + nr_pages * PAGE_SIZE;
> >                       flush_cache_range(vma, address, end_addr);
> > @@ -2141,8 +2161,8 @@ static bool try_to_unmap_one(struct folio *folio,=
 struct vm_area_struct *vma,
> >                               goto discard;
> >                       }
> >
> > -                     if (swap_duplicate(entry) < 0) {
> > -                             set_pte_at(mm, address, pvmw.pte, pteval)=
;
> > +                     if (swap_duplicate(entry, nr_pages) < 0) {
> > +                             set_ptes(mm, address, pvmw.pte, pteval, n=
r_pages);
> >                               goto walk_abort;
> >                       }
> >
> > @@ -2159,9 +2179,10 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >
> >                       /* See folio_try_share_anon_rmap(): clear PTE fir=
st. */
> >                       if (anon_exclusive &&
> > -                         folio_try_share_anon_rmap_pte(folio, subpage)=
) {
> > -                             swap_free(entry);
> > -                             set_pte_at(mm, address, pvmw.pte, pteval)=
;
> > +                         __folio_try_share_anon_rmap(folio, subpage, n=
r_pages,
> > +                                                     RMAP_LEVEL_PTE)) =
{
> > +                             swap_free_nr(entry, nr_pages);
> > +                             set_ptes(mm, address, pvmw.pte, pteval, n=
r_pages);
> >                               goto walk_abort;
> >                       }
> >                       if (list_empty(&mm->mmlist)) {
> > @@ -2170,23 +2191,27 @@ static bool try_to_unmap_one(struct folio *foli=
o, struct vm_area_struct *vma,
> >                                       list_add(&mm->mmlist, &init_mm.mm=
list);
> >                               spin_unlock(&mmlist_lock);
> >                       }
> > -                     dec_mm_counter(mm, MM_ANONPAGES);
> > -                     inc_mm_counter(mm, MM_SWAPENTS);
> > -                     swp_pte =3D swp_entry_to_pte(entry);
> > -                     if (anon_exclusive)
> > -                             swp_pte =3D pte_swp_mkexclusive(swp_pte);
> > -                     if (likely(pte_present(pteval))) {
> > -                             if (pte_soft_dirty(pteval))
> > -                                     swp_pte =3D pte_swp_mksoft_dirty(=
swp_pte);
> > -                             if (pte_uffd_wp(pteval))
> > -                                     swp_pte =3D pte_swp_mkuffd_wp(swp=
_pte);
> > -                     } else {
> > -                             if (pte_swp_soft_dirty(pteval))
> > -                                     swp_pte =3D pte_swp_mksoft_dirty(=
swp_pte);
> > -                             if (pte_swp_uffd_wp(pteval))
> > -                                     swp_pte =3D pte_swp_mkuffd_wp(swp=
_pte);
> > +                     add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
> > +                     add_mm_counter(mm, MM_SWAPENTS, nr_pages);
> > +                     /* TODO: let set_ptes() support swp_offset advanc=
e */
> > +                     for (pte_t *ptep =3D pvmw.pte; address < end_addr=
;
> > +                          entry.val++, address +=3D PAGE_SIZE, ptep++)=
 {
> > +                             swp_pte =3D swp_entry_to_pte(entry);
> > +                             if (anon_exclusive)
> > +                                     swp_pte =3D pte_swp_mkexclusive(s=
wp_pte);
> > +                             if (likely(pte_present(pteval))) {
> > +                                     if (pte_soft_dirty(pteval))
> > +                                             swp_pte =3D pte_swp_mksof=
t_dirty(swp_pte);
> > +                                     if (pte_uffd_wp(pteval))
> > +                                             swp_pte =3D pte_swp_mkuff=
d_wp(swp_pte);
> > +                             } else {
> > +                                     if (pte_swp_soft_dirty(pteval))
> > +                                             swp_pte =3D pte_swp_mksof=
t_dirty(swp_pte);
> > +                                     if (pte_swp_uffd_wp(pteval))
> > +                                             swp_pte =3D pte_swp_mkuff=
d_wp(swp_pte);
> > +                             }
> > +                             set_pte_at(mm, address, ptep, swp_pte);
> >                       }
> > -                     set_pte_at(mm, address, pvmw.pte, swp_pte);
> >               } else {
> >                       /*
> >                        * This is a locked file-backed folio,
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index 026090bf3efe..189e3474ffc6 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -3550,13 +3550,17 @@ static int __swap_duplicate(swp_entry_t entry, =
unsigned char usage, int nr)
> >
> >       offset =3D swp_offset(entry);
> >       VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
> > -     VM_WARN_ON(usage =3D=3D 1 && nr > 1);
> >       ci =3D lock_cluster(si, offset);
> >
> >       err =3D 0;
> >       for (i =3D 0; i < nr; i++) {
> >               count =3D si->swap_map[offset + i];
> >
> > +             /*
> > +              * We only support batched swap_duplicate() for unmapping
> > +              * exclusive large folios where count should be zero
> > +              */
> > +             VM_WARN_ON(usage =3D=3D 1 && nr > 1 && swap_count(count))=
;
>
> I think we should return an error instead of a warning. Although we
> triggered this warning (which might not be reported in an actual
> product), the program will continue to run and potentially cause more
> serious consequences, because the add_swap_count_continuation() needs to
> know which offset in the large swap entry to perform recovery.

Sounds like a good idea to me. We're currently doing
`for (i =3D 0; i < nr; i++)` twice:
- First pass: check if it's safe to proceed;
- Second pass: actually perform the work.

As long as we return an error code other than `ENOMEM`, this approach
should be fine.

>
> >               /*
> >                * swapin_readahead() doesn't check if a swap entry is va=
lid, so the
> >                * swap entry could be SWAP_MAP_BAD. Check here with lock=
 held.
> > @@ -3626,11 +3630,11 @@ void swap_shmem_alloc(swp_entry_t entry, int nr=
)
> >    * if __swap_duplicate() fails for another reason (-EINVAL or -ENOENT=
), which
> >    * might occur if a page table entry has got corrupted.
> >    */
> > -int swap_duplicate(swp_entry_t entry)
> > +int swap_duplicate(swp_entry_t entry, int nr)
> >   {
> >       int err =3D 0;
> >
> > -     while (!err && __swap_duplicate(entry, 1, 1) =3D=3D -ENOMEM)
> > +     while (!err && __swap_duplicate(entry, 1, nr) =3D=3D -ENOMEM)
> >               err =3D add_swap_count_continuation(entry, GFP_ATOMIC);

thanks
Barry
