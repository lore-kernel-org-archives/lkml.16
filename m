Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D31DF75D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275044; cv=none; b=r2vHFB7Z+tpR/A6wDRx8wPeSvfcVrNabjKFanQK9gZ1TsNKFMH2T6MA/LpN4el76x6PvPbs7FaT5Qn6rWOyD4VTQAu2BY7lAxzagqI6zYaQrwPLVrZ+b41dieeBfjv2jDxHzoRB1e+aKxUjWQusTMeg7qUpDQ9/p5SgmuJwlQPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275044; c=relaxed/simple;
	bh=c0gaBrgJ0etc5ksA9GHJSqy7+IHgiO3vNMUD0eYN3gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hE2Sh9Cnsm0vZys5IwUVmQI+29lRLamvvlaPwihbxT65NwwK6k2QRe7IWxIArtzXt+YJp+XFXTMgHFb0NT/VKhNryUJCpHZoow7B8aGm+x/pOrgAo8ICyGX8YEb57Z7Rcc1UaRzSeGjEh7cjg2cUEzNzSGvkORwnPGXz6ez7u5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEf7Gu5F; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEf7Gu5F"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso40078501fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751275041; x=1751879841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2IwUnsQ3fI+p8KneiXMIa2uJdWSNo3wea4wAfr4czY=;
        b=kEf7Gu5FB4T7QQV6l9MXWplDthfw2C9jdHng8e/I7tL2E6emYGAY9RYjGOWmNRH73W
         Wth8b949b2qRCoQCaL4bi2241U7n+nO9VV4/2e8B3mOeQhRfZrCSvduGlHV4xPwQ5Db2
         9r+d+N5Gemex58RswWmhT+6rEQJWLbdfLJtC4VyQcL6kkMzVQyRh4NswEjO2wRfymEB0
         OTyzcXPJsxDwYu3Jq5RIU9F3kkcKCtLi0WvBPIaDh9lqERquCXcEgk+TVmdAR7/TbMBS
         pzfnQSukR3wbwbO/f9cA89tC59VK0pXQGCoT5dWLFFTnYqHSITDXgF2BlNhxuLcUFvwK
         2RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275041; x=1751879841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2IwUnsQ3fI+p8KneiXMIa2uJdWSNo3wea4wAfr4czY=;
        b=I54IQ5T6lc79il22Ms3vUvzV3L45E5AtuCcgk1rBQaim7VdR48BU4mw7IIc261m1Az
         CuH8Q7CtgLL8f03IMvMLTGZsxJI2gTpDlq82oxbCd2ED8JVGm3vxsSPcS9RRC7aXNbgN
         ZhpXltSy7JG/oe9fd0KZbaPVS5DxvBKPmfkD0PHCt4Nu9ZdD4ZNPQCZ3uSWhk478R6UV
         wJtJNHDsT5e/zDlbflxI222BdkLirtnCbgTnl96eekBqwxKj1dR0uoqlIblwJlcTBspo
         1JX/mCugl+7vZDPQOcl/HAeeO+GiU/Q9mkE9q7rfFFRbJMbZBDJfgWVE7THqAJjM7/kb
         tPpA==
X-Forwarded-Encrypted: i=1; AJvYcCWUkPXt0Ig5qaXpCK1J2ZGxDVtd57ptFuoqoVBBbttLlIB08KxOZg1TFiLOqSWdqHFDvXEsgHmKpzZFhVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8F752rzJDdy9ZS0Na75fwMXVVmZ1+NCLtzo2zEYQHLKd+wLCl
	+FV7Y+B3iOzYgxPhu6qL6vC7r2CqIGiZEvGAezgUzp+2RERlcOZ3fgfhEo2T4nCr5nnb2rzCwal
	IKAP4qE+ZIXHDTuJQwnZHFVcUqtox2G0=
X-Gm-Gg: ASbGncsILNn3mlPO630Ypg62fCkl9/nRDGn34S4ofMjNFE+w0Sq9Jr9HX95RIkbn2sO
	nF1UAX/QISmNTGUWpMos2zVl2GqYpP2kGrQnUQucxQq3wwTm5E6EdvfFatMnKvQsqysqTjFURnT
	SqugRb2pMeehKlHw1ngxf7q2mI6c0Lmm90vjGBBEl5pLU=
X-Google-Smtp-Source: AGHT+IGuME3Dbq/JRIQh3tyG3vPdtqRxlASS9Cn7i2AqEN0Cmz1BDXOKscuX7UinV9D0Imn3ABzo77FsBEjg31v3Lbk=
X-Received: by 2002:a2e:a013:0:b0:32b:3b5a:c4a2 with SMTP id
 38308e7fff4ca-32cdc445f2cmr23109581fa.6.1751275040650; Mon, 30 Jun 2025
 02:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627062020.534-1-ryncsn@gmail.com> <20250627062020.534-5-ryncsn@gmail.com>
 <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com>
