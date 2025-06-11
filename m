Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636F32253FB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749624779; cv=none; b=NY72B+Pfud6ECECfOKjYVVsMSoE+DJtvfhSgN5LRlJiXj8MtCmBFQ1+w9blqTN8YFFGH3QZF6FAC5SW+q8+/lOEjqaeSLOHfUIaxWsewd08gWzC9fa/oKGLG6sGEcstxypC9/flSOEBlbA09vgYppDByVY8FzyQg6VtBPplVCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749624779; c=relaxed/simple;
	bh=/CLLrIW5aQMUJNR9aLvDWLib2WpGEzBt04bGlUBvQpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKsYw1vN7PBHSltUfOox7a6MOud8QdOjg/so5Cbd93QDuBTHvbECMjAsz2y6R0/TwjLfK0CToiDCk6+WzgnFi/2OLEKxT8eDONcC+WGPyHItqPpYHTOKG29eQLAZEUahn6xSUhcNCK3dheZlPj15ZnQ6ORLWXUgWm7IVIV0sZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKPaZy2s; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKPaZy2s"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a528e301b0so31120f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749624776; x=1750229576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZcoFkVAiTRFqiOiNNWpiZEngLNxlokcj95V82V3k6w=;
        b=YKPaZy2sGYDuokZ2viUJxW75BaPTK6L3XGkMe7z0vuxO07wJqZkZTIebOYP9Is2Z4o
         ANc806h1CIftTdG0r4AkFVqXvNn0ksOYbWo4tT0bS+ovybFzTLSdwOA1VG1l8dY/7ZgF
         h+nJSWTKr4qQ4pK/vM/S3/NJF7wdLSJhIFoMpE/outza35N6SFK4swfPiR3tXDxnMulW
         +PzNNJz/syYnLSDFSNaqk0VdA8jZtupwkOQPho63OiNmZa7yHrZGqfw4fcAu5fAkJuy+
         hJPAF1T5JkEUXRHR6smNlVcA/ZkCdUWCJCzwrwJ7hzcDCB+9zhWDXZ4c/tujicmRcSHb
         /Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749624776; x=1750229576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZcoFkVAiTRFqiOiNNWpiZEngLNxlokcj95V82V3k6w=;
        b=V91o0OegcM+wk5ZYhDOCWsaI4Ce3cosd13fsfdlwipFsUN3SEes+spOHZUHcJhvrp9
         YZVWCcjHME6b1UIsVKDW9iAqXrFT5DJngc47B6ZCYBLAkxKXiijjRW7gcl27gr3nnXK7
         QvbXd9X8wOKjCsYa0VnefRpY2w4D2+sNMTtdntWgsnSdOjT/gvhztRtyK48+4y/x7HA9
         f55D8Oxr+lpCD/wa7lTQMwz6FphD2c8x9RrHHcWB3GFgRZ9nhh+jVTiNTPsUvuNawYcx
         FcH7UBNDXiS/g9cG3Cz5K8nwcYFBqnvvmEQlZKOLRhfG7T4oPgmfQsyLOn7ckQVHiMwa
         rM0w==
X-Forwarded-Encrypted: i=1; AJvYcCXb6iM7VmE8mEmcsjqR0CRi7LKHNUp5YwmXl0651iX8vrJd4++IgXjhcYNtjqoGos5AqV6+pDpfBLogiVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwhQgB2IpFQ+4Jp6haIf9Q6B9PTuYlkhzeV6zrMUPQlaervNE
	+Xi7kXbUzXBWNsead3sIfyPjt0QWY5tDG1YEAo6vbp/04I7LUzcKgOee/4BtrAZr2wKLcKaERPx
	pf7Aw0W3JPzRTgr3QhfQWz/KO4Z3292U=
X-Gm-Gg: ASbGncufpGwpPMNVq1a55JrYrOsjac27vsJS4gpI2+i54gwHkcUrp6YGyLe7OFOM+Yc
	p/w2w8EEFmRiBRb3gV1tFoCPcWxNvTsvQLwDknBDO+TBCzkjw5onUBESt0eyhF75da+C5R3a4nW
	prJZfshUzreAoe/RfB4i3YvARM5OnG9shumhPs2oQByWpO
X-Google-Smtp-Source: AGHT+IFZh6owmX7HkiRyf7we5O3Nj8AI3dd6DQRu2hcC5wXD5rSpVUk53mGX3UXq06FsnBnovOBbHjJ++ogCfyvGCfQ=
X-Received: by 2002:a05:6000:2082:b0:3a4:da29:d13f with SMTP id
 ffacd0b85a97d-3a5586b89d0mr531578f8f.3.1749624775564; Tue, 10 Jun 2025
 23:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com> <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
 <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com> <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
