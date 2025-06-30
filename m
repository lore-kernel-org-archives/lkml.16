Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713572613
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751307612; cv=none; b=IOVzfX1sRliF8HswkUAInXkyXjSXk/9wkDpxPPTWs7K6Lsz+oxV4wS22lUK+rlm2EoVRWv/irXMMQessN3PbC4VFLSVIV9xfO8zF9W0j65IuO8hbgQFHu35AjB0Iwi7XEXDXmVv/c57H2z4PwnErdRw1aViC8Feka2JWz46Mq+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751307612; c=relaxed/simple;
	bh=PyF0/btW/+EWYwZUX3/MdZqapjRhNioOpuY/SKvIez4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnLbO+HUDh357GlpoXewI0sMapTh8bORQ2Vzg9hqnqjraNcyICzOsIdvTt6iXhAPqsDmB2IyNO37l9w3vxsqkNYdTfR3E283sIEMzYuLgNHvIG/rQAmUHy7viIdSSQF6OJAYVFg67+wyXLSjb2aQmooriksO5mDR3on0NUmuLxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7kzSKXv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7kzSKXv"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso48220461fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751307605; x=1751912405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgQEndvV070jbZmVprPSkC0YmLtRqW4yjoRhYm2MBHI=;
        b=J7kzSKXvD3KTH7FPjvzmxl5FAnk19BfjlCdJRBH4/qWGHTFQrSFeYlAbstQ/awKsal
         1b2UDHibckiLsX8/wCLWOhJtmgB4UWclyN7sUfVK3YKT+gBzx1ai0+MUGOAQ7CGadTit
         uxmo1ltX8OL2y5QKeqtt8PlVu+eybQ4Z+GPN6dOcXDK8Dy+8+vvC1YZE36eelKs94OVU
         KvtnUZHtYwQbYiY0DXR8xIKVo4QnQDKcpRjE+aU8cWSCtCpw27x0DEKBmYLg6aYSzj21
         NGLF5PiMSFqFWoUAMn+AOp9uu1hNdPbLCNHbADxYQbvL8dYRCjujqYvIJNcCnu6nH4H5
         rxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307605; x=1751912405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgQEndvV070jbZmVprPSkC0YmLtRqW4yjoRhYm2MBHI=;
        b=T1ET4CEQpqF3EAXfGfEuhnFfVo4o9ExlEALOnJVGhpFKzZQStpU//OPUvvLE4l7k7B
         z7jtB/D1JfsAiuycH+h3QlOTnVDfTehNLICmK1D+VFq5+kq9IROT6sB8gZ9gk0+SSfln
         sg71979KfBZC9k/XS3k1wTbcl/8EeL6kPhF4bXvWJ7v1GvXvsS2GZjRAJNUlFNv+5Ans
         tKx+ZxbIBJcc9No3CpX++XeSiJ9JPw6iUPZiLQzP3e1IaLxylXCjBp2FpBX12ILWzvY5
         kyOrye8jB9fscvssVh31eLx6uORv5ot422QTOKxVa/v8Wt9qIMe+BY5sxTuiUePntKJT
         BjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTbKwPgQmVKOorOtEkGexqtAljSa7JFldE7LVuAO17R/GuxUT8dm+jkN4Nw0npZUaVNedS8piN9irKWN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJzRqWdCf3ra/p8/HRBe0vbGulFGx71DjCOiqakmRU1585qh+
	oo+XN2K4FP+m9adxbNeyEtJz/aEk4YvPh2EUCoNuKFiTGoakHp0LnB9GgGUUBLtj8HVyzId1nC+
	WDYcs4v3kbPiczD92An35WByh5uTjzhY=
X-Gm-Gg: ASbGncsL6AqGocOJCCmdkr5KU1Fxmi+eA3H27uu1yAyuMiInJqkedMQBzs7cli3VNv4
	1jYeVLM7Z29jsxjkmaPKfb6PMXkb9iQmplNVPIEn5Jz/X2GZigNQDWfG6eKceXiJNA8t6XF0O76
	Y5Ae0pKYD7gwdKVemR1MmsJYsUM5cj2WUPRHGgzq2wmio=
