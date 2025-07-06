Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10414A0A8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751802652; cv=none; b=tNOcQAnhTGoMoMmFVaFKLRqnAFtRoJmYAAdl2Lvr6ZD2Xej/Mtv5L74sHabrmETNI3fQZjYbcyJHuYtkO5jOqItXqdXYruKWICZT4oDCqPY+rcr6PtRum1kDQZKTXwL6qV+v2Fdny9koEQn4/vqejdPCoQHKLm69o7LuMfWrSr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751802652; c=relaxed/simple;
	bh=dVJlnYkxqtU9GtMPCEOR0mFIbJ9zfJTaXl2uiHBYXX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKT9aVi7J6oEbKDUswqkOdtnNPedkuXwvSrYimW4KECFDGnVharAo8zIUpvw+JZEa06s2eAuus2phHCkHRNSSbVLoQSw5NATGC9f5sQPkUg15Q1aKweaZOr4v70jcMaEYdc5jSz7pFz1wteRj+tn70nTHNYrhTqJfX6dj4o9/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDdEJstu; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDdEJstu"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b43cce9efso17624991fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 04:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751802648; x=1752407448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uLWsYXG7c2ap9/zMB/fpsuY1pTgnkiyQ9mjOWskbNA=;
        b=hDdEJstuK/9N5ZrLyQMWjg7CjMzTQNr8SKN1BriESKPnvKIY6CJDvOtIsXlACTfWH9
         U+1kOVzG0m+S4lMUTmwM/SdjjhwBSAIhIDDO6uc5e6b8loV+XaeAFjMQ8uItraqW76ly
         PZ+ySoa6EMJHA451saq/L8I/vy+qccFaM/qNfYabnHpC9AUNyJIi6ko7D7ZPkMfGOPEg
         ncEduCIhc+IS1OWXYLxrqp085LWM1izGZEukgPPUmTumMOVKSJQgSPNfty1X1zDpKoYJ
         bDiLIymqrEpL1vHxVnZvSniobVTG+WCTjeMFFhto3FYO4gOFU8wahrnNktAQxhRRAImK
         KiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751802648; x=1752407448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uLWsYXG7c2ap9/zMB/fpsuY1pTgnkiyQ9mjOWskbNA=;
        b=w7nt7AdP3b1bar52MzrfrCUIJPRimxcY8hFIfUbF7g0RSPGZ0O7cSmavEy8n4CiN6W
         KpdRGMbVU3EL0Wq4b/lFUb8M0vaanX/+Zj5dll9THwkO67dn8y7Qnqsmtayg/FWnooVa
         cKMzEX946ASmTDTmdO/Xn8NNRUTuO+xf7gQrome4k6DWJKTKNNiQ09Mdor1sWPz7PFeE
         czjDkt/aTCwsGIOUbrUCgZGN4Qu1ukV5SPZhtm+yMtJ8C52Yme4IEjGlSc6UEJk16hiA
         mPoED//NHkEqJJMS3wtKmH01yErGvAAcuMGurUeEfkIjeZs9CC8QJhcWsdr1tE1Djd3q
         QN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEQb8pT5OT/vn8Kh5Ltl1RLjLNU/P2jGkX5vvhD+by/1rDQbHilGFNNILuuYat85LUL91ei88C1kd77Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw196qbnOQO0VMYY4IS9m1iWjNXkU+03wNhEEEQb/iIesY6fvXI
	6DsER9RDlyacHR5DISEizHADWpZGapalePn92fnDtsNWSn0GXHYJWvenaWKg+/m6VdOL/ZQXj20
	wH9Zyyi02D31as/QGuBkFY1UKybWbk7Q=
X-Gm-Gg: ASbGnctdLyWIgf5BZGV7NRfDzGmip/d29+kDRBrtFp7Xe+ERnR6+e3zNwLvauloIpNT
	wIeDjUTiRVxxDT0K7qrfEBXVNjwZ1WYlp+z9LoMPowHnpk97O/VUuIEYwi5LNGL4VphlX62xICZ
	SAdTdsHnoSY3rGp0W6ncLybqX/aVmh+GxmR+D8E2CVuyI=
X-Google-Smtp-Source: AGHT+IGXnnIUrI1mtDwJG5eNISIgA6HAL7qlf4RN8LHZ47hbbHFwd2HMAEH292N/X2VJLvRXkC9SNNcu475JUyQ7ByM=
X-Received: by 2002:a2e:bea9:0:b0:32a:7f4f:ebdc with SMTP id
 38308e7fff4ca-32f00c873f0mr22361571fa.5.1751802647734; Sun, 06 Jul 2025
 04:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704181748.63181-1-ryncsn@gmail.com> <20250704181748.63181-5-ryncsn@gmail.com>
 <452cad4b-e0c7-4792-9272-69199fa52a55@linux.alibaba.com>
