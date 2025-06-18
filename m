Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF022212D97
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229426; cv=none; b=J2ckBqmtdML4hGGPAZMCszIjUTIBUuOm8iWxU8ikJ+SHcDsFhVqFrI2KdbC8WavjUH8hNInQdT7qZmKWpNZdhPGvoZy+RHMmPq6q3qDA3E49brlVSNM4h+1WpBBLHfNukTzXBz6rmRcLCv503+9VswFHH0LCLzutRDVwT0IkeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229426; c=relaxed/simple;
	bh=wuJ9iMQA9YpSgSdvf0vLco08hJ3WLEYKJel1UAc3e2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tt1iPAS8fcghWAP/DNL9gbEPToIsM5oDAKREWQdWvyMVqBpyAje22mr73PUQkFRbq1YgAmZ8wQ/Ll4bBG56nnvCmHSBC9GSc7nfsJuvnXzj70UBibX04E85vOeDprN3S4hvuiXG93D9Q2E5/nEqD4IDw5XFDQEa4tQpVxQGhsgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcOHz2jg; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcOHz2jg"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32addf54a00so53971251fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750229423; x=1750834223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIeMiiKb4oTFC9/Xf6OjRX+SZD33hG/1cOEcU99ZFFo=;
        b=dcOHz2jg4vYPSeoy7JnEI/cjVSC0kJwODR27tUBoWB2dXVhZci2wCtPmsmq13LGzQ6
         PvlLk5+G12SB5CxTY5Ubx5HqWSRQ2t/1Gex3G5jH4xZHQwKAA4bzEtEDqbhHSQnZY6oW
         V3HGOuPjXoYESb6+ftrn4RFmJMwXFzDab/HxBHr1A/KcbHuqLo8QJFs1eb5l4xjfd8eO
         kvKqFHDwbQslzf/W+bCvlt1sK9OlWuiT+h6bmWEzLZzo4WPnqZa/2u9Dgp6XEyiMEENM
         prft68ZTRG9+WhC2HgKv41FGYHE6PnuTSMRT81+ihHOsddzAIBxVgKr7ZR45vjy48Y0T
         VDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750229423; x=1750834223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIeMiiKb4oTFC9/Xf6OjRX+SZD33hG/1cOEcU99ZFFo=;
        b=XqTr7s1Q/jHQaVZ2+Tj+EWNRSM7pSAbnX0BcsruQ6GmX03w8zJe1nb6UopCJh0GZPL
         jEAtaspL74bTy3HlNU+vdosSVDJPImptgLD90gMcdWAEbF4PY3PONzOm6I2genHgNY6i
         mB3iSKSHhIzHk/fJMbOAfUmKCs2S1N6wooxctjUjaN2y9ntu5QNwr0MNCj/KQpn/6bG/
         PMtPVnqhlAnaQ7U5KJ21U4SaYXIfc/vI84tFKcI+CxdU/ZTvt6M6rb15UbObVxzj6PZ2
         f2v5KnqMf7wc+ik7uRqdexhb4Q4q5t+pVLLxygdncF4pQxIfLYeKUSD1Bu9va1tyRj7h
         4yew==
X-Forwarded-Encrypted: i=1; AJvYcCWmnEKvT6unwSG0cRov43SfdNqTuKdqEt4gY8UiVm6F3GpQ3sMSeaH9phy0JV7IdnygYlQwT9AgprTIdqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vOZXcSl0Mo/0ViIOJvBCxLXymXKLjpBeYJzy+e4YINsw/hc1
	Itla9Li9jB3MzG5jkzIsgaN+KBNRdY1ynqrYHZF/UGRwj4L7/LvYauhMZNVNDGTLPsn1iROEzmg
	8gGlGlGv773eK1KWu6dln9f95CHvOFeY=
X-Gm-Gg: ASbGncuC7+oOUx3UxrQOwO1rfJh0ubHhmqw8xuU2OeY96XrDBBjNOWs4j8Eo46YbZfX
	2uxYGtoY1VeDTSraJghAda/0wf7SgoKaBL3dbyY2pieleq6ZTlAMxo7q68sgSemu+w22o+SnUtW
	AkFiG9k74YJFoaLe3Gl+Ia4UwMrnXO2oxTOxrVx4T+5zI=
