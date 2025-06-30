Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9D24DCFF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278052; cv=none; b=I/R+ab3gLT/+1l+8aGa+FJlbs4P1FTox3dDs040JM2Ohi7HiRVGRKTFYTPjhH/vCr+bTo0bXTM1nQzUIsPlpesYBXlL1m7yi3E7/JPmXI6b4VTtO9poa1u4M4XM5ejpHEBRDDqbgHdwcJu9LlPoZ3xIu53LNAI0e5YSVFZK9QMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278052; c=relaxed/simple;
	bh=SX4yRLl24V720YVIMGPVyzcl7KHTtraBb2KMKG7/do8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+KgR3OUB89Z8xAstMiGDYdUlFDVQLwCEhLfn+iCu5YeLUsX7tON9EW+H9Tiy8l8BWyJXyWCgo7ybOLFyv7tZlCNmWn3kuTwdXwF9TkW0X/PmMWm+41OoNRUalXCUCXZUtAXMHW71hIub10zxSDJn3fs8/7OWNMik7sw+V4PBJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKfzsAO0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKfzsAO0"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so43122451fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751278048; x=1751882848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yApQn/jz7uaYJvJBlseJlwXBxaJ3ZYx22iioJTZKbg=;
        b=AKfzsAO06q534d/ZrZyPup6JgPSWgQ/b05cbfKms+Ff4ixo0aB6fUvOtICqCkx2VU6
         kJIWl5Czfup3NpXSLcsHuz9UVHbpNGNTETo86PmxqBTbfEi6wbJygJiMKm3kLLO6XiA2
         PhtW7pNeiWq2clDfLZfHVOrPEZRM55+vPmGE9qiohlR0ahbo2kv47U6KH6B2HXhSOehW
         HdAQyXnmsq50qiJkmqYShbXrjacKehztLYpSZlAzDX/H8ELgMFk27miJuZQGoh+aMBeb
         qxPUy3xlyZ5od4DCYAa95pZ7yIiT+Q2cSwJdKvIxrw4Cn3Jnf8EYaCyFPMs10xUYNaGR
         XSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751278048; x=1751882848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yApQn/jz7uaYJvJBlseJlwXBxaJ3ZYx22iioJTZKbg=;
        b=kYywk4RQfd6GWqmd3EocvCpEKSbIYIllUC5KxaKf6mf9P4WnTxm43clyaTnb+7OVma
         yPmH+E8KJx0/xAs43hP/rJAZAgNsfpiZGqW/+CAOpwJ9SB/peo8BtxF5exi3mBnZbeGB
         0V6jThAaKcOSTmG9BQMiwao5QW2jFw3tx7mnc+EV5ivzBSrpQEUpMr083nl4NVqBq15G
         R4NfWMYRs7Qd0mC4EDumfFEdPRwXLG8sev9xqIK4t/sw3v6oI/qNJyy3IeM65w42fe1T
         hnCbfoRTAITfDQA6eDoehdy+/M4YOLvcw4rFTe7mZT9Qtuhpy5VQY0oIduCsmbgDwBu7
         IMNA==
X-Forwarded-Encrypted: i=1; AJvYcCU0FqASLS+6nmPJG4Bh06jXOC/RMOlvluqhchnydcDY0E7pfqb2jVAfm/TAt2nXIfhjGc4VN8a4fKWFtrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRiStFyHJwvfmRt1PXlis+Guo5qJig5QnsEOITZpJuj7/yx6s
	aPcSof6ebzY8WvhPPSJQ1imdfebzbJwBAxMqBohxPt23T1F1PKWWzg8sW4dldqFareJVShQzilI
	4oulyJ3DbSFA+N0wY+wQB03Et0RqfRhI=
X-Gm-Gg: ASbGncsyB8ml2Jphrd39EiyXAdsWyV49I7Sl80X3Op8G7PLYK6assmiutWmPm9k+25Y
	BTABBnv/kVyHRhAAsGgyfKB/Gjmcf6e7fmBIbNSppFMTtsYlZ6evTFC0EU0aooEKgurXWKTat9e
	Z6T5zqy0VpFaKOGkxjF+GbgIGUl9DfMpFSMZWjcHInrHU=