In-Reply-To: <452cad4b-e0c7-4792-9272-69199fa52a55@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 6 Jul 2025 19:50:10 +0800
X-Gm-Features: Ac12FXyWcjznOL2DsXuvAkXKfhQ5XmunMLI_wpd_eKQiD5XKHdBMZWiZdw2KkfY
Message-ID: <CAMgjq7D5WuNW_WpZe=U+U9pQ3xaYFxkG6kOXK8PD8E+VaBEoiA@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] mm/shmem, swap: tidy up swap entry splitting
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 11:38=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/7/5 02:17, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Instead of keeping different paths of splitting the entry before the
> > swap in start, move the entry splitting after the swapin has put
> > the folio in swap cache (or set the SWAP_HAS_CACHE bit). This way
> > we only need one place and one unified way to split the large entry.
> > Whenever swapin brought in a folio smaller than the shmem swap entry,
> > split the entry and recalculate the entry and index for verification.
> >
> > This removes duplicated codes and function calls, reduces LOC,
> > and the split is less racy as it's guarded by swap cache now. So it
> > will have a lower chance of repeated faults due to raced split.
> > The compiler is also able to optimize the coder further:
> >
> > bloat-o-meter results with GCC 14:
> >
> > With DEBUG_SECTION_MISMATCH (-fno-inline-functions-called-once):
> > ./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-82 (-82)
> > Function                                     old     new   delta
> > shmem_swapin_folio                          2361    2279     -82
> > Total: Before=3D33151, After=3D33069, chg -0.25%
> >
> > With !DEBUG_SECTION_MISMATCH:
> > ./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
> > add/remove: 0/1 grow/shrink: 1/0 up/down: 949/-750 (199)
> > Function                                     old     new   delta
> > shmem_swapin_folio                          2878    3827    +949
> > shmem_split_large_entry.isra                 750       -    -750
> > Total: Before=3D33086, After=3D33285, chg +0.60%
> >
> > Since shmem_split_large_entry is only called in one place now. The
> > compiler will either generate more compact code, or inlined it for
> > better performance.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   mm/shmem.c | 53 +++++++++++++++++++++--------------------------------
> >   1 file changed, 21 insertions(+), 32 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index e43becfa04b3..217264315842 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2266,14 +2266,15 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >       struct address_space *mapping =3D inode->i_mapping;
> >       struct mm_struct *fault_mm =3D vma ? vma->vm_mm : NULL;
> >       struct shmem_inode_info *info =3D SHMEM_I(inode);
> > +     swp_entry_t swap, index_entry;
> >       struct swap_info_struct *si;
> >       struct folio *folio =3D NULL;
> >       bool skip_swapcache =3D false;
> > -     swp_entry_t swap;
> >       int error, nr_pages, order, split_order;
> > +     pgoff_t offset;
> >
> >       VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> > -     swap =3D radix_to_swp_entry(*foliop);
> > +     swap =3D index_entry =3D radix_to_swp_entry(*foliop);
> >       *foliop =3D NULL;
> >
> >       if (is_poisoned_swp_entry(swap))
> > @@ -2321,46 +2322,35 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >               }
> >
> >               /*
> > -              * Now swap device can only swap in order 0 folio, then w=
e
> > -              * should split the large swap entry stored in the pageca=
che
> > -              * if necessary.
> > -              */
> > -             split_order =3D shmem_split_large_entry(inode, index, swa=
p, gfp);
> > -             if (split_order < 0) {
> > -                     error =3D split_order;
> > -                     goto failed;
> > -             }
> > -
> > -             /*
> > -              * If the large swap entry has already been split, it is
> > +              * Now swap device can only swap in order 0 folio, it is
> >                * necessary to recalculate the new swap entry based on
> > -              * the old order alignment.
> > +              * the offset, as the swapin index might be unalgined.
> >                */
> > -             if (split_order > 0) {
> > -                     pgoff_t offset =3D index - round_down(index, 1 <<=
 split_order);
> > -
> > +             if (order) {
> > +                     offset =3D index - round_down(index, 1 << order);
> >                       swap =3D swp_entry(swp_type(swap), swp_offset(swa=
p) + offset);
> >               }
> >
> > -             /* Here we actually start the io */
> >               folio =3D shmem_swapin_cluster(swap, gfp, info, index);
> >               if (!folio) {
> >                       error =3D -ENOMEM;
> >                       goto failed;
> >               }
> > -     } else if (order > folio_order(folio)) {
> > +     }
> > +alloced:
> > +     if (order > folio_order(folio)) {
> >               /*
> > -              * Swap readahead may swap in order 0 folios into swapcac=
he
> > +              * Swapin may get smaller folios due to various reasons:
> > +              * It may fallback to order 0 due to memory pressure or r=
ace,
> > +              * swap readahead may swap in order 0 folios into swapcac=
he
> >                * asynchronously, while the shmem mapping can still stor=
es
> >                * large swap entries. In such cases, we should split the
> >                * large swap entry to prevent possible data corruption.
> >                */
> > -             split_order =3D shmem_split_large_entry(inode, index, swa=
p, gfp);
> > +             split_order =3D shmem_split_large_entry(inode, index, ind=
ex_entry, gfp);
> >               if (split_order < 0) {
> > -                     folio_put(folio);
> > -                     folio =3D NULL;
> >                       error =3D split_order;
> > -                     goto failed;
> > +                     goto failed_nolock;
> >               }
> >
> >               /*
> > @@ -2369,15 +2359,13 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >                * the old order alignment.
> >                */
> >               if (split_order > 0) {
> > -                     pgoff_t offset =3D index - round_down(index, 1 <<=
 split_order);
> > -
> > +                     offset =3D index - round_down(index, 1 << split_o=
rder);
> >                       swap =3D swp_entry(swp_type(swap), swp_offset(swa=
p) + offset);
>
> Obviously, you should use the original swap value 'index_entry' to
> calculate the new swap value.

Thanks, good catch.

>
> With the following fix, you can add:
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index d530df550f7f..1e8422ac863e 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2361,7 +2361,7 @@ static int shmem_swapin_folio(struct inode *inode,
> pgoff_t index,
>                   */
>                  if (split_order > 0) {
>                          offset =3D index - round_down(index, 1 <<
> split_order);
> -                       swap =3D swp_entry(swp_type(swap),
> swp_offset(swap) + offset);
> +                       swap =3D swp_entry(swp_type(swap),
> swp_offset(index_swap) + offset);
>                  }
>          } else if (order < folio_order(folio)) {
>                  swap.val =3D round_down(swap.val, 1 << folio_order(folio=
));
>
>
