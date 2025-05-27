Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652A27A115
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358709; cv=none; b=IxzTa59/ZFixFk9QehkgjfA5yZujp+yfa5eO5JxOBmrs3gAkTx2wD5RoRUz1D9hvnIVbnXq6mYMAA2WmBq7oKLZI8R4Z0JbhbMiT0tiXStnvJIkdvg7Cwz4GrI1ObDE9tfpS3drulvGnm2bhrOQrOfuLYxsy0RbtW2nk1xLxLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358709; c=relaxed/simple;
	bh=oiiiRFNxb+7JpAk7E7jgwreuGk5SzlvfHw0WkaPkBAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+nCcHPC4PP8Jw5C9FqaTGmxrXybGA8KonFg4Y3sp1D6/W/N+n7aBlMah3RcNFqoNgCf34DUgALPQjoTWoLkP/6y+dHE5JJWb/acA9hyW2QgHXj1jfGPuZvizh5uv2UX+XkxcXKYJsLA9jmE5kHIm7cs9ZW5I6uIjKgvh+WVAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpqdAmvD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpqdAmvD"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553245cad29so2089931e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358706; x=1748963506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h56XKNtyXyta3lZZ70PXL6/fM382B+6dMGx8vne5QvA=;
        b=TpqdAmvDNS59zcvPpso6mbF7wLOTc8IIwwiC8Nqqmv0pYmHOXSs73mtQTKpCI66El/
         YaAaRdU89JEoxPoOmdXq/mSjChhkVkhUDPebV/HvFZvrV2o8R5QhXf4Pqs8oobg4Clmc
         mv9SeDR20uyRi9V0So1ATKlC6lyDOf3x/yvElIQ0wD9pxRe/pb7aICyISQGM9BMrZ6Lv
         L3VwkfcZjtisJZXufExi25R/FBmijp1o3Lp9HftUpbN737ZtjIQfWo3mnFwB7P6gdeKv
         ekfqt00E2HnUFuAjPzBcG0Qzn+Uhz7WTwZnage2WNRsMWoL9VKqVRm7Qe9IHhOBsXuln
         gwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358706; x=1748963506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h56XKNtyXyta3lZZ70PXL6/fM382B+6dMGx8vne5QvA=;
        b=TFncFQ4apOYzzgpxaq7iiDMahvRi7J4l2giqr/Xh2swsLTyKc8zNZLtUvn6Z62BtW1
         FZK1LpYvL34k7WQSy4oWduKEBD98CjX0FSeCr3hJ/MwlHXwMFQ9eClbDNPRbj1+KIJ9Z
         PKi5mJvi84OE454yynqVXyhpA7hRI7PgE099id+9zgtNrwFnr6KcjPogsIeXmyvxmwyf
         oGJzSZf126qbUzO7zp9kWgdjjlP03ARco7yp3sJq4Hni6Pl2y7JBIVmzxY9fM01ueLLt
         SKST9Qd0z1GpMr7SkRJJjzIAgKjkAuUAecjLkOoD5BMaduyqKPX+Cogbn/1+G0yY5Vu6
         d75A==
X-Forwarded-Encrypted: i=1; AJvYcCVZR12zwUJDVUKZj8PgnRzWIcEZTb40IWh44GLMP52rZ/4+kwTmV3+auUMR94nbG3JA1X9amGmwVkuKRBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKJAyjs790i2/Knr9PQ1bkshs/Lb0CKQuOTcEM1ATmNVAQPCC
	P6rx0QzQe9pOQoX1QKLAgeK/6XXBDgkZYred2C06PHCXp2zYRDRp864WvAwFaLaLfhx0fEu0r3l
	171WT3FLwOa4+vEFswaa2g35ezskXgqk=
X-Gm-Gg: ASbGncufj5Fqn/wOZse+2H1VtBqCJ87pnlvDdmcTZ1VZLPIVNj4tZ5ODSYa9qQI/O8p
	Ih+ddK30pacc0MU0zuNe/qq+2uUZaxc1CvnvB195qWCHCyWsg815RWHvQdKp8HtooeSwJnNpCYS
	4455b9HK4VXCpWpfbuC77iYDzhgzt/0z2b
