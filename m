Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7928C5B6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034176; cv=none; b=bxsL+X98AybUOcw+6ElmsAQGqatCaM8SE00YeevSm/g2lzZeSe1Rkt+20T3bFxwTTm6hdcyUF38OqmNJ637ALPUp6d3IzqULEgiVoiji9pUUimlPlWMpauUATvts9LocRiSc/N8PgUZ0u66pQYwhTSosYhA8X2b1PMOIFDUnwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034176; c=relaxed/simple;
	bh=2PZTdXSJ5ZXAAURxbOSrECvRw+S46bnSkvyyy1BRtgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0zY6lCIhYRiHaCoLZDaPEfmI0NNu6hjpcHz9F0Rft9kkSYe/MXmzYHSLRQI0OVwWjVlV875/4DwFVahcr9qmoLbXMHKGerIJGxBBIJZiU7hJ84LQmrz9clh3oFOI+naiX8a0vKwgVjPpyAyMKdaJOebuZgEqZfWd0SDR0FKbqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtZfFRcQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtZfFRcQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso632377f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749034173; x=1749638973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWimSkfWm5JH4ZLawa6c2SjXJDNrI4LeXxoo3qltBvk=;
        b=QtZfFRcQP92BK3vq5IhxQUQVMUfsZ2VFd7ZPWccm/zuJrVwRdZu2T2QH8pG1wUH+5R
         xQJwgoX5EDk6MBQ+jC1XBFdKbc0moIHjlYuVpTSMhdSjViihz/GVU+fEOiWwMXIjhJ96
         b++VYdepWXW3pqCkuMisGXrlGRu5Nt1L1YrD7Do/P7jeCS0rViJWaVyhtGSxqz3jL/Hx
         qxoY3h+WjIxRCYfDEfEwqmYpwFXIC1G59ifFEnmHR83alAuXK4dBIy7KVjVC/n0Fp6DV
         ufErbuvg0byh9+dhgbUjqvlJlYx/trT1fDlbDh6EOxiNxD+8hcC8jFjnyL7WKHWdPQpP
         gRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034173; x=1749638973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWimSkfWm5JH4ZLawa6c2SjXJDNrI4LeXxoo3qltBvk=;
        b=YdpJR8cdH3NhsDSugUqTWqO3fY03T8KHk3dp8aV65KRpu5vfuHTqv7yps/H06M4l7a
         hWvk2bVIpJwUZARn6HfSyDGXnnioL4uV1v3SvEtfrwU9/C9gNHowjbS91a7kECGp06RT
         01409uY328PNbAJmRg89usa98lFxj3sKVfx8kCseQNvk0tbWF38jXYCF1iF1ES6pa/Tx
         Vh8Du89B7hlv+R45ItogcI+Z6HBRnYcfk0twHn6U7FN8u+crHuBIBFIUqW+bzAVV9dTY
         wMYn9nrqfb1yJtsDbPI8g7byVsWj0z7qmu+4GFrOEwjYlmj+wl+7suSnuXRM6wSMBZQj
         n2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVC/0Nm45/GMOKo38e57TrpF5brCkX8ibwGeo8GIBwsNTF31um9MalYf7l4rBri/5L9v0f9MUxwsUoOIgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLg2nFkXDi60HXRpEkN3cAqOTkiwkboPgdA7/wyoo+V1XO6BpS
	EHrhXnEUBH3OvZNJR77DOruRMy2vaSTTKiR+CP2QSMjvrdgpqC0BXNG1nz0LVFvdC4PaFsd5+sG
	1ZL9zJMUjxA/ZVriipGB1XYM4y2CHL4AcbX12
X-Gm-Gg: ASbGncvFqxbnO8mnBtvpcfrDcxHaVI8aG9oSgdP9/YBIqzM3ADLed8L2Ina3c8IX0UX
	zN1Sx8E6jKKxfftWxnkpAA36otBmdtNximVPK/86uJYDuGvea0Go7hPPDG7kwvyO4Fcqoq7F0Rf
	seIUXQB8fL9xD8bXDT3kaOvTjcJGT1a3oinQ==
X-Google-Smtp-Source: AGHT+IEhWr/oJ8E1Zyy+W66pCjIpMxWHTixzW7gMc8tMPHE5zIr4Q479fvioLoa7TY4uLVTgBq1zVIJbucTNp0WLh2o=
X-Received: by 2002:a05:6000:1887:b0:3a4:e667:9226 with SMTP id
 ffacd0b85a97d-3a51d95dc6bmr683154f8f.10.1749034172575; Wed, 04 Jun 2025
 03:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com> <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
