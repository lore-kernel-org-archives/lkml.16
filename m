Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47890FC1D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275097; cv=none; b=n0bEO8jDG+8lo5sPeanDBcsrEj0EUERJYc9d3HMue+E2FNIwWnSO0scnA4pddiEggG7qVuJtxvJoabUYztdOpbhnHpBtG4zVJ1NVJPv2XQ2KwrSQjmmPAbOKrfqp4up+dsEWu3I1avKGW5/DgRXtZEcwDJaGB/cjf1kQhebfc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275097; c=relaxed/simple;
	bh=jRIy8VZYzKPQ4t9pVPILQUvMx7qIxloJGmiGAzpOm9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5SSRQdQBgzTrmRclGkhp8iklVDLDa9sD+6GgIb8CGUKXdriAobvB4q6YH3KMT0SzvBiPWrmc4h8SO+kOjOjF6BqEqtp55voRwZMoi95KYcyl4g7QyKpqFsdqvag5/smL3FkkegbEpehX9PW/4yfuTbBliVXwpjYvKMaV+8I1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyBRZ8mb; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyBRZ8mb"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso39320971fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751275093; x=1751879893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnIpIZ4G/sjmfy7xy3QJFu6/ZAKk6jCpqqTswmPwA1U=;
        b=PyBRZ8mbsW/ZdzQOLsRRKMdD8QE8nJXvoUCOzDEh8r3l0XNjiV14z1lYGPGndIQ188
         aeXmhxFL/8pBa8tNPRMf94w5JH+N2Hs14FHexL53SrtN88M2m0QlvegV6uIxRza8d1TF
         sxjIWP9HwsVEOsa94no/ZXWxJ32Wy/Eq4xh8We/bff2UuVDoGTArZXLPRUCMkGzxnsOb
         klYu6lfY1OnLNWYe2WwF1U+jl7bGky5ttAT6RGvN8DCliMNo8t/rHHcwnsns4xwpQyEv
         oGNsX8bmmp0AMjtZjlaMehRjmK+xnKhPvhUnbFNDq4djbYnD1+HbheyiRcodZTpPjTm0
         5UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275093; x=1751879893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnIpIZ4G/sjmfy7xy3QJFu6/ZAKk6jCpqqTswmPwA1U=;
        b=AO7VQ8zmdNq+j0x+UY+YchHJDyio60Wc2AUh4EycWIJ8tmuapxanh4pbtlz7yIGcUy
         tPi5G/hPp1Tez6C4GjZERXGf/7fYnhMeJGdVjGOMsIJ8t7Grw9mGbWaRAOJPl31tbc+o
         eakNFYL7HkMnxtkCZ147a4mE/qBlbYBMB4PZvOvj3LdU+etJJ6HZbCTVq+K1RPa/uz7p
         YCk5IRWRbGG9wUphRWdk+Vs6Y2noDzh1zsA8ftbpDitb5rPZ2KswH0ugHsRCL9YXG46g
         kYpLGci5GZYN0G1ho6//UBVS2ToguJ69Jl8Tv/KFd40F+/awjAKMSng6iMYXr0KdX1NE
         zm6A==
X-Forwarded-Encrypted: i=1; AJvYcCUV0v957jV3rcyKE/AlQIv0+2a4Ned+EctKN3I0FIZuel1mdaEVtImLlbzpnblghqPGDzYN2GBBSNBMnk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2jV1CJjBL9ADmM113YKgyDCuYWBYdgREArD4oNtongpURCaH
	myv197KimhaNWMWrWZTr9Q/Ujr2/BAm0Q1O7SyUinJq3OxaCOw5Bb40SDHaz9RxhJms9OuhZs3V
	EqKbEHF44baVlYXz/H6VUhbPQ3Lhu5sQ=
X-Gm-Gg: ASbGncvnhVoRw+xQzw/M3hsMGba18/A5N7/SHHvqKHvf0FtOyyY8ssF7y0rAwpKu8QM
	XxpccLndFl6eOs0SYa/UyJ1Yp7Nm/+w9sbzCNryafJYBkblJXQj1I+iR2S5ADV3YOvQXmVdg/Ge
	kXE9P3xIQAdphEtUqb4LcP2YhS+mvH1oE/WtjhksqviQ9JpXs6q/4EJg==
