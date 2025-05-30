Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C223CEE5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633096; cv=none; b=uLL4CYKzHjjUB/YZGRsHkYW60XUpv7b8F0fH7dWl0TTTlnOeRhyvNe2tJ6H3Wv8PZVeeVhJ6FsstS97vmPPcCN7B6NnGJ8oCflIbpiWCgTk2LrVXks8uRCBytRaTU1KXpxsO0mOSclvxWF/CLIcAIl03Glj65qSEMZEvNBtpkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633096; c=relaxed/simple;
	bh=uXF4JP3s4AIPD9u69XK3F7nVPB1UOEHx7zLiyjlSnFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sO7btyAVMQjM+HZNDc7LVFxsZ7vK7K6A142w3GzDnMCcZOsHWtpghbxbiejCihD10SyZRExcDA4K1rCaIl7aW8FZqwR9zU7177c0VkiqS3WFBOvD6D2RE/6BTE/GlYxs4NR7z43nMA4SZ89VJ7/uGa5BcI/ZOe3SmJB3dJ9RDP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhdUsXj1; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhdUsXj1"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso20498211fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748633092; x=1749237892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3x+XwOs38yhaUq7Mf1YCL8Z3w+p+5XhoJf0uNSubdMw=;
        b=KhdUsXj1RMXGV+vvVcXUNhOZWRVzX44eziUgR7qgTBXmCanFb9dirWYWfA5ZCW64Fn
         CBzHtHlUS6iZwEbHL4oHVNgZMV+tBcL3Yi9oBhBVmO0utRd4Y2wqUN7OI+yVOx6QYgom
         q/Lfyrfxev0gFls//fpnODsRJmxvsP6D+nhtLUuMOWRYvMedXBFktYt2nYtCJfXAZaVa
         uJHdVCNMbAxlSj1Z0HlWQQJHRjGHLlNysEN++39zpMV5WmwDhYqFYEhrZiTmtXV2dGhi
         kDW8+D7IRXDzM6YykHkVKMC5cuIoDLe2pHzVxvdNfBHEbe4e+n1TePn9DpzJUHvVXrqP
         8aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748633092; x=1749237892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3x+XwOs38yhaUq7Mf1YCL8Z3w+p+5XhoJf0uNSubdMw=;
        b=kVvw12pjPkwLHXdyf0fXmfaci1rBmbkPoiyhvfDiJRcl3c8oDB+AmK6/9bgrdH/bOF
         K/K1I7yG9VM5MaRX5a23NV6ad2OyzRDcNgxwM6tsTDB9vRrBg/p3fSKYQ0Ma0ugPJE7S
         TamUf2mdbTHzQ1CmlFgNJPeko4tlxyZ0gNgTZo7pZk4hptwF3Z/rDAe9VD6D/pR6798i
         FAVfi9RaMMkX/MTK9mntreYKEpRReBakmkkH6MeFvSFC8YJHIXAbj8JMzKzspukMLwO0
         41bKK21Wp0s47MFBOwivHkRv9A99p3j2I9pDDiIWhQ0E1ccRjznY1Tz5Zk98Z7LDbRA4
         Gzvw==
X-Forwarded-Encrypted: i=1; AJvYcCV/j4FIhk3i3kG9bXF7FqAkFcqZs8RgVtN0mbueo08A5hPKYlDe+N2sa/c6ho8dXCyLc7lIQBd0goHahfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzspLW+ojc30Zqs0YjinhjEp9cYfOw9lHgD4vdJmJwuAfdA6pNu
	XvSLX4y1s2qFsqnoc7VnJajC6/Ks/i5xUp69wRowX/gzT6K61DB9rBLVB/Oixt4ySoLln1fIO4J
	uD0g8IGBlP2s2e7NziGB70JxBOSCIgLs=
