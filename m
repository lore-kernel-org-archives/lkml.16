Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A528A702
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875524; cv=none; b=AEbwdZIzmxWlLKb1dY1OR51dseB7NLauMZ7O3Hj+EkFm93w5B7Ddc+wcNdbf8ihXuG/ywJjLg34ckgXr/GGJ+ePR+6AyHFywUnjB+JqB0Kr2cx+n61Z4mBybFMDnF2JsYpRE5awqYNPdRZEebZRCTcWxaU2ey8/tygtHA/R1OZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875524; c=relaxed/simple;
	bh=l9eiW/G4nd/WFgM+voC3r2fZOdfgH2k59aZiakl4x0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJtRqZ4AL5ng/XVf5jNsrWvZB0h19h+f1JD5xusEu5qqujyueIzMpU8CWpjibOVZPO2K8Lxojg6I6YaGSnYnB4Un67Gb2Q4HgMynqA+1CElycepv7Z538W4pTkk9ib0q/4EUpstCz84h+6JTVKe4l+A59nJcsZqhmgkDZFHA3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8jkmBIA; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8jkmBIA"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b5931037eso22496351fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751875520; x=1752480320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z88uHAjPEKGSJNP4tbcHU+4G3qfjX+M6dkD9zUP3er0=;
        b=O8jkmBIANG2YCtlfXfCjLJpQ+qeTPhny/6j1MoV3DjgbxP/qChDmSwNPte+oil6tE/
         hWb+zeo2m0NDLZHu+9HEkOVW98kjUc1jJnADYId1nvlk++Mo6PpioIvEiA9sLL1CB1Pz
         5pB8QIkk/o4QY0qOBX+zm9fKwLCZ5imzC/29UFTyOpVnu7soQ6ZJYPlGplhCKt3t5eUY
         JZsnKlKDlglcQKsqFYm8rTnPySnWn31khCYNvTO79NTE08dfeoNzdKAU2FQuQ2ahTYUl
         iOBEcIBM58qY/N+Z7T1RpFuyedSLF3+qehgPVDnxf72X7LYchwOtm98XmhfevvQ6mg7+
         CioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875520; x=1752480320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z88uHAjPEKGSJNP4tbcHU+4G3qfjX+M6dkD9zUP3er0=;
        b=KoAbjJzmbC5u11Ck60t+fC5HATfOdHxK+/UVX304gsJqkaocyFspZ9Mq+f6kfXkkPL
         JAFp5vawyAlh79FdXEDiXXoLoPIytCdUipNkhcxPx0fUaDo8w5OgzDfdgAahmajPiVfA
         Q8h1AMFh8WR3pF4qc8TXjGbz0se7k9w+a2XjaWBzIDIFY0ZaIqqgY1lvoDBIUloR4dQi
         bXRr8h9BVAbF48ioCv2JNsoWQ4UIbJxuvOSDOs4b2v/d21LyPvILuv+GhT02+h1N10TZ
         KY6iIwl2zGRnhSNYr4rg+Y9UcFlzfQrO5uxWD6JiC2j1OBauUSyi537hhb1ZzEdSgGBh
         THSg==
X-Forwarded-Encrypted: i=1; AJvYcCViz24dX7b3IYmHR79Ts53zhEt0HWdtUxU5F/FYWghBPY6RFTWOM8EpVZN853Fq9MoV0D0la1l2rmWwE/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxptVwXj0///mzKhBzReWjwzP8VwOpTsdg0Jldj0DT8Vojr77Wi
	xO9KZt8XNyq/BRNNM2+XG7rX+P7ATij0GNt4yDpTu6jeNhnOo5zo185/jcfSdVy+vFdEqShlRsn
	s5O2l+UV4hmlxILIsFi1ctHmkQNTVdOfufwDBqYM=
X-Gm-Gg: ASbGncvF0KCdSfG/Mhhd9jh2x7ZKRP5xev75GZtNTEEK7zD1TIOd/cy9mrv2IKzqad4
	JXap3XGVGXgIiPD8F3nn7P6Gg3NLoKhll3A15Wk6HvJEEZLppz5S1/YxdOE9+HcKrpDtOvsNOcg
	kHe6AqRB5G2EAAHZepwrkDPOyTPhHizlSsyLribatac8c=