X-Google-Smtp-Source: AGHT+IGnxbHS94ZiV/u6LPxlRPnz8pXczm2KQNzEmIo7l7hFoHyru8skGnmXMVsH/pytuzNTlxhgkMcVEUB1rLkMAYE=
X-Received: by 2002:a2e:bc1c:0:b0:32c:ef7a:ccf9 with SMTP id
 38308e7fff4ca-32cef7ad3aamr19785691fa.32.1751278047821; Mon, 30 Jun 2025
 03:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627062020.534-1-ryncsn@gmail.com> <20250627062020.534-5-ryncsn@gmail.com>
 <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com> <CAMgjq7Dc4QJAkxFpAkzXk-8Xe5zyx2HUzNKpoq_sqbyZUFpOkA@mail.gmail.com>
 <ce54b1b1-1d3a-4783-bb76-6d4d4e902dac@linux.alibaba.com>
In-Reply-To: <ce54b1b1-1d3a-4783-bb76-6d4d4e902dac@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 30 Jun 2025 18:06:49 +0800
X-Gm-Features: Ac12FXzdNg__0QchLEqmf62au7Sut2gWjEl-dCYRGs_hv-9BtLw9MyaltUP-CIc
Message-ID: <CAMgjq7CmK3g_QpepGJP9Cyu2aA7t+R4XN+NQDqouLCKKF+RJPA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 5:53=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 2025/6/30 17:16, Kairui Song wrote:
> > On Mon, Jun 30, 2025 at 2:34=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >> On 2025/6/27 14:20, Kairui Song wrote:
> >>> From: Kairui Song <kasong@tencent.com>
> >>>
> >>> Instead of keeping different paths of splitting the entry and
> >>> recalculating the swap entry and index, do it in one place.
> >>>
> >>> Whenever swapin brought in a folio smaller than the entry, split the
> >>> entry. And always recalculate the entry and index, in case it might
> >>> read in a folio that's larger than the entry order. This removes
> >>> duplicated code and function calls, and makes the code more robust.
> >>>
> >>> Signed-off-by: Kairui Song <kasong@tencent.com>
> >>> ---
> >>>    mm/shmem.c | 103 +++++++++++++++++++++----------------------------=
----
> >>>    1 file changed, 41 insertions(+), 62 deletions(-)
> >>>
> >>> diff --git a/mm/shmem.c b/mm/shmem.c
> >>> index f85a985167c5..5be9c905396e 100644
> >>> --- a/mm/shmem.c
> >>> +++ b/mm/shmem.c
> >>> @@ -2178,8 +2178,12 @@ static void shmem_set_folio_swapin_error(struc=
t inode *inode, pgoff_t index,
> >>>        swap_free_nr(swap, nr_pages);
> >>>    }
> >>>
> >>> -static int shmem_split_large_entry(struct inode *inode, pgoff_t inde=
x,
> >>> -                                swp_entry_t swap, gfp_t gfp)
> >>> +/*
> >>> + * Split an existing large swap entry. @index should point to one su=
b mapping
> >>> + * slot within the entry @swap, this sub slot will be split into ord=
er 0.
> >>> + */
> >>> +static int shmem_split_swap_entry(struct inode *inode, pgoff_t index=
,
> >>> +                               swp_entry_t swap, gfp_t gfp)
> >>>    {
> >>>        struct address_space *mapping =3D inode->i_mapping;
> >>>        XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
> >>> @@ -2250,7 +2254,7 @@ static int shmem_split_large_entry(struct inode=
 *inode, pgoff_t index,
> >>>        if (xas_error(&xas))
> >>>                return xas_error(&xas);
> >>>
> >>> -     return entry_order;
> >>> +     return 0;
> >>>    }
> >>>
> >>>    /*
> >>> @@ -2267,11 +2271,11 @@ static int shmem_swapin_folio(struct inode *i=
node, pgoff_t index,
> >>>        struct address_space *mapping =3D inode->i_mapping;
> >>>        struct mm_struct *fault_mm =3D vma ? vma->vm_mm : NULL;
> >>>        struct shmem_inode_info *info =3D SHMEM_I(inode);
> >>> +     int error, nr_pages, order, swap_order;
> >>>        struct swap_info_struct *si;
> >>>        struct folio *folio =3D NULL;
> >>>        bool skip_swapcache =3D false;
> >>>        swp_entry_t swap;
> >>> -     int error, nr_pages, order, split_order;
> >>>
> >>>        VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> >>>        swap =3D radix_to_swp_entry(*foliop);
> >>> @@ -2321,70 +2325,43 @@ static int shmem_swapin_folio(struct inode *i=
node, pgoff_t index,
> >>>                                goto failed;
> >>>                }
> >>>
> >>> -             /*
> >>> -              * Now swap device can only swap in order 0 folio, then=
 we
> >>> -              * should split the large swap entry stored in the page=
cache
> >>> -              * if necessary.
> >>> -              */
> >>> -             split_order =3D shmem_split_large_entry(inode, index, s=
wap, gfp);
> >>> -             if (split_order < 0) {
> >>> -                     error =3D split_order;
> >>> -                     goto failed;
> >>> -             }
> >>> -
> >>> -             /*
> >>> -              * If the large swap entry has already been split, it i=
s
> >>> -              * necessary to recalculate the new swap entry based on
> >>> -              * the old order alignment.
> >>> -              */
> >>> -             if (split_order > 0) {
> >>> -                     pgoff_t offset =3D index - round_down(index, 1 =
<< split_order);
> >>> -
> >>> -                     swap =3D swp_entry(swp_type(swap), swp_offset(s=
wap) + offset);
> >>> -             }
> >>> -
> >>>                /* Here we actually start the io */
> >>>                folio =3D shmem_swapin_cluster(swap, gfp, info, index)=
;
> >>>                if (!folio) {
> >>>                        error =3D -ENOMEM;
> >>>                        goto failed;
> >>>                }
> >>> -     } else if (order > folio_order(folio)) {
> >>> -             /*
> >>> -              * Swap readahead may swap in order 0 folios into swapc=
ache
> >>> -              * asynchronously, while the shmem mapping can still st=
ores
> >>> -              * large swap entries. In such cases, we should split t=
he
> >>> -              * large swap entry to prevent possible data corruption=
.
> >>> -              */
> >>> -             split_order =3D shmem_split_large_entry(inode, index, s=
wap, gfp);
> >>> -             if (split_order < 0) {
> >>> -                     folio_put(folio);
> >>> -                     folio =3D NULL;
> >>> -                     error =3D split_order;
> >>> -                     goto failed;
> >>> -             }
> >>> -
> >>> -             /*
> >>> -              * If the large swap entry has already been split, it i=
s
> >>> -              * necessary to recalculate the new swap entry based on
> >>> -              * the old order alignment.
> >>> -              */
> >>> -             if (split_order > 0) {
> >>> -                     pgoff_t offset =3D index - round_down(index, 1 =
<< split_order);
> >>> -
> >>> -                     swap =3D swp_entry(swp_type(swap), swp_offset(s=
wap) + offset);
> >>> -             }
> >>> -     } else if (order < folio_order(folio)) {
> >>> -             swap.val =3D round_down(swap.val, 1 << folio_order(foli=
o));
> >>>        }
> >>>
> >>>    alloced:
> >>> +     /*
> >>> +      * We need to split an existing large entry if swapin brought i=
n a
> >>> +      * smaller folio due to various of reasons.
> >>> +      *
> >>> +      * And worth noting there is a special case: if there is a smal=
ler
> >>> +      * cached folio that covers @swap, but not @index (it only cove=
rs
> >>> +      * first few sub entries of the large entry, but @index points =
to
> >>> +      * later parts), the swap cache lookup will still see this foli=
o,
> >>> +      * And we need to split the large entry here. Later checks will=
 fail,
> >>> +      * as it can't satisfy the swap requirement, and we will retry
> >>> +      * the swapin from beginning.
> >>> +      */
> >>> +     swap_order =3D folio_order(folio);
> >>
> >> Nit: 'swap_order' is confusing, and can you just use folio_order() or =
a
> >> btter name?
> >
> > Good idea.
> >
> >>
> >>> +     if (order > swap_order) {
> >>> +             error =3D shmem_split_swap_entry(inode, index, swap, gf=
p);
> >>> +             if (error)
> >>> +                     goto failed_nolock;
> >>> +     }
> >>> +
> >>> +     index =3D round_down(index, 1 << swap_order);
> >>> +     swap.val =3D round_down(swap.val, 1 << swap_order);
> >>
> >> The round_down() of index and swap value here may cause
> >> shmem_add_to_page_cache() to fail to insert a new folio, because the
> >> swap value stored at that index in the shmem mapping does not match,
> >> leading to another swapin page fault for correction.
> >>
> >> For example, shmem stores a large swap entry of order 4 in the range o=
f
> >> index 0-64. When a swapin fault occurs at index =3D 3, with swap.val =
=3D
> >> 0x4000, if a split happens and this round_down() logic is applied, the=
n
> >> index =3D 3, swap.val =3D 0x4000. However, the actual swap.val should =
be
> >> 0x4003 stored in the shmem mapping. This would cause another swapin fa=
ult.
> >
> > Oops, I missed a swap value fixup in the !SWP_SYNCHRONOUS_IO path
> > above, it should re-calculate the swap value there. It's fixed in the
> > final patch but left unhandled here. I'll update this part.
> >
> >>
> >> I still prefer my original alignment method, and do you find this will
> >> cause any issues?
> >>
> >> "
> >> if (split_order > 0) {
> >>          pgoff_t offset =3D index - round_down(index, 1 << split_order=
);
> >>
> >>          swap =3D swp_entry(swp_type(swap), swp_offset(swap) + offset)=
;
> >> }
> >> "
> >
> > It only fits the cached swapin and uncached swapin, not the cache hit
> > case. Cache hits may see a larger folio so split didn't happen, but
> > the round_down is still needed.
>
> IMO, this only fits for the large swap entry split case.
>
> > And there is another racy case: before this patch, the split may
> > happen first, but shmem_swapin_cluster brought in a large folio due to
> > race in the swap cache layer.
>
> shmem_swapin_cluster() can only allocate order 0 folio, right?