X-Gm-Gg: ASbGncsP82Zpp8oHM94kqgB153QB802US5MD926uvFzgZQGqL1H6eXkUlczClZuqYSm
	4IvOuHoRrdJQN1FoFU6ZYNJvOT/zWUOxnxIqLXTiw1Bt+KpAvTO7fsWELEmDRn80Zx5Ju8VwjKe
	DtIbn50qZnAq/dKbeRHIQxCOROXbWO8Avxx6emtITiWp0=
X-Google-Smtp-Source: AGHT+IFZyLsLaTu5kEJeN7ag0B1DXxz1fOh2qsr6VsO0/H+k5BZLIsvQRcYDkt5MugmeGiNK2AzUsFh9j4kxz2Z2VN0=
X-Received: by 2002:a2e:be08:0:b0:32a:7979:47c3 with SMTP id
 38308e7fff4ca-32a8cd52862mr17933541fa.11.1748633091194; Fri, 30 May 2025
 12:24:51 -0700 (PDT)
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
 <CAGsJ_4ymRwXhQdzabstHhkK0OM0JEWtvR3tjeyQppm7sKZ8FUw@mail.gmail.com>
 <CAMgjq7B1K=6OOrK2OUZ0-tqCzi+EJt+2_K97TPGoSt=9+JwP7Q@mail.gmail.com> <CAMgjq7CTbSeNq7HEzZP6raK_6ngC6HAzt46ZSBu0f2RQftZUBQ@mail.gmail.com>
In-Reply-To: <CAMgjq7CTbSeNq7HEzZP6raK_6ngC6HAzt46ZSBu0f2RQftZUBQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 31 May 2025 03:24:33 +0800
X-Gm-Features: AX0GCFsTtMA00jY9PQv2Ds1-E9ku6iax6UhhwZbgbdVWaUbwUe8j-aTdr59syqw
Message-ID: <CAMgjq7DEPHd5TPXtq86pyu-PGQZ+8KOk_6TS-yD7edmTxS2-SQ@mail.gmail.com>
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

