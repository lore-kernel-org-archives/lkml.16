Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4A2D541D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628294; cv=none; b=eKaDnWOQV8jXTjahyTsCUQaTYfAFbbqX42qaKM761Dc7up0nCjr/mC0DAtXxNVU/0ITkJoxBIMmnA13/4Ymg9ofT25x6ufSVwAPSxoxhDCSrN/ziHV1J0OysNzeaYNpmNb5Pax4R5oav8CSmPw5xDl7hgCpnJm4BTwpsq51skKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628294; c=relaxed/simple;
	bh=1AwsTNhg820s4TkmaqGYu4lvRYj8SK/8JETcTBE2Jeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN0XyGZfBUNrQUHBlokLaH95kqnZkL1NsIGtna8N9nRFJlqEYSUkUYLpxBPWsoBdZBlF9DPyX/YTQ3XrXvNBZ2asoaRHIPRZmdrh+GfJ7MOkJF3m/2uuRo5jWF2h7nmBvvhWGd7A8Ixciswhd/KbKmV6aQPf4Xa2rzqwn9l9WK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bALVaXye; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bALVaXye"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a524caf77eso36280f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628290; x=1750233090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi+30Ooluj619fLFXIuMDlsnESWYjj85mXdtEqwcdX8=;
        b=bALVaXyeqoRKG63YX+nduazU9gRRhnimRqYLZ3/k6mzE+3TEHAvNY185GH31kJYzFQ
         b07fOTbl7//Jt1H2I3wemVksmEweLMbsgt8WsRX8sraJEzvXoiIml4xmR3HsKabNQdgz
         EgFHZCuZSuBiLjelhxPnEkTK7xoscmyqz7f1Zpa0X0nc1m7AFyEShXQ16ki6ns1KUw/w
         cHY1A3fr8ldVkycIpcYTT2bmBQsGqXIY2iet8Y2rGB9gmwKtpUjKRRbI7b7CRH5Wz7UT
         nVPlb0wSS+tFTV8CDmdOuCwRTThkT9NBqQP9FF2r/HPaFHxTuwAKj7Lh8/qsAtvZxeAn
         SHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628290; x=1750233090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mi+30Ooluj619fLFXIuMDlsnESWYjj85mXdtEqwcdX8=;
        b=pc3eix4Q3vgICqgl4HTdXzSJ84ygI/i7KKeBL1gMn1FgKUZHE+OLSbTdNiMC0PScN0
         jMCjG8lb/PMGYnbgC5qqz4yOtCqzBpGh67QokYOwghgM/vCjJ2dgXPBnDFMGXICnYCjH
         oR0F/90spauWLmjs85QIbX4Vy4k6o1ODl6cXZJRg2iFxPrjqvkb9JTyntfNu1FA6gu+x
         EkSBR2+zdWdWKrIe1Xo1J9uGIGkfTePpxAGdpcjFqJpHXm70gRQHJ1A6tHAoI8RlR0KA
         k0k9xgldABj4bt8ab4GbKgBG5ZLoyLB9x3Qh5FNP8VAdlxoDPU+8CHcpVtglDNOrWrKt
         gvRA==
X-Forwarded-Encrypted: i=1; AJvYcCUeWT5W/8o+3z51C2kiWUD0fK1XRUobNyFrZbw7kWLH5AsyLcdlkEhy003pr9Z9O2318pG70oKMPG6EqbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKd11kjw8uiabQ2mDwaoSnRslgOflNjcDfIihYeCrUsFT3E5P
	cHBUtf32a/rrSwY6IHq55FOOjOBuRDaiine+nZ/1mHXSgWwPonz4y6zIHcQe04HYnyiDK1nXNeQ
	9v1VdaeftUAaKzCUTATXrKnfXqZKaXWoyg2V2
X-Gm-Gg: ASbGncv0jhLVk6aYVMioh8A597V79otlRqocTVFkF5ulpeva8dJju+m8zyKbUsCUOU4
	SpnupRuujs+7I8us50+xMOkkKiMO/rOqjX8i8DCAleYPeECzWqoiaHFU9qUbZMkpdOSGM2XfNYf
	WVAI095o3nlfLy8g4rGa/TMDja4TLFk4sf4dupqXRWMU8YbyXVlX4EjA4=
X-Google-Smtp-Source: AGHT+IF92v4K1GmEkFd+Rw58ud0rgDTs0sVoI8keo+rm009PCl4Yaf3qX9GYrn/6TZxvtQ0VSDMHyAIlNrUXC0OKkb8=
X-Received: by 2002:a5d:588a:0:b0:3a3:7049:f947 with SMTP id
 ffacd0b85a97d-3a55880427amr615920f8f.10.1749628290401; Wed, 11 Jun 2025
 00:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com> <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
 <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
 <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org> <CAHJ8P3+=LEbbj8bzh0N3HbPu=jVkRfkowbxqoT0PfCZtWbuRbg@mail.gmail.com>
