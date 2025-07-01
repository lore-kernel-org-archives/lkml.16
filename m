Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1C21CC40
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395827; cv=none; b=ZT0/MmnZ7u5wBeEgrQZ/DqdivusYvOcK8/L0/x05t2rrdO8n7qwt9UKnhISA61GiXmqYabh19CVOH6/tvkMYsXqvHt9X6LHVmGjPBFIhUFgHsE0KEimwuFZqazzXgfImV86iPGSEj1uL1WySOAJOpJAhIj0FueZ2fiHWtv7JCkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395827; c=relaxed/simple;
	bh=BbGfRYABRfNarTMJVkF6/M7jnu2ZhSuS0jdJejbKKFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGxxb1gO8o3yWYmqdNC2iUFNupGsuRu3GqEaY1VlZybsUdPzgTHD47+1L8rQ5jjPNChCFcYC+m4Qlo4gHca17fSkwCvn2BU6B5O1JZcNSOpykMSum0pc9lViPBxFbxIOH8eKMOfKK2XiSElqmdwBBafsqNVqlb4TqnJQKTJGDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwMcMvfV; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwMcMvfV"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40aef72f252so1881912b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751395825; x=1752000625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeaXLDhnOR+ESQPZpiJeZ8DJiZobAk1i38knqNaGybY=;
        b=IwMcMvfV2MoB/0ZBXcD/oMNmA36r4/NTwqNbfqany2QNKp2tiEfsVPHDI1PRlozEGf
         gtgWvk/25kdjq2lxRwc8R0jQWTnk+42ZAQ+B3JHXvp4un2qmNhhq/Xz77vWh7UK4hOdc
         gmQo2UKOAmTW6yAFtJuo5wznFzvy/BHsbz9kCsKkVNqU1MY/hcvrV60IpTpKWholWrwE
         0RCFoVg1PcpoxSl0lBg7hhqaWfzgVzEgOoM4FSdsjzDi+f33U0LIW6olYvAtDh3pnuh2
         O92rlRCUYLo23aX0F7t8CYXWZmsk+YR7ob7zvc0Z1TmzmHyCqFC4c57ueSmY7QuSpwi8
         lMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751395825; x=1752000625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeaXLDhnOR+ESQPZpiJeZ8DJiZobAk1i38knqNaGybY=;
        b=k6KLelOR+HpVxCq6YmzQ/RaP8+Xa6EKOk+dT344bBNEXy7PJs+V68GT2Mh4FTE6put
         6sRCQM5BrsvMad7GjT9Ux405BO+A4IFyoqACOGi6uNS7p9RhDci+nEN0w/MG5IX2Jo4I
         DxDGP81j6BxP+vksEW96ugpJG52AWtA1buVBOOHxSJKXiXa7y7fPsc0Fat/gTdV61Hjt
         b4QO489Hz3w5uFSl/GIObF6T9InAahQoShjgCbsjuUrk6JmRDioxy6KxbCAtDo4AKJFZ
         sUnncmyuYUTEtQvMI3kA0ONBkUJkIV/f9pcIJlyTyimDBoK38IvDtGtgdnAGhE1lw3bq
         ix9w==
X-Forwarded-Encrypted: i=1; AJvYcCWg73m+68SkkU+dYQChyp0lpexha672L/4eGZe7NDfOo3McB1GdbP2tWYDUzqVNhzqYLBNwUZ1xC7UO9uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD6TBri4hxyFkJ0Iwq7HE7/Yz5VtAUceTUr0n5114IPBaMVyHL
	tMKKFJ86hKcrUQrknVLXfz202Id+zR0nakWD1+6nFc0Va8SZVNML/v4hnBwby/Q1bsOQMUJE2bF
	s3mKS5ynrXNRyOCpWgBfLHwhsire4ZX8=
