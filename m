Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367613E02D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216067; cv=none; b=PO+kKEU08mtxi9k3/YiymoJ7zdBf6ocp01Nr3IKl3FaDBggQocEg8hSybUp4hhtJ0PxHmB+Ii5ZbwCvyiUScv1aKl0qzyNorB3KQlxiCyHrNI75tcH0icAdDkjx5Yg9pSpclvjsxqhp41FzUmMw/u92f1/jc/W7VwyCwAu5TVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216067; c=relaxed/simple;
	bh=MA+NPme0bnTwJ/T+fVWWMMcGIF45T/TIufZDuY4NEj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJr+YEnLjKW/c1dQMkyMNjqnda6VhBWDl3ztI/en0Gpm8Lq1g9zjdBGMGqybhQsqdqCkRn3AaUyHZ7QpWgfC5NsCz8PjmcX66DRKKiQfqXjFZk0o6GXeQqCtoc5PDeWBvwOqORYOyGMtGSp0k3t1y6PDh6Ppj8BIB1Hks810x08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O85x+yTT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O85x+yTT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32918fe5334so59258891fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216063; x=1750820863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3zUICPhinkw3JOiRXbperRYmBshkcCwZWbIoyWDapw=;
        b=O85x+yTTvjtNwFcJwNAKKNH4j6xvtXbA3lHdrelzkilAOK9P4lMujKS4ta2iKFmfDd
         rDP5nM2dUKtsNzdPyNNbDX1c3hGeYp041jq1fKhDJ+drcB7FasKjFqR6rAdJ3+yErIdc
         mpglJ6moTjnEoKKT895rc1zFHNCWO5oKwlV/aoJnFAkvkEcy8mksjwHhdFyj9vBiFL7T
         L4AnKTLy4iF7sG2u+mGjaHLuLzbB3zKJi+edIzjjm+Q+fOMj4TuDVAeAi/iDjx04/fH5
         gQd8116vJ8PBn5SnJtXzDGN3u6VglSDxBoxUE1Dvb0ltg+1hmqJy+t+3MizMSG3j3zVH
         fJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216063; x=1750820863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3zUICPhinkw3JOiRXbperRYmBshkcCwZWbIoyWDapw=;
        b=sg8zB+7+noWHM/4yxv5etpNERcsXuxWjmSdV6wLpMA2sKlJMG1JHjHrHu4n2JIVsEd
         J7NBtaymjyTMp/fDMGjUZC+2Rrbpj9C1WpRYhOsQz4dUjTJ+3LnyzPd+d02ZdW5EvA+k
         RHzOuCLxctu1V/60SUxFtYImYZMY/Cu48PnxuhcDGPDYtivd4sflyFvHYdtOB3t+5cyX
         fEwS7NHG3GhJM43UCizQjvxbOxHuhkKqgIn0NJpW6FcApTsazi5oWD9gGgeZLWY5nfFg
         TpDqdWV6Bhfpl8Bxv2O1zZzXwSZxrNNWDAm/X8XRnx/5TJefFTFMZMfnyilzrQFnrUQ5
         5GSw==
X-Forwarded-Encrypted: i=1; AJvYcCWMUVFX4tV7xUUbtFLekiBF4hicB9IMFd2FCQBvH+Tv8fZt/WxW2vrWZ6y0myAV6rouXrRd47N8lKi1w6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOzFuMo9ZofGST8nY/OLPghZRRL+wl/Eg12uFy/5044V9jMe18
	5ABEhU/pMRSxW/YoYm15JmkBy/7QI5nT6FBnts+oOl+b3ViprT1KT7MTYez+IxE4il77UEReATG
	BVt8/pj93Jt1DscpOZncuC5/CvXU5bUQ=
X-Gm-Gg: ASbGncugpntCi8qLPTFFQJu02yGxm+OQfv0at6jKbObpyQ+fVwD4z2p3jOTwgyMFTBY
	XEU6Mg5xq/ooOhRjkYdaqUpe5nXY/uyvs/0+bkffkLlRFvWcCAftJMd572AQM0hJOFAjEMx5vyB
	Mnkh3Zl7ue1SuZsqM8/yP7IiKuPpPclyuKwCM+CjNfhW0=