In-Reply-To: <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 4 Jun 2025 18:49:21 +0800
X-Gm-Features: AX0GCFvCuty0imqhT_17dlR0lz_ZTGEqCRFE17Z47gaugw1FbiJUIKH6XW1W_M8
Message-ID: <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
Subject: Re: [PATCH] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=884=E6=97=A5=E5=91=
=A8=E4=B8=89 17:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/4/25 13:54, Zhiguo Niu wrote:
> > The decompress_io_ctx may be released asynchronously after
> > I/O completion. If this file is deleted immediately after read,
> > and the kworker of processing post_read_wq has not been executed yet
> > due to high workloads, It is possible that the inode(f2fs_inode_info)
> > is evicted and freed before it is used f2fs_free_dic.
> >
> >     The UAF case as below:
> >     Thread A                                      Thread B
> >     - f2fs_decompress_end_io
> >      - f2fs_put_dic
> >       - queue_work
> >         add free_dic work to post_read_wq
> >                                                    - do_unlink
> >                                                     - iput
> >                                                      - evict
> >                                                       - call_rcu
> >     This file is deleted after read.
> >
> >     Thread C                                 kworker to process post_re=
ad_wq
> >     - rcu_do_batch
> >      - f2fs_free_inode
> >       - kmem_cache_free
> >      inode is freed by rcu
> >                                              - process_scheduled_works
> >                                               - f2fs_late_free_dic
> >                                                - f2fs_free_dic
> >                                                 - f2fs_release_decomp_m=
em
> >                                       read (dic->inode)->i_compress_alg=
orithm
> >
> > This patch increase inode->i_count before f2fs_free_dic and decrease it
> > after free the dic.
> >
> > Cc: Daeho Jeong <daehojeong@google.com>
> > Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in s=
oftirq")
> > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> > Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> > ---
> >  fs/f2fs/compress.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index b3c1df9..6b3b3a7 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decomp=
ress_io_ctx *dic,
> >  }
> >
> >  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> > -             bool bypass_destroy_callback);
> > +             bool bypass_destroy_callback, bool late_free);
> >
> >  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
> >  {
> > @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct=
 compress_ctx *cc)
> >       return dic;
> >
> >  out_free:
> > -     f2fs_free_dic(dic, true);
> > +     f2fs_free_dic(dic, true, false);
> >       return ERR_PTR(ret);
> >  }
> >
> >  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> > -             bool bypass_destroy_callback)
> > +             bool bypass_destroy_callback, bool late_free)
> >  {
> >       int i;
> >
> > @@ -1775,6 +1775,11 @@ static void f2fs_free_dic(struct decompress_io_c=
tx *dic,
> >       }
> >
> >       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> > +     if (late_free) {
> > +             spin_lock(&dic->inode->i_lock);
> > +             atomic_dec(&dic->inode->i_count);
> > +             spin_unlock(&dic->inode->i_lock);
>
> If it is the last one release i_count, it needs to call iput_final to evi=
ct inode
> like what iput did, so we'd better to call iput() here?
Hi Chao,
Yes, we have also tested this method(iput/__iget), and it worked.
Just think It is simpler and easier to read to directly operate
i_count, and then free it
by relying on the memory module when i_count=3D0.
But It seems iput/__iget is better.
>
> > +     }
> >       kmem_cache_free(dic_entry_slab, dic);
> >  }
> >
> > @@ -1783,16 +1788,20 @@ static void f2fs_late_free_dic(struct work_stru=
ct *work)
> >       struct decompress_io_ctx *dic =3D
> >               container_of(work, struct decompress_io_ctx, free_work);
> >
> > -     f2fs_free_dic(dic, false);
> > +     f2fs_free_dic(dic, false, true);
> >  }
> >
> >  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
> >  {
> >       if (refcount_dec_and_test(&dic->refcnt)) {
> >               if (in_task) {
> > -                     f2fs_free_dic(dic, false);
> > +                     f2fs_free_dic(dic, false, false);
> >               } else {
> >                       INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> > +                     /* to avoid inode is evicted simultaneously */
> > +                     spin_lock(&dic->inode->i_lock);
> > +                     atomic_inc(&dic->inode->i_count);
> > +                     spin_unlock(&dic->inode->i_lock);
>
> iget()?
>
> BTW, can we store i_compress_algorithm in dic to avoid inode access?

Also thought of this method, but it would require more changes.
dic->inode used in f2fs_free_dic are all needed to modify except
i_compress_algorithm.
such as  page_array_free(dic->inode),
allow_memalloc_for_decomp(F2FS_I_SB(dic->inode)).

Do you have any other suggestions?
thanks=EF=BC=81

>
> Thanks,
>
> >                       queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> >                                       &dic->free_work);
> >               }
>