X-Google-Smtp-Source: AGHT+IEHo61DDf9mV8ifWr0exAFpT+KhKvtPmoUhloI2HSV/oBv6aYB5J+kMJQIoHB6jnoxDo2YBODKl+Cu5Y97uYbQ=
X-Received: by 2002:a05:651c:f10:b0:32b:53b1:c8ab with SMTP id
 38308e7fff4ca-32f19b574fbmr22931251fa.22.1751875519494; Mon, 07 Jul 2025
 01:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704181748.63181-1-ryncsn@gmail.com> <20250704181748.63181-6-ryncsn@gmail.com>
 <17d23ed0-3b12-42a5-a5de-994f570b1bca@linux.alibaba.com>
In-Reply-To: <17d23ed0-3b12-42a5-a5de-994f570b1bca@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 7 Jul 2025 16:04:42 +0800
X-Gm-Features: Ac12FXx1ZC0tuvMHDAyKyf5Q-oqZ0i4OBwcmj1fyIP-rSOSoM_Lx3Q9GixcYF1E
Message-ID: <CAMgjq7DAeZq2zib3q_x99BssjHDa29Pnd9YFGAqLttkED_gmSA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] mm/shmem, swap: avoid false positive swap cache lookup
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:53=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Hi Kairui,
>
> On 2025/7/5 02:17, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > If a shmem read request's index points to the middle of a large swap
> > entry, shmem swap in will try the swap cache lookup using the large
> > swap entry's starting value (which is the first sub swap entry of this
> > large entry).  This will lead to false positive lookup results, if only
> > the first few swap entries are cached but the actual requested swap
> > entry pointed by index is uncached. This is not a rare event as swap
> > readahead always try to cache order 0 folios when possible.
> >
> > Currently, shmem will do a large entry split when it occurs, aborts
> > due to a mismatching folio swap value, then retry the swapin from
> > the beginning, which is a waste of CPU and adds wrong info to
> > the readahead statistics.
> >
> > This can be optimized easily by doing the lookup using the right
> > swap entry value.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   mm/shmem.c | 31 +++++++++++++++----------------
> >   1 file changed, 15 insertions(+), 16 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 217264315842..2ab214e2771c 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2274,14 +2274,15 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >       pgoff_t offset;
> >
> >       VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> > -     swap =3D index_entry =3D radix_to_swp_entry(*foliop);
> > +     index_entry =3D radix_to_swp_entry(*foliop);
> > +     swap =3D index_entry;
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
> > @@ -2293,6 +2294,12 @@ static int shmem_swapin_folio(struct inode *inod=
e, pgoff_t index,
> >               return -EEXIST;
> >       }
> >
> > +     /* index may point to the middle of a large entry, get the sub en=
try */
> > +     if (order) {
> > +             offset =3D index - round_down(index, 1 << order);
> > +             swap =3D swp_entry(swp_type(swap), swp_offset(swap) + off=
set);
> > +     }
> > +
> >       /* Look it up and read it in.. */
> >       folio =3D swap_cache_get_folio(swap, NULL, 0);
>
> Please drop this patch, which will cause a swapin fault dead loop.
>
> Assume an order-4 shmem folio has been swapped out, and the swap cache
> holds this order-4 folio (assuming index =3D=3D 0, swap.val =3D=3D 0x4000=
).
>
> During swapin, if the index is 1, and the recalculation of the swap
> value here will result in 'swap.val =3D=3D 0x4001'. This will cause the
> subsequent 'folio->swap.val !=3D swap.val' check to fail, continuously
> triggering a dead-loop swapin fault, ultimately causing the CPU to hang.
>

Oh, thanks for catching that.

Clearly I wasn't thinking carefully enough on this. The problem will
be gone if we calculate the `swap.val` based on folio_order and not
split_order, which is currently done in patch 8.

Previously there were only 4 patches so I never expected this
problem... I can try to organize the patch order again. I was hoping
they could be merged as one patch, some designs are supposed to work
together so splitting the patch may cause intermediate problems like
this.

Perhaps you can help have a look at later patches, if we can just
merge them into one? eg. merge or move patch 8 into this. Or maybe I
need to move this patch later.

The performance / object size / stack usage improvements are
shown in the commit message.