X-Google-Smtp-Source: AGHT+IFwVR3xIWifIDP4t023xJNSIg5V9Q+EF5n0Bus/lHd8Waz99pPJyGFu/jgp+6lcjr6vWt9F0f+8KftZWoV8/9g=
X-Received: by 2002:a05:651c:169b:b0:32b:905b:7417 with SMTP id
 38308e7fff4ca-32cdc51e545mr34822441fa.35.1751307604452; Mon, 30 Jun 2025
 11:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627062020.534-1-ryncsn@gmail.com> <20250627062020.534-5-ryncsn@gmail.com>
 <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com> <CAMgjq7Dc4QJAkxFpAkzXk-8Xe5zyx2HUzNKpoq_sqbyZUFpOkA@mail.gmail.com>
 <ce54b1b1-1d3a-4783-bb76-6d4d4e902dac@linux.alibaba.com> <CAMgjq7CmK3g_QpepGJP9Cyu2aA7t+R4XN+NQDqouLCKKF+RJPA@mail.gmail.com>
 <1102fb2b-3e2e-4ae2-8609-cff6a4b0d821@linux.alibaba.com>
In-Reply-To: <1102fb2b-3e2e-4ae2-8609-cff6a4b0d821@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 1 Jul 2025 02:19:26 +0800
X-Gm-Features: Ac12FXw17RTOObpqm0wsoGiA4KYMn-qNtRmU2TTfhmA6XTk9ftPuiK1Ge5xLnkg
Message-ID: <CAMgjq7D8wPJECCdsRzHkTNXN9Ot5A7Op+9BH83_ojDjtp=GCUg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 7:59=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/6/30 18:06, Kairui Song wrote:
> > On Mon, Jun 30, 2025 at 5:53=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >> On 2025/6/30 17:16, Kairui Song wrote:
> >>> On Mon, Jun 30, 2025 at 2:34=E2=80=AFPM Baolin Wang
> >>> <baolin.wang@linux.alibaba.com> wrote:
> >>>> On 2025/6/27 14:20, Kairui Song wrote:
> >>>>> From: Kairui Song <kasong@tencent.com>
> >>>>>
> >>>>> Instead of keeping different paths of splitting the entry and
> >>>>> recalculating the swap entry and index, do it in one place.
> >>>>>
> >>>>> Whenever swapin brought in a folio smaller than the entry, split th=
e
> >>>>> entry. And always recalculate the entry and index, in case it might
> >>>>> read in a folio that's larger than the entry order. This removes
> >>>>> duplicated code and function calls, and makes the code more robust.
> >>>>>
> >>>>> Signed-off-by: Kairui Song <kasong@tencent.com>
> >>>>> ---
> >>>>>     mm/shmem.c | 103 +++++++++++++++++++++-------------------------=
-------
> >>>>>     1 file changed, 41 insertions(+), 62 deletions(-)
> >>>>>
> >>>>> diff --git a/mm/shmem.c b/mm/shmem.c
> >>>>> index f85a985167c5..5be9c905396e 100644
> >>>>> --- a/mm/shmem.c
> >>>>> +++ b/mm/shmem.c
> >>>>> @@ -2178,8 +2178,12 @@ static void shmem_set_folio_swapin_error(str=
uct inode *inode, pgoff_t index,
> >>>>>         swap_free_nr(swap, nr_pages);
> >>>>>     }
> >>>>>
> >>>>> -static int shmem_split_large_entry(struct inode *inode, pgoff_t in=
dex,
> >>>>> -                                swp_entry_t swap, gfp_t gfp)
> >>>>> +/*
> >>>>> + * Split an existing large swap entry. @index should point to one =
sub mapping
> >>>>> + * slot within the entry @swap, this sub slot will be split into o=
rder 0.
> >>>>> + */
> >>>>> +static int shmem_split_swap_entry(struct inode *inode, pgoff_t ind=
ex,
> >>>>> +                               swp_entry_t swap, gfp_t gfp)
> >>>>>     {
> >>>>>         struct address_space *mapping =3D inode->i_mapping;
> >>>>>         XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
> >>>>> @@ -2250,7 +2254,7 @@ static int shmem_split_large_entry(struct ino=
de *inode, pgoff_t index,
> >>>>>         if (xas_error(&xas))
> >>>>>                 return xas_error(&xas);
> >>>>>
> >>>>> -     return entry_order;
> >>>>> +     return 0;
> >>>>>     }
> >>>>>
> >>>>>     /*
> >>>>> @@ -2267,11 +2271,11 @@ static int shmem_swapin_folio(struct inode =
*inode, pgoff_t index,
> >>>>>         struct address_space *mapping =3D inode->i_mapping;
> >>>>>         struct mm_struct *fault_mm =3D vma ? vma->vm_mm : NULL;
> >>>>>         struct shmem_inode_info *info =3D SHMEM_I(inode);
> >>>>> +     int error, nr_pages, order, swap_order;
> >>>>>         struct swap_info_struct *si;
> >>>>>         struct folio *folio =3D NULL;
> >>>>>         bool skip_swapcache =3D false;
> >>>>>         swp_entry_t swap;
> >>>>> -     int error, nr_pages, order, split_order;
> >>>>>
> >>>>>         VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> >>>>>         swap =3D radix_to_swp_entry(*foliop);
> >>>>> @@ -2321,70 +2325,43 @@ static int shmem_swapin_folio(struct inode =
*inode, pgoff_t index,
> >>>>>                                 goto failed;
> >>>>>                 }
> >>>>>
> >>>>> -             /*
> >>>>> -              * Now swap device can only swap in order 0 folio, th=
en we
> >>>>> -              * should split the large swap entry stored in the pa=
gecache
> >>>>> -              * if necessary.
> >>>>> -              */
> >>>>> -             split_order =3D shmem_split_large_entry(inode, index,=
 swap, gfp);
> >>>>> -             if (split_order < 0) {
> >>>>> -                     error =3D split_order;
> >>>>> -                     goto failed;
> >>>>> -             }
> >>>>> -
> >>>>> -             /*
> >>>>> -              * If the large swap entry has already been split, it=
 is
> >>>>> -              * necessary to recalculate the new swap entry based =
on
> >>>>> -              * the old order alignment.
> >>>>> -              */
> >>>>> -             if (split_order > 0) {
> >>>>> -                     pgoff_t offset =3D index - round_down(index, =
1 << split_order);
> >>>>> -
> >>>>> -                     swap =3D swp_entry(swp_type(swap), swp_offset=
(swap) + offset);
> >>>>> -             }
> >>>>> -
> >>>>>                 /* Here we actually start the io */
> >>>>>                 folio =3D shmem_swapin_cluster(swap, gfp, info, ind=
ex);
> >>>>>                 if (!folio) {
> >>>>>                         error =3D -ENOMEM;
> >>>>>                         goto failed;
> >>>>>                 }
> >>>>> -     } else if (order > folio_order(folio)) {
> >>>>> -             /*
> >>>>> -              * Swap readahead may swap in order 0 folios into swa=
pcache
> >>>>> -              * asynchronously, while the shmem mapping can still =
stores
> >>>>> -              * large swap entries. In such cases, we should split=
 the
> >>>>> -              * large swap entry to prevent possible data corrupti=
on.
> >>>>> -              */
> >>>>> -             split_order =3D shmem_split_large_entry(inode, index,=
 swap, gfp);
> >>>>> -             if (split_order < 0) {
> >>>>> -                     folio_put(folio);
> >>>>> -                     folio =3D NULL;
> >>>>> -                     error =3D split_order;
> >>>>> -                     goto failed;
> >>>>> -             }
> >>>>> -
> >>>>> -             /*
> >>>>> -              * If the large swap entry has already been split, it=
 is
> >>>>> -              * necessary to recalculate the new swap entry based =
on
> >>>>> -              * the old order alignment.
> >>>>> -              */
> >>>>> -             if (split_order > 0) {
> >>>>> -                     pgoff_t offset =3D index - round_down(index, =
1 << split_order);
> >>>>> -
> >>>>> -                     swap =3D swp_entry(swp_type(swap), swp_offset=
(swap) + offset);
> >>>>> -             }
> >>>>> -     } else if (order < folio_order(folio)) {
> >>>>> -             swap.val =3D round_down(swap.val, 1 << folio_order(fo=
lio));
> >>>>>         }
> >>>>>
> >>>>>     alloced:
> >>>>> +     /*
> >>>>> +      * We need to split an existing large entry if swapin brought=
 in a
> >>>>> +      * smaller folio due to various of reasons.
> >>>>> +      *
> >>>>> +      * And worth noting there is a special case: if there is a sm=
aller
> >>>>> +      * cached folio that covers @swap, but not @index (it only co=
vers
> >>>>> +      * first few sub entries of the large entry, but @index point=
s to
> >>>>> +      * later parts), the swap cache lookup will still see this fo=
lio,
> >>>>> +      * And we need to split the large entry here. Later checks wi=
ll fail,
> >>>>> +      * as it can't satisfy the swap requirement, and we will retr=
y
> >>>>> +      * the swapin from beginning.
> >>>>> +      */
> >>>>> +     swap_order =3D folio_order(folio);
> >>>>
> >>>> Nit: 'swap_order' is confusing, and can you just use folio_order() o=
r a
> >>>> btter name?
> >>>
> >>> Good idea.
> >>>
> >>>>
> >>>>> +     if (order > swap_order) {
> >>>>> +             error =3D shmem_split_swap_entry(inode, index, swap, =
gfp);
> >>>>> +             if (error)
> >>>>> +                     goto failed_nolock;
> >>>>> +     }
> >>>>> +
> >>>>> +     index =3D round_down(index, 1 << swap_order);
> >>>>> +     swap.val =3D round_down(swap.val, 1 << swap_order);
> >>>>
> >>>> The round_down() of index and swap value here may cause
> >>>> shmem_add_to_page_cache() to fail to insert a new folio, because the
> >>>> swap value stored at that index in the shmem mapping does not match,
> >>>> leading to another swapin page fault for correction.
> >>>>
> >>>> For example, shmem stores a large swap entry of order 4 in the range=
 of
