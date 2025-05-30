Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940401465B4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594966; cv=none; b=IM4wOYHA6Twkca8Gtdhahw9hdNLi1Uap0lqoHi47XhxZQK4xlbpfYjRxX37C0eDGLrBQ7DVwdj0D3u0YJ7HeccSPypcWR+zt3Ei+gQ8StyhTXZXirs/2icmXrVOoaJixDLLuBRcT6PmzjcxnM/tRXWNEC40fUJie9Pl77oEdG6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594966; c=relaxed/simple;
	bh=ucBbvM/c14wBbCHaDiYuMaPpRPHVVsNj1AuM5Oh2SlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaAWf8aEO/q9NFRuM7V+XvK3tziA1MkOaghOSZum/3yQ+yrJ6vuKP54VjYIVw3eXccVIBynbdh0iMYjQjLWoD1t58w3A1MmuRMCaiPhCt5ImtkyEqH1JbGzUKucMfNNj3UCjtvDi+UCqPBn057U+i/ss4GRhr/OTB4T1PShdC7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8lt1ubD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8lt1ubD"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3105ef2a071so20853691fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748594961; x=1749199761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bMp2GwF28M9nCY+1eTbEjES5I4QV1m653ObPpjGH6k=;
        b=O8lt1ubD25zSY8rO9b2tZ5I6NbgupwUJlrqSMmCDy6vsF7PwyQ0tWO/yoKrhrwSf00
         nqQlUHKniqN0mow2dL70fSWzwVJwxOJAwCiycmH/ldfZwtKaRgB8Ay+xHzuMRrIWrjfu
         Wj7uS+U70rqcbouSVIsOO7dhdMp5O+uOfsGIbThp/HHbcBAp0TRX6aRFbE6n2W5cbtAn
         tcr+8ehvMBdoYjSX1Dk9gSYh27WSfCpJtHyh+l4EWk2JK4YdnqkZ6JsywlSsmAwCHzzw
         CejRxvB7qoM3GBbQ9PHWhOggnpc3vCOjNjG4vxpvjcTi56tMEOcJyJARo9BEpTRHevp0
         1I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748594961; x=1749199761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bMp2GwF28M9nCY+1eTbEjES5I4QV1m653ObPpjGH6k=;
        b=cF4oAls2TITTsCc3ktakjDmnn00/MPyE8QyV+UwPFB6RUO6QAf8gEN0b5rm5CWzKtH
         iFTGXIK5TUqdslVISCNhHtDKbEU5R1lvcY7W8w+FfuuRc+kiw7AOyb7qoFkZdY0dUPna
         YyIhXxf5OLrx7XgZD0kDYIu4XyIyGuX7gTmaYhWn25KN6nJOQmmhu+avHofnF1QrJZZB
         OuOrJXzYMQ/P+IKNVv/DKo9wvoUFIVCQY/rgHGor/gw54C5Rw2Sviwt2aAFytmZ1HQUn
         9/dvtukSRYpLQssXYpbp8YsZYw/BHDitG5DDO1KHxpeWsahjyWyyVGSiIhfzBOWgZcEz
         j/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU4OPiehntmMEYXgTjWhSlQO6kuH4O/aCIXtzReG0FLk8a3Dpq9QvnYHLTfJeog6UeclmPUH2/mfXdd1QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1jFGjr0TJsErC7jyBtRa8MW7E8EStB3pReR0ct25SE8qnOCJ
	vMjm5vizlNQDwjjhmUrtk2gM2heGD56MGqELx2BjaMDJzC0PHgxOfEkHofVRwFL826pgUjY1ecE
	sG7ybzp13EMk+EI/DYyjCTEloMoVxbtM=
X-Gm-Gg: ASbGnctyggUh8qtRiQ7bU+uAuVJnzTah2PFR/9lryfszoc8oUwR++2rOzfEqxFcf9VU
	L1EjeMwjGEDwLL295D1tLsazNDYo2kNs27UYPak1HrnF/GG5v5CXUn9ncwloUjPGsZ8HfRNPgdE
	Eus+iLQ9Nw0gb45mjI3E/FN+C3OOA8O0Ej
