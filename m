Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAC24DCF1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749035687; cv=none; b=PrEw+94ptqZWCNKjfpP/aZhLEuEWxkc7HkS/0CyWqHsN9FKWfKITbgCknwItUX0Kkesp5PbRMPcnIdYPkPf8UK08dU5vzF/au+nL9pOFs6OJd6g4SqHr+2X6nbzD/cx/VdRaiH2HNCfryLimDjSgbEvevpWGQ/DBs66JTvewEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749035687; c=relaxed/simple;
	bh=cBgnUFe9NIi5atwAq48uMs0hePgq9x+WEyJyAKbr08I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+aMOgnQayLV/tViTwrA8RxjI+ITwFeXT+fnc4oB/ypUHNaJqljlghfDGglnbGKG90FdbZ4jxcsWQ3aQbBKCdzjNtCfoI94EyD1CB10DUEdFVQH303fGDB4nylM9TcZN301m2+BDN5aZQYfI2el4Q1R/Do7x9nlbVrcXIm4ed80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4DH7Vyp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4DH7Vyp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so677674f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749035684; x=1749640484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W3SslCIkybQ8nlaw9YaSUzaYWq8vA0m3x6Q+lRAvHA=;
        b=h4DH7VyptlmBYB2rZzJT2jQ6yRoS52xzVhncgNnsuwraJOdPIjltrx8eVL1U21QLZl
         LTnrKt3JedWY1K9x0oDR+FkZQ4IAb+U/4NB8/ULF3f7J77KuvUGMxJ54D//3TEpEHVad
         UA67e4FLIindqg/cwjxesYPBo0zCsVzM6TEaTXy1RuA/bKv5HF7ImfLqtxgH5OYqwO2e
         JqlYkdR0ctV63TsCFi7W8iBVtM8FN+qkazpAHNpcjF9K7l/v6hodd4Go95v2wYDzR0+E
         rsGz2nMUCnt2MyOzQXGyI1hvtOwzzF9Y8FIvMQug+z/nwsADagUtAk8PZtzh2ol1iNLQ
         U06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749035684; x=1749640484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/W3SslCIkybQ8nlaw9YaSUzaYWq8vA0m3x6Q+lRAvHA=;
        b=Mr1W+OOn+DK4RtEsGl0V5GbZFKYQQ9BYI4aHxCs7EFkHquvHwNHVw//OIrTEEwFWrB
         ReZPaD53SYpVD+ii31lPsBTpCblcwVoYaGVRrt+hiTDIhMT0g3DEjHbhM5nUMNwUzV35
         B18uRxuLuU6KFaYbbXT00rr3ngAgbuVOjonVmKxepfn0itU2IUIZaoU+eXVZ8EOcvkD2
         AyUmsqRLHQcJr0wp0SGEx+VGNfN4/nOMISt6sG6WhJWf2gqjoqaKUN59o8uGMXDT+VBh
         5bMopLhnuNSYYCmRB1ZOiO5+eUgZoRW6U+lPmblQZ/rgIjn/NgFJILzQHi1jMZVlrNDP
         8v6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGIl44guHl2fDC5zCFkXfJwWaxWR/dklnX/P3VHQ1nXGEr1ChVp9ETBrSmT5cEkZG58usdA1sL5Kvc1KI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9c5w5FmSHzyJSx1e4kPX5nUwTX0GN+F6veAbOzhMxFbZOG8bl
	GN1PE3V+I3QIbbKcyj72lreNDWLuPwG0IaURSI4jhRA7Xi68eXe+1GrbV/7DFN6b1CyQ0NaYhM8
	XzuaUtLd4ciMO7tvaemeFBjiQJknxplk=
X-Gm-Gg: ASbGncv7zUKMMna26bUNu6/AGfLIc+u7zc7UDeds/+5b8yXDwvkRL8RdJS89ZXwZjoa
	fObqUD2oCPoMMHXJSOk5o9XIgKDBRqojiMp078WHZnK29R8vDbpYgmqgiSV6NgD8JhTka02iTDg
	Hesydd2UsTzlC4GfQ2Iht79sue0m4ioVZIeDUnipjK/Mav
