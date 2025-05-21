Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47428BEC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795538; cv=none; b=qvuzDUdySLG91yIWeVPp7LSZc80dT2RgYBk9bvv+mFFxx/889zRMCY0TP9Fcz+kwtwpUg7W80KQVjDTlpkyx+nvZe4MwsE0Z6N2bqReQhd0OoqFbVydWgJGXVncGWK5/iXKz4ctWNCKQqR7q7pE0BeEuIVdEXPofY30/iXHSZ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795538; c=relaxed/simple;
	bh=id/hzbSdQxdfP6M6p9up+k58aWZu6joq6fGrCveN1bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kP/agUEAk3vyBbaJoynPJ58rb0c5ASTeE17XYX5MLpQq/6A+8ARphRdda0sXSUSbyEswjb7GdSpSQ+FNWEDBPHBrYYFRnY3qUuD/Q5WZnMvBfiAeINhKwdDRNAUGfW17WrgnUhGO3md4uiyUrXQDW7BYEd0xQ+YjZvarSFzmLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQXe+PiV; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQXe+PiV"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so60738161fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747795535; x=1748400335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekWVNyS5Ehqk/LS3e/3t4Uu2hE0jQa8FW1yvGkAqang=;
        b=fQXe+PiV4g6JCxCQVJvTFnzBEoze9oe6B206GwTB82uKqEGPeXeEideJx8FzMN6fVz
         EPoGNBtrpZyjFJKXbRTn9DS4O56E68L7ZVhCvWHchSw8+q8QsirZ42pxGoFFyV4UL7qQ
         U1Wmf3tyob6O4DHMCN+nYNZqJWYZSdqIWMpPyhwfYrhvn6wAUEPe1pG1hvpAYPfxFMK3
         HcGjvABsX6/SAKNFm00GLKmIMgZE812JIch8yI/8sgjyLpAH6pXLpuMoVV7kAVhmFln2
         CJ6S6P7VqCiJNs2SlsT+8vmOyZM1WKIaAoBMk2l6Xe8ENhnujEDBOk3t/mYHR3rWv5nO
         sicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795535; x=1748400335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekWVNyS5Ehqk/LS3e/3t4Uu2hE0jQa8FW1yvGkAqang=;
        b=vGBdMp+Dg1zBqfNdBdrUmfwKdOiQ3pagBGJV2sVYGOoGJTEzYz3oHN6VKWuCk+1qKY
         P8aoRO8ngf3EWPSZIA90yk/66wywfbUvgrRKNmgO+OzEkAEgIwZ+ZnxS4VIuK+qtTFxV
         hSXrdILrFr/MzfWdju85odp76poZ1M8xvLYMgJqzo54witH9Du4HbTaMy6RnT8kfuELH
         j17XoVdQdKjVF30dHT2pxh+B5RBWdbKEImoDTiUQJWaUhdWRMPVyhrfaQsgzIqGGXBYU
         IYuI6ITjvR5o7CyQ2kk1K6e2Wx2tOjjhwN9O0Gxwabqm0PVf+c10u3vdmZ8TmaW5DaDn
         l2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXbKNDXdI3gmX/5gnQOrXhp6QCDZccCkzQPL0zhoTehyFiM9bIwtC2n6r4nUDw/UtMg99kuOhtdpn3GSB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QEJG39nAuzsBiw4WkL7ohXSyChwoQbVmtlhHuXei+LvYzICl
	GSjYeWlPL9AKKDmw1F2Zl3BrDmhI1i8vgUqixQMUeHC/WZqyDGkEBl9PnFPSCJdt6bxOjBhjafh
	EM+cEg3NlZBPpgpRqxkdTLUM2137PSnM=
X-Gm-Gg: ASbGnctvqdONXz+XdKHFfeTDJUgwUPgGstiTPOZmtw1Ttwzljv4RdEMCxfvL2GEUU6P
	DCwFxqHuaqUYvnGmT+qqitsl/vBp4qfHAJ+A8jp+XJ5nv/Jdnvh25Lr/8aOkBBLvqWoEWwAI2Yg
	HH+m3NNHv5W/e7UgbRolLybRpti1kXb2E=
