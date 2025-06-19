Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12E2AF1C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354685; cv=none; b=SMtPfnlSO4ALL8h8tdEyoMIXw2mzvFfiDHAvMdOhgoehiFV3eJR2SUTmXKThQrSWClivR8qWxu/yX4LXsz/XclZSfDN9MJSfSay4XptTGoxhcxBKdXmO6MhiokPwgLDTbGABTAyQd3y/d5RHxR1cj1bDOb0oeXnX/NTKX/Ngu6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354685; c=relaxed/simple;
	bh=wJ2RP3i1uLLappsSXNlTZWygk+cqf/HjTLFXPZbL5QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jx7SDpD+Uk2bQ2N6RLps8Y2XGRDPfZO6YMUlQFL2uuuEmPfUZUE/8tO4DAZdl3IO23Y68UCOXjsxoFjDoA6sgh0k7UjWAZrjzgaz+Yk+hMycYjcFaislJZhoXkW0NOiLv/mUVdLkrM1DlGsHrJ101m8l7uL79XucyUl19apJVjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFzeyS96; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFzeyS96"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b43cce9efso8997021fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750354682; x=1750959482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdG1ig0yFjbOMH8OBAS6HhXXXjRpyHtMI1DOQoERDrE=;
        b=UFzeyS96qKiMxwp7voM321JSnUei23ksHK+InWccgkpzxl1m5pciCVoHh5+XR1iN7P
         78njFyK/HTu247b+8c5Vni/PGYz3L6+78GO+Ecz74Jz80lnGGSjiXAxqtN02dNJOJTCs
         AFIXgyntp5mKIFcrZ81NlE3uf3KJImKFE/SqKmCyd8WJAqN1Sf3oB9UqIzK6Og7bkR4/
         TFYH8b1u6cfBJC9VwSl7tcciCoaozhrxw2nGTiJ6BjEagi2fSC+wuMLQwnhTP+fE0cP5
         JpjZrJmOwCjRayOmj7wjuzIeVXcFIJEB/HL4s6d9VkQbkQIMHl06O1b6804NgINO4Xe8
         pdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750354682; x=1750959482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdG1ig0yFjbOMH8OBAS6HhXXXjRpyHtMI1DOQoERDrE=;
        b=q1d/BrBQtUBfY5ZPeIUZvvqLlFyWj1QDnaip99yK1odnZES1qkhF+nJ8FMSDityZpG
         jmBm1gCa/L+9WeHWlekNEXXdolec2NAN9HA1AiL8maZVmxH+9M9rmKq+45NUk35e4pRI
         oRBrfgrIcJ9tigxJAgaHRMbxxycrVXX7nPRruTnQR//gzWJ2aExShPweL7n5eTB1Ww1q
         qL8ZhqUJY55duUmX4ZZ4hkK10K1CzL7Wo5ZJc54msAY4tc/byvrXIB15BkJMjcHRXLZr
         jJIfxXwAcbz0pLLMDKlBukxwwFNQWz5VrLVlq6kD7/VZPov5ogBSy51EtxvjbEiPog7W
         UVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVLWhb+yH1tBhYu+xIqUykMbiC1BTlwayn4F5dcygk13CziZMfSjWrJBuRBH+ehcYtprYNbOLk1SK4VxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wVTM0J7oj8bSO+i12lG1/mgpqGY842Cv2Fl77jY+Q5BDRMCM
	KEKNla190GYYaEfdnnVOML67WREFC53Y5f5dKm+syRz85UjDQ6MmWmr85fNRqjJ1E3hkVDqqCUh
	OExNSvTvwjhr2DwOpY1VaHrVO029wvZLrWmqd4yqqhA==
X-Gm-Gg: ASbGncuZrFp8UiIp+x1ADQ3/JrvJK/nl28JRkJaT6vkpk/blKsdOZHRnM000cQ//mGK
	StSjSRWjcKFcl5fTOqSZm9RaiGPXu6mx+FxJUDC1OIGVPoUaJMo3I8pslfLx8dnuDK/CcjJ2kv7
	YMoUpHAs/LjBF3youZMZlrnjGutEEXcgDagM9gTeisYxg0/EEBIWV85A==
