Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DE2576
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749624117; cv=none; b=QHvoZzYEWOxfra2kdeJNZHVe060d44dGFiF1Cu/gYOEwCGRIlRwKU2NHkrWfUkUn8VwCg2g171YPjCxAnMcttOtRmAlQsoFcgQ3mq8l8dW/NSNQCTSjKYEJ+2l8vBM7HnCnRIgwU2RokU3SOhtdkjMDhUvqnbPIay3Odj3z1o/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749624117; c=relaxed/simple;
	bh=sXJmL5Px5sCtFSPvYG6NMM3tqqDimkKgHA0Ne5OKOTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7c+yqwW7pRGt6toPXqHLYxZchtTTqP69LsH5Gk5mmdyx1YJapHMH8NCl3BDpD5v1wu+Grsoe2q96BFVO6XOIGLlt9cWCY75whfTbpaLDccmOLVQQ7bjXTPaJfXwRemnE8cabQfzhw8rx8x/2UFcnOXGmWx9tlym2+fw1Bocb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvUTpJom; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvUTpJom"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4f7865b22so27303f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749624114; x=1750228914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYhs6xK44tttQEGd9alnm7cLivjv6fMj93Ib7TVFrE4=;
        b=SvUTpJomVEC6NGTSt+eiJ/f+nyLL8e/sFPbXTBmZjgRMOblY0dAvfAqR2jvUJnqPKY
         uPiRpVQXrxL7/PfXIH2oE6uTe4N69CnggmbfH2IM6+uxl2MAg3LLaWWEaoNMI9LLGJm1
         /NVo05DuMfN+dPYx879ru3Cpgc0i8vWJ13DfolfN46GU+8heRwDQWk+Kk80Cn45QXPfM
         8VQHxGYqIXJngT/LQdcHk7lWfbxHIcIbusbt1JXYxoancLwVA/q+QE5IPwtJZnaPLzae
         ulWRtT+4B2oJgUvti17jnq/HWBFg2U0O5KS/dWDTjR94hAIYYFjE1iOVyhut1idb7dw6
         qLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749624114; x=1750228914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYhs6xK44tttQEGd9alnm7cLivjv6fMj93Ib7TVFrE4=;
        b=JwIktjk+R3vxHomNCHBtVsCwxbtD8teZJqDEuQUHfgwjouTstYYND9bK7hn7CwA5fh
         h+IOPV/+xnDKT5dtg9189WlqhxVQCyXj4FEfLgXVQbJffiDF1VPcjas7I/aqU4BxSG1R
         KO+BDjohj5hljPBqat2x9Bx201i6j1PJzw+zg/nzasDVlkgH9GpZgsdICQWF0DL6LGl9
         zIYjm1Zf6vU0sEImz4xzi/mMU8VLAhgE0u9GwEqnymA05uyZeVjzbGep4hE16xbEkAIe
         vj5/cVqKom+zA9kttM2d6h1gwvXulg8EWFPjoeGJlV/Q9Neckkst7QnZq9bqOb2BBFqk
         0w3g==
X-Forwarded-Encrypted: i=1; AJvYcCXHsHwth6FoJiaHHA8Y5RMGOKe0uln9TgBTNNAbGWkFysmQ6Y/EMuJf6U3VYTWl7mHrxR+jyyQhKXT83gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgpLI86uXQeN/J+5BvghCHIVUjQjTqmeSrI5+foArYU0Fva4Di
	BCz2CRbss0lenhH32plYZ/6HThP8yCvO5bNsScyEpL9T91ud5BqDRlQmwBWAz2sHt6tvnuKO4Gv
	RQXgmPaER0hXn/PUhGD116EfbX93cu5D48sQs
X-Gm-Gg: ASbGncuxO1Ff2uvfKRGfBt7aN5mToKSE9jMRH46r+6qqtyL7pSgJFKAGvGrwfsT1kGS
	a1BMmNfOaVy86cI2jBNEFdKutWkRz83801txaPfppC955P85TFYig2/FdzAzHDhfIZeBRF4h3ZO
	+T+jGD6C1tbpnZ5W2DhEZHgNqStBSxiwCcnCQk8TGecn2D
X-Google-Smtp-Source: AGHT+IEUqCZcBZMD4HCDk8xW7KsXfbJpYiHZ1ipiPUQm8CijINYGP5+iokOyIKe2ejx1U9zxoWMwK+NBPQJAtV4RTNg=
X-Received: by 2002:a05:6000:40c9:b0:3a4:d0dc:184b with SMTP id
 ffacd0b85a97d-3a5586c5ea5mr521678f8f.6.1749624113790; Tue, 10 Jun 2025
 23:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com> <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