X-Google-Smtp-Source: AGHT+IGUyYziX3ezJyY+S/9pxHTLIxdL2yhsMx14GQw0tXGQTTnZA4BthMBrSAQicvr8OaEBhYiF3Pz805LHFm7SjA8=
X-Received: by 2002:a2e:a995:0:b0:30c:aae:6d61 with SMTP id
 38308e7fff4ca-3280974eef6mr65341931fa.30.1747795534455; Tue, 20 May 2025
 19:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-6-ryncsn@gmail.com> <20250519043847.1806-1-21cnbao@gmail.com>
 <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com>
 <CAGsJ_4wC5_YSMLNoY5q4hUsZTpD+YPHSBtzCAdWRFH65EJA_iw@mail.gmail.com>
 <CAMgjq7AO__8TFE8ibwQswWmmf4tTGg2NBEJp0aEn32vN+Dy8uw@mail.gmail.com> <CAGsJ_4z1cJfOCcpZDt4EuHK7+SON1r0ptRJNv1h=cDv+eOcdSQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4z1cJfOCcpZDt4EuHK7+SON1r0ptRJNv1h=cDv+eOcdSQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 May 2025 10:45:16 +0800
X-Gm-Features: AX0GCFspAzlf_oLb-7X0sbp31_S7uHzktacxEMv4ktnM4eJqURlBG9mDxUMf1Ac
Message-ID: <CAMgjq7CJ4_9bB=46TVzByFRuOwxNs4da=sN==x8cc++YsV+ETQ@mail.gmail.com>
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

Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=8821=E6=97=A5=
=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, May 21, 2025 at 7:10=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Tue, May 20, 2025 at 12:41=E2=80=AFPM Barry Song <21cnbao@gmail.com>=
 wrote:
> > >
> > > On Tue, May 20, 2025 at 3:31=E2=80=AFPM Kairui Song <ryncsn@gmail.com=
> wrote:
> > > >
> > > > On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@gmail.=
com> wrote:
> > > > >
> > > > > > From: Kairui Song <kasong@tencent.com>
> > > > >
> > > > > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > > > > index e5a0db7f3331..5b4f01aecf35 100644
> > > > > > --- a/mm/userfaultfd.c
> > > > > > +++ b/mm/userfaultfd.c
> > > > > > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_stru=
ct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
> > > > > >                               goto retry;
> > > > > >                       }
> > > > > >               }
> > > > > > +             if (!folio_swap_contains(src_folio, entry)) {
> > > > > > +                     err =3D -EBUSY;
> > > > > > +                     goto out;
> > > > > > +             }
> > > > >
> > > > > It seems we don't need this. In move_swap_pte(), we have been che=
cking pte pages
> > > > > are stable:
> > > > >
> > > > >         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, =
orig_src_pte,
> > > > >                                  dst_pmd, dst_pmdval)) {
> > > > >                 double_pt_unlock(dst_ptl, src_ptl);
> > > > >                 return -EAGAIN;
> > > > >         }
> > > >
> > > > The tricky part is when swap_cache_get_folio returns the folio, bot=
h
> > > > folio and ptes are unlocked. So is it possible that someone else
> > > > swapped in the entries, then swapped them out again using the same
> > > > entries?
> > > >
> > > > The folio will be different here but PTEs are still the same value =
to
> > > > they will pass the is_pte_pages_stable check, we previously saw
> > > > similar races with anon fault or shmem. I think more strict checkin=
g
> > > > won't hurt here.
> > >
> > > This doesn't seem to be the same case as the one you fixed in
> > > do_swap_page(). Here, we're hitting the swap cache, whereas in that
> > > case, there was no one hitting the swap cache, and you used
> > > swap_prepare() to set up the cache to fix the issue.
> > >
> > > By the way, if we're not hitting the swap cache, src_folio will be
> > > NULL. Also, it seems that folio_swap_contains(src_folio, entry) does
> > > not guard against that case either.
> >
> > Ah, that's true, it should be moved inside the if (folio) {...} block
> > above. Thanks for catching this!
> >
> > > But I suspect we won't have a problem, since we're not swapping in =
=E2=80=94
> > > we didn't read any stale data, right? Swap-in will only occur after w=
e
> > > move the PTEs.
> >
> > My concern is that a parallel swapin / swapout could result in the
> > folio to be a completely irrelevant or invalid folio.
> >
> > It's not about the dst, but in the move src side, something like:
> >
> > CPU1                             CPU2
> > move_pages_pte
> >   folio =3D swap_cache_get_folio(...)
> >     | Got folio A here
> >   move_swap_pte
> >                                  <swapin src_pte, using folio A>
> >                                  <swapout src_pte, put folio A>
> >                                    | Now folio A is no longer valid.
> >                                    | It's very unlikely but here SWAP
> >                                    | could reuse the same entry as abov=
e.
>
>
> swap_cache_get_folio() does increment the folio's refcount, but it seems =
this
> doesn't prevent do_swap_page() from freeing the swap entry after swapping
> in src_pte with folio A, if it's a read fault.
> for write fault, folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(folio)=
)
> will be false:
>
> static inline bool should_try_to_free_swap(struct folio *folio,
>                                            struct vm_area_struct *vma,
>                                            unsigned int fault_flags)
> {
>        ...
>
>         /*
>          * If we want to map a page that's in the swapcache writable, we
>          * have to detect via the refcount if we're really the exclusive
>          * user. Try freeing the swapcache to get rid of the swapcache
>          * reference only in case it's likely that we'll be the exlusive =
user.
>          */
>         return (fault_flags & FAULT_FLAG_WRITE) && !folio_test_ksm(folio)=
 &&
>                 folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(folio))=
;
> }
>
> and for swapout, __removing_mapping does check refcount as well:
>
> static int __remove_mapping(struct address_space *mapping, struct folio *=
folio,
>                             bool reclaimed, struct mem_cgroup *target_mem=
cg)
> {
>         refcount =3D 1 + folio_nr_pages(folio);
>         if (!folio_ref_freeze(folio, refcount))
>                 goto cannot_free;
>
> }
>
> However, since __remove_mapping() occurs after pageout(), it seems
> this also doesn't prevent swapout from allocating a new swap entry to
> fill src_pte.
>
> It seems your concern is valid=E2=80=94unless I'm missing something.
> Do you have a reproducer? If so, this will likely need a separate fix
> patch rather than being hidden in this patchset.