X-Google-Smtp-Source: AGHT+IGu6221iPW6oxvUGCbZQXXQ9dxx5ctEWKGgVDVNy08hC2dJP7oYCDEECAJXpZDHuJbmyho2N7bh3Zzk0fTJDdA=
X-Received: by 2002:a05:651c:20db:20b0:32b:9792:1887 with SMTP id
 38308e7fff4ca-32b97921bbfmr531101fa.11.1750354681442; Thu, 19 Jun 2025
 10:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617183503.10527-1-ryncsn@gmail.com> <20250617183503.10527-5-ryncsn@gmail.com>
 <a9a2e167-1617-7f7c-22ed-f949afcbe656@huaweicloud.com>
In-Reply-To: <a9a2e167-1617-7f7c-22ed-f949afcbe656@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 20 Jun 2025 01:37:24 +0800
X-Gm-Features: AX0GCFtTNLBEfqVpt2YEbWVNb5mcsPO2dq58xPj-PqUjG_DyYgyvi4VjVt-QlJU
Message-ID: <CAMgjq7CyXG5Mp-frdYU=D-66yPrYMLKSPqxBgq6r4WV__H4W0w@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm/shmem, swap: avoid false positive swap cache lookup
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:28=E2=80=AFAM Kemeng Shi <shikemeng@huaweicloud.c=
om> wrote:
>
>
>
> on 6/18/2025 2:35 AM, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > If the shmem read request's index points to the middle of a large swap
> > entry, shmem swap in does the swap cache lookup use the large swap
> > entry's starting value (the first sub swap entry of this large entry).
> > This will lead to false positive lookup result if only the first few
> > swap entries are cached, but the requested swap entry pointed by index
> > is uncached.
> >
> > Currently shmem will do a large entry split then retry the swapin from
> > beginning, which is a waste of CPU and fragile. Handle this correctly.
> >
> > Also add some sanity checks to help understand the code and ensure
> > things won't go wrong.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/shmem.c | 61 ++++++++++++++++++++++++++----------------------------
> >  1 file changed, 29 insertions(+), 32 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 46dea2fa1b43..0bc30dafad90 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1977,12 +1977,12 @@ static struct folio *shmem_alloc_and_add_folio(=
struct vm_fault *vmf,
> >
> >  static struct folio *shmem_swapin_direct(struct inode *inode,
> >               struct vm_area_struct *vma, pgoff_t index,
> > -             swp_entry_t entry, int *order, gfp_t gfp)
> > +             swp_entry_t swap_entry, swp_entry_t swap,
> > +             int *order, gfp_t gfp)
> >  {
> >       struct shmem_inode_info *info =3D SHMEM_I(inode);
> >       int nr_pages =3D 1 << *order;
> >       struct folio *new;
> > -     pgoff_t offset;
> >       void *shadow;
> >
> >       /*
> > @@ -2003,13 +2003,11 @@ static struct folio *shmem_swapin_direct(struct=
 inode *inode,
> >                */
> >               if ((vma && userfaultfd_armed(vma)) ||
> >                   !zswap_never_enabled() ||
> > -                 non_swapcache_batch(entry, nr_pages) !=3D nr_pages) {
> > -                     offset =3D index - round_down(index, nr_pages);
> > -                     entry =3D swp_entry(swp_type(entry),
> > -                                       swp_offset(entry) + offset);
> > +                 non_swapcache_batch(swap_entry, nr_pages) !=3D nr_pag=
es) {
> >                       *order =3D 0;
> >                       nr_pages =3D 1;
> >               } else {
> > +                     swap.val =3D swap_entry.val;
> >                       gfp_t huge_gfp =3D vma_thp_gfp_mask(vma);
> >
> >                       gfp =3D limit_gfp_mask(huge_gfp, gfp);
> > @@ -2021,7 +2019,7 @@ static struct folio *shmem_swapin_direct(struct i=
node *inode,
> >               return ERR_PTR(-ENOMEM);
> >
> >       if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
> > -                                        gfp, entry)) {
> > +                                        gfp, swap)) {
> >               folio_put(new);
> >               return ERR_PTR(-ENOMEM);
> >       }
> > @@ -2036,17 +2034,17 @@ static struct folio *shmem_swapin_direct(struct=
 inode *inode,
> >        * In this case, shmem_add_to_page_cache() will help identify the
> >        * concurrent swapin and return -EEXIST.
> >        */
> > -     if (swapcache_prepare(entry, nr_pages)) {
> > +     if (swapcache_prepare(swap, nr_pages)) {
> >               folio_put(new);
> >               return ERR_PTR(-EEXIST);
> >       }
> >
> >       __folio_set_locked(new);
> >       __folio_set_swapbacked(new);
> > -     new->swap =3D entry;
> > +     new->swap =3D swap;
> >
> > -     memcg1_swapin(entry, nr_pages);
> > -     shadow =3D get_shadow_from_swap_cache(entry);
> > +     memcg1_swapin(swap, nr_pages);
> > +     shadow =3D get_shadow_from_swap_cache(swap);
> >       if (shadow)
> >               workingset_refault(new, shadow);
> >       folio_add_lru(new);
> > @@ -2278,20 +2276,21 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >       struct mm_struct *fault_mm =3D vma ? vma->vm_mm : NULL;
> >       struct shmem_inode_info *info =3D SHMEM_I(inode);
> >       int error, nr_pages, order, swap_order;
> > +     swp_entry_t swap, swap_entry;
> >       struct swap_info_struct *si;
> >       struct folio *folio =3D NULL;
> >       bool skip_swapcache =3D false;
> > -     swp_entry_t swap;
> > +     pgoff_t offset;
> >
> >       VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> > -     swap =3D radix_to_swp_entry(*foliop);
> > +     swap_entry =3D radix_to_swp_entry(*foliop);
> >       *foliop =3D NULL;
> >
> > -     if (is_poisoned_swp_entry(swap))
> > +     if (is_poisoned_swp_entry(swap_entry))
> >               return -EIO;
> >
> > -     si =3D get_swap_device(swap);
> > -     order =3D shmem_swap_check_entry(mapping, index, swap);
> > +     si =3D get_swap_device(swap_entry);
> > +     order =3D shmem_swap_check_entry(mapping, index, swap_entry);
> >       if (unlikely(!si)) {
> >               if (order < 0)
> >                       return -EEXIST;
> > @@ -2303,7 +2302,9 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >               return -EEXIST;
> >       }
> >
> > -     /* Look it up and read it in.. */
> > +     /* @index may points to the middle of a large entry, get the real=
 swap value first */
> > +     offset =3D index - round_down(index, 1 << order);
> > +     swap.val =3D swap_entry.val + offset;
> >       folio =3D swap_cache_get_folio(swap, NULL, 0);
> >       if (!folio) {
> >               /* Or update major stats only when swapin succeeds?? */
> > @@ -2315,7 +2316,7 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >               /* Try direct mTHP swapin bypassing swap cache and readah=
ead */
> >               if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> >                       swap_order =3D order;
> > -                     folio =3D shmem_swapin_direct(inode, vma, index,
> > +                     folio =3D shmem_swapin_direct(inode, vma, index, =
swap_entry,
> >                                                   swap, &swap_order, gf=
p);
> >                       if (!IS_ERR(folio)) {
> >                               skip_swapcache =3D true;
> > @@ -2338,28 +2339,25 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >               }
> >       }
> >  alloced:
> > +     swap_order =3D folio_order(folio);
> > +     nr_pages =3D folio_nr_pages(folio);
> > +
> > +     /* The swap-in should cover both @swap and @index */
> > +     swap.val =3D round_down(swap.val, nr_pages);
> > +     VM_WARN_ON_ONCE(swap.val > swap_entry.val + offset);
> > +     VM_WARN_ON_ONCE(swap.val + nr_pages <=3D swap_entry.val + offset)=
;> +
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
> > +             error =3D shmem_split_swap_entry(inode, index, swap_entry=
, gfp);
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
> > @@ -2372,7 +2370,6 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >               goto failed;
> >       }
> >       folio_wait_writeback(folio);
> > -     nr_pages =3D folio_nr_pages(folio);
> >
> >       /*
> >        * Some architectures may have to restore extra metadata to the
> >
> The patch look good to me, just some small suggestion.
> I think the name "swap" and "swap_entry" is not good enough. Maybe someth=
ing
> like "index_entry" and "align_entry" will be more clean.

Thanks, very good suggestion, I prefer index_entry then.

> Besides we pass "swap" and "order" already, we can calculate swap_entry e=
asily
> and the code will be more easy to understand.

True, I'm not sure if the compiler is smart enough to avoid a
round_down here, the inlined function can be optimized better with
parameters.

> Not a big deal anyway, so:
> Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
>

Thanks again!
