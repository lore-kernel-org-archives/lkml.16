Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1214E136E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096332; cv=none; b=aQWG7ij4LN/fD99zWTgo39z/MXVwHGMvbZ681knD9yp1NtBuhjsVGDXzvsQTqeBkBMTrqx8gAg1uo1MeazRXupAhtFLGP9k0B7dHWVIQRlG93hVbmDsYb4nH6g3s82W0VEaPP7ckkAqdFTYN+v4/SC/rPpiweb/EPzwIyZKIGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096332; c=relaxed/simple;
	bh=0aMuVvcO/HryfZVnLIrporC1sMe8K19mf8AMb9yj2UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMaIFPy7x55pxKd/mNSIw+PjVFinqdLYbzqYl2Ucf9/envHMrQ5NlIF1AOgYH3s0JvK9xdfuqgp1w9AIaAriXeUP90zopcjLEYCIbxNsmOFn7uIJbgtGeiReb1o9qg6Qi3dUOmv5yls0Lg7QJeiJm3zz5M0FuHKJd47NTpfloIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9ODmomC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9ODmomC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e62619afso79670f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749096329; x=1749701129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEwtieco4GKYEC1Fw9rbOSmkU4O570HqhhN1nDaf00c=;
        b=P9ODmomC72UN8EmB2tJD2B0yQFuq/smuKTwGArOC+3gDPtIx7YdY2cA5orVcsoAbe3
         IKAbDYKBqDA0FXupKA7HaV9szr6a/BSjgsxpv55E2F8vwzqnBdQQSaMInyZQcAfweLq9
         Y9GF5h4IQpxpDuUEfALsyWgu88F/PMWmEt1Z3B59AsEewcOb+Rc0DcmAmvQ+nD19Gnut
         4kNqM0rPcwiO0aEdVx8gge6FfUWgGdoTmJ3yfTdvVdTk064JGByctLy+7bbeWAiXFIKV
         VxMt1ZlWBsBxdkBYtaRSUGSSHq5bKdkU66lj1IFGUN/WdHGYBWmwe+IvQEwV67h3vaMg
         XliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096329; x=1749701129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEwtieco4GKYEC1Fw9rbOSmkU4O570HqhhN1nDaf00c=;
        b=gLALTK+lH8v52yKiqcF61/BZ5cjq0xLszg09I1ZqmEPmkoa39Q31z6hq6o1miF1j52
         6h3Sat01wfwMmbhr81HeDkGNvdI57HWGfJfUPrQUS9n0Z/KjSOkA+DGi0Z+cPRzBVam4
         QZPGSafJbK7HgCzvDw4iIBrxktAauuxMfFhbxEFZrKVw/VOcHZFhU8jlPWv7scleUn+V
         P+AMF6n6hPc4Zj19cCPVP9b9PLipLY8J9ygM44a2fRflVfd5LxHYh2EST1IDJWozxbTh
         EndBNUy+IPAtzLPsuM7ZPXRcP8UyKKeHeBRt+yujMuOUW5AsDeIOi+7wn7LypMgBomBL
         NUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMLmAbLdiphSiWpFK2iWn3VyysE31ZYwzkYifIDHr8ahP/ITXOJIM/toh8+EQGEC+Jy4JhNm6aNiG7/Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ocDEsz/huF41sJ0Eo3DWUNm5+toQqhqVemysHIKojyBHrdTK
	cD0RI+tbugr50E3PRKug7TPk/dQeKtjhu5H0aXQCW8UjilSfi6iIQmQCncyLQ+BeBPv0fUQZp9k
	wqRGr5Li5/QpSz5NeIp/olU1FjTJ4AZwkvQ==
X-Gm-Gg: ASbGncv+fSMNY5Q+HRSAmdr3gB5UdacfRmsWwNuMvx2QUAr0p9vnyRyS0SJjiDI0aRH
	XVhgy5ORT7pKig5g4WaSvF9jFw4QBIQDvo+3yFkETITnrzgpCr7io3M7xEDgXvfDGLd6j+X5ZtL
	PkyyyIR0e3nuguXHNGDH3QdC8CmhKr3OrLbQ==
X-Google-Smtp-Source: AGHT+IEGy5Ojz4lIsgpjdJct16wfU6hSORmQedpsbzwZYJaouI3aHwEH0WbI773cz57GlUP8HPa6/7RP5vf0nNBq8mc=
X-Received: by 2002:a05:6000:430d:b0:3a3:6ab0:8863 with SMTP id
 ffacd0b85a97d-3a51d997120mr1434178f8f.16.1749096329088; Wed, 04 Jun 2025
 21:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
 <76adf905-191d-4415-a584-a79bc502bb87@kernel.org> <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
 <2a387dd6-9c10-478d-aae2-8284ad395944@kernel.org>