X-Google-Smtp-Source: AGHT+IGew/TsNPIq+Nroxr/dllhfSRSorwJkVcKVlL7nROnf5CDMeRSk0OAOCw4BMEH+9FlTlm7krtYWlIejHsTFydg=
X-Received: by 2002:a05:651c:b2a:b0:30b:a20b:6667 with SMTP id
 38308e7fff4ca-32b4a41e9cfmr49284001fa.9.1750216062834; Tue, 17 Jun 2025
 20:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617183503.10527-1-ryncsn@gmail.com> <20250617183503.10527-3-ryncsn@gmail.com>
 <17bdc50c-1b2c-bb3b-f828-bd9ce93ea086@huaweicloud.com>
In-Reply-To: <17bdc50c-1b2c-bb3b-f828-bd9ce93ea086@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 18 Jun 2025 11:07:25 +0800
X-Gm-Features: AX0GCFuKCXNr4NMt0l97oNd1EFA7bv0HDzZgopeZgfTh4Zz3W_HMm72pCEe3P4o
Message-ID: <CAMgjq7BR=99KDiSy7o_L0u_DYsnZunyokPc6FycrdExSdrdB_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm/shmem, swap: avoid redundant Xarray lookup during swapin
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:49=E2=80=AFAM Kemeng Shi <shikemeng@huaweicloud.=
com> wrote:
> on 6/18/2025 2:35 AM, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Currently shmem calls xa_get_order to get the swap radix entry order,
> > requiring a full tree walk. This can be easily combined with the swap
> > entry value checking (shmem_confirm_swap) to avoid the duplicated
> > lookup, which should improve the performance.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/shmem.c | 33 ++++++++++++++++++++++++---------
> >  1 file changed, 24 insertions(+), 9 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 4e7ef343a29b..0ad49e57f736 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_spa=
ce *mapping,
> >
> >  /*
> >   * Sometimes, before we decide whether to proceed or to fail, we must =
check
> > - * that an entry was not already brought back from swap by a racing th=
read.
> > + * that an entry was not already brought back or split by a racing thr=
ead.
> >   *
> >   * Checking folio is not enough: by the time a swapcache folio is lock=
ed, it
> >   * might be reused, and again be swapcache, using the same swap as bef=
ore.
> > + * Returns the swap entry's order if it still presents, else returns -=
1.
> >   */
> > -static bool shmem_confirm_swap(struct address_space *mapping,
> > -                            pgoff_t index, swp_entry_t swap)
> > +static int shmem_swap_check_entry(struct address_space *mapping, pgoff=
_t index,
> > +                               swp_entry_t swap)
> >  {
> > -     return xa_load(&mapping->i_pages, index) =3D=3D swp_to_radix_entr=
y(swap);
> > +     XA_STATE(xas, &mapping->i_pages, index);
> > +     int ret =3D -1;
> > +     void *entry;
> > +
> > +     rcu_read_lock();
> > +     do {
> > +             entry =3D xas_load(&xas);
> > +             if (entry =3D=3D swp_to_radix_entry(swap))
> > +                     ret =3D xas_get_order(&xas);
> > +     } while (xas_retry(&xas, entry));
> > +     rcu_read_unlock();
> > +     return ret;
> >  }
> >
> >  /*
> > @@ -2256,16 +2268,20 @@ static int shmem_swapin_folio(struct inode *ino=
de, pgoff_t index,
> >               return -EIO;
> >
> >       si =3D get_swap_device(swap);
> > -     if (!si) {
> > -             if (!shmem_confirm_swap(mapping, index, swap))
> > +     order =3D shmem_swap_check_entry(mapping, index, swap);
> > +     if (unlikely(!si)) {
> > +             if (order < 0)
> >                       return -EEXIST;
> >               else
> >                       return -EINVAL;
> >       }
> > +     if (unlikely(order < 0)) {
> > +             put_swap_device(si);
> > +             return -EEXIST;
> > +     }
> Can we re-arrange the code block as following:
>         order =3D shmem_swap_check_entry(mapping, index, swap);
>         if (unlikely(order < 0))
>                 return -EEXIST;
>
>         si =3D get_swap_device(swap);
>         if (!si) {
>                 return -EINVAL;
> ...

Hi, thanks for the suggestion.

This may lead to a trivial higher chance of getting -EINVAL when it
should return -EEXIST, leading to user space errors.

For example if this CPU get interrupted after `order =3D
shmem_swap_check_entry(mapping, index, swap);`, and another CPU
swapoff-ed the device. Next, we get `si =3D NULL` here, but the entry is
swapped in already, so it should return -EEXIST. Not -EINVAL.

The chance is really low so it's kind of trivial, we can do a `goto
failed` if got (!si) here, but it will make the logic under `failed:`
more complex. So I'd prefer to not change the original behaviour,
which looks more correct.