X-Google-Smtp-Source: AGHT+IHR/lo91lkLt10dA3Hreb4XkVuhHX8jRTyUHpmbSD2NOop/C86BxTUHk8Jffc+ng7xlE+avIlyE7FrwooDV6kw=
X-Received: by 2002:a2e:a9a6:0:b0:32a:6bef:7587 with SMTP id
 38308e7fff4ca-32b4a4b17fbmr50969661fa.20.1750229422529; Tue, 17 Jun 2025
 23:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617183503.10527-1-ryncsn@gmail.com> <20250617183503.10527-4-ryncsn@gmail.com>
 <06bf5a2f-6687-dc24-cdb2-408faf413dd4@huaweicloud.com>
In-Reply-To: <06bf5a2f-6687-dc24-cdb2-408faf413dd4@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 18 Jun 2025 14:50:05 +0800
X-Gm-Features: AX0GCFt_nSbgUw7mPQRrX6sRL6bxEhcf3zdP6m4SWM2DW0AwqnqV0FB0-osfJA8
Message-ID: <CAMgjq7CicJC8JbZ41ccvZwwVSsPftj8DUX06x=dNmKu-18HS2w@mail.gmail.com>
Subject: Re: [PATCH 3/4] mm/shmem, swap: improve mthp swapin process
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:27=E2=80=AFPM Kemeng Shi <shikemeng@huaweicloud.c=
om> wrote:
> on 6/18/2025 2:35 AM, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Tidy up the mTHP swapin workflow. There should be no feature change, bu=
t
> > consolidates the mTHP related check to one place so they are now all
> > wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
> > compiler if not needed.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/shmem.c | 175 ++++++++++++++++++++++++-----------------------------
> >  1 file changed, 78 insertions(+), 97 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 0ad49e57f736..46dea2fa1b43 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
>
> ...
>
> > @@ -2283,110 +2306,66 @@ static int shmem_swapin_folio(struct inode *in=
ode, pgoff_t index,
> >       /* Look it up and read it in.. */
> >       folio =3D swap_cache_get_folio(swap, NULL, 0);
> >       if (!folio) {
> > -             int nr_pages =3D 1 << order;
> > -             bool fallback_order0 =3D false;
> > -
> >               /* Or update major stats only when swapin succeeds?? */
> >               if (fault_type) {
> >                       *fault_type |=3D VM_FAULT_MAJOR;
> >                       count_vm_event(PGMAJFAULT);
> >                       count_memcg_event_mm(fault_mm, PGMAJFAULT);
> >               }
> > -
> > -             /*
> > -              * If uffd is active for the vma, we need per-page fault
> > -              * fidelity to maintain the uffd semantics, then fallback
> > -              * to swapin order-0 folio, as well as for zswap case.
> > -              * Any existing sub folio in the swap cache also blocks
> > -              * mTHP swapin.
> > -              */
> > -             if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma)=
)) ||
> > -                               !zswap_never_enabled() ||
> > -                               non_swapcache_batch(swap, nr_pages) !=
=3D nr_pages))
> > -                     fallback_order0 =3D true;
> > -
> > -             /* Skip swapcache for synchronous device. */
> > -             if (!fallback_order0 && data_race(si->flags & SWP_SYNCHRO=
NOUS_IO)) {
> > -                     folio =3D shmem_swap_alloc_folio(inode, vma, inde=
x, swap, order, gfp);
> > +             /* Try direct mTHP swapin bypassing swap cache and readah=
ead */
> > +             if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> > +                     swap_order =3D order;
> > +                     folio =3D shmem_swapin_direct(inode, vma, index,
> > +                                                 swap, &swap_order, gf=
p);
> >                       if (!IS_ERR(folio)) {
> >                               skip_swapcache =3D true;
> >                               goto alloced;
> >                       }
> > -
> > -                     /*
> > -                      * Fallback to swapin order-0 folio unless the sw=
ap entry
> > -                      * already exists.
> > -                      */
> > +                     /* Fallback if order > 0 swapin failed with -ENOM=
EM */
> >                       error =3D PTR_ERR(folio);
> >                       folio =3D NULL;
> > -                     if (error =3D=3D -EEXIST)
> > +                     if (error !=3D -ENOMEM || !swap_order)
> >                               goto failed;
> >               }
> > -
> >               /*
> > -              * Now swap device can only swap in order 0 folio, then w=
e
> > -              * should split the large swap entry stored in the pageca=
che
> > -              * if necessary.
> > +              * Try order 0 swapin using swap cache and readahead, it =
still
> > +              * may return order > 0 folio due to raced swap cache.
> >                */
> > -             split_order =3D shmem_split_large_entry(inode, index, swa=
p, gfp);
> > -             if (split_order < 0) {
> > -                     error =3D split_order;
> > -                     goto failed;
> > -             }
> > -
> > -             /*
> > -              * If the large swap entry has already been split, it is
> > -              * necessary to recalculate the new swap entry based on
> > -              * the old order alignment.
> > -              */
> > -             if (split_order > 0) {
> > -                     pgoff_t offset =3D index - round_down(index, 1 <<=
 split_order);
> > -
> > -                     swap =3D swp_entry(swp_type(swap), swp_offset(swa=
p) + offset);
> > -             }
> > -
> For fallback order 0, we always call shmem_swapin_cluster() before but we=
 will call