X-Google-Smtp-Source: AGHT+IHMUXxJ5vi0k1dwPqrpUyBi/SiUwVU9oHPtwN20lM6itfJnJo4i1TQfWd7HOIDyiJ+JF7GIMuHU7woIp38mUlo=
X-Received: by 2002:a05:651c:b09:b0:32a:62a2:f72b with SMTP id
 38308e7fff4ca-32a906cf1f8mr3745591fa.14.1748594960833; Fri, 30 May 2025
 01:49:20 -0700 (PDT)
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
 <CAMgjq7Bc0-eXZ8G=bN8bo2NG1ndtPmCUvxCi0bdM+HdqmOjaPQ@mail.gmail.com>
 <CAGsJ_4ymRwXhQdzabstHhkK0OM0JEWtvR3tjeyQppm7sKZ8FUw@mail.gmail.com> <CAMgjq7B1K=6OOrK2OUZ0-tqCzi+EJt+2_K97TPGoSt=9+JwP7Q@mail.gmail.com>
In-Reply-To: <CAMgjq7B1K=6OOrK2OUZ0-tqCzi+EJt+2_K97TPGoSt=9+JwP7Q@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 30 May 2025 16:49:02 +0800
X-Gm-Features: AX0GCFundRkueUSS1m8MxSja_2c1kn5vAhBJf6EhcMcXxkYjJcXnH5ar5KUJuQQ
Message-ID: <CAMgjq7CTbSeNq7HEzZP6raK_6ngC6HAzt46ZSBu0f2RQftZUBQ@mail.gmail.com>
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

On Tue, May 27, 2025 at 11:11=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Tue, May 27, 2025 at 3:59=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > On Sat, May 24, 2025 at 8:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > On Fri, May 23, 2025 at 10:30=E2=80=AFAM Barry Song <21cnbao@gmail.co=
m> wrote:
> > > >
> > > > On Wed, May 21, 2025 at 2:45=E2=80=AFPM Kairui Song <ryncsn@gmail.c=
om> wrote:
> > > > >
> > > > > Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=882=
1=E6=97=A5=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > Let me run test case [1] to check whether this ever happens. I =
guess I need to
> > > > > > hack kernel a bit to always add folio to swapcache even for SYN=
C IO.
> > > > >
> > > > > That will cause quite a performance regression I think. Good thin=
g is,
> > > > > that's exactly the problem this series is solving by dropping the=
 SYNC
> > > > > IO swapin path and never bypassing the swap cache, while improvin=
g the
> > > > > performance, eliminating things like this. One more reason to jus=
tify
> > > > > the approach :)
> > >
> > > Hi Barry,
> > >
> > > >
> > > > I attempted to reproduce the scenario where a folio is added to the=
 swapcache