X-Google-Smtp-Source: AGHT+IE0Qn6gOQ8QGmAs8CrGPJdavUw2eWZCGOUk8VhczlRhK7Yu7ysdfiEIEcTehO1ISuGC68kBYW8rIShTXFmyYbE=
X-Received: by 2002:a05:6000:2305:b0:3a3:584b:f5d7 with SMTP id
 ffacd0b85a97d-3a51d91f8a4mr726947f8f.5.1749035683391; Wed, 04 Jun 2025
 04:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
 <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org> <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
 <1791cead-c598-41dc-8c6c-811787df14b7@kernel.org>
In-Reply-To: <1791cead-c598-41dc-8c6c-811787df14b7@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 4 Jun 2025 19:14:31 +0800
X-Gm-Features: AX0GCFuDkB7CamZfWdlKurMulJGXKDq3kb6xULMz2Ze7rFIYjcGWXjRFGaXSkz0
Message-ID: <CAHJ8P3JCV9wjRXC530WgPjZx-_XEhVRoG3B9Mcn4XG_Y-x1nGQ@mail.gmail.com>
Subject: Re: [PATCH] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=884=E6=97=A5=E5=91=
=A8=E4=B8=89 19:09=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/4/25 18:49, Zhiguo Niu wrote:
> > Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=884=E6=97=A5=E5=
=91=A8=E4=B8=89 17:48=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On 6/4/25 13:54, Zhiguo Niu wrote:
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
> >>> This patch increase inode->i_count before f2fs_free_dic and decrease =
it
> >>> after free the dic.
> >>>
> >>> Cc: Daeho Jeong <daehojeong@google.com>
> >>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in=
 softirq")
> >>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> >>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> >>> ---
> >>>  fs/f2fs/compress.c | 19 ++++++++++++++-----
> >>>  1 file changed, 14 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >>> index b3c1df9..6b3b3a7 100644
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
> >>> @@ -1775,6 +1775,11 @@ static void f2fs_free_dic(struct decompress_io=
_ctx *dic,
> >>>       }
> >>>
> >>>       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> >>> +     if (late_free) {
> >>> +             spin_lock(&dic->inode->i_lock);
> >>> +             atomic_dec(&dic->inode->i_count);
> >>> +             spin_unlock(&dic->inode->i_lock);
> >>
> >> If it is the last one release i_count, it needs to call iput_final to =
evict inode
> >> like what iput did, so we'd better to call iput() here?
> > Hi Chao,
> > Yes, we have also tested this method(iput/__iget), and it worked.
> > Just think It is simpler and easier to read to directly operate
> > i_count, and then free it
> > by relying on the memory module when i_count=3D0.
> > But It seems iput/__iget is better.
> >>
> >>> +     }
> >>>       kmem_cache_free(dic_entry_slab, dic);
> >>>  }
> >>>
> >>> @@ -1783,16 +1788,20 @@ static void f2fs_late_free_dic(struct work_st=
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
> >>> +                     atomic_inc(&dic->inode->i_count);
> >>> +                     spin_unlock(&dic->inode->i_lock);
> >>
> >> iget()?
> >>
> >> BTW, can we store i_compress_algorithm in dic to avoid inode access?
> >
> > Also thought of this method, but it would require more changes.
> > dic->inode used in f2fs_free_dic are all needed to modify except
> > i_compress_algorithm.
> > such as  page_array_free(dic->inode),
>
> Zhiguo,
>
> page_array_free() parses dic->inode to get sbi only, so we can pass sbi t=
o
> page_array_free() directly to avoid using dic->inode.
Hi Chao,
but now sbi is not in dic structure, so we also need to add it ?
>
> > allow_memalloc_for_decomp(F2FS_I_SB(dic->inode)).
> >
> > Do you have any other suggestions?
>
> Using iget/iput looks fine to me, please go ahead.
OK~
thanks!
>
> Thanks,
>
> > thanks=EF=BC=81
> >
> >>
> >> Thanks,
> >>
> >>>                       queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> >>>                                       &dic->free_work);
> >>>               }
> >>
>
