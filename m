Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1D281537
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721585; cv=none; b=Vj1SK6Fq6sUYoHqLkixRTUyDAsITTpqNmlcq58xjHja4zvsJ16u/3HcQ048RbBhfBfZQLW2xDKngoYm5rtdZhHM/0QBaxH8aC9BnkSndOd537yuRvPtfSHj1o8mQRNHkKx+Is1vouEoNBORaYzs8Gc815ngEnA2HOJixp4ZmdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721585; c=relaxed/simple;
	bh=C0eoCVrtuAsPdwrLAcKGcd8Cyykg7TaO2p3fc3IXmIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAsxNh1Hu7BMYiU/DgQ3SBYUWcU6XFBQ60tAXKs2Xpw5ADJ7+rHAV1VK/WiZhLJcF5SWNisbouHN9/Kfqrw+JRo1E4umSA04s8Yh1siBjgebmoCKm5OmGAzlZzCv6du2LMr+nV0tvAZ0mEVUtnZmWROvlUZ8/BXe68bKtDP+k5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb2DV/LZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb2DV/LZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so998161a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746721583; x=1747326383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck8MhtIBXjdzy4GpZyx41rmV478wkvBcm54CEX5/g+I=;
        b=eb2DV/LZy92l2jQqv8U5ahjPlkXrO/+bNaZX6ooaCiA7gxsKgXkpYZDSSmt1xKkv2q
         LOQTXx0wWEN0XRpiG299NsR2/jIGrFFL5yJVxGNghJYlhZqd35Bx6UQm9Kuj8AfHiUTI
         VXc8Ic793Hu9elOAYldOAYeJqmC0EBdNJyieV+2UMe6kpO267MbK1dWCzdnE5vaDFc4x
         fEi7xwtba0Mw5ITyH/aYWTh1Z2WSyK4KgCfTTApbgRsQxrrriPm/MqKcEyHEwG4VPdl+
         IlpbBaEFeOwiDhdbFjoh/OQ69GIZN/ymjacfe0wqZhQ4nazStGAKLyK64bWv/0kU7isL
         CGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746721583; x=1747326383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ck8MhtIBXjdzy4GpZyx41rmV478wkvBcm54CEX5/g+I=;
        b=ccPLMEtpNAZWcY4BiMeWS4CL/id3YaufhUyKHfy/w8vXpRI6/JvPNs1M8+E/QhNWWi
         B7tMychbmMEX0N2Z4qx2Hbq9Tg1DgznjQuyNn1sD+hfHmMy+Q2nkan6Ez3oGxsIgijHX
         g+MmyFL2f4YqTjTt1tPbYxj1nzYdNI0K9qAbY/QShmBMGbN+llzDDPPJ8Hnt9erM5Q8J
         WSZQedcC1fM4Y2bYtza5SFqFbadBP69SGUupxGc1+GJDkak20V8xQxiQIXbIaLg/Knja
         HOoPGWs4qwCH8qCBY7Wv9yv8nl+NpkkrU7I7OzgyRoDwKhiDEPMxs6naM3dEEoMr6CiZ
         gvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKIEPrQkes+GZxNpiKjPGVp/GUOUjQpWN9rqAv+SZ9sozURSOdaKvYDUF8b6nwUhz+hwyDj+ypjjaEJ3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47AV4m40GwCirA7tcfOHq3jSsTUaW3paC+QwWZir4ipCVCJHb
	XuL7EPpq5S3SzIwIziCLK3hZqXTaYBqbtAxFi4xoUYUvSQe/GK8cPPvtBXfmF5NHDRGGCwSd7Wl
	Ipoi6kXvxVM8WMXSF44S+619oeA4=
X-Gm-Gg: ASbGncuKbTUifmwkknAPFrsH7uBlDfCzXcluhjoqD6PEJ3rID2WsLMGewjt7wltV9gd
	UP+adyKzGWyWCxcbfN0ik9F19GZR0dDOjXNGqrTm7DDtpQCjSLV7INfLtuMwORzgpbOxnzE5N/Y
	pOFlqZEr8Y20lxfHVBZcEBJda7
X-Google-Smtp-Source: AGHT+IHJSF64WcaamytQnP3dC6GwgbxGwn2M5VCuGw3Gg4I7VhI+u1ulQIjvXdKjF8rEka1c3Q5Dshy9E6oEW1MxcLk=
X-Received: by 2002:a17:90b:3882:b0:2fe:80cb:ac05 with SMTP id
 98e67ed59e1d1-30c3cefe5b5mr200351a91.9.1746721583289; Thu, 08 May 2025
 09:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508160800.12540-1-aha310510@gmail.com> <aBzYNsvccLZVxcV5@pc636>