> >>>> index 0-64. When a swapin fault occurs at index =3D 3, with swap.val=
 =3D
> >>>> 0x4000, if a split happens and this round_down() logic is applied, t=
hen
> >>>> index =3D 3, swap.val =3D 0x4000. However, the actual swap.val shoul=
d be
> >>>> 0x4003 stored in the shmem mapping. This would cause another swapin =
fault.
> >>>
> >>> Oops, I missed a swap value fixup in the !SWP_SYNCHRONOUS_IO path
> >>> above, it should re-calculate the swap value there. It's fixed in the
> >>> final patch but left unhandled here. I'll update this part.
> >>>
> >>>>
> >>>> I still prefer my original alignment method, and do you find this wi=
ll
> >>>> cause any issues?
> >>>>
> >>>> "
> >>>> if (split_order > 0) {
> >>>>           pgoff_t offset =3D index - round_down(index, 1 << split_or=
der);
> >>>>
> >>>>           swap =3D swp_entry(swp_type(swap), swp_offset(swap) + offs=
et);
> >>>> }
> >>>> "
> >>>
> >>> It only fits the cached swapin and uncached swapin, not the cache hit
> >>> case. Cache hits may see a larger folio so split didn't happen, but
> >>> the round_down is still needed.
> >>
> >> IMO, this only fits for the large swap entry split case.
> >>
> >>> And there is another racy case: before this patch, the split may
> >>> happen first, but shmem_swapin_cluster brought in a large folio due t=
o
> >>> race in the swap cache layer.
> >>
> >> shmem_swapin_cluster() can only allocate order 0 folio, right?
> >
> > It can only allocate order 0 folio, but It can hit a large folio: eg.
> > a parallel swapin/swapout happened, and the folio stays in swap cache,
> > while we are handling a swapin here.
>
> Yes, I know this. This is exactly the issue that patch 1 wants to fix.

