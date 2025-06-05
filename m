Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B5476C61
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 02:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091471; cv=none; b=iCjJmfkx1Kd2MH2S/9B39ZUoisfUl5QVRLMQlD0psOaVrjSD+gkBH2VLAdKDhums8rv83S53Y40tKoQkVZCozoZdmhuAZHZdfkZ6mSivJmbz+I0maLTFluoPeX/O6fWhc23SR67LzTkjxm56/gJwyHBKwLNYJLeTO8Is1zV3jIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091471; c=relaxed/simple;
	bh=o32E6eCEdA2ACnzowIOk/ynhye+vAbgJhSdf3DTg6jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTLjj22+tNMUFAQzR1N7msCBFd2dJwU0AUZfdJ+SDgNIM4aYt50jCe7K9vNi7xM5EYvn9snS1Av5N+E9Z420R9EwKujDUSc7oCeGyI5ES95eXzVh8qvJrcUwc/6Q55vsGHmmagFgxJNp0Tsz9q6dXA6Q2OBqYahvWlPhbPaiAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUrnfvhf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUrnfvhf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so50845f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749091468; x=1749696268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/0pVGWzXcFQ955kWBaboT1rhQfuOXVFKSSp7OjJXH4=;
        b=QUrnfvhfDiB3rveq4ihF3znoFz0jzacHrDBm/LX/fTOcOC9w9Rinx7m7oMdUPxTrJE
         sGznKwAqj1cN+HhMwt2g+8RUAB2/9wmohhpQnMjNK4iLY7+3aIg6ZocmUQ7lWRtU8dZY
         FmhUnuB3UZwSsOKWdu+/qF/T6YLFL8oCdQN/knTx25AMZ9bJZA2uOSFJqr6JQPvoMS4J
         amG5DXMGD10aBVx0AdjwgpFEq3sd3yufHuBE9rxtJAFDgePRWXF93sNskGkJwcNAsokH
         MlYyZbRUHmS/TBnGhcRHMAj64Ii4l2G1lEKVh4TWhSG1cMS36kDK6c9t1ZZYr6hlHq5V
         U4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749091468; x=1749696268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/0pVGWzXcFQ955kWBaboT1rhQfuOXVFKSSp7OjJXH4=;
        b=TvKRkCRHy1Z5i40dPQVfslm+8z054R1IPbv3+uIj8JZf4IGY6v8VXnpMGBH2EM6HY/
         ideSs/rXy4YiVMYwO6BbYJ0ALcUS4aF7YHJBdRHc9LOMuopeiM7Rn7n50JDw04Q9cqbd
         rLZQA8cNLRtcs7RRcLwpvBULcG3bJAuIXwcnnAk+NTFucVttAXcVQ2iB1XxI626DJ0YJ
         truwPeS3k7n9XOZpSVebK9OHLo6Wf2SZLDrVwXhtL1gQJyyaBnGHExniv2t0AoCQ/mCs
         JIYC5idJZCQaHhfysV6RRPYolOz0g8v/CrOCrWKLMT7X6vkVDUjau5O1IJKAiTetZ5Oy
         fK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXODqUfAcJyEo33p983fmFnY+OFoqczKoUhMob/URuiO5gq1Za4/CBe30nRnl4DJKafs3lJN59YDgF2DhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJqgYU+ey+kvLGMWYXYvk0F9KVLy9Iq4Oj5ZdgB12FFke9uM3
	SqRp5KnRABcWsYtJvo5e6lbZaqJbMwK2hkBygNWnV9MV+uHzgqPAVdxipw0m2Txfi2IWLcYu2Ky
	zHfJOyiMYqk7VdjmtbaSCeP+63Mn/66U=
X-Gm-Gg: ASbGncuDiAzKGa3vITr6Uvj8+vrlkOE9v/m1jKr42s9nCrIXj7Co7LaveSaAp2JugTB
	rKdwXFoFw80MYxALMR8+tan5+TR6pBjsv4x2S+xd8q7ObVafv7PYFOeS6WOxECVt2dVB8x38cKr
	2yr9mFiMoN5vX1C6lDNpHKrgrnrvs8FXHF25MPza831U3n
X-Google-Smtp-Source: AGHT+IFUb2rBaDqOLFPMfGPrqkKc83DFwn/HlDNCEZzWMjeMi/FrJzuQJY5+W1OgDhvOfGFhBS6ObPFJrvnJlmlvShw=
X-Received: by 2002:a05:6000:2482:b0:3a4:d30a:7633 with SMTP id
 ffacd0b85a97d-3a51d987c45mr1430856f8f.15.1749091467780; Wed, 04 Jun 2025
 19:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com> <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
In-Reply-To: <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 10:44:15 +0800
X-Gm-Features: AX0GCFvXicNXat09LB3YmJe-vPJXw7p7jjCvh-oK6T8jhT5VEamiUB0-8G47A_U
Message-ID: <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=885=E6=97=A5=E5=91=
=A8=E5=9B=9B 10:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/4/25 19:37, Zhiguo Niu wrote:
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
> > This patch use __iget before f2fs_free_dic and iput after free the dic.
> >
> > Cc: Daeho Jeong <daehojeong@google.com>
> > Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in s=
oftirq")
> > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> > Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> > ---
> > v2: use __iget/iput function
> > ---
> >  fs/f2fs/compress.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index b3c1df9..3f0c18d 100644
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
> > @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ct=
x *dic,
> >       }
> >
> >       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> > +     if (late_free)
> > +             iput(dic->inode);
> >       kmem_cache_free(dic_entry_slab, dic);
> >  }
> >
> > @@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_stru=
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
> > +                     __iget(dic->inode);
> > +                     spin_unlock(&dic->inode->i_lock);
>
> Oh, how about using igrab() instead?
Hi Chao,
after I check igrab, I think it is ok,
but here We don't need care about igarb's return value, right?
Thanks!

>
> >                       queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> >                                       &dic->free_work);
> >               }
>