X-Gm-Gg: ASbGncu7bgsu7a/sWH+BiFAyMA8Fvg7Lf5rusTfiU625PJKlCXrp1SXcGBzgyX+8tRb
	n7Zj30SNB2G8wqr2+dYrCI2jG23lG6rpwASLnRGtJ/lGOZBNI51inAPt6f6aW/Vu4syth/MiTGw
	7PW50xF37cNmCoFzlSCVtuZMtP7NLOpd7fcNQKZrxiXpY=
X-Google-Smtp-Source: AGHT+IGqJAqh4cagMVs/WdFDeJnSt3JtSO0gUJfO3THRo/y9r4c0nqFkmSQ4917g2ZM26sc3x+13nRS/Z8vUhY7RzYo=
X-Received: by 2002:a05:6808:1206:b0:40a:547c:20a2 with SMTP id
 5614622812f47-40b33c181ecmr14215013b6e.6.1751395824758; Tue, 01 Jul 2025
 11:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627062020.534-1-ryncsn@gmail.com> <20250627062020.534-5-ryncsn@gmail.com>
 <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com> <CAMgjq7Dc4QJAkxFpAkzXk-8Xe5zyx2HUzNKpoq_sqbyZUFpOkA@mail.gmail.com>
 <ce54b1b1-1d3a-4783-bb76-6d4d4e902dac@linux.alibaba.com> <CAMgjq7CmK3g_QpepGJP9Cyu2aA7t+R4XN+NQDqouLCKKF+RJPA@mail.gmail.com>
 <1102fb2b-3e2e-4ae2-8609-cff6a4b0d821@linux.alibaba.com> <CAMgjq7D8wPJECCdsRzHkTNXN9Ot5A7Op+9BH83_ojDjtp=GCUg@mail.gmail.com>
 <ddf1f0f0-dfb9-4df0-9bfa-df9c5cf39ec5@linux.alibaba.com>
In-Reply-To: <ddf1f0f0-dfb9-4df0-9bfa-df9c5cf39ec5@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 2 Jul 2025 02:49:41 +0800
X-Gm-Features: Ac12FXyEfAG5Dsjjc73_PzpmDuMtBKKASw3zCfUHsbPX9x-om_EVWeTXdoHcAso
Message-ID: <CAMgjq7Cvtx-2eVqcJY9K6DQ_G7zg8t6wCnS_H2TpW-_08jyoug@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 9:57=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 2025/7/1 02:19, Kairui Song wrote:
> > On Mon, Jun 30, 2025 at 7:59=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >> On 2025/6/30 18:06, Kairui Song wrote:
... snip ...
> >>> It can only allocate order 0 folio, but It can hit a large folio: eg.
> >>> a parallel swapin/swapout happened, and the folio stays in swap cache=
,
> >>> while we are handling a swapin here.
> >>
> >> Yes, I know this. This is exactly the issue that patch 1 wants to fix.
> >
> > Hmm, patch 1 prevents the hang but doesn't prevent things like a
> > duplicated fault:
> >
> > Starts with:
> > swap entry val =3D 0x400, order =3D 4, covering index 0 - 15, faulting =
index 3:
> >
> > Before this patch:
> > CPU0                        CPU1
> > shmem_swapin_folio (see order =3D 4)
> >                              shmem_swapin_folio (see order =3D 4)
> >    /* fallback to order 0 due to */
> >    /* mem pressure / temporary pin / etc */
> >    shmem_split_large_entry
> >    /* split to order 0 */
> >    /* interrupted */
> >                              /* swapin done with order =3D 4 folio */
> >                              /* swapout again, leave the large folio
> >                                 in cache temporarily  */
> >    folio =3D swap_cluster_readahead(0x403)
> >    /* Gets folio order =3D 4, folio->swap =3D 0x400
> >       since swap_cluster_readahead uses swap cache */
> >    folio->swap.val !=3D swap.val
> >    /* ! Above test failed ! */
> >    /* It shouldn't fail the round down is needed */
>
> OK. Thanks for the explanation. Yes, this might cause a refault.
>
> > This patch moved the split after the swapin so it should be OK now,
>
> Yes, I agree 'moving the split after the swapin'.
>
> > but still the split_order could be unstable, see below:
>
> >>>>> And I'm not sure if split_order is always reliable here, for exampl=
e
> >>>>> concurrent split may return an inaccurate value here.
> >>>>
> >>>> We've held the xas lock to ensure the split is reliable, even though
> >>>> concurrent splits may occur, only one split can get the large
> >>>> 'split_order', another will return 0 (since it will see the large sw=
ao
> >>>> entry has already been split).
> >>>
> >>> Yes, it may return 0, so we can get a large folio here, but get
> >>> `split_order =3D 0`?
> >>
> >> If split happens, which means the 'order' > folio_order(), right? how
> >> can you get a large folio in this context?
> >>
> >>> And if concurrently swapout/swapin happened, the `split_order` could
> >>> be a different value?
> >>
> >> What do you mean different value? The large swap entry can only be spl=
it
> >> once, so the 'split_order' must be 0 or the original large order.
> >
> > Since d53c78fffe7ad, shmem_split_large_entry doesn't split every slot
> > into order 0 IIUC, so things get complex if two CPUs are faulting on
> > different indexes landing into two different splitting zones:
> >
> > Before this patch:
> > swap entry val =3D 0x400, order =3D 9, covering index 0 - 511, faulting=
 index 3:
> >
> > CPU0                           CPU1
> > shmem_swapin_folio (index =3D 3)
> >                                 shmem_swapin_folio (index =3D 510)
> >    /* Gets swap =3D 0x400 */      /* Gets swap =3D 0x400 */
> >    /* fallback to order 0 */    /* fallback to order 0 */
> >    split_order =3D shmem_split_large_entry
> >    /* get split_order =3D 512 */
> >    /* offset =3D 3 */
> >                                 split_order =3D shmem_split_large_entry
> >                                 /* get split_order =3D 0, but no split =
*/
> >                                 /* map order is 8, offset =3D 0 */
> >                                 /* wrong offset */
> >                                 shmem_swapin_cluster(0x400)
> >                                 /* It should swapin 0x5fe */
>
> Not ture. IIUC, the CPU1 will failed to split due to
> 'swp_to_radix_entry(swap) !=3D old' in shmem_split_large_entry(), and wil=
l
> retry again to fix this race.
>
> > After this patch (with the append fix which was left in latest patch
> > by mistake) it won't swapin wrong entry now, but
> > shmem_split_large_entry may still return a outdated order.
>
> Like I said above, I don't think we can get a outdated order,right?
>
> > That's two previous races I can come up with. These no longer exist
> > after this patch, it's not a bug though, just redundant IO as far as I
> > can see because other checks will fallback, looks a bit fragile
> > though. But shmem_split_large_entry may still return invalid order,
> > just much less likely.
> >
> > I think the ideology here is, because the `order =3D
> > shmem_confirm_swap(mapping, index, swap)` ensures order is stable and
> > corresponds to the entry value at one point, so keep using that value
> > is better (and so this patch does the offset and calculation using the
> > `order` retrieved there before issues the swapin).
>
> I don't think that the 'order' obtained through the shmem_confirm_swap()
> is stable, because shmem_confirm_swap() is only protected by RCU.
> However, I think the 'split_order' obtained from
> shmem_split_large_entry() under the xas lock is stable.
>
> > And after the swapin have brought a folio in, simply round down using
> > the folio's order, which should ensure the folio can be added
> > successfully in any case as long as the folio->swap and index fits the
> > shmem mapping fine.
> >
> >>>> Based on your current patch, would the following modifications be cl=
earer?
> >>>>
> >>>> diff --git a/mm/shmem.c b/mm/shmem.c
> >>>> index 5be9c905396e..91c071fb7b67 100644
> >>>> --- a/mm/shmem.c
> >>>> +++ b/mm/shmem.c
> >>>> @@ -2254,7 +2254,7 @@ static int shmem_split_swap_entry(struct inode
> >>>> *inode, pgoff_t index,
> >>>>            if (xas_error(&xas))
> >>>>                    return xas_error(&xas);
> >>>>
> >>>> -       return 0;
> >>>> +       return split_order;
> >>>>     }