Hmm, patch 1 prevents the hang but doesn't prevent things like a
duplicated fault:

Starts with:
swap entry val =3D 0x400, order =3D 4, covering index 0 - 15, faulting inde=
x 3:

Before this patch:
CPU0                        CPU1
shmem_swapin_folio (see order =3D 4)
                            shmem_swapin_folio (see order =3D 4)
  /* fallback to order 0 due to */
  /* mem pressure / temporary pin / etc */
  shmem_split_large_entry
  /* split to order 0 */
  /* interrupted */
                            /* swapin done with order =3D 4 folio */
                            /* swapout again, leave the large folio
                               in cache temporarily  */
  folio =3D swap_cluster_readahead(0x403)
  /* Gets folio order =3D 4, folio->swap =3D 0x400
     since swap_cluster_readahead uses swap cache */
  folio->swap.val !=3D swap.val
  /* ! Above test failed ! */
  /* It shouldn't fail the round down is needed */

This patch moved the split after the swapin so it should be OK now,
but still the split_order could be unstable, see below:

>
> >>> And I'm not sure if split_order is always reliable here, for example
> >>> concurrent split may return an inaccurate value here.
> >>
> >> We've held the xas lock to ensure the split is reliable, even though
> >> concurrent splits may occur, only one split can get the large
> >> 'split_order', another will return 0 (since it will see the large swao
> >> entry has already been split).
> >
> > Yes, it may return 0, so we can get a large folio here, but get
> > `split_order =3D 0`?
>
> If split happens, which means the 'order' > folio_order(), right? how
> can you get a large folio in this context?
>
> > And if concurrently swapout/swapin happened, the `split_order` could
> > be a different value?
>
> What do you mean different value? The large swap entry can only be split
> once, so the 'split_order' must be 0 or the original large order.