> shmem_swap_alloc_folio() now. It seems fine to me. Just point this out fo=
r others
> to recheck this.

It's an improvement, I forgot to mention that in the commit message.
Readahead is a burden for SWP_SYNCHRONOUS_IO devices so calling
shmem_swap_alloc_folio is better. I'll update the commit message.

> > -             /* Here we actually start the io */
> >               folio =3D shmem_swapin_cluster(swap, gfp, info, index);
> >               if (!folio) {
> >                       error =3D -ENOMEM;
> >                       goto failed;
> >               }
> > -     } else if (order > folio_order(folio)) {
> > -             /*
> > -              * Swap readahead may swap in order 0 folios into swapcac=
he
> > -              * asynchronously, while the shmem mapping can still stor=
es
> > -              * large swap entries. In such cases, we should split the
> > -              * large swap entry to prevent possible data corruption.
> > -              */
> > -             split_order =3D shmem_split_large_entry(inode, index, swa=
p, gfp);
> > -             if (split_order < 0) {
> > -                     folio_put(folio);
> > -                     folio =3D NULL;
> > -                     error =3D split_order;
> > -                     goto failed;
> > -             }
> > -
> > -             /*
> > -              * If the large swap entry has already been split, it is
> > -              * necessary to recalculate the new swap entry based on
> > -              * the old order alignment.
> > -              */
> > -             if (split_order > 0) {
> > -                     pgoff_t offset =3D index - round_down(index, 1 <<=
 split_order);
> > -
> > -                     swap =3D swp_entry(swp_type(swap), swp_offset(swa=
p) + offset);
> > -             }
> > -     } else if (order < folio_order(folio)) {
> > -             swap.val =3D round_down(swp_type(swap), folio_order(folio=
));
> >       }
> > -
> >  alloced:
> > +     /*
> > +      * We need to split an existing large entry if swapin brought in =
a
> > +      * smaller folio due to various of reasons.
> > +      *
> > +      * And worth noting there is a special case: if there is a smalle=
r
> > +      * cached folio that covers @swap, but not @index (it only covers
> > +      * first few sub entries of the large entry, but @index points to
> > +      * later parts), the swap cache lookup will still see this folio,
> > +      * And we need to split the large entry here. Later checks will f=
ail,
> > +      * as it can't satisfy the swap requirement, and we will retry
> > +      * the swapin from beginning.
> > +      */
> > +     swap_order =3D folio_order(folio);
> > +     if (order > swap_order) {
> > +             error =3D shmem_split_swap_entry(inode, index, swap, gfp)=
;
> > +             if (error)
> > +                     goto failed_nolock;
> > +     }
> > +
> > +     index =3D round_down(index, 1 << swap_order);
> > +     swap.val =3D round_down(swap.val, 1 << swap_order);
> > +
>
> If swap entry order is reduced but index and value keep unchange,
> the shmem_split_swap_entry() will split the reduced large swap entry
> successfully but index and swap.val will be incorrect beacuse of wrong
> swap_order. We can catch unexpected order and swap entry in
> shmem_add_to_page_cache() and will retry the swapin, but this will
> introduce extra cost.
>
> If we return order of entry which is splited in shmem_split_swap_entry()
> and update index and swap.val with returned order, we can avoid the extra
> cost for mentioned racy case.

The swap_order here is simply the folio's order, so doing this
round_down will get the swap entry and index that will be covered by
this folio. (the later folio->swap.val !=3D swap.val ensures the values
are valid here).

Remember the previous patch mentioned that, we may see the shmem
mapping's entry got split but still seeing a large folio here. With
current design, shmem_add_to_page_cache can still succeed as it should
be, but if we round_down with the returned order of
shmem_split_swap_entry, it will fail.

So I think to make it better to keep it this way, and besides, the
next patch makes use of this for sanity checks and reducing false
positives of swap cache lookups.
