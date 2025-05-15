Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6FC120
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747273109; cv=none; b=htDaZV3fkTm0s8c2nWgP11vlp7DYwsJ8xd1TnOb6wHCiD4DlllP+gkp2xeoyFP7Ta2ehBiHoPzfdC1sCpQm3Ak2kqz8mvv6+YOYwwgZ3FtwtHfxQr55t7N9GnSCPlWBikt+OMpAMZqqBOKWsxWF/n+VyhpUCAU5IpAVtFdHww7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747273109; c=relaxed/simple;
	bh=MuLnjVd121/GKQCTXq7+ftx8NbLvz0Q+uqTWu/d0AY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msE8/FH6i7KcKNN+GkGDljEGPXSrDvr8HzAd++DdAwIr3hoOeKnFGuU3OYiu9HJ2ZXa0rCQU3Fs0Ui6QZEZI4omc/zrKWs24KQ5Ea/AOxMpuzaiZUuHpddUiuCyFczV0tYuZ7VxUZ7SY8Cq9YfPhvYgDIIeNJwGc7Xp1l9lpDr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qb3QJxej; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qb3QJxej"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52c54b4d68bso125638e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747273106; x=1747877906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYMghdxO9pFq0+ESkScJLJY1d2a+Vc4kdlZhuynEBPc=;
        b=Qb3QJxejuLqiee5JhXyi70DnsSHZ1aUTkOTeBKlx44JgL5VdOXYHaUqZy991l+Daqg
         CbzWdBaQlR9qbnPiMUYoC4+m8zBb3F0eglNlQRj/0aEWX8Unu3+7fJwuXZ6XSyo0Qt5O
         jUwJN00XV5wd0idRlKf+0C/3/s0QAJG/TSaWgiHv9eBkkmhYTZfeojlD3eGEzAE4PXoa
         kAjmUSDSEUeH60d5HZKCgiQcmZJWagYtO3W7FLJRbGdNPkkFO5fwzwlTCN3NfPTKdHAA
         L8iqSrE6+UXjx+lDL1juYBVIDOQF7NOQCWJVv6u6x4UhTFbkTCH0OR3szXpzEfFO6t17
         KOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747273106; x=1747877906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYMghdxO9pFq0+ESkScJLJY1d2a+Vc4kdlZhuynEBPc=;
        b=DeXENA5ssYY5ZAQuGSolLyCoXI/7X5ezhTRqVU9jOVJvgfUyCujH4Os1KH+HgtHW4I
         wbZNhhZISuamFE+vvpUGFP9Bi0rO8psOzHWXpOuRdL553pX7/H9xXRoMgsuWYL5Y6QL+
         v2hfwGpDXl6Vk3rqX5BJdjltDPuSZlG06LF03LI20B67xWDOd0s+D5l13bvAiYmNfvL2
         YvtHvNz5GPKx2nOd3DLmXU5jBf6S2Zmck/c/HKo5NL5NWxqsgjcJnMkiCOhZDyauuClv
         p0rmZQoWbRYzkcv8IjiapKJtvHPwKx2/qr9gtGRb7vU3PGEb26HNtOfchLFEEtdaf8qe
         21cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRY1FDb6SgJJN41j+wdxZ8cjBHKfdx3yBrC/+6HBUCLsQIthZRHL//jqWHY6aHYm5aG3z9jMFH7kh3Tw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJ+1FuemzxFUunsw4H8YuF/06bx2CzR5EvT69+nOEee9z8TnW
	nALHTkaXde3uw1XQZSRe7BRTiz619zSeq2x1Q6CkPsYKQH5/k7XD6bU6O06UfiFCsYw+0eJCprH
	jfh1LTZ7SlkSjkA85lNEptt0qeB4=
X-Gm-Gg: ASbGncsV8OlA5HcGqChM+94BrTDMkXxfX53GuD48ZN3PsGca/MwjNyhC7VfJX1OJ9Ik
	aXDAEUdjeJQCGiQEPBgF1N1d5H1k0EDDNAYMIZGbKBIz3NvgqzVjI+2+Hmu/98duiYjefAaEdt5
	g3GFMPPbvmKcq0aW8ey6/ZJoOIaWc+2OscbA==
X-Google-Smtp-Source: AGHT+IF/5qSRWeZ3Cq+D1z5u3w9zBV9BRyfNKTGRiJC97bcFdw12ub0R7bzxUi1Naw1SnMBz819Mu6bYRkxRaA27wHg=
X-Received: by 2002:a05:6122:912:b0:520:5e9b:49b2 with SMTP id
 71dfb90a1353d-52dabcd46a3mr622270e0c.3.1747273105778; Wed, 14 May 2025
 18:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513084620.58231-1-21cnbao@gmail.com> <b083d377-ae92-486f-9c6b-5fe30bb88397@arm.com>
In-Reply-To: <b083d377-ae92-486f-9c6b-5fe30bb88397@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 15 May 2025 13:38:14 +1200
X-Gm-Features: AX0GCFtN6iaPtZGxKGN96XY6BsSFYzlmAT7eZ7Y0tPtY-N9M43BI4GSzm0TdzGE
Message-ID: <CAGsJ_4yX_PVQhq8Uj=A_5oxpLwAXrcBLNHcgTyZne6ST9NK1Ow@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: make try_to_unmap_one support batched unmap for
 anon large folios
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@redhat.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, Baoquan He <bhe@redhat.com>, 
	Dan Schatzberg <schatzberg.dan@gmail.com>, Kaixiong Yu <yukaixiong@huawei.com>, 
	Fan Ni <fan.ni@samsung.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 7:56=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 13/05/25 2:16 pm, Barry Song wrote:
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
> >
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
>
> Missed writing the parameter name here.

Thanks =E2=80=94 I noticed this as well after sending. But compilation went
through without
any issues.

>
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
> >       return err;
> >   }
>

Best Regards
Barry