X-Google-Smtp-Source: AGHT+IFj/rnJCQCIWxhAi6iORfvdK9JLWNWyS0gII8ApwLnDzqbhGsh597o2ylDtcd0y3t4VEbA/04I+0x+ATzvuuRw=
X-Received: by 2002:a05:6512:318e:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-553202ea4a3mr2714050e87.0.1748358705329; Tue, 27 May 2025
 08:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-6-ryncsn@gmail.com> <20250519043847.1806-1-21cnbao@gmail.com>
 <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com>
 <CAGsJ_4wC5_YSMLNoY5q4hUsZTpD+YPHSBtzCAdWRFH65EJA_iw@mail.gmail.com>
 <CAMgjq7AO__8TFE8ibwQswWmmf4tTGg2NBEJp0aEn32vN+Dy8uw@mail.gmail.com>
 <CAGsJ_4z1cJfOCcpZDt4EuHK7+SON1r0ptRJNv1h=cDv+eOcdSQ@mail.gmail.com>
 <CAMgjq7CJ4_9bB=46TVzByFRuOwxNs4da=sN==x8cc++YsV+ETQ@mail.gmail.com>
 <CAGsJ_4wo6u1WSXdzj8RUUDNdk5_YCfLV_mcJtvhiv2UonXw+nw@mail.gmail.com>
 <CAMgjq7Bc0-eXZ8G=bN8bo2NG1ndtPmCUvxCi0bdM+HdqmOjaPQ@mail.gmail.com> <CAGsJ_4ymRwXhQdzabstHhkK0OM0JEWtvR3tjeyQppm7sKZ8FUw@mail.gmail.com>
In-Reply-To: <CAGsJ_4ymRwXhQdzabstHhkK0OM0JEWtvR3tjeyQppm7sKZ8FUw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 27 May 2025 23:11:28 +0800
X-Gm-Features: AX0GCFsywKHdweAQpsq3ezsHZo1lW50RhNthF4TuGvSdOh8qQZEIpIMulnqV3qg
Message-ID: <CAMgjq7B1K=6OOrK2OUZ0-tqCzi+EJt+2_K97TPGoSt=9+JwP7Q@mail.gmail.com>
Subject: Re: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Chris Li <chrisl@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 3:59=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Sat, May 24, 2025 at 8:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Fri, May 23, 2025 at 10:30=E2=80=AFAM Barry Song <21cnbao@gmail.com>=
 wrote:
> > >
> > > On Wed, May 21, 2025 at 2:45=E2=80=AFPM Kairui Song <ryncsn@gmail.com=
> wrote:
> > > >
> > > > Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Let me run test case [1] to check whether this ever happens. I gu=
ess I need to
> > > > > hack kernel a bit to always add folio to swapcache even for SYNC =
IO.
> > > >
> > > > That will cause quite a performance regression I think. Good thing =
is,
> > > > that's exactly the problem this series is solving by dropping the S=
YNC
> > > > IO swapin path and never bypassing the swap cache, while improving =
the
> > > > performance, eliminating things like this. One more reason to justi=
fy
> > > > the approach :)
> >
> > Hi Barry,
> >
> > >
> > > I attempted to reproduce the scenario where a folio is added to the s=
wapcache
> > > after filemap_get_folio() returns NULL but before move_swap_pte()
> > > moves the swap PTE
> > > using non-synchronized I/O. Technically, this seems possible; however=
,
> > > I was unable
> > > to reproduce it, likely because the time window between swapin_readah=
ead and
> > > taking the page table lock within do_swap_page() is too short.
> >
> > Thank you so much for trying this!
> >
> > I have been trying to reproduce it too, and so far I didn't observe
> > any crash or warn. I added following debug code:
> >
> >  static __always_inline
> >  bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long ds=
t_end)
> > @@ -1163,6 +1167,7 @@ static int move_pages_pte(struct mm_struct *mm,
> > pmd_t *dst_pmd, pmd_t *src_pmd,
> >         pmd_t dummy_pmdval;
> >         pmd_t dst_pmdval;
> >         struct folio *src_folio =3D NULL;
> > +       struct folio *tmp_folio =3D NULL;
> >         struct anon_vma *src_anon_vma =3D NULL;
> >         struct mmu_notifier_range range;
> >         int err =3D 0;
> > @@ -1391,6 +1396,15 @@ static int move_pages_pte(struct mm_struct *mm,
> > pmd_t *dst_pmd, pmd_t *src_pmd,
> >                 if (!src_folio)
> >                         folio =3D filemap_get_folio(swap_address_space(=
entry),
> >                                         swap_cache_index(entry));
> > +               udelay(get_random_u32_below(1000));
> > +               tmp_folio =3D filemap_get_folio(swap_address_space(entr=
y),
> > +                                       swap_cache_index(entry));
> > +               if (!IS_ERR_OR_NULL(tmp_folio)) {
> > +                       if (!IS_ERR_OR_NULL(folio) && tmp_folio !=3D fo=
lio) {
> > +                               pr_err("UFFDIO_MOVE: UNSTABLE folio
> > %lx (%lx) -> %lx (%lx)\n", folio, folio->swap.val, tmp_folio,
> > tmp_folio->swap.val);
> > +                       }
> > +                       folio_put(tmp_folio);
> > +               }
> >                 if (!IS_ERR_OR_NULL(folio)) {
> >                         if (folio_test_large(folio)) {
> >                                 err =3D -EBUSY;
> > @@ -1413,6 +1427,8 @@ static int move_pages_pte(struct mm_struct *mm,
> > pmd_t *dst_pmd, pmd_t *src_pmd,
> >                 err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr,
> > dst_pte, src_pte,
> >                                 orig_dst_pte, orig_src_pte, dst_pmd, ds=
t_pmdval,
> >                                 dst_ptl, src_ptl, src_folio);
> > +               if (tmp_folio !=3D folio && !err)
> > +                       pr_err("UFFDIO_MOVE: UNSTABLE folio passed
> > check: %lx -> %lx\n", folio, tmp_folio);
> >         }
> >
> > And I saw these two prints are getting triggered like this (not a real
> > issue though, just help to understand the problem)
> > ...
> > [ 3127.632791] UFFDIO_MOVE: UNSTABLE folio fffffdffc334cd00 (0) ->
> > fffffdffc7ccac80 (51)
> > [ 3172.033269] UFFDIO_MOVE: UNSTABLE folio fffffdffc343bb40 (0) ->
> > fffffdffc3435e00 (3b)
> > [ 3194.425213] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d481c0 (0) ->
> > fffffdffc34ab8c0 (76)
> > [ 3194.991318] UFFDIO_MOVE: UNSTABLE folio fffffdffc34f95c0 (0) ->
> > fffffdffc34ab8c0 (6d)
> > [ 3203.467212] UFFDIO_MOVE: UNSTABLE folio fffffdffc34b13c0 (0) ->
> > fffffdffc34eda80 (32)
> > [ 3206.217820] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d297c0 (0) ->
> > fffffdffc38cedc0 (b)
> > [ 3214.913039] UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc=
34db140
> > [ 3217.066972] UFFDIO_MOVE: UNSTABLE folio fffffdffc342b5c0 (0) ->
> > fffffdffc3465cc0 (21)
> > ...
> >
> > The "UFFDIO_MOVE: UNSTABLE folio fffffdffc3435180 (0) ->
> > fffffdffc3853540 (53)" worries me at first. On first look it seems the
> > folio is indeed freed completely from the swap cache after the first
> > lookup, so another swapout can reuse the entry. But as you mentioned
> > __remove_mapping won't release a folio if the refcount check fails, so
> > they must be freed by folio_free_swap or __try_to_reclaim_swap, there
> > are many places that can happen. But these two helpers won't free a
> > folio from swap cache if its swap count is not zero. And the folio
> > will either be swapped out (swap count non zero), or mapped (freeing
> > it is fine, PTE is non_swap, and another swapout will still use the
> > same folio).
> >
> > So after more investigation and dumping the pages, it's actually the
> > second lookup (tmp_folio) seeing the entry being reused by another
> > page table entry, after the first folio is swapped back and released.
> > So the page table check below will always fail just fine.
> >
> > But this also proves the first look up can see a completely irrelevant
> > folio too: If the src folio is swapped out, but got swapped back and
> > freed, then another folio B shortly got added to swap cache reuse the
> > src folio's old swap entry, then the folio B got seen by the look up
> > here and get freed from swap cache, then src folio got swapped out
> > again also reusing the same entry, then we have a problem as PTE seems
> > untouched indeed but we grabbed a wrong folio. Seems possible if I'm
> > not wrong:
> >
> > Something like this:
> > CPU1                             CPU2
> > move_pages_pte
> >   entry =3D pte_to_swp_entry(orig_src_pte);
> >     | Got Swap Entry S1 from src_pte
> >   ...
> >                                  <swapin src_pte, using folio A>
>
> I=E2=80=99m assuming you mean `<swapin src_pte, using folio B>`, since I=
=E2=80=99m not
> sure where folio B comes from in the statement `<someone else tried to
> swap out folio B>`.
>
> If that assumption is correct, and folio A is still in the swapcache,
> how could someone swap in folio B without hitting folio A? That would
> suggest folio A must have been removed from the swapcache earlier=E2=80=
=94right?
>
> >                                  <free folio A from swap cache freeing =
S1>
> >                                  <someone else try swap out folio B >

Sorry my bad, I think I made people think folio B is related to
src_pte at this point. What I actually mean is that: Another random
folio B, unrelated to src_pte, could got swapped out, and using the
swap entry S1.

> >                                  <put folio B to swap cache using S1 >
> >                                 ...
> >   folio =3D swap_cache_get_folio(S1)
> >     | Got folio B here !!!
> >   move_swap_pte
> >                                  <free folio B from swap cache>
> >                                    | Holding a reference doesn't pin th=
e cache
> >                                    | as we have demonstrated
> >                                  <Swapout folio A also using S1>
> >     double_pt_lock
> >     is_pte_pages_stable
> >       | Passed because of S1 is reused
> >     folio_move_anon_rmap(...)
> >       | Moved invalid folio B here !!!
> >
> > But this is extremely hard to reproduce though, even if doing it
> > deliberately...
> >
> > So I think a "folio_swap_contains" or equivalent check here is a good
> > thing to have, to make it more robust and easier to understand. The
> > checking after locking a folio has very tiny overhead and can
> > definitely ensure the folio's swap entry is valid and stable.
> >
> > The "UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc385fb00"
> > here might seem problematic, but it's still not a real problem. That's
> > the case where the swapin in src region happens after the lookup, and
> > before the PTE lock. It will pass the PTE check without moving the
> > folio. But the folio is guaranteed to be a completely new folio here
> > because the folio can't be added back to the page table without
> > holding the PTE lock, and if that happens the following PTE check here
> > will fail.
> >
> > So I think we should patch the current kernel only adding a
> > "folio_swap_contains" equivalent check here, and maybe more comments,
> > how do you think?
>
> The description appears to have some inconsistencies.
> Would you mind rephrasing it?

Yeah, let's ignore the "UFFDIO_MOVE: UNSTABLE folio passed check: 0 ->
fffffdffc385fb00" part first, as both you and me have come into a
conclusion that "filemap_get_folio() returns NULL before
move_swap_pte, but a folio was added to swap cache" is OK, and this
output only proves that happens.

So the problematic race is:

Here move_pages_pte is moving src_pte to dst_pte, and it begins with
src_pte =3D=3D swap entry S1, and S1 isn't cached.

CPU1                             CPU2
move_pages_pte()
  entry =3D pte_to_swp_entry(orig_src_pte);
    | src_pte is absent, and got entry =3D=3D S1
  ... < Somehow interrupted> ...
                                 <swapin src_pte, using folio A>
                                   | folio A is just a new allocated folio
                                   | for resolving the swap in fault.
                                 <free folio A from swap cache freeing S1>
                                   | swap in fault is resolved, src_pte
                                   | now points to folio A, so folio A
                                   | can get freed just fine.
                                   | And now S1 is free to be used
                                   | by anyone.
                                 <someone else try swap out another folio B=
 >
                                   | Folio B is a completely unrelated
                                   | folio swapped out by random process.
                                   | (has nothing to do with src_pte)
                                   | But S1 is freed so it may use S1
                                   | as its swap entry.
                                 <put folio B to swap cache with index S1 >
                                 ...
  folio =3D filemap_get_folio(S1)
    | The lookup is using S1, so it
    | got folio B here !!!
  ... < Somehow interrupted> ...
                                 <free folio B from swap cache>
                                   | Folio B could fail to be swapped out
                                   | or got swapped in again, so it can
                                   | be freed by folio_free_swap or
                                   | swap cache reclaim.
                                   | CPU1 is holding a reference but it
                                   | doesn't pin the swap cache folio
                                   | as I have demonstrated with the
                                   | test C program previously.
                                   | New S1 is free to be used again.
                                 <Swapout src_pte again using S1>
                                   | No thing blocks this from happening
                                   | The swapout is still using folio A,
                                   | and src_pte =3D=3D S1.
  folio_trylock(folio)
  move_swap_pte
    double_pt_lock
    is_pte_pages_stable
      | Passed because of S1 is reused so src_pte =3D=3D S1.
    folio_move_anon_rmap(...)
      | Moved invalid folio B here !!!

It's a long and complex one, I don't think it's practically possible
to happen in reality but in theory doable, once in a million maybe...
Still we have to fix it, or did I got anything wrong here?

>
> Thanks
> barry