X-Google-Smtp-Source: AGHT+IFF/YGWB1m+/umcq4JF8HLg71XTKn3p5xOQXnTmPiyyTIZBLllvvDEBczQmzRQoYw9alJGKFXpRKO02gWJS9gU=
X-Received: by 2002:a2e:b5b7:0:b0:32c:e253:20c9 with SMTP id
 38308e7fff4ca-32ce25338e1mr24420101fa.41.1751275093088; Mon, 30 Jun 2025
 02:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627062020.534-1-ryncsn@gmail.com> <20250627062020.534-8-ryncsn@gmail.com>
 <b3e15124-f29a-4c73-b26e-184553b9137e@linux.alibaba.com>
In-Reply-To: <b3e15124-f29a-4c73-b26e-184553b9137e@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 30 Jun 2025 17:17:35 +0800
X-Gm-Features: Ac12FXwa2GU5SI346WrZEhyPtXXGdN3bhoV6BISvp1n5zG8SR88LtSe5C1Wrgic
Message-ID: <CAMgjq7A0wQmFP0=Y=uyxPzW8yxnB16i_pRZ-931-hvKtoKJg2g@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] mm/shmem, swap: avoid false positive swap cache lookup
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:22=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 2025/6/27 14:20, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > If the shmem read request's index points to the middle of a large swap
> > entry, shmem swap in does the swap cache lookup use the large swap entr=
y's
> > starting value (the first sub swap entry of this large entry).
>
> Right.
>
> This will
> > lead to false positive lookup result if only the first few swap entries
> > are cached, but the requested swap entry pointed by index is uncached.
> >
> > Currently shmem will do a large entry split then retry the swapin from
> > beginning, which is a waste of CPU and fragile.  Handle this correctly.
>
> Sorry, I did not get you here. Only when the 'order' (get from
> shmem_confirm_swap()) is not equal to folio_order(), will it trigger the
> large swap entry split. Could you describe the issue in more detail?

Right, for example we have a `order =3D 4` swap entry covering `index 0
- 16`, `swap.val =3D 0x4000`.

A swapin request starts with `index =3D 3`. The swap_cache_get_folio
will be called with `swap.val =3D 0x4000`. It may return an order 0
folio with `swap.val =3D 0x4000` (especially readaheads read order 0
folios easily). It doesn't satisfy the swapin requests. A split is
issued and swapin will fall, then the fault is triggered again.

After this patch, swap_cache_get_folio will return either NULL or the
right folio.

> I also found a false positive swap-in in your patch 4, seems they are
> related?

It's unrelated, I should added this code in this patch for
!SWP_SYNCHRONOUS_IO path in that patch:

offset =3D index - round_down(index, 1 << order);
swap.val =3D index_entry.val + offset;

>
> > Also add some sanity checks to help understand the code and ensure thin=
gs
> > won't go wrong.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   mm/shmem.c | 60 +++++++++++++++++++++++++++++------------------------=
-
> >   1 file changed, 32 insertions(+), 28 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index ea9a105ded5d..9341c51c3d10 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1977,14 +1977,19 @@ static struct folio *shmem_alloc_and_add_folio(=
struct vm_fault *vmf,
> >
> >   static struct folio *shmem_swapin_direct(struct inode *inode,
> >               struct vm_area_struct *vma, pgoff_t index,
> > -             swp_entry_t entry, int order, gfp_t gfp)
> > +             swp_entry_t index_entry, swp_entry_t swap,
> > +             int order, gfp_t gfp)
> >   {
> >       struct shmem_inode_info *info =3D SHMEM_I(inode);
> > -     int nr_pages =3D 1 << order;
> >       struct folio *new;
> > -     pgoff_t offset;
> > +     swp_entry_t entry;
> >       gfp_t swap_gfp;
> >       void *shadow;
> > +     int nr_pages;
> > +
> > +     /* Prefer aligned THP swapin */
> > +     entry.val =3D index_entry.val;
> > +     nr_pages =3D 1 << order;
> >
> >       /*
> >        * We have arrived here because our zones are constrained, so don=
't
> > @@ -2011,6 +2016,7 @@ static struct folio *shmem_swapin_direct(struct i=
node *inode,
> >                       swap_gfp =3D limit_gfp_mask(vma_thp_gfp_mask(vma)=
, gfp);
> >               }
> >       }
> > +
> >   retry:
> >       new =3D shmem_alloc_folio(swap_gfp, order, info, index);
> >       if (!new) {
> > @@ -2056,11 +2062,10 @@ static struct folio *shmem_swapin_direct(struct=
 inode *inode,
> >       if (!order)
> >               return new;
> >       /* High order swapin failed, fallback to order 0 and retry */
> > -     order =3D 0;
> > -     nr_pages =3D 1;
> > +     entry.val =3D swap.val;
> >       swap_gfp =3D gfp;
> > -     offset =3D index - round_down(index, nr_pages);
> > -     entry =3D swp_entry(swp_type(entry), swp_offset(entry) + offset);
> > +     nr_pages =3D 1;
> > +     order =3D 0;
> >       goto retry;
> >   }
> >
> > @@ -2288,20 +2293,21 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >       struct mm_struct *fault_mm =3D vma ? vma->vm_mm : NULL;
> >       struct shmem_inode_info *info =3D SHMEM_I(inode);
> >       int error, nr_pages, order, swap_order;
> > +     swp_entry_t swap, index_entry;
> >       struct swap_info_struct *si;
> >       struct folio *folio =3D NULL;
> >       bool skip_swapcache =3D false;
> > -     swp_entry_t swap;
> > +     pgoff_t offset;
> >
> >       VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> > -     swap =3D radix_to_swp_entry(*foliop);
> > +     index_entry =3D radix_to_swp_entry(*foliop);
> >       *foliop =3D NULL;
> >
> > -     if (is_poisoned_swp_entry(swap))
> > +     if (is_poisoned_swp_entry(index_entry))
> >               return -EIO;
> >
> > -     si =3D get_swap_device(swap);
> > -     order =3D shmem_confirm_swap(mapping, index, swap);
> > +     si =3D get_swap_device(index_entry);
> > +     order =3D shmem_confirm_swap(mapping, index, index_entry);
> >       if (unlikely(!si)) {
> >               if (order < 0)
> >                       return -EEXIST;
> > @@ -2313,13 +2319,15 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >               return -EEXIST;
> >       }
> >
> > -     /* Look it up and read it in.. */
> > +     /* @index may points to the middle of a large entry, get the real=
 swap value first */