In-Reply-To: <CAHJ8P3+=LEbbj8bzh0N3HbPu=jVkRfkowbxqoT0PfCZtWbuRbg@mail.gmail.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 11 Jun 2025 15:51:19 +0800
X-Gm-Features: AX0GCFtDpeJ8FFsyofnR27y0h-tuJvnp2d_cEHbNKqbnGcu3Mwefc1lZuTX2K3k
Message-ID: <CAHJ8P3Lah5o60wJTb-H6Dng6sSrs8gY9cuFyw_1zAOAGfZMd_Q@mail.gmail.com>
Subject: Re: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Zhiguo Niu <niuzhiguo84@gmail.com> =E4=BA=8E2025=E5=B9=B46=E6=9C=8811=E6=97=
=A5=E5=91=A8=E4=B8=89 14:52=E5=86=99=E9=81=93=EF=BC=9A
>
> Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=8811=E6=97=A5=E5=
=91=A8=E4=B8=89 14:47=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 6/11/25 14:41, Zhiguo Niu wrote:
> > > Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=8811=E6=97=A5=
=E5=91=A8=E4=B8=89 14:07=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> On 6/11/25 00:08, Jaegeuk Kim wrote:
> > >>> Hi Zhiguo,
> > >>>
> > >>> This patch causes CPU hang when running fsstress on compressed/non-=
compressed
> > >>> files. Please check.
> > >>
> > >> Oh, seems it may cause below deadlock:
> > >>
> > >> CPU0
> > >> process A
> > >> - spin_lock(i_lock)
> > >> software IRQ
> > >> - end_io
> > >>  - igrab
> > >>   - spin_lock(i_lock)
> > >>
> > >> Thanks,
> > > Hi Chao,
> > > Thanks for pointing this out.
> > > I have tested this patch locally about some basic cases before submis=
sion.
> > > So it seems that should use the following method  to solve this probl=
em?
> > > " store i_compress_algorithm/sbi in dic to avoid inode access?"
> >
> > Zhiguo,
> >
> > Yeah, I guess so.
> Hi Chao,
> OK, I will prepare it .
> Thanks a lot.
> >
> > Thanks,
> >
> > > thanks=EF=BC=81
> > >
> > >
> > >>
> > >>>
> > >>> On 06/05, Zhiguo Niu wrote:
> > >>>> The decompress_io_ctx may be released asynchronously after
> > >>>> I/O completion. If this file is deleted immediately after read,
> > >>>> and the kworker of processing post_read_wq has not been executed y=
et
> > >>>> due to high workloads, It is possible that the inode(f2fs_inode_in=
fo)
> > >>>> is evicted and freed before it is used f2fs_free_dic.
> > >>>>
> > >>>>     The UAF case as below:
> > >>>>     Thread A                                      Thread B
> > >>>>     - f2fs_decompress_end_io
> > >>>>      - f2fs_put_dic
> > >>>>       - queue_work
> > >>>>         add free_dic work to post_read_wq
> > >>>>                                                    - do_unlink
> > >>>>                                                     - iput
> > >>>>                                                      - evict
> > >>>>                                                       - call_rcu
> > >>>>     This file is deleted after read.
> > >>>>
> > >>>>     Thread C                                 kworker to process po=
st_read_wq
> > >>>>     - rcu_do_batch
> > >>>>      - f2fs_free_inode
> > >>>>       - kmem_cache_free
> > >>>>      inode is freed by rcu
> > >>>>                                              - process_scheduled_w=
orks
> > >>>>                                               - f2fs_late_free_dic
> > >>>>                                                - f2fs_free_dic
> > >>>>                                                 - f2fs_release_dec=
omp_mem
> > >>>>                                       read (dic->inode)->i_compres=
s_algorithm
> > >>>>
> > >>>> This patch use igrab before f2fs_free_dic and iput after free the =
dic when dic free
> > >>>> action is done by kworker.
> > >>>>
> > >>>> Cc: Daeho Jeong <daehojeong@google.com>
> > >>>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing=
 in softirq")