In-Reply-To: <2a387dd6-9c10-478d-aae2-8284ad395944@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 12:05:17 +0800
X-Gm-Features: AX0GCFvJBT95joyY_JO0nCWFEiJ0UyXel-A54_RG69i2bqx3GaVOigAsJsFlYfo
Message-ID: <CAHJ8P3JcGAtwQVTqCfno+_agZjkEMn3XHtgBeOicUAPkONvnTQ@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=885=E6=97=A5=E5=91=
=A8=E5=9B=9B 11:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/5/25 10:44, Zhiguo Niu wrote:
> > Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=885=E6=97=A5=E5=
=91=A8=E5=9B=9B 10:23=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On 6/4/25 19:37, Zhiguo Niu wrote:
> >>> The decompress_io_ctx may be released asynchronously after
> >>> I/O completion. If this file is deleted immediately after read,
> >>> and the kworker of processing post_read_wq has not been executed yet
> >>> due to high workloads, It is possible that the inode(f2fs_inode_info)
> >>> is evicted and freed before it is used f2fs_free_dic.
> >>>
> >>>     The UAF case as below:
> >>>     Thread A                                      Thread B
> >>>     - f2fs_decompress_end_io
> >>>      - f2fs_put_dic
> >>>       - queue_work
> >>>         add free_dic work to post_read_wq
> >>>                                                    - do_unlink
> >>>                                                     - iput
> >>>                                                      - evict
> >>>                                                       - call_rcu
> >>>     This file is deleted after read.
> >>>
> >>>     Thread C                                 kworker to process post_=
read_wq
> >>>     - rcu_do_batch
> >>>      - f2fs_free_inode
> >>>       - kmem_cache_free
> >>>      inode is freed by rcu
> >>>                                              - process_scheduled_work=
s
> >>>                                               - f2fs_late_free_dic
> >>>                                                - f2fs_free_dic
> >>>                                                 - f2fs_release_decomp=
_mem
> >>>                                       read (dic->inode)->i_compress_a=
lgorithm
> >>>
> >>> This patch use __iget before f2fs_free_dic and iput after free the di=
c.
> >>>
> >>> Cc: Daeho Jeong <daehojeong@google.com>
> >>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in=
 softirq")
> >>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> >>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> >>> ---
> >>> v2: use __iget/iput function
> >>> ---
> >>>  fs/f2fs/compress.c | 16 +++++++++++-----
> >>>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >>> index b3c1df9..3f0c18d 100644
> >>> --- a/fs/f2fs/compress.c
> >>> +++ b/fs/f2fs/compress.c
> >>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct deco=
mpress_io_ctx *dic,
> >>>  }
> >>>
> >>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> >>> -             bool bypass_destroy_callback);
> >>> +             bool bypass_destroy_callback, bool late_free);
> >>>
> >>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
> >>>  {
> >>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(stru=
ct compress_ctx *cc)
> >>>       return dic;
> >>>
> >>>  out_free:
> >>> -     f2fs_free_dic(dic, true);
> >>> +     f2fs_free_dic(dic, true, false);
> >>>       return ERR_PTR(ret);
> >>>  }
> >>>
> >>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> >>> -             bool bypass_destroy_callback)
> >>> +             bool bypass_destroy_callback, bool late_free)
> >>>  {
> >>>       int i;
> >>>
> >>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_=
ctx *dic,
> >>>       }
> >>>
> >>>       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> >>> +     if (late_free)
> >>> +             iput(dic->inode);
> >>>       kmem_cache_free(dic_entry_slab, dic);
> >>>  }
> >>>
> >>> @@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_st=
ruct *work)
> >>>       struct decompress_io_ctx *dic =3D
> >>>               container_of(work, struct decompress_io_ctx, free_work)=
;
> >>>
> >>> -     f2fs_free_dic(dic, false);
> >>> +     f2fs_free_dic(dic, false, true);
> >>>  }
> >>>
> >>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task=
)
> >>>  {
> >>>       if (refcount_dec_and_test(&dic->refcnt)) {
> >>>               if (in_task) {
> >>> -                     f2fs_free_dic(dic, false);
> >>> +                     f2fs_free_dic(dic, false, false);
> >>>               } else {
> >>>                       INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> >>> +                     /* to avoid inode is evicted simultaneously */
> >>> +                     spin_lock(&dic->inode->i_lock);
> >>> +                     __iget(dic->inode);
> >>> +                     spin_unlock(&dic->inode->i_lock);
> >>
> >> Oh, how about using igrab() instead?
> > Hi Chao,
> > after I check igrab, I think it is ok,
> > but here We don't need care about igarb's return value, right?
>
> I guess "return NULL" should be impossible case, but still we can add
> f2fs_bug_on() to detect any potential bug, right?
OK, thanks for your suggestions.
>
> Thanks,
>
> > Thanks!
> >
> >>
> >>>                       queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> >>>                                       &dic->free_work);
> >>>               }
> >>
>