> > > > after filemap_get_folio() returns NULL but before move_swap_pte()
> > > > moves the swap PTE
> > > > using non-synchronized I/O. Technically, this seems possible; howev=
er,
> > > > I was unable
> > > > to reproduce it, likely because the time window between swapin_read=
ahead and
> > > > taking the page table lock within do_swap_page() is too short.
> > >
> > > Thank you so much for trying this!
> > >
> > > I have been trying to reproduce it too, and so far I didn't observe
> > > any crash or warn. I added following debug code:
> > >
> > >  static __always_inline
> > >  bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long =
dst_end)
> > > @@ -1163,6 +1167,7 @@ static int move_pages_pte(struct mm_struct *mm,
> > > pmd_t *dst_pmd, pmd_t *src_pmd,
> > >         pmd_t dummy_pmdval;
> > >         pmd_t dst_pmdval;
> > >         struct folio *src_folio =3D NULL;
> > > +       struct folio *tmp_folio =3D NULL;
> > >         struct anon_vma *src_anon_vma =3D NULL;
> > >         struct mmu_notifier_range range;
> > >         int err =3D 0;
> > > @@ -1391,6 +1396,15 @@ static int move_pages_pte(struct mm_struct *mm=
,
> > > pmd_t *dst_pmd, pmd_t *src_pmd,
> > >                 if (!src_folio)
> > >                         folio =3D filemap_get_folio(swap_address_spac=
e(entry),
> > >                                         swap_cache_index(entry));
> > > +               udelay(get_random_u32_below(1000));
> > > +               tmp_folio =3D filemap_get_folio(swap_address_space(en=
try),
> > > +                                       swap_cache_index(entry));
> > > +               if (!IS_ERR_OR_NULL(tmp_folio)) {
> > > +                       if (!IS_ERR_OR_NULL(folio) && tmp_folio !=3D =
folio) {
> > > +                               pr_err("UFFDIO_MOVE: UNSTABLE folio
> > > %lx (%lx) -> %lx (%lx)\n", folio, folio->swap.val, tmp_folio,
> > > tmp_folio->swap.val);
> > > +                       }
> > > +                       folio_put(tmp_folio);
> > > +               }
> > >                 if (!IS_ERR_OR_NULL(folio)) {
> > >                         if (folio_test_large(folio)) {
> > >                                 err =3D -EBUSY;
> > > @@ -1413,6 +1427,8 @@ static int move_pages_pte(struct mm_struct *mm,
> > > pmd_t *dst_pmd, pmd_t *src_pmd,
> > >                 err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr=
,
> > > dst_pte, src_pte,
> > >                                 orig_dst_pte, orig_src_pte, dst_pmd, =
dst_pmdval,
> > >                                 dst_ptl, src_ptl, src_folio);
> > > +               if (tmp_folio !=3D folio && !err)
> > > +                       pr_err("UFFDIO_MOVE: UNSTABLE folio passed
> > > check: %lx -> %lx\n", folio, tmp_folio);
> > >         }
> > >
> > > And I saw these two prints are getting triggered like this (not a rea=
l
> > > issue though, just help to understand the problem)
> > > ...
> > > [ 3127.632791] UFFDIO_MOVE: UNSTABLE folio fffffdffc334cd00 (0) ->
> > > fffffdffc7ccac80 (51)
> > > [ 3172.033269] UFFDIO_MOVE: UNSTABLE folio fffffdffc343bb40 (0) ->
> > > fffffdffc3435e00 (3b)
> > > [ 3194.425213] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d481c0 (0) ->
> > > fffffdffc34ab8c0 (76)
> > > [ 3194.991318] UFFDIO_MOVE: UNSTABLE folio fffffdffc34f95c0 (0) ->
> > > fffffdffc34ab8c0 (6d)
> > > [ 3203.467212] UFFDIO_MOVE: UNSTABLE folio fffffdffc34b13c0 (0) ->
> > > fffffdffc34eda80 (32)
> > > [ 3206.217820] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d297c0 (0) ->
> > > fffffdffc38cedc0 (b)
> > > [ 3214.913039] UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdf=
fc34db140
> > > [ 3217.066972] UFFDIO_MOVE: UNSTABLE folio fffffdffc342b5c0 (0) ->
> > > fffffdffc3465cc0 (21)
> > > ...
> > >
> > > The "UFFDIO_MOVE: UNSTABLE folio fffffdffc3435180 (0) ->
> > > fffffdffc3853540 (53)" worries me at first. On first look it seems th=
e
> > > folio is indeed freed completely from the swap cache after the first
> > > lookup, so another swapout can reuse the entry. But as you mentioned
> > > __remove_mapping won't release a folio if the refcount check fails, s=
o
> > > they must be freed by folio_free_swap or __try_to_reclaim_swap, there
> > > are many places that can happen. But these two helpers won't free a
> > > folio from swap cache if its swap count is not zero. And the folio
> > > will either be swapped out (swap count non zero), or mapped (freeing
> > > it is fine, PTE is non_swap, and another swapout will still use the
> > > same folio).
> > >
> > > So after more investigation and dumping the pages, it's actually the
> > > second lookup (tmp_folio) seeing the entry being reused by another
> > > page table entry, after the first folio is swapped back and released.
> > > So the page table check below will always fail just fine.
> > >
> > > But this also proves the first look up can see a completely irrelevan=
t
> > > folio too: If the src folio is swapped out, but got swapped back and
> > > freed, then another folio B shortly got added to swap cache reuse the
> > > src folio's old swap entry, then the folio B got seen by the look up
> > > here and get freed from swap cache, then src folio got swapped out
> > > again also reusing the same entry, then we have a problem as PTE seem=
s
> > > untouched indeed but we grabbed a wrong folio. Seems possible if I'm
> > > not wrong:
> > >
> > > Something like this:
> > > CPU1                             CPU2
> > > move_pages_pte
> > >   entry =3D pte_to_swp_entry(orig_src_pte);
> > >     | Got Swap Entry S1 from src_pte
> > >   ...
> > >                                  <swapin src_pte, using folio A>
> >
> > I=E2=80=99m assuming you mean `<swapin src_pte, using folio B>`, since =
I=E2=80=99m not
> > sure where folio B comes from in the statement `<someone else tried to
> > swap out folio B>`.
> >
> > If that assumption is correct, and folio A is still in the swapcache,
> > how could someone swap in folio B without hitting folio A? That would
> > suggest folio A must have been removed from the swapcache earlier=E2=80=
=94right?
> >
> > >                                  <free folio A from swap cache freein=
g S1>
> > >                                  <someone else try swap out folio B >
>
> Sorry my bad, I think I made people think folio B is related to
> src_pte at this point. What I actually mean is that: Another random
> folio B, unrelated to src_pte, could got swapped out, and using the
> swap entry S1.
>
> > >                                  <put folio B to swap cache using S1 =
>
> > >                                 ...
> > >   folio =3D swap_cache_get_folio(S1)
> > >     | Got folio B here !!!
> > >   move_swap_pte
> > >                                  <free folio B from swap cache>
> > >                                    | Holding a reference doesn't pin =
the cache
> > >                                    | as we have demonstrated
> > >                                  <Swapout folio A also using S1>
> > >     double_pt_lock
> > >     is_pte_pages_stable
> > >       | Passed because of S1 is reused
> > >     folio_move_anon_rmap(...)
> > >       | Moved invalid folio B here !!!
> > >
> > > But this is extremely hard to reproduce though, even if doing it
> > > deliberately...
> > >
> > > So I think a "folio_swap_contains" or equivalent check here is a good
> > > thing to have, to make it more robust and easier to understand. The
> > > checking after locking a folio has very tiny overhead and can
> > > definitely ensure the folio's swap entry is valid and stable.
> > >
> > > The "UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc385fb00"
> > > here might seem problematic, but it's still not a real problem. That'=
s
> > > the case where the swapin in src region happens after the lookup, and
> > > before the PTE lock. It will pass the PTE check without moving the
> > > folio. But the folio is guaranteed to be a completely new folio here
> > > because the folio can't be added back to the page table without
> > > holding the PTE lock, and if that happens the following PTE check her=
e
> > > will fail.
> > >
> > > So I think we should patch the current kernel only adding a
> > > "folio_swap_contains" equivalent check here, and maybe more comments,
> > > how do you think?
> >
> > The description appears to have some inconsistencies.
> > Would you mind rephrasing it?
>
> Yeah, let's ignore the "UFFDIO_MOVE: UNSTABLE folio passed check: 0 ->
> fffffdffc385fb00" part first, as both you and me have come into a
> conclusion that "filemap_get_folio() returns NULL before
> move_swap_pte, but a folio was added to swap cache" is OK, and this
> output only proves that happens.
>
> So the problematic race is:
>
> Here move_pages_pte is moving src_pte to dst_pte, and it begins with
> src_pte =3D=3D swap entry S1, and S1 isn't cached.
>
> CPU1                             CPU2
> move_pages_pte()
>   entry =3D pte_to_swp_entry(orig_src_pte);
>     | src_pte is absent, and got entry =3D=3D S1
>   ... < Somehow interrupted> ...
>                                  <swapin src_pte, using folio A>
>                                    | folio A is just a new allocated foli=
o
>                                    | for resolving the swap in fault.
>                                  <free folio A from swap cache freeing S1=
>
>                                    | swap in fault is resolved, src_pte
>                                    | now points to folio A, so folio A
>                                    | can get freed just fine.
>                                    | And now S1 is free to be used
>                                    | by anyone.
>                                  <someone else try swap out another folio=
 B >
>                                    | Folio B is a completely unrelated
>                                    | folio swapped out by random process.
>                                    | (has nothing to do with src_pte)
>                                    | But S1 is freed so it may use S1
>                                    | as its swap entry.
>                                  <put folio B to swap cache with index S1=
 >
>                                  ...
>   folio =3D filemap_get_folio(S1)
>     | The lookup is using S1, so it
>     | got folio B here !!!
>   ... < Somehow interrupted> ...
>                                  <free folio B from swap cache>
>                                    | Folio B could fail to be swapped out
>                                    | or got swapped in again, so it can
>                                    | be freed by folio_free_swap or
>                                    | swap cache reclaim.
>                                    | CPU1 is holding a reference but it
>                                    | doesn't pin the swap cache folio
>                                    | as I have demonstrated with the
>                                    | test C program previously.
>                                    | New S1 is free to be used again.
>                                  <Swapout src_pte again using S1>
>                                    | No thing blocks this from happening
>                                    | The swapout is still using folio A,
>                                    | and src_pte =3D=3D S1.
>   folio_trylock(folio)
>   move_swap_pte
>     double_pt_lock
>     is_pte_pages_stable
>       | Passed because of S1 is reused so src_pte =3D=3D S1.
>     folio_move_anon_rmap(...)
>       | Moved invalid folio B here !!!
>
> It's a long and complex one, I don't think it's practically possible
> to happen in reality but in theory doable, once in a million maybe...
> Still we have to fix it, or did I got anything wrong here?

Hi Barry,

I managed to reproduce this issue, by hacking the kernel a bit (Only
adding only delay to increase the race window, and adding a WARN to
indicate the problem)

1. Applying following patch for kernel:
=3D=3D=3D

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bc473ad21202..1d710adf9839 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -15,6 +15,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/hugetlb.h>
 #include <linux/shmem_fs.h>
+#include <linux/delay.h>
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
 #include "internal.h"
@@ -1100,6 +1101,10 @@ static int move_swap_pte(struct mm_struct *mm,
struct vm_area_struct *dst_vma,
         * occur and hit the swapcache after moving the PTE.
         */
        if (src_folio) {
+               if (WARN_ON(src_folio->swap.val !=3D
pte_to_swp_entry(orig_src_pte).val))
+                       pr_err("Moving folio %lx (folio->swap =3D %lx),
orig_src_pte =3D %lx\n",
+                              (unsigned long)src_folio, src_folio->swap.va=
l,
+                              pte_to_swp_entry(orig_src_pte).val);
                folio_move_anon_rmap(src_folio, dst_vma);
                src_folio->index =3D linear_page_index(dst_vma, dst_addr);
        }
@@ -1388,9 +1393,13 @@ static int move_pages_pte(struct mm_struct *mm,
pmd_t *dst_pmd, pmd_t *src_pmd,
                 * folios in the swapcache. This issue needs to be resolved
                 * separately to allow proper handling.
                 */
+               pr_err("DEBUG: Will do the lookup using entry %lx,
wait 3s...\n", entry.val);
+               mdelay(1000 * 3);
                if (!src_folio)
                        folio =3D filemap_get_folio(swap_address_space(entr=
y),
                                        swap_cache_index(entry));
+               pr_err("DEBUG: Got folio value %lx, wait 3s...\n",
(unsigned long)folio);
+               mdelay(1000 * 3);
                if (!IS_ERR_OR_NULL(folio)) {
                        if (folio_test_large(folio)) {
                                err =3D -EBUSY;

2. Save following program in userspace (didn't bother with error check
for simpler code):
=3D=3D=3D
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>
#include <linux/userfaultfd.h>
#include <fcntl.h>
#include <pthread.h>
#include <unistd.h>
#include <poll.h>
#include <errno.h>

#define PAGE_SIZE 4096
/* Need to consume all slots so define the swap device size here */
#define SWAP_DEVICE_SIZE (PAGE_SIZE * 1024 - 1)

char *src, *race, *dst, *place_holder;
int uffd;

void read_in(char *p) {
    /* This test program initials memory with 0xAA to bypass zeromap */
    while (*((volatile char*)p) !=3D 0xAA);
}

void *reader_thread(void *arg) {
    /* Test requires kernel to wait upon uffd move */
    read_in(dst);
    return NULL;
}

void *fault_handler_thread(void *arg) {
    int ret;
    struct uffd_msg msg;
    struct uffdio_move move;
    struct pollfd pollfd =3D { .fd =3D uffd, .events =3D POLLIN };
    pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
    pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);

    while (1) {
        poll(&pollfd, 1, -1);
        read(uffd, &msg, sizeof(msg));

        move.src =3D (unsigned long)src + (msg.arg.pagefault.address -
            (unsigned long)dst);
        move.dst =3D msg.arg.pagefault.address & ~(PAGE_SIZE - 1);
        move.len =3D PAGE_SIZE;
        move.mode =3D 0;

        ioctl(uffd, UFFDIO_MOVE, &move);
    }
    return NULL;
}

int main() {
    pthread_t fault_handler_thr, reader_thr;
    struct uffdio_api uffdio_api =3D { .api =3D UFFD_API, .features =3D 0 }=
;
    struct uffdio_register uffdio_register;

    src =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE |
MAP_ANONYMOUS, -1, 0);
    dst =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE |
MAP_ANONYMOUS, -1, 0);
    memset(src, 0xAA, PAGE_SIZE);
    madvise(src, PAGE_SIZE, MADV_PAGEOUT);

    /* Consume all slots on swap device left only one entry (S1) */
    place_holder =3D mmap(NULL, SWAP_DEVICE_SIZE - 1, PROT_READ |
PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    memset(place_holder, 0xAA, SWAP_DEVICE_SIZE - 1);
    madvise(place_holder, SWAP_DEVICE_SIZE - 1, MADV_PAGEOUT);

    /* Setup uffd handler and dst reader */
    uffd =3D syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
    ioctl(uffd, UFFDIO_API, &uffdio_api);
    uffdio_register.range.start =3D (unsigned long)dst;
    uffdio_register.range.len =3D PAGE_SIZE;
    uffdio_register.mode =3D UFFDIO_REGISTER_MODE_MISSING;
    ioctl(uffd, UFFDIO_REGISTER, &uffdio_register);
    pthread_create(&fault_handler_thr, NULL, fault_handler_thread, NULL);
    pthread_create(&reader_thr, NULL, reader_thread, NULL);

    /* Wait for UFFDIO to start */
    sleep(1);

    /* Release src folio (A) from swap, freeing the entry S1 */
    read_in(src);

    /* Swapout another race folio (B) using S1 */
    race =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED |
MAP_ANONYMOUS, -1, 0);
    memset(race, 0xAA, PAGE_SIZE);
    madvise(race, PAGE_SIZE, MADV_PAGEOUT);

    /* Wait for UFFDIO swap lookup to see the race folio (B) */
    sleep(3);

    /* Free the race folio (B) from swap */
    read_in(race);
    /* And swap out src folio (A) again, using S1 */
    madvise(src, PAGE_SIZE, MADV_PAGEOUT);

    /* Kernel should have moved a wrong folio by now */

    pthread_join(reader_thr, NULL);
    pthread_cancel(fault_handler_thr);
    pthread_join(fault_handler_thr, NULL);
    munmap(race, PAGE_SIZE);
    munmap(src, PAGE_SIZE);
    munmap(dst, PAGE_SIZE);
    close(uffd);

    return 0;
}

3. Run the test with (ensure no other swap device is mounted and
current dir is on a block device):
=3D=3D=3D
dd if=3D/dev/zero of=3Dswap.img bs=3D1M count=3D1; mkswap swap.img; swapon
swap.img; gcc test-uffd.c && ./a.out

Then we get the WARN:
[  348.200587] ------------[ cut here ]------------
[  348.200599] WARNING: CPU: 7 PID: 1856 at mm/userfaultfd.c:1104
move_pages_pte+0xdb8/0x11a0
[  348.207544] Modules linked in: loop
[  348.209401] CPU: 7 UID: 0 PID: 1856 Comm: a.out Kdump: loaded Not
tainted 6.15.0-rc6ptch-00381-g99f00d7c6c6f-dirty #304
PREEMPT(voluntary)
[  348.214579] Hardware name: QEMU QEMU Virtual Machine, BIOS
edk2-stable202408-prebuilt.qemu.org 08/13/2024
[  348.218656] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=
=3D--)
[  348.222013] pc : move_pages_pte+0xdb8/0x11a0
[  348.224062] lr : move_pages_pte+0x928/0x11a0
[  348.225881] sp : ffff800088b2b8f0
[  348.227360] x29: ffff800088b2b970 x28: 0000000000000000 x27: 0000ffffbc9=
20000
[  348.230228] x26: fffffdffc335e4a8 x25: 0000000000000001 x24: fffffdffc3e=
4dd40
[  348.233159] x23: 080000010d792403 x22: ffff0000cd792900 x21: ffff0000c5a=
6d2c0
[  348.236339] x20: fffffdffc335e4a8 x19: 0000000000001004 x18: 00000000000=
00006
[  348.239269] x17: 0000ffffbc920000 x16: 0000ffffbc922fff x15: 00000000000=
00003
[  348.242703] x14: ffff8000812c3b68 x13: 0000000000000003 x12: 00000000000=
00003
[  348.245947] x11: 0000000000000000 x10: ffff800081e4feb8 x9 : 00000000000=
00001
[  348.249284] x8 : 0000000000000000 x7 : 6f696c6f6620746f x6 : 47203a47554=
24544
[  348.252071] x5 : ffff8000815789e3 x4 : ffff8000815789e5 x3 : 00000000000=
00000
[  348.255358] x2 : ffff0001fed2aef0 x1 : 0000000000000000 x0 : fffffdffc33=
5e4a8
[  348.258134] Call trace:
[  348.259468]  move_pages_pte+0xdb8/0x11a0 (P)
[  348.261348]  move_pages+0x3c0/0x738
[  348.262987]  userfaultfd_ioctl+0x3d8/0x1f98
[  348.264916]  __arm64_sys_ioctl+0x88/0xd0
[  348.266779]  invoke_syscall+0x64/0xec
[  348.268347]  el0_svc_common+0xa8/0xd8
[  348.269967]  do_el0_svc+0x1c/0x28
[  348.271711]  el0_svc+0x40/0xe0
[  348.273345]  el0t_64_sync_handler+0x78/0x108
[  348.274821]  el0t_64_sync+0x19c/0x1a0
[  348.276117] ---[ end trace 0000000000000000 ]---
[  348.278638] Moving folio fffffdffc3e4dd40 (folio->swap =3D 0), orig_src_=
pte =3D 1

That's the new added WARN, but the test program also hung with D
forever, and with errors with other tests like:
[  406.893936] BUG: Bad rss-counter state mm:ffff0000c5a9ddc0
type:MM_ANONPAGES val:-1
[  406.894071] BUG: Bad rss-counter state mm:ffff0000c5a9ddc0
type:MM_SHMEMPAGES val:1

Because the kernel just moved the wrong folio, so unmap takes forever
looking for the missing folio, and counting went wrong too.

So this race is real. It's extremely unlikely to happen because it
requires multiple collisions of multiple tiny race windows, however
it's not impossible.

I'll post a fix very soon.