> > >>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> > >>>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> > >>>> ---
> > >>>> v3: use igrab to replace __iget
> > >>>> v2: use __iget/iput function
> > >>>> ---
> > >>>>  fs/f2fs/compress.c | 14 +++++++++-----
> > >>>>  1 file changed, 9 insertions(+), 5 deletions(-)
> > >>>>
> > >>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > >>>> index b3c1df9..729ad16 100644
> > >>>> --- a/fs/f2fs/compress.c
> > >>>> +++ b/fs/f2fs/compress.c
> > >>>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct d=
ecompress_io_ctx *dic,
> > >>>>  }
> > >>>>
> > >>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> > >>>> -            bool bypass_destroy_callback);
> > >>>> +            bool bypass_destroy_callback, bool late_free);
> > >>>>
> > >>>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
> > >>>>  {
> > >>>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(s=
truct compress_ctx *cc)
> > >>>>      return dic;
> > >>>>
> > >>>>  out_free:
> > >>>> -    f2fs_free_dic(dic, true);
> > >>>> +    f2fs_free_dic(dic, true, false);
> > >>>>      return ERR_PTR(ret);
> > >>>>  }
> > >>>>
> > >>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> > >>>> -            bool bypass_destroy_callback)
> > >>>> +            bool bypass_destroy_callback, bool late_free)
> > >>>>  {
> > >>>>      int i;
> > >>>>
> > >>>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_=
io_ctx *dic,
> > >>>>      }
> > >>>>
> > >>>>      page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> > >>>> +    if (late_free)
> > >>>> +            iput(dic->inode);
> > >>>>      kmem_cache_free(dic_entry_slab, dic);
> > >>>>  }
> > >>>>
> > >>>> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work=
_struct *work)
> > >>>>      struct decompress_io_ctx *dic =3D
> > >>>>              container_of(work, struct decompress_io_ctx, free_wor=
k);
> > >>>>
> > >>>> -    f2fs_free_dic(dic, false);
> > >>>> +    f2fs_free_dic(dic, false, true);
> > >>>>  }
> > >>>>
> > >>>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_t=
ask)
> > >>>>  {
> > >>>>      if (refcount_dec_and_test(&dic->refcnt)) {
> > >>>>              if (in_task) {
> > >>>> -                    f2fs_free_dic(dic, false);
> > >>>> +                    f2fs_free_dic(dic, false, false);
> > >>>>              } else {
> > >>>>                      INIT_WORK(&dic->free_work, f2fs_late_free_dic=
);
> > >>>> +                    /* use igrab to avoid inode is evicted simult=
aneously */
> > >>>> +                    f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic=
->inode));
> > >>>>                      queue_work(F2FS_I_SB(dic->inode)->post_read_w=
q,
> > >>>>                                      &dic->free_work);
> > >>>>              }
> > >>>> --
> > >>>> 1.9.1
> > >>
> >

Hi Chao,

The patch is about as follows, because dic->sbi is used directly in
f2fs_free_dic: page_array_free(dic->sbi, dic->tpages, dic->cluster_size);
so there are two points I want to confirm:
1. As a corresponding, the first parameter (inode) of page_array_alloc
is need to modify to sbi or not ?
2. As a corresponding, do we need to add the sbi field in compress_ctx
so that page_array_alloc/free called
in compress flow can use sbi directly?
Thanks!

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3c1df9..897d8ae 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -34,9 +34,8 @@ static void *page_array_alloc(struct inode *inode, int nr=
)
        return f2fs_kzalloc(sbi, size, GFP_NOFS);
 }

-static void page_array_free(struct inode *inode, void *pages, int nr)
+static void page_array_free(struct f2fs_sb_info *sbi, void *pages, int nr)
 {
-       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
        unsigned int size =3D sizeof(struct page *) * nr;

        if (!pages)
@@ -155,7 +154,7 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)

 void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 {
-       page_array_free(cc->inode, cc->rpages, cc->cluster_size);
+       page_array_free(F2FS_I_SB(cc->inode), cc->rpages, cc->cluster_size)=
;
        cc->rpages =3D NULL;
        cc->nr_rpages =3D 0;
        cc->nr_cpages =3D 0;
@@ -716,7 +715,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
                if (cc->cpages[i])
                        f2fs_compress_free_page(cc->cpages[i]);
        }
-       page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+       page_array_free(F2FS_I_SB(cc->inode), cc->cpages, cc->nr_cpages);
        cc->cpages =3D NULL;
 destroy_compress_ctx:
        if (cops->destroy_compress_ctx)