In-Reply-To: <aBzYNsvccLZVxcV5@pc636>
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 9 May 2025 01:26:14 +0900
X-Gm-Features: ATxdqUHXGzNWpD4D8egncUm3vSMNi0tDslCh7EunS9i3px-Qdg7K-yBkt3ce22E
Message-ID: <CAO9qdTEZGPRB1XJ0U9fNVmG54sohC5hiP4u=9WdOPeO6htfFrQ@mail.gmail.com>
Subject: Re: [PATCH v5] mm/vmalloc: fix data race in show_numa_info()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, edumazet@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Fri, May 09, 2025 at 01:07:59AM +0900, Jeongjun Park wrote:
> > The following data-race was found in show_numa_info():
> >
> > ==================================================================
> > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> >
> > read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
> >  show_numa_info mm/vmalloc.c:4936 [inline]
> >  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
> >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > ....
> >
> > write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
> >  show_numa_info mm/vmalloc.c:4934 [inline]
> >  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
> >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > ....
> >
> > value changed: 0x0000008f -> 0x00000000
> > ==================================================================
> >
> > According to this report,there is a read/write data-race because m->private
> > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > in proc_vmalloc_init() and passing the heap address to m->private,
> > vmalloc_info_show() should allocate the heap.
> >
> > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > Suggested-by: Eric Dumazet <edumazet@google.com>
> > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> > v5: Change heap to be allocated only when CONFIG_NUMA is enabled
> > - Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
> > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> >     And fix it to call smp_rmb() in the correct location.
> > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> >     to avoid printing uninitialized members of vm_struct.
> > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > ---
> >  mm/vmalloc.c | 62 ++++++++++++++++++++++++++++------------------------
> >  1 file changed, 34 insertions(+), 28 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3ed720a787ec..866f18766dfc 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
> >       /*
> >        * Before removing VM_UNINITIALIZED,
> >        * we should make sure that vm has proper values.
> > -      * Pair with smp_rmb() in show_numa_info().
> > +      * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
> >        */
> >       smp_wmb();
> >       vm->flags &= ~VM_UNINITIALIZED;
> > @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
> >  #endif
> >
> >  #ifdef CONFIG_PROC_FS
> > -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > -{
> > -     if (IS_ENABLED(CONFIG_NUMA)) {
> > -             unsigned int nr, *counters = m->private;
> > -             unsigned int step = 1U << vm_area_page_order(v);
> >
> > -             if (!counters)
> > -                     return;
> > +/*
> > + * Print number of pages allocated on each memory node.
> > + *
> > + * This function can only be called if CONFIG_NUMA is enabled
> > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > + */
> > +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> > +                              unsigned int *counters)
> > +{
> > +     unsigned int nr;
> > +     unsigned int step = 1U << vm_area_page_order(v);
> >
> > -             if (v->flags & VM_UNINITIALIZED)
> > -                     return;
> > -             /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > -             smp_rmb();
> > +     if (!counters)
> > +             return;
> >
> > -             memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > +     memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> >
> > -             for (nr = 0; nr < v->nr_pages; nr += step)
> > -                     counters[page_to_nid(v->pages[nr])] += step;
> > -             for_each_node_state(nr, N_HIGH_MEMORY)
> > -                     if (counters[nr])
> > -                             seq_printf(m, " N%u=%u", nr, counters[nr]);
> > -     }
> > +     for (nr = 0; nr < v->nr_pages; nr += step)
> > +             counters[page_to_nid(v->pages[nr])] += step;
> > +     for_each_node_state(nr, N_HIGH_MEMORY)
> > +             if (counters[nr])
> > +                     seq_printf(m, " N%u=%u", nr, counters[nr]);
> >  }
> >
> >  static void show_purge_info(struct seq_file *m)
> > @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >       struct vmap_node *vn;
> >       struct vmap_area *va;
> >       struct vm_struct *v;
> > +     unsigned int *counters = NULL;
> >       int i;
> >
> > +     if (IS_ENABLED(CONFIG_NUMA))
> > +             counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > +
> >       for (i = 0; i < nr_vmap_nodes; i++) {
> >               vn = &vmap_nodes[i];
> >
> > @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >                       }
> >
> >                       v = va->vm;
> > +                     if (v->flags & VM_UNINITIALIZED)
> > +                             continue;
> > +
> > +                     /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > +                     smp_rmb();
> >
> >                       seq_printf(m, "0x%pK-0x%pK %7ld",
> >                               v->addr, v->addr + v->size, v->size);
> > @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >                       if (is_vmalloc_addr(v->pages))
> >                               seq_puts(m, " vpages");
> >
> > -                     show_numa_info(m, v);
> > +                     if (counters)
> > +                             show_numa_info(m, v, counters);
> > +
> Let's execute it for NUMA only.
>
> >                       seq_putc(m, '\n');
> >               }
> >               spin_unlock(&vn->busy.lock);
> > @@ -5023,19 +5035,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >        * As a final step, dump "unpurged" areas.
> >        */
> >       show_purge_info(m);
> > +     kfree(counters);
> Let's execute it for NUMA only.
>
> >       return 0;
> >  }
> >
> >  static int __init proc_vmalloc_init(void)
> >  {
> > -     void *priv_data = NULL;
> > -
> > -     if (IS_ENABLED(CONFIG_NUMA))
> > -             priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > -
> > -     proc_create_single_data("vmallocinfo",
> > -             0400, NULL, vmalloc_info_show, priv_data);
> > -
> > +     proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
> >       return 0;
> >  }
> >  module_init(proc_vmalloc_init);
> > --
>
> You are so fast :)
>

oops sorry.

I'm not sure why you'd want to avoid initializing "counters pointer" to
NULL, but it's a simple change so I'll write a patch for it right away
and send it out as a v6 patch.

Regards,

Jeongjun Park

> --
> Uladzislau Rezki