In-Reply-To: <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 11 Jun 2025 14:52:44 +0800
X-Gm-Features: AX0GCFsgQsBYEedhmjPxxYOEFa7Lezd6IZoo4NA3srqISU4K_ypR7qGlMdQgg-g
Message-ID: <CAHJ8P3+=LEbbj8bzh0N3HbPu=jVkRfkowbxqoT0PfCZtWbuRbg@mail.gmail.com>
Subject: Re: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=8811=E6=97=A5=E5=91=
=A8=E4=B8=89 14:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/11/25 14:41, Zhiguo Niu wrote:
> > Chao Yu <chao@kernel.org> =E4=BA=8E2025=E5=B9=B46=E6=9C=8811=E6=97=A5=
=E5=91=A8=E4=B8=89 14:07=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On 6/11/25 00:08, Jaegeuk Kim wrote:
> >>> Hi Zhiguo,
> >>>
> >>> This patch causes CPU hang when running fsstress on compressed/non-co=
mpressed
> >>> files. Please check.
> >>
> >> Oh, seems it may cause below deadlock:
> >>
> >> CPU0
> >> process A
> >> - spin_lock(i_lock)
> >> software IRQ
> >> - end_io
> >>  - igrab
> >>   - spin_lock(i_lock)
> >>
> >> Thanks,
> > Hi Chao,
> > Thanks for pointing this out.
> > I have tested this patch locally about some basic cases before submissi=
on.
> > So it seems that should use the following method  to solve this problem=
?
> > " store i_compress_algorithm/sbi in dic to avoid inode access?"
>
> Zhiguo,
>
> Yeah, I guess so.
Hi Chao,
OK, I will prepare it .
Thanks a lot.
>
> Thanks,
>
> > thanks=EF=BC=81
> >
> >
> >>
> >>>
> >>> On 06/05, Zhiguo Niu wrote:
> >>>> The decompress_io_ctx may be released asynchronously after
> >>>> I/O completion. If this file is deleted immediately after read,
> >>>> and the kworker of processing post_read_wq has not been executed yet
> >>>> due to high workloads, It is possible that the inode(f2fs_inode_info=
)
> >>>> is evicted and freed before it is used f2fs_free_dic.
> >>>>
> >>>>     The UAF case as below:
> >>>>     Thread A                                      Thread B
> >>>>     - f2fs_decompress_end_io
> >>>>      - f2fs_put_dic
> >>>>       - queue_work
> >>>>         add free_dic work to post_read_wq
> >>>>                                                    - do_unlink
> >>>>                                                     - iput
> >>>>                                                      - evict
> >>>>                                                       - call_rcu
> >>>>     This file is deleted after read.
> >>>>
> >>>>     Thread C                                 kworker to process post=
_read_wq
> >>>>     - rcu_do_batch
> >>>>      - f2fs_free_inode
> >>>>       - kmem_cache_free
> >>>>      inode is freed by rcu
> >>>>                                              - process_scheduled_wor=
ks
> >>>>                                               - f2fs_late_free_dic
> >>>>                                                - f2fs_free_dic
> >>>>                                                 - f2fs_release_decom=
p_mem
> >>>>                                       read (dic->inode)->i_compress_=
algorithm
> >>>>
> >>>> This patch use igrab before f2fs_free_dic and iput after free the di=
c when dic free
> >>>> action is done by kworker.
> >>>>
> >>>> Cc: Daeho Jeong <daehojeong@google.com>
> >>>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing i=
n softirq")
> >>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> >>>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> >>>> ---
> >>>> v3: use igrab to replace __iget
> >>>> v2: use __iget/iput function
> >>>> ---
> >>>>  fs/f2fs/compress.c | 14 +++++++++-----
> >>>>  1 file changed, 9 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >>>> index b3c1df9..729ad16 100644
> >>>> --- a/fs/f2fs/compress.c
> >>>> +++ b/fs/f2fs/compress.c
> >>>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct dec=
ompress_io_ctx *dic,
> >>>>  }
> >>>>
> >>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> >>>> -            bool bypass_destroy_callback);
> >>>> +            bool bypass_destroy_callback, bool late_free);
> >>>>
> >>>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
> >>>>  {
> >>>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(str=
uct compress_ctx *cc)
> >>>>      return dic;
> >>>>
> >>>>  out_free:
> >>>> -    f2fs_free_dic(dic, true);
> >>>> +    f2fs_free_dic(dic, true, false);
> >>>>      return ERR_PTR(ret);
> >>>>  }
> >>>>
> >>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> >>>> -            bool bypass_destroy_callback)
> >>>> +            bool bypass_destroy_callback, bool late_free)
> >>>>  {
> >>>>      int i;
> >>>>
> >>>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io=
_ctx *dic,
> >>>>      }
> >>>>
> >>>>      page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> >>>> +    if (late_free)
> >>>> +            iput(dic->inode);
> >>>>      kmem_cache_free(dic_entry_slab, dic);
> >>>>  }
> >>>>
> >>>> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_s=
truct *work)
> >>>>      struct decompress_io_ctx *dic =3D
> >>>>              container_of(work, struct decompress_io_ctx, free_work)=
;
> >>>>
> >>>> -    f2fs_free_dic(dic, false);
> >>>> +    f2fs_free_dic(dic, false, true);
> >>>>  }
> >>>>
> >>>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_tas=
k)
> >>>>  {
> >>>>      if (refcount_dec_and_test(&dic->refcnt)) {
> >>>>              if (in_task) {
> >>>> -                    f2fs_free_dic(dic, false);
> >>>> +                    f2fs_free_dic(dic, false, false);
> >>>>              } else {
> >>>>                      INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> >>>> +                    /* use igrab to avoid inode is evicted simultan=
eously */
> >>>> +                    f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->=
inode));
> >>>>                      queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> >>>>                                      &dic->free_work);
> >>>>              }
> >>>> --
> >>>> 1.9.1
> >>
>