In-Reply-To: <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 11 Jun 2025 14:41:42 +0800
X-Gm-Features: AX0GCFszQVFDzNW_vueFfuzuPAF20JAWp1_i5iMDP87FAt4QDQtAxoIS95iopo0
Message-ID: <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
Subject: Re: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=8811=E6=97=A5=E5=91=
=A8=E4=B8=89 14:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/11/25 00:08, Jaegeuk Kim wrote:
> > Hi Zhiguo,
> >
> > This patch causes CPU hang when running fsstress on compressed/non-comp=
ressed
> > files. Please check.
>
> Oh, seems it may cause below deadlock:
>
> CPU0
> process A
> - spin_lock(i_lock)
> software IRQ
> - end_io
>  - igrab
>   - spin_lock(i_lock)
>
> Thanks,
Hi Chao,
Thanks for pointing this out.
I have tested this patch locally about some basic cases before submission.
So it seems that should use the following method  to solve this problem?
" store i_compress_algorithm/sbi in dic to avoid inode access?"
thanks=EF=BC=81


>
> >
> > On 06/05, Zhiguo Niu wrote:
> >> The decompress_io_ctx may be released asynchronously after
> >> I/O completion. If this file is deleted immediately after read,
> >> and the kworker of processing post_read_wq has not been executed yet
> >> due to high workloads, It is possible that the inode(f2fs_inode_info)
> >> is evicted and freed before it is used f2fs_free_dic.
> >>
> >>     The UAF case as below:
> >>     Thread A                                      Thread B
> >>     - f2fs_decompress_end_io
> >>      - f2fs_put_dic
> >>       - queue_work
> >>         add free_dic work to post_read_wq
> >>                                                    - do_unlink
> >>                                                     - iput
> >>                                                      - evict
> >>                                                       - call_rcu
> >>     This file is deleted after read.
> >>
> >>     Thread C                                 kworker to process post_r=
ead_wq
> >>     - rcu_do_batch
> >>      - f2fs_free_inode
> >>       - kmem_cache_free
> >>      inode is freed by rcu
> >>                                              - process_scheduled_works
> >>                                               - f2fs_late_free_dic
> >>                                                - f2fs_free_dic
> >>                                                 - f2fs_release_decomp_=
mem
> >>                                       read (dic->inode)->i_compress_al=
gorithm
> >>
> >> This patch use igrab before f2fs_free_dic and iput after free the dic =
when dic free
> >> action is done by kworker.
> >>
> >> Cc: Daeho Jeong <daehojeong@google.com>
> >> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in =
softirq")
> >> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> >> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> >> ---
> >> v3: use igrab to replace __iget
> >> v2: use __iget/iput function
> >> ---
> >>  fs/f2fs/compress.c | 14 +++++++++-----
> >>  1 file changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >> index b3c1df9..729ad16 100644
> >> --- a/fs/f2fs/compress.c
> >> +++ b/fs/f2fs/compress.c
> >> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decom=
press_io_ctx *dic,
> >>  }
> >>
> >>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> >> -            bool bypass_destroy_callback);
> >> +            bool bypass_destroy_callback, bool late_free);
> >>
> >>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
> >>  {
> >> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struc=
t compress_ctx *cc)
> >>      return dic;
> >>
> >>  out_free:
> >> -    f2fs_free_dic(dic, true);
> >> +    f2fs_free_dic(dic, true, false);
> >>      return ERR_PTR(ret);
> >>  }
> >>
> >>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> >> -            bool bypass_destroy_callback)
> >> +            bool bypass_destroy_callback, bool late_free)
> >>  {
> >>      int i;
> >>
> >> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_c=
tx *dic,
> >>      }
> >>
> >>      page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> >> +    if (late_free)
> >> +            iput(dic->inode);
> >>      kmem_cache_free(dic_entry_slab, dic);
> >>  }
> >>
> >> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_str=
uct *work)
> >>      struct decompress_io_ctx *dic =3D
> >>              container_of(work, struct decompress_io_ctx, free_work);
> >>
> >> -    f2fs_free_dic(dic, false);
> >> +    f2fs_free_dic(dic, false, true);
> >>  }
> >>
> >>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
> >>  {
> >>      if (refcount_dec_and_test(&dic->refcnt)) {
> >>              if (in_task) {
> >> -                    f2fs_free_dic(dic, false);
> >> +                    f2fs_free_dic(dic, false, false);
> >>              } else {
> >>                      INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> >> +                    /* use igrab to avoid inode is evicted simultaneo=
usly */
> >> +                    f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->in=
ode));
> >>                      queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> >>                                      &dic->free_work);
> >>              }
> >> --
> >> 1.9.1
>