On Fri, May 30, 2025 at 4:49=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, May 27, 2025 at 11:11=E2=80=AFPM Kairui Song <ryncsn@gmail.com> w=
rote:
> >
> > On Tue, May 27, 2025 at 3:59=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> > >
> > > On Sat, May 24, 2025 at 8:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com=
> wrote:
> > > >
> > > > On Fri, May 23, 2025 at 10:30=E2=80=AFAM Barry Song <21cnbao@gmail.=
com> wrote:
> > > > >
> > > > > On Wed, May 21, 2025 at 2:45=E2=80=AFPM Kairui Song <ryncsn@gmail=
.com> wrote:
> > > > > >
> > > > > > Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > Let me run test case [1] to check whether this ever happens. =
I guess I need to
> > > > > > > hack kernel a bit to always add folio to swapcache even for S=
YNC IO.
> > > > > >
> > > > > > That will cause quite a performance regression I think. Good th=
ing is,
> > > > > > that's exactly the problem this series is solving by dropping t=
he SYNC
> > > > > > IO swapin path and never bypassing the swap cache, while improv=
ing the
> > > > > > performance, eliminating things like this. One more reason to j=
ustify
> > > > > > the approach :)
> > > >
> > > > Hi Barry,
> > > >
> > > > >
> > > > > I attempted to reproduce the scenario where a folio is added to t=
he swapcache
> > > > > after filemap_get_folio() returns NULL but before move_swap_pte()
> > > > > moves the swap PTE
> > > > > using non-synchronized I/O. Technically, this seems possible; how=
ever,
> > > > > I was unable
> > > > > to reproduce it, likely because the time window between swapin_re=
adahead and
> > > > > taking the page table lock within do_swap_page() is too short.
> > > >
> > > > Thank you so much for trying this!
> > > >
> > > > I have been trying to reproduce it too, and so far I didn't observe
> > > > any crash or warn. I added following debug code:
> > > >
> > > >  static __always_inline
> > > >  bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned lon=
g dst_end)
> > > > @@ -1163,6 +1167,7 @@ static int move_pages_pte(struct mm_struct *m=
m,
> > > > pmd_t *dst_pmd, pmd_t *src_pmd,
> > > >         pmd_t dummy_pmdval;
> > > >         pmd_t dst_pmdval;
> > > >         struct folio *src_folio =3D NULL;
> > > > +       struct folio *tmp_folio =3D NULL;
> > > >         struct anon_vma *src_anon_vma =3D NULL;
> > > >         struct mmu_notifier_range range;
> > > >         int err =3D 0;
> > > > @@ -1391,6 +1396,15 @@ static int move_pages_pte(struct mm_struct *=
mm,
> > > > pmd_t *dst_pmd, pmd_t *src_pmd,
> > > >                 if (!src_folio)
> > > >                         folio =3D filemap_get_folio(swap_address_sp=
ace(entry),
> > > >                                         swap_cache_index(entry));
> > > > +               udelay(get_random_u32_below(1000));
> > > > +               tmp_folio =3D filemap_get_folio(swap_address_space(=
entry),
> > > > +                                       swap_cache_index(entry));
> > > > +               if (!IS_ERR_OR_NULL(tmp_folio)) {
> > > > +                       if (!IS_ERR_OR_NULL(folio) && tmp_folio !=
=3D folio) {
> > > > +                               pr_err("UFFDIO_MOVE: UNSTABLE folio
> > > > %lx (%lx) -> %lx (%lx)\n", folio, folio->swap.val, tmp_folio,
> > > > tmp_folio->swap.val);
> > > > +                       }
> > > > +                       folio_put(tmp_folio);
> > > > +               }
> > > >                 if (!IS_ERR_OR_NULL(folio)) {
> > > >                         if (folio_test_large(folio)) {
> > > >                                 err =3D -EBUSY;
> > > > @@ -1413,6 +1427,8 @@ static int move_pages_pte(struct mm_struct *m=
m,
> > > > pmd_t *dst_pmd, pmd_t *src_pmd,
> > > >                 err =3D move_swap_pte(mm, dst_vma, dst_addr, src_ad=
dr,
> > > > dst_pte, src_pte,
> > > >                                 orig_dst_pte, orig_src_pte, dst_pmd=
, dst_pmdval,
> > > >                                 dst_ptl, src_ptl, src_folio);
> > > > +               if (tmp_folio !=3D folio && !err)
> > > > +                       pr_err("UFFDIO_MOVE: UNSTABLE folio passed
> > > > check: %lx -> %lx\n", folio, tmp_folio);
> > > >         }
> > > >
> > > > And I saw these two prints are getting triggered like this (not a r=
eal
> > > > issue though, just help to understand the problem)
> > > > ...
> > > > [ 3127.632791] UFFDIO_MOVE: UNSTABLE folio fffffdffc334cd00 (0) ->
> > > > fffffdffc7ccac80 (51)
> > > > [ 3172.033269] UFFDIO_MOVE: UNSTABLE folio fffffdffc343bb40 (0) ->
> > > > fffffdffc3435e00 (3b)
> > > > [ 3194.425213] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d481c0 (0) ->
> > > > fffffdffc34ab8c0 (76)
> > > > [ 3194.991318] UFFDIO_MOVE: UNSTABLE folio fffffdffc34f95c0 (0) ->
> > > > fffffdffc34ab8c0 (6d)
> > > > [ 3203.467212] UFFDIO_MOVE: UNSTABLE folio fffffdffc34b13c0 (0) ->
> > > > fffffdffc34eda80 (32)
> > > > [ 3206.217820] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d297c0 (0) ->
> > > > fffffdffc38cedc0 (b)
> > > > [ 3214.913039] UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffff=
dffc34db140
> > > > [ 3217.066972] UFFDIO_MOVE: UNSTABLE folio fffffdffc342b5c0 (0) ->
> > > > fffffdffc3465cc0 (21)
> > > > ...
> > > >
> > > > The "UFFDIO_MOVE: UNSTABLE folio fffffdffc3435180 (0) ->
> > > > fffffdffc3853540 (53)" worries me at first. On first look it seems =
the
> > > > folio is indeed freed completely from the swap cache after the firs=
t
> > > > lookup, so another swapout can reuse the entry. But as you mentione=
d
> > > > __remove_mapping won't release a folio if the refcount check fails,=
 so
> > > > they must be freed by folio_free_swap or __try_to_reclaim_swap, the=
re
> > > > are many places that can happen. But these two helpers won't free a
> > > > folio from swap cache if its swap count is not zero. And the folio
> > > > will either be swapped out (swap count non zero), or mapped (freein=
g
> > > > it is fine, PTE is non_swap, and another swapout will still use the
> > > > same folio).
> > > >
> > > > So after more investigation and dumping the pages, it's actually th=
e
> > > > second lookup (tmp_folio) seeing the entry being reused by another
> > > > page table entry, after the first folio is swapped back and release=
d.
> > > > So the page table check below will always fail just fine.
> > > >
> > > > But this also proves the first look up can see a completely irrelev=
ant
> > > > folio too: If the src folio is swapped out, but got swapped back an=
d
> > > > freed, then another folio B shortly got added to swap cache reuse t=
he
> > > > src folio's old swap entry, then the folio B got seen by the look u=
p
> > > > here and get freed from swap cache, then src folio got swapped out
> > > > again also reusing the same entry, then we have a problem as PTE se=
ems
> > > > untouched indeed but we grabbed a wrong folio. Seems possible if I'=
m
> > > > not wrong:
> > > >
> > > > Something like this:
> > > > CPU1                             CPU2
> > > > move_pages_pte
> > > >   entry =3D pte_to_swp_entry(orig_src_pte);
> > > >     | Got Swap Entry S1 from src_pte
> > > >   ...
> > > >                                  <swapin src_pte, using folio A>
> > >
> > > I=E2=80=99m assuming you mean `<swapin src_pte, using folio B>`, sinc=
e I=E2=80=99m not
> > > sure where folio B comes from in the statement `<someone else tried t=
o
> > > swap out folio B>`.
> > >
> > > If that assumption is correct, and folio A is still in the swapcache,
> > > how could someone swap in folio B without hitting folio A? That would
> > > suggest folio A must have been removed from the swapcache earlier=E2=
=80=94right?
> > >
> > > >                                  <free folio A from swap cache free=
ing S1>
> > > >                                  <someone else try swap out folio B=
 >
> >
> > Sorry my bad, I think I made people think folio B is related to
> > src_pte at this point. What I actually mean is that: Another random
> > folio B, unrelated to src_pte, could got swapped out, and using the
> > swap entry S1.
> >
> > > >                                  <put folio B to swap cache using S=
1 >
> > > >                                 ...
> > > >   folio =3D swap_cache_get_folio(S1)
> > > >     | Got folio B here !!!
> > > >   move_swap_pte
> > > >                                  <free folio B from swap cache>
> > > >                                    | Holding a reference doesn't pi=
n the cache
> > > >                                    | as we have demonstrated
> > > >                                  <Swapout folio A also using S1>
> > > >     double_pt_lock
> > > >     is_pte_pages_stable
> > > >       | Passed because of S1 is reused
> > > >     folio_move_anon_rmap(...)
> > > >       | Moved invalid folio B here !!!
> > > >
> > > > But this is extremely hard to reproduce though, even if doing it
> > > > deliberately...
> > > >
> > > > So I think a "folio_swap_contains" or equivalent check here is a go=
od
> > > > thing to have, to make it more robust and easier to understand. The
> > > > checking after locking a folio has very tiny overhead and can
> > > > definitely ensure the folio's swap entry is valid and stable.
> > > >
> > > > The "UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc385fb0=
0"
> > > > here might seem problematic, but it's still not a real problem. Tha=
t's
> > > > the case where the swapin in src region happens after the lookup, a=
nd
> > > > before the PTE lock. It will pass the PTE check without moving the
> > > > folio. But the folio is guaranteed to be a completely new folio her=
e
> > > > because the folio can't be added back to the page table without
> > > > holding the PTE lock, and if that happens the following PTE check h=
ere
> > > > will fail.
> > > >
> > > > So I think we should patch the current kernel only adding a
> > > > "folio_swap_contains" equivalent check here, and maybe more comment=
s,
> > > > how do you think?
> > >
> > > The description appears to have some inconsistencies.
> > > Would you mind rephrasing it?
> >
> > Yeah, let's ignore the "UFFDIO_MOVE: UNSTABLE folio passed check: 0 ->
> > fffffdffc385fb00" part first, as both you and me have come into a
> > conclusion that "filemap_get_folio() returns NULL before
> > move_swap_pte, but a folio was added to swap cache" is OK, and this
> > output only proves that happens.
> >
> > So the problematic race is:
> >
> > Here move_pages_pte is moving src_pte to dst_pte, and it begins with
> > src_pte =3D=3D swap entry S1, and S1 isn't cached.
> >
> > CPU1                             CPU2
> > move_pages_pte()
> >   entry =3D pte_to_swp_entry(orig_src_pte);
> >     | src_pte is absent, and got entry =3D=3D S1
> >   ... < Somehow interrupted> ...
> >                                  <swapin src_pte, using folio A>
> >                                    | folio A is just a new allocated fo=
lio
> >                                    | for resolving the swap in fault.
> >                                  <free folio A from swap cache freeing =
S1>
> >                                    | swap in fault is resolved, src_pte
> >                                    | now points to folio A, so folio A
> >                                    | can get freed just fine.
> >                                    | And now S1 is free to be used
> >                                    | by anyone.
> >                                  <someone else try swap out another fol=
io B >
> >                                    | Folio B is a completely unrelated
> >                                    | folio swapped out by random proces=
s.
> >                                    | (has nothing to do with src_pte)
> >                                    | But S1 is freed so it may use S1
> >                                    | as its swap entry.
> >                                  <put folio B to swap cache with index =
S1 >
> >                                  ...
> >   folio =3D filemap_get_folio(S1)
> >     | The lookup is using S1, so it
> >     | got folio B here !!!
> >   ... < Somehow interrupted> ...
> >                                  <free folio B from swap cache>
> >                                    | Folio B could fail to be swapped o=
ut
> >                                    | or got swapped in again, so it can
> >                                    | be freed by folio_free_swap or
> >                                    | swap cache reclaim.
> >                                    | CPU1 is holding a reference but it
> >                                    | doesn't pin the swap cache folio
> >                                    | as I have demonstrated with the
> >                                    | test C program previously.
> >                                    | New S1 is free to be used again.
> >                                  <Swapout src_pte again using S1>
> >                                    | No thing blocks this from happenin=
g
> >                                    | The swapout is still using folio A=
,
> >                                    | and src_pte =3D=3D S1.
> >   folio_trylock(folio)
> >   move_swap_pte
> >     double_pt_lock
> >     is_pte_pages_stable
> >       | Passed because of S1 is reused so src_pte =3D=3D S1.
> >     folio_move_anon_rmap(...)
> >       | Moved invalid folio B here !!!
> >
> > It's a long and complex one, I don't think it's practically possible
> > to happen in reality but in theory doable, once in a million maybe...
> > Still we have to fix it, or did I got anything wrong here?
>
> Hi Barry,
>
> I managed to reproduce this issue, by hacking the kernel a bit (Only
> adding only delay to increase the race window, and adding a WARN to
> indicate the problem)
>
> 1. Applying following patch for kernel:
> =3D=3D=3D
>
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index bc473ad21202..1d710adf9839 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -15,6 +15,7 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/hugetlb.h>
>  #include <linux/shmem_fs.h>
> +#include <linux/delay.h>
>  #include <asm/tlbflush.h>
>  #include <asm/tlb.h>
>  #include "internal.h"
> @@ -1100,6 +1101,10 @@ static int move_swap_pte(struct mm_struct *mm,
> struct vm_area_struct *dst_vma,
>          * occur and hit the swapcache after moving the PTE.
>          */
>         if (src_folio) {
> +               if (WARN_ON(src_folio->swap.val !=3D
> pte_to_swp_entry(orig_src_pte).val))
> +                       pr_err("Moving folio %lx (folio->swap =3D %lx),
> orig_src_pte =3D %lx\n",
> +                              (unsigned long)src_folio, src_folio->swap.=
val,
> +                              pte_to_swp_entry(orig_src_pte).val);
>                 folio_move_anon_rmap(src_folio, dst_vma);
>                 src_folio->index =3D linear_page_index(dst_vma, dst_addr)=
;
>         }
> @@ -1388,9 +1393,13 @@ static int move_pages_pte(struct mm_struct *mm,
> pmd_t *dst_pmd, pmd_t *src_pmd,
>                  * folios in the swapcache. This issue needs to be resolv=
ed
>                  * separately to allow proper handling.
>                  */
> +               pr_err("DEBUG: Will do the lookup using entry %lx,
> wait 3s...\n", entry.val);
> +               mdelay(1000 * 3);
>                 if (!src_folio)
>                         folio =3D filemap_get_folio(swap_address_space(en=
try),
>                                         swap_cache_index(entry));
> +               pr_err("DEBUG: Got folio value %lx, wait 3s...\n",
> (unsigned long)folio);
> +               mdelay(1000 * 3);
>                 if (!IS_ERR_OR_NULL(folio)) {
>                         if (folio_test_large(folio)) {
>                                 err =3D -EBUSY;
>
> 2. Save following program in userspace (didn't bother with error check
> for simpler code):
> =3D=3D=3D
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/mman.h>
> #include <sys/ioctl.h>
> #include <sys/syscall.h>
> #include <linux/userfaultfd.h>
> #include <fcntl.h>
> #include <pthread.h>
> #include <unistd.h>
> #include <poll.h>
> #include <errno.h>
>
> #define PAGE_SIZE 4096
> /* Need to consume all slots so define the swap device size here */
> #define SWAP_DEVICE_SIZE (PAGE_SIZE * 1024 - 1)
>
> char *src, *race, *dst, *place_holder;
> int uffd;
>
> void read_in(char *p) {
>     /* This test program initials memory with 0xAA to bypass zeromap */
>     while (*((volatile char*)p) !=3D 0xAA);
> }
>
> void *reader_thread(void *arg) {
>     /* Test requires kernel to wait upon uffd move */
>     read_in(dst);
>     return NULL;
> }
>
> void *fault_handler_thread(void *arg) {
>     int ret;
>     struct uffd_msg msg;
>     struct uffdio_move move;
>     struct pollfd pollfd =3D { .fd =3D uffd, .events =3D POLLIN };
>     pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
>     pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);
>
>     while (1) {
>         poll(&pollfd, 1, -1);
>         read(uffd, &msg, sizeof(msg));
>
>         move.src =3D (unsigned long)src + (msg.arg.pagefault.address -
>             (unsigned long)dst);
>         move.dst =3D msg.arg.pagefault.address & ~(PAGE_SIZE - 1);
>         move.len =3D PAGE_SIZE;
>         move.mode =3D 0;
>
>         ioctl(uffd, UFFDIO_MOVE, &move);
>     }
>     return NULL;
> }
>
> int main() {
>     pthread_t fault_handler_thr, reader_thr;
>     struct uffdio_api uffdio_api =3D { .api =3D UFFD_API, .features =3D 0=
 };
>     struct uffdio_register uffdio_register;
>
>     src =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE |
> MAP_ANONYMOUS, -1, 0);
>     dst =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE |
> MAP_ANONYMOUS, -1, 0);
>     memset(src, 0xAA, PAGE_SIZE);
>     madvise(src, PAGE_SIZE, MADV_PAGEOUT);
>
>     /* Consume all slots on swap device left only one entry (S1) */
>     place_holder =3D mmap(NULL, SWAP_DEVICE_SIZE - 1, PROT_READ |
> PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>     memset(place_holder, 0xAA, SWAP_DEVICE_SIZE - 1);
>     madvise(place_holder, SWAP_DEVICE_SIZE - 1, MADV_PAGEOUT);
>
>     /* Setup uffd handler and dst reader */
>     uffd =3D syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
>     ioctl(uffd, UFFDIO_API, &uffdio_api);
>     uffdio_register.range.start =3D (unsigned long)dst;
>     uffdio_register.range.len =3D PAGE_SIZE;
>     uffdio_register.mode =3D UFFDIO_REGISTER_MODE_MISSING;
>     ioctl(uffd, UFFDIO_REGISTER, &uffdio_register);
>     pthread_create(&fault_handler_thr, NULL, fault_handler_thread, NULL);
>     pthread_create(&reader_thr, NULL, reader_thread, NULL);
>
>     /* Wait for UFFDIO to start */
>     sleep(1);
>
>     /* Release src folio (A) from swap, freeing the entry S1 */
>     read_in(src);
>
>     /* Swapout another race folio (B) using S1 */
>     race =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED |
> MAP_ANONYMOUS, -1, 0);
>     memset(race, 0xAA, PAGE_SIZE);
>     madvise(race, PAGE_SIZE, MADV_PAGEOUT);
>
>     /* Wait for UFFDIO swap lookup to see the race folio (B) */
>     sleep(3);
>
>     /* Free the race folio (B) from swap */
>     read_in(race);
>     /* And swap out src folio (A) again, using S1 */
>     madvise(src, PAGE_SIZE, MADV_PAGEOUT);
>
>     /* Kernel should have moved a wrong folio by now */
>
>     pthread_join(reader_thr, NULL);
>     pthread_cancel(fault_handler_thr);
>     pthread_join(fault_handler_thr, NULL);
>     munmap(race, PAGE_SIZE);
>     munmap(src, PAGE_SIZE);
>     munmap(dst, PAGE_SIZE);
>     close(uffd);
>
>     return 0;
> }
>
> 3. Run the test with (ensure no other swap device is mounted and
> current dir is on a block device):
> =3D=3D=3D
> dd if=3D/dev/zero of=3Dswap.img bs=3D1M count=3D1; mkswap swap.img; swapo=
n
> swap.img; gcc test-uffd.c && ./a.out
>
> Then we get the WARN:
> [  348.200587] ------------[ cut here ]------------
> [  348.200599] WARNING: CPU: 7 PID: 1856 at mm/userfaultfd.c:1104
> move_pages_pte+0xdb8/0x11a0
> [  348.207544] Modules linked in: loop
> [  348.209401] CPU: 7 UID: 0 PID: 1856 Comm: a.out Kdump: loaded Not
> tainted 6.15.0-rc6ptch-00381-g99f00d7c6c6f-dirty #304
> PREEMPT(voluntary)
> [  348.214579] Hardware name: QEMU QEMU Virtual Machine, BIOS
> edk2-stable202408-prebuilt.qemu.org 08/13/2024
> [  348.218656] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [  348.222013] pc : move_pages_pte+0xdb8/0x11a0
> [  348.224062] lr : move_pages_pte+0x928/0x11a0
> [  348.225881] sp : ffff800088b2b8f0
> [  348.227360] x29: ffff800088b2b970 x28: 0000000000000000 x27: 0000ffffb=
c920000
> [  348.230228] x26: fffffdffc335e4a8 x25: 0000000000000001 x24: fffffdffc=
3e4dd40
> [  348.233159] x23: 080000010d792403 x22: ffff0000cd792900 x21: ffff0000c=
5a6d2c0
> [  348.236339] x20: fffffdffc335e4a8 x19: 0000000000001004 x18: 000000000=
0000006
> [  348.239269] x17: 0000ffffbc920000 x16: 0000ffffbc922fff x15: 000000000=
0000003
> [  348.242703] x14: ffff8000812c3b68 x13: 0000000000000003 x12: 000000000=
0000003
> [  348.245947] x11: 0000000000000000 x10: ffff800081e4feb8 x9 : 000000000=
0000001
> [  348.249284] x8 : 0000000000000000 x7 : 6f696c6f6620746f x6 : 47203a475=
5424544
> [  348.252071] x5 : ffff8000815789e3 x4 : ffff8000815789e5 x3 : 000000000=
0000000
> [  348.255358] x2 : ffff0001fed2aef0 x1 : 0000000000000000 x0 : fffffdffc=
335e4a8
> [  348.258134] Call trace:
> [  348.259468]  move_pages_pte+0xdb8/0x11a0 (P)
> [  348.261348]  move_pages+0x3c0/0x738
> [  348.262987]  userfaultfd_ioctl+0x3d8/0x1f98
> [  348.264916]  __arm64_sys_ioctl+0x88/0xd0
> [  348.266779]  invoke_syscall+0x64/0xec
> [  348.268347]  el0_svc_common+0xa8/0xd8
> [  348.269967]  do_el0_svc+0x1c/0x28
> [  348.271711]  el0_svc+0x40/0xe0
> [  348.273345]  el0t_64_sync_handler+0x78/0x108
> [  348.274821]  el0t_64_sync+0x19c/0x1a0
> [  348.276117] ---[ end trace 0000000000000000 ]---
> [  348.278638] Moving folio fffffdffc3e4dd40 (folio->swap =3D 0), orig_sr=
c_pte =3D 1
>
> That's the new added WARN, but the test program also hung with D
> forever, and with errors with other tests like:
> [  406.893936] BUG: Bad rss-counter state mm:ffff0000c5a9ddc0
> type:MM_ANONPAGES val:-1
> [  406.894071] BUG: Bad rss-counter state mm:ffff0000c5a9ddc0
> type:MM_SHMEMPAGES val:1
>
> Because the kernel just moved the wrong folio, so unmap takes forever
> looking for the missing folio, and counting went wrong too.
>
> So this race is real. It's extremely unlikely to happen because it
> requires multiple collisions of multiple tiny race windows, however
> it's not impossible.
>
> I'll post a fix very soon.

On second thought, the "filemap_get_folio() returns NULL before
move_swap_pte, but a folio was added to swap cache" case is also
buggy. It can also be reproduced with the program above with slight
modification:

--- test-uffd.c 2025-05-30 08:34:00.485206529 +0000
+++ test-uffd-same-folio.c      2025-05-30 19:04:13.826078271 +0000
@@ -83,20 +83,20 @@
     /* Release src folio (A) from swap, freeing the entry S1 */
     read_in(src);

-    /* Swapout another race folio (B) using S1 */
+    /* Swapout and free another race folio (B) forcing reclaiming S1
and folio (A) */
     race =3D mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED |
MAP_ANONYMOUS, -1, 0);
     memset(race, 0xAA, PAGE_SIZE);
     madvise(race, PAGE_SIZE, MADV_PAGEOUT);
+    read_in(race);
+    printf("RECLAMING A?\n");

-    /* Wait for UFFDIO swap lookup to see the race folio (B) */
+    /* Wait for UFFDIO swap lookup to see NULL */
     sleep(3);

-    /* Free the race folio (B) from swap */
-    read_in(race);
     /* And swap out src folio (A) again, using S1 */
     madvise(src, PAGE_SIZE, MADV_PAGEOUT);

-    /* Kernel should have moved a wrong folio by now */
+    /* Kernel should have moved folio (A) but it didn't */

     pthread_join(reader_thr, NULL);
     pthread_cancel(fault_handler_thr);

I'll fix them together.