Since d53c78fffe7ad, shmem_split_large_entry doesn't split every slot
into order 0 IIUC, so things get complex if two CPUs are faulting on
different indexes landing into two different splitting zones:

Before this patch:
swap entry val =3D 0x400, order =3D 9, covering index 0 - 511, faulting ind=
ex 3:

CPU0                           CPU1
shmem_swapin_folio (index =3D 3)
                               shmem_swapin_folio (index =3D 510)
  /* Gets swap =3D 0x400 */      /* Gets swap =3D 0x400 */
  /* fallback to order 0 */    /* fallback to order 0 */
  split_order =3D shmem_split_large_entry
  /* get split_order =3D 512 */
  /* offset =3D 3 */
                               split_order =3D shmem_split_large_entry
                               /* get split_order =3D 0, but no split */
                               /* map order is 8, offset =3D 0 */
                               /* wrong offset */
                               shmem_swapin_cluster(0x400)
                               /* It should swapin 0x5fe */

After this patch (with the append fix which was left in latest patch
by mistake) it won't swapin wrong entry now, but
shmem_split_large_entry may still return a outdated order.

That's two previous races I can come up with. These no longer exist
after this patch, it's not a bug though, just redundant IO as far as I
can see because other checks will fallback, looks a bit fragile
though. But shmem_split_large_entry may still return invalid order,
just much less likely.

I think the ideology here is, because the `order =3D
shmem_confirm_swap(mapping, index, swap)` ensures order is stable and
corresponds to the entry value at one point, so keep using that value
is better (and so this patch does the offset and calculation using the
`order` retrieved there before issues the swapin).

And after the swapin have brought a folio in, simply round down using
the folio's order, which should ensure the folio can be added
successfully in any case as long as the folio->swap and index fits the
shmem mapping fine.