@@ -734,7 +733,7 @@ static void f2fs_release_decomp_mem(struct
decompress_io_ctx *dic,

 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 {
-       struct f2fs_sb_info *sbi =3D F2FS_I_SB(dic->inode);
+       struct f2fs_sb_info *sbi =3D dic->sbi;
        struct f2fs_inode_info *fi =3D F2FS_I(dic->inode);
        const struct f2fs_compress_ops *cops =3D
                        f2fs_cops[fi->i_compress_algorithm];
@@ -1442,13 +1441,13 @@ static int f2fs_write_compressed_pages(struct
compress_ctx *cc,
        spin_unlock(&fi->i_size_lock);

        f2fs_put_rpages(cc);
-       page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+       page_array_free(F2FS_I_SB(cc->inode), cc->cpages, cc->nr_cpages);
        cc->cpages =3D NULL;
        f2fs_destroy_compress_ctx(cc, false);
        return 0;

 out_destroy_crypt:
-       page_array_free(cc->inode, cic->rpages, cc->cluster_size);
+       page_array_free(F2FS_I_SB(cc->inode), cic->rpages, cc->cluster_size=
);

        for (--i; i >=3D 0; i--) {
                if (!cc->cpages[i])
@@ -1469,7 +1468,7 @@ static int f2fs_write_compressed_pages(struct
compress_ctx *cc,
                f2fs_compress_free_page(cc->cpages[i]);
                cc->cpages[i] =3D NULL;
        }
-       page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+       page_array_free(F2FS_I_SB(cc->inode), cc->cpages, cc->nr_cpages);
        cc->cpages =3D NULL;
        return -EAGAIN;
 }
@@ -1499,7 +1498,7 @@ void f2fs_compress_write_end_io(struct bio *bio,
struct page *page)
                end_page_writeback(cic->rpages[i]);
        }

-       page_array_free(cic->inode, cic->rpages, cic->nr_rpages);
+       page_array_free(F2FS_I_SB(cic->inode), cic->rpages, cic->nr_rpages)=
;
        kmem_cache_free(cic_entry_slab, cic);
 }

@@ -1637,7 +1636,7 @@ static int f2fs_prepare_decomp_mem(struct
decompress_io_ctx *dic,
                f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
        int i;

-       if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+       if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
                return 0;

        dic->tpages =3D page_array_alloc(dic->inode, dic->cluster_size);
@@ -1670,10 +1669,9 @@ static int f2fs_prepare_decomp_mem(struct
decompress_io_ctx *dic,
 static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
                bool bypass_destroy_callback, bool pre_alloc)
 {
-       const struct f2fs_compress_ops *cops =3D
-               f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+       const struct f2fs_compress_ops *cops =3D
f2fs_cops[dic->compress_algorithm];

-       if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+       if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
                return;

        if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
@@ -1708,6 +1706,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct
compress_ctx *cc)

        dic->magic =3D F2FS_COMPRESSED_PAGE_MAGIC;
        dic->inode =3D cc->inode;
+       dic->sbi =3D sbi;
+       dic->compress_algorithm =3D F2FS_I(cc->inode)->i_compress_algorithm=
;
        atomic_set(&dic->remaining_pages, cc->nr_cpages);
        dic->cluster_idx =3D cc->cluster_idx;
        dic->cluster_size =3D cc->cluster_size;
@@ -1762,7 +1762,7 @@ static void f2fs_free_dic(struct decompress_io_ctx *d=
ic,
                                continue;
                        f2fs_compress_free_page(dic->tpages[i]);
                }
-               page_array_free(dic->inode, dic->tpages, dic->cluster_size)=
;
+               page_array_free(dic->sbi, dic->tpages, dic->cluster_size);
        }

        if (dic->cpages) {
@@ -1771,10 +1771,10 @@ static void f2fs_free_dic(struct decompress_io_ctx =
*dic,
                                continue;
                        f2fs_compress_free_page(dic->cpages[i]);
                }
-               page_array_free(dic->inode, dic->cpages, dic->nr_cpages);
+               page_array_free(dic->sbi, dic->cpages, dic->nr_cpages);
        }

-       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
+       page_array_free(dic->sbi, dic->rpages, dic->nr_rpages);
        kmem_cache_free(dic_entry_slab, dic);
 }

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b..da2137e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1536,6 +1536,7 @@ struct compress_io_ctx {
 struct decompress_io_ctx {
        u32 magic;                      /* magic number to indicate
page is compressed */
        struct inode *inode;            /* inode the context belong to */
+       struct f2fs_sb_info *sbi;       /* f2fs_sb_info pointer */
        pgoff_t cluster_idx;            /* cluster index number */
        unsigned int cluster_size;      /* page count in cluster */
        unsigned int log_cluster_size;  /* log of cluster size */
@@ -1576,6 +1577,7 @@ struct decompress_io_ctx {

        bool failed;                    /* IO error occurred before
decompression? */
        bool need_verity;               /* need fs-verity verification
after decompression? */
+       unsigned char compress_algorithm;       /* backup algorithm type */
        void *private;                  /* payload buffer for
specified decompression algorithm */
        void *private2;                 /* extra payload buffer */
        struct work_struct verity_work; /* work to verify the
decompressed pages */