> > +     offset =3D index - round_down(index, 1 << order);
> > +     swap.val =3D index_entry.val + offset;
> >       folio =3D swap_cache_get_folio(swap, NULL, 0);
> >       if (!folio) {
> >               if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> >                       /* Direct mTHP swapin without swap cache or reada=
head */
> >                       folio =3D shmem_swapin_direct(inode, vma, index,
> > -                                                 swap, order, gfp);
> > +                                                 index_entry, swap, or=
der, gfp);
> >                       if (IS_ERR(folio)) {
> >                               error =3D PTR_ERR(folio);
> >                               folio =3D NULL;
> > @@ -2341,28 +2349,25 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >                       count_memcg_event_mm(fault_mm, PGMAJFAULT);
> >               }
> >       }
> > +
> > +     swap_order =3D folio_order(folio);
> > +     nr_pages =3D folio_nr_pages(folio);
> > +     /* The swap-in should cover both @swap and @index */
> > +     swap.val =3D round_down(swap.val, nr_pages);
> > +     VM_WARN_ON_ONCE(swap.val > index_entry.val + offset);
> > +     VM_WARN_ON_ONCE(swap.val + nr_pages <=3D index_entry.val + offset=
);
> > +
> >       /*
> >        * We need to split an existing large entry if swapin brought in =
a
> >        * smaller folio due to various of reasons.
> > -      *
> > -      * And worth noting there is a special case: if there is a smalle=
r
> > -      * cached folio that covers @swap, but not @index (it only covers
> > -      * first few sub entries of the large entry, but @index points to
> > -      * later parts), the swap cache lookup will still see this folio,
> > -      * And we need to split the large entry here. Later checks will f=
ail,
> > -      * as it can't satisfy the swap requirement, and we will retry
> > -      * the swapin from beginning.
> >        */
> > -     swap_order =3D folio_order(folio);
> > +     index =3D round_down(index, nr_pages);
> >       if (order > swap_order) {
> > -             error =3D shmem_split_swap_entry(inode, index, swap, gfp)=
;
> > +             error =3D shmem_split_swap_entry(inode, index, index_entr=
y, gfp);
> >               if (error)
> >                       goto failed_nolock;
> >       }
> >
> > -     index =3D round_down(index, 1 << swap_order);
> > -     swap.val =3D round_down(swap.val, 1 << swap_order);
> > -
> >       /* We have to do this with folio locked to prevent races */
> >       folio_lock(folio);
> >       if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
> > @@ -2375,7 +2380,6 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >               goto failed;
> >       }
> >       folio_wait_writeback(folio);
> > -     nr_pages =3D folio_nr_pages(folio);
> >
> >       /*
> >        * Some architectures may have to restore extra metadata to the
>
>