In-Reply-To: <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 30 Jun 2025 17:16:41 +0800
X-Gm-Features: Ac12FXxao1767eArzfL8z6NbeIOPAEf55qqL6jLjLciaipEd9kZcb0OMv4rTnUg
Message-ID: <CAMgjq7Dc4QJAkxFpAkzXk-8Xe5zyx2HUzNKpoq_sqbyZUFpOkA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:34=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 2025/6/27 14:20, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Instead of keeping different paths of splitting the entry and
> > recalculating the swap entry and index, do it in one place.
> >
> > Whenever swapin brought in a folio smaller than the entry, split the
> > entry. And always recalculate the entry and index, in case it might
> > read in a folio that's larger than the entry order. This removes
> > duplicated code and function calls, and makes the code more robust.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   mm/shmem.c | 103 +++++++++++++++++++++-------------------------------=
-
> >   1 file changed, 41 insertions(+), 62 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index f85a985167c5..5be9c905396e 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2178,8 +2178,12 @@ static void shmem_set_folio_swapin_error(struct =
inode *inode, pgoff_t index,
> >       swap_free_nr(swap, nr_pages);
> >   }
> >
> > -static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
> > -                                swp_entry_t swap, gfp_t gfp)
> > +/*
> > + * Split an existing large swap entry. @index should point to one sub =
mapping
> > + * slot within the entry @swap, this sub slot will be split into order=
 0.
> > + */
> > +static int shmem_split_swap_entry(struct inode *inode, pgoff_t index,
> > +                               swp_entry_t swap, gfp_t gfp)
> >   {
> >       struct address_space *mapping =3D inode->i_mapping;
> >       XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
> > @@ -2250,7 +2254,7 @@ static int shmem_split_large_entry(struct inode *=
inode, pgoff_t index,
> >       if (xas_error(&xas))
> >               return xas_error(&xas);
> >
> > -     return entry_order;
> > +     return 0;
> >   }
> >
> >   /*
> > @@ -2267,11 +2271,11 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >       struct address_space *mapping =3D inode->i_mapping;
> >       struct mm_struct *fault_mm =3D vma ? vma->vm_mm : NULL;
> >       struct shmem_inode_info *info =3D SHMEM_I(inode);
> > +     int error, nr_pages, order, swap_order;
> >       struct swap_info_struct *si;
> >       struct folio *folio =3D NULL;
> >       bool skip_swapcache =3D false;
> >       swp_entry_t swap;
> > -     int error, nr_pages, order, split_order;
> >
> >       VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> >       swap =3D radix_to_swp_entry(*foliop);
> > @@ -2321,70 +2325,43 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >                               goto failed;
> >               }
> >
> > -             /*
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
> >               /* Here we actually start the io */
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
> > -             swap.val =3D round_down(swap.val, 1 << folio_order(folio)=
);
> >       }
> >
> >   alloced:
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
>
> Nit: 'swap_order' is confusing, and can you just use folio_order() or a
> btter name?

Good idea.

>
> > +     if (order > swap_order) {
> > +             error =3D shmem_split_swap_entry(inode, index, swap, gfp)=
;
> > +             if (error)
> > +                     goto failed_nolock;
> > +     }
> > +
> > +     index =3D round_down(index, 1 << swap_order);
> > +     swap.val =3D round_down(swap.val, 1 << swap_order);
>
> The round_down() of index and swap value here may cause
> shmem_add_to_page_cache() to fail to insert a new folio, because the
> swap value stored at that index in the shmem mapping does not match,
> leading to another swapin page fault for correction.
>
> For example, shmem stores a large swap entry of order 4 in the range of
> index 0-64. When a swapin fault occurs at index =3D 3, with swap.val =3D
> 0x4000, if a split happens and this round_down() logic is applied, then
> index =3D 3, swap.val =3D 0x4000. However, the actual swap.val should be
> 0x4003 stored in the shmem mapping. This would cause another swapin fault=
.

Oops, I missed a swap value fixup in the !SWP_SYNCHRONOUS_IO path
above, it should re-calculate the swap value there. It's fixed in the
final patch but left unhandled here. I'll update this part.

>
> I still prefer my original alignment method, and do you find this will
> cause any issues?
>
> "
> if (split_order > 0) {
>         pgoff_t offset =3D index - round_down(index, 1 << split_order);
>
>         swap =3D swp_entry(swp_type(swap), swp_offset(swap) + offset);
> }
> "

It only fits the cached swapin and uncached swapin, not the cache hit
case. Cache hits may see a larger folio so split didn't happen, but
the round_down is still needed.
And there is another racy case: before this patch, the split may
happen first, but shmem_swapin_cluster brought in a large folio due to
race in the swap cache layer.

And I'm not sure if split_order is always reliable here, for example
concurrent split may return an inaccurate value here.

So I wanted to simplify it: by round_down(folio_order(folio)) we
simply get the index and swap that will be covered by this specific
folio, if the covered range still has the corresponding swap entries
(check and ensured by shmem_add_to_page_cache which holds the
xa_lock), then the folio will be inserted back safely and
successfully.