Sorry about the bad example, I got confused looking at the wrong code
base and deduced a wrong stack. Before this series it was returning
entry_order here so yeah it's OK.

> >>>>
> >>>>     /*
> >>>> @@ -2351,10 +2351,23 @@ static int shmem_swapin_folio(struct inode
> >>>> *inode, pgoff_t index,
> >>>>                    error =3D shmem_split_swap_entry(inode, index, sw=
ap, gfp);
> >>>>                    if (error)
> >>>>                            goto failed_nolock;
> >>>> -       }
> >>>>
> >>>> -       index =3D round_down(index, 1 << swap_order);
> >>>> -       swap.val =3D round_down(swap.val, 1 << swap_order);
> >>>> +               /*
> >>>> +                * If the large swap entry has already been split, i=
t is
> >>>> +                * necessary to recalculate the new swap entry based=
 on
> >>>> +                * the old order alignment.
> >>>> +                */
> >>>> +               if (split_order > 0) {
> >
> > The split_order could still be an outdated value, eg. we may even get
> > split_order =3D 0 with a large folio loaded here.
>
> Ditto. I didn't see split_order can be an outdated value.

The problem is, could split_order be 0 while getting a large folio,
which is like the problem in patch 1.
This patch changed the race window by a lot, even if that happens,
shmem_split_swap_entry will just fail and retry though.

Or, can it get a split_order !=3D 0 while folio order =3D=3D 0:

So assume we do (check split_order instead, trimming all comments):
if (order > folio_order(folio)) {
    split_order =3D shmem_split_swap_entry(inode, index, swap, gfp);
    if (split_order < 0)
        goto failed_nolock;
    if (split_order > 0) {
        offset =3D index - round_down(index, 1 << split_order);
        swap =3D swp_entry(swp_type(swap), swp_offset(swap) + offset);
        /* Could we get unnecessary `folio->swap !=3D swap`? */
    } else {
        /* Do we need any rounding here? */
        /* eg. swap.val =3D round_down(swap.val, 1 << folio_order(folio)) *=
/
        /* Could be helpful */
    }
} else if (order < folio_order(folio)) {
    swap.val =3D round_down(swap.val, 1 << folio_order(folio));
}

I was scratching my head in the midnight to figure out if we
need a round down in the /* Do we need any rounding here */ part.

And it seems, we don't? There could be a lot of races, but because
shmem_split_swap_entry is now actually
guarded by swap cache (or swap_map's HAS_CACHE) now: to split an
index, we must load the folio in the swap cache (or the HAS_CACHE bit)
first now. So if a large folio is loaded here, the underlying entries
must remain un-splitted, as it prevents any parallel swapin for
entries is covered.

But this also requires us to call shmem_split_swap_entry with the
right swap and index value covered by the folio (if not, it's still
OK, just redundant split or redundant fault in the worst case it
seems, this clean up can be done later instead).

But there is still a missing issue that I posted previously, it really
should do a ealy fixup of the swap entry for the cached swapin in this
patch (it's delayed to the final patch in this series):

So the shmem_swapin_cluster call should be:

/* Cached swapin currently only supports order 0 swapin */
offset =3D index - round_down(index, 1 << order);
folio =3D shmem_swapin_cluster(swp_entry(swp_type(swap),
swp_offset(swap) + offset), gfp, info, index);

So far I think it's enough for this patch now. I can send a V4 to
keep this part's change as minimized as possible, but in later commits
things may still have to change a bit... especially for avoiding
redundant calculation of offset and swap, or minimizing the overhead,
ensuring shmem_split_swap_entry is called with the right value to
avoid re-faults.

I'll try my best to keep this part as unchanged as possible, but I do find =
it
somehow harder to track as the swapin path gets more refactors.

My bad for making it confusing in the first place, the patches are
still not very well-splitted enough for easier reviewing I think,
please have my apologies if this is causing any inconvenience for you.