It can only allocate order 0 folio, but It can hit a large folio: eg.
a parallel swapin/swapout happened, and the folio stays in swap cache,
while we are handling a swapin here.

>
> > And I'm not sure if split_order is always reliable here, for example
> > concurrent split may return an inaccurate value here.
>
> We've held the xas lock to ensure the split is reliable, even though
> concurrent splits may occur, only one split can get the large
> 'split_order', another will return 0 (since it will see the large swao
> entry has already been split).

Yes, it may return 0, so we can get a large folio here, but get
`split_order =3D 0`?

And if concurrently swapout/swapin happened, the `split_order` could
be a different value?

>
> Based on your current patch, would the following modifications be clearer=
?
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 5be9c905396e..91c071fb7b67 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2254,7 +2254,7 @@ static int shmem_split_swap_entry(struct inode
> *inode, pgoff_t index,
>          if (xas_error(&xas))
>                  return xas_error(&xas);
>
> -       return 0;
> +       return split_order;
>   }
>
>   /*
> @@ -2351,10 +2351,23 @@ static int shmem_swapin_folio(struct inode
> *inode, pgoff_t index,
>                  error =3D shmem_split_swap_entry(inode, index, swap, gfp=
);
>                  if (error)
>                          goto failed_nolock;
> -       }
>
> -       index =3D round_down(index, 1 << swap_order);
> -       swap.val =3D round_down(swap.val, 1 << swap_order);
> +               /*
> +                * If the large swap entry has already been split, it is
> +                * necessary to recalculate the new swap entry based on
> +                * the old order alignment.
> +                */
> +               if (split_order > 0) {
> +                       pgoff_t offset =3D index - round_down(index, 1 <<
> split_order);
> +
> +                       swap =3D swp_entry(swp_type(swap),
> swp_offset(swap) + offset);
> +               }
> +       } else if (order < folio_order(folio)) {
> +               /*
> +                * TODO; explain the posible race...
> +                */
> +               swap.val =3D round_down(swap.val, 1 << folio_order(folio)=
);
> +       }
>
>          /* We have to do this with folio locked to prevent races */
>          folio_lock(folio);
> @@ -2382,7 +2395,8 @@ static int shmem_swapin_folio(struct inode *inode,
> pgoff_t index,
>                          goto failed;
>          }
>
> -       error =3D shmem_add_to_page_cache(folio, mapping, index,
> +       error =3D shmem_add_to_page_cache(folio, mapping,
> +                                       round_down(index, nr_pages),
>                                          swp_to_radix_entry(swap), gfp);
>          if (error)
>                  goto failed;
>
> > So I wanted to simplify it: by round_down(folio_order(folio)) we
> > simply get the index and swap that will be covered by this specific
> > folio, if the covered range still has the corresponding swap entries
> > (check and ensured by shmem_add_to_page_cache which holds the
> > xa_lock), then the folio will be inserted back safely and
> > successfully.
>

I think adding the missing swap value fixup in the !SYNC_IO path
should be good enough?

diff --git a/mm/shmem.c b/mm/shmem.c
index 5be9c905396e..2620e4d1b56a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2276,6 +2276,7 @@ static int shmem_swapin_folio(struct inode
*inode, pgoff_t index,
        struct folio *folio =3D NULL;
        bool skip_swapcache =3D false;
        swp_entry_t swap;
+       pgoff_t offset;

        VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
        swap =3D radix_to_swp_entry(*foliop);
@@ -2325,7 +2326,9 @@ static int shmem_swapin_folio(struct inode
*inode, pgoff_t index,
                                goto failed;
                }

-               /* Here we actually start the io */
+               /* Cached swapin currently only supports order 0 swapin */
+               /* It may hit a large folio but that's OK and handled below=
 */
+               offset =3D index - round_down(index, 1 << order);
+               swap.val =3D swap.val + offset;

                folio =3D shmem_swapin_cluster(swap, gfp, info, index);
                if (!folio) {
                        error =3D -ENOMEM;