> >> Based on your current patch, would the following modifications be clea=
rer?
> >>
> >> diff --git a/mm/shmem.c b/mm/shmem.c
> >> index 5be9c905396e..91c071fb7b67 100644
> >> --- a/mm/shmem.c
> >> +++ b/mm/shmem.c
> >> @@ -2254,7 +2254,7 @@ static int shmem_split_swap_entry(struct inode
> >> *inode, pgoff_t index,
> >>           if (xas_error(&xas))
> >>                   return xas_error(&xas);
> >>
> >> -       return 0;
> >> +       return split_order;
> >>    }
> >>
> >>    /*
> >> @@ -2351,10 +2351,23 @@ static int shmem_swapin_folio(struct inode
> >> *inode, pgoff_t index,
> >>                   error =3D shmem_split_swap_entry(inode, index, swap,=
 gfp);
> >>                   if (error)
> >>                           goto failed_nolock;
> >> -       }
> >>
> >> -       index =3D round_down(index, 1 << swap_order);
> >> -       swap.val =3D round_down(swap.val, 1 << swap_order);
> >> +               /*
> >> +                * If the large swap entry has already been split, it =
is
> >> +                * necessary to recalculate the new swap entry based o=
n
> >> +                * the old order alignment.
> >> +                */
> >> +               if (split_order > 0) {

The split_order could still be an outdated value, eg. we may even get
split_order =3D 0 with a large folio loaded here.

> >> +                       pgoff_t offset =3D index - round_down(index, 1=
 <<
> >> split_order);
> >> +
> >> +                       swap =3D swp_entry(swp_type(swap),
> >> swp_offset(swap) + offset);
> >> +               }
> >> +       } else if (order < folio_order(folio)) {
> >> +               /*
> >> +                * TODO; explain the posible race...
> >> +                */
> >> +               swap.val =3D round_down(swap.val, 1 << folio_order(fol=
io));
> >> +       }
>
> Sorry, you changes did not convince me. I still prefer my changes,
> listing out the possible races that might require changes to the swap
> value, as it would be clearer and more readable. Additionally, this is a
> cleanup patch, so I hope there are no implicit functional changes.

I was thinking that the less branch we have the better, I won't insist
on this though.

>
> >>           /* We have to do this with folio locked to prevent races */
> >>           folio_lock(folio);
> >> @@ -2382,7 +2395,8 @@ static int shmem_swapin_folio(struct inode *inod=
e,
> >> pgoff_t index,
> >>                           goto failed;
> >>           }
> >>
> >> -       error =3D shmem_add_to_page_cache(folio, mapping, index,
> >> +       error =3D shmem_add_to_page_cache(folio, mapping,
> >> +                                       round_down(index, nr_pages),
> >>                                           swp_to_radix_entry(swap), gf=
p);
> >>           if (error)
> >>                   goto failed;
> >>
> >>> So I wanted to simplify it: by round_down(folio_order(folio)) we
> >>> simply get the index and swap that will be covered by this specific
> >>> folio, if the covered range still has the corresponding swap entries
> >>> (check and ensured by shmem_add_to_page_cache which holds the
> >>> xa_lock), then the folio will be inserted back safely and
> >>> successfully.
> >>
> >
> > I think adding the missing swap value fixup in the !SYNC_IO path
> > should be good enough?
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 5be9c905396e..2620e4d1b56a 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2276,6 +2276,7 @@ static int shmem_swapin_folio(struct inode
> > *inode, pgoff_t index,
> >          struct folio *folio =3D NULL;
> >          bool skip_swapcache =3D false;
> >          swp_entry_t swap;
> > +       pgoff_t offset;
> >
> >          VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> >          swap =3D radix_to_swp_entry(*foliop);
> > @@ -2325,7 +2326,9 @@ static int shmem_swapin_folio(struct inode
> > *inode, pgoff_t index,
> >                                  goto failed;
> >                  }
> >
> > -               /* Here we actually start the io */
> > +               /* Cached swapin currently only supports order 0 swapin=
 */
> > +               /* It may hit a large folio but that's OK and handled b=
elow */
> > +               offset =3D index - round_down(index, 1 << order);
> > +               swap.val =3D swap.val + offset;

BTW for this append patch, it should be using a different variable so
swap won't be changed or it will cause redundant fault again. My bad.

> >                  folio =3D shmem_swapin_cluster(swap, gfp, info, index)=
;
> >                  if (!folio) {
> >                          error =3D -ENOMEM;
>