Thanks for the analysis. I don't have a reproducer yet, I did some
local experiments and that seems possible, but the race window is so
tiny and it's very difficult to make the swap entry reuse to collide
with that, I'll try more but in theory this seems possible, or at
least looks very fragile.

And yeah, let's patch the kernel first if that's a real issue.

>
> >     double_pt_lock
> >     is_pte_pages_stable
> >       | Passed because of entry reuse.
> >     folio_move_anon_rmap(...)
> >       | Moved invalid folio A.
> >
> > And could it be possible that the swap_cache_get_folio returns NULL
> > here, but later right before the double_pt_lock, a folio is added to
> > swap cache? Maybe we better check the swap cache after clear and
> > releasing dst lock, but before releasing src lock?
>
> It seems you're suggesting that a parallel swap-in allocates and adds
> a folio to the swap cache, but the PTE has not yet been updated from
> a swap entry to a present mapping?
>
> As long as do_swap_page() adds the folio to the swap cache
> before updating the PTE to present, this scenario seems possible.

Yes, that's two kinds of problems here. I suspected there could be an
ABA problem while working on the series, but wasn't certain. And just
realised there could be another missed cache read here thanks to your
review and discussion :)

>
> It seems we need to double-check:
>
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index bc473ad21202..976053bd2bf1 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1102,8 +1102,14 @@ static int move_swap_pte(struct mm_struct *mm,
> struct vm_area_struct *dst_vma,
>         if (src_folio) {
>                 folio_move_anon_rmap(src_folio, dst_vma);
>                 src_folio->index =3D linear_page_index(dst_vma, dst_addr)=
;
> +       } else {
> +               struct folio *folio =3D
> filemap_get_folio(swap_address_space(entry),
> +                                       swap_cache_index(entry));
> +               if (!IS_ERR_OR_NULL(folio)) {
> +                       double_pt_unlock(dst_ptl, src_ptl);
> +                       return -EAGAIN;
> +               }
>         }
> -
>         orig_src_pte =3D ptep_get_and_clear(mm, src_addr, src_pte);
>  #ifdef CONFIG_MEM_SOFT_DIRTY
>         orig_src_pte =3D pte_swp_mksoft_dirty(orig_src_pte);

Maybe it has to get even dirtier here to call swapcache_prepare too to
cover the SYNC_IO case?

>
> Let me run test case [1] to check whether this ever happens. I guess I ne=
ed to
> hack kernel a bit to always add folio to swapcache even for SYNC IO.

That will cause quite a performance regression I think. Good thing is,
that's exactly the problem this series is solving by dropping the SYNC
IO swapin path and never bypassing the swap cache, while improving the
performance, eliminating things like this. One more reason to justify
the approach :)

>
> [1] https://lore.kernel.org/linux-mm/20250219112519.92853-1-21cnbao@gmail=
.com/

I'll try this too.

>
> >
> >
> > >
> > > >
> > > > >
> > > > > Also, -EBUSY is somehow incorrect error code.
> > > >
> > > > Yes, thanks, I'll use EAGAIN here just like move_swap_pte.
> > > >
> > > >
> > > > >
> > > > > >               err =3D move_swap_pte(mm, dst_vma, dst_addr, src_=
addr, dst_pte, src_pte,
> > > > > >                               orig_dst_pte, orig_src_pte, dst_p=
md, dst_pmdval,
> > > > > >                               dst_ptl, src_ptl, src_folio);
> > > > > >
> > > > >
> > >
>
> Thanks
> Barry
