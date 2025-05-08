Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520E20D4E2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726372; cv=none; b=Z3PHDfvOulv0bliwLbCuyyHIJNiRhNFaDqHBTS0qXZdPigxOh9OC0FVxImkKAVvCGu2aagYw/+fGmgoSBywX6WQIpIn4T1cfYRjUMBqg9iEAVzfChBXMINvH3b+voTGMWZh12eSbXkMRJHBuI3haXeDQTLs2L/jC3qr8Qljh+6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726372; c=relaxed/simple;
	bh=WUG0vjVJ+PuA3Dpi/S2TZp4qS7pyXcTRvNgGqu0hrpw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGSRVt070mCqHOY8zt0o/WXgDIBz5wnXIlJ7DZsVZuJD5Y6kAoGhr8UGfgg5oTbhjN0Rk8zar2lGAb4DVrybH6esycEQKcbHoPQPd2EDqZ5352zM1Ts1N+ptAVQ87oC4gwU0b1pW/71sAwJOrCIyhJ/5FEE4hftilCSC/vZUNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm81w/Ap; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm81w/Ap"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499d2134e8so1656082e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746726368; x=1747331168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqmk4M3DrF29I/qbtB8U0fpJdgAdiiMTLbwwOsWf1q8=;
        b=Wm81w/Apj8tyWoRWnL5vJPKcwcx7tnfq8Pi1rnkD132rvvGy8UUHbW0eaXApZkfqan
         FC/UsMka9u6phZMQsWUi+HjXSJrhhzl7V27lZx1gkRw0HJreh6GNcMil6sWdoAjlQuJm
         VGDG2xIVbKOaJFO5/5YiSBBcyU9NhX0IqeIK8TBjtRZFKQV1QVHyY6uP6ao7ddBgxRkr
         pBpjCkdbGTml5f4v9Vd6lkPonW741KuYRZP10BFA6un1gVOlPnHELT0J99tDv8mvwp9c
         VetHIzBx5QmRd/Gd1jPSV8TVfWmah2ZEbYP9MYPPOAUvV7jeiub1n7PY25Jx/LJ248Pb
         EoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726368; x=1747331168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqmk4M3DrF29I/qbtB8U0fpJdgAdiiMTLbwwOsWf1q8=;
        b=usOVVPm4C6JQsoYyfasJxhfRMzUB4nOzIh9WNBt9aPqCKagp08DDh01nbNGqXHzyxu
         U/6cG38o/x5vqn/rYyFqL5aUy6dMZ4zwJPrCswdhLV+TsUc3+tQmF8XnytrrbRVe89bI
         58plSdaEJhKqRB1F9aRq0GIr/aSsbvlJ0DNfKlldcEU4OdBAh2d1TldVnOX02eJzHaei
         2Jb/WnuJJkFmCKAlSQSHY2nSFL3McX8eQGeDL+2v60D7nBo0Lijj7lml2CyGMEFb/g7I
         L54uWoIxXNNYd6BUOZKBQHaoRIrjI9dh9ZPVJPZGyeuRHK3VtsjGOGRgBlFBbwJ+K6Nd
         dzWw==
X-Forwarded-Encrypted: i=1; AJvYcCWfdMY0jhp3i8peZSdGQs8Do/oNcvUsveuClC6FvZ5FdKSESiWMZvaC+N8Ya9d3i3y5fxdgmpgwcdpV8u4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXuG9AG0VFK8naGRaTgWqjn9ul6VYBgM+AHob43sZkHdABCf3D
	UctSbmnnL+xrGgkbxyE3BnyGJ8kN1mY9O0TvjaW1zSd2DzifHon+72I7wQ==
X-Gm-Gg: ASbGnct3PpACrKL8tfFtinRu9qGxPrpBbWG+UBZ1jKSlCi3cHIWIiaKf5YYfGweF/89
	vpXzvqTPnCOGaFBZtKEdy2y5FVKLbPw4rxctTSwbplzen2PCcXnyDFVU3b7MhhARPlQKI4IJHnI
	q/Ivbvyu5wGdhe6hd5HRUnHx/guEYzrv71NnrzIThk1E2DSHldVena9KRn7kpTRs3mlC+yv/tYQ
	BPGLZU10QGsfMikvZ/LAepcckkZLpTm59R+dkZihaLyqRUxwPh+rKYu+39aaKxcTyKBnWgSBgIB
	1xwK40l7P8hfieMx2emfhGjCVKGqYuxHArMKhmds7DUZmOYFSTV7MTEEI7AMJruBWAB9
X-Google-Smtp-Source: AGHT+IEetBMwa2XQqElClYSAZkQrSQPEeaYWrS2+mPR7Nmlj2u5AbpPdRYI1FaaPTaalk7//cfpSMQ==
X-Received: by 2002:a05:6512:6401:b0:54a:c4af:18 with SMTP id 2adb3069b0e04-54fc67c5defmr30643e87.22.1746726367583;
        Thu, 08 May 2025 10:46:07 -0700 (PDT)
Received: from pc636 (host-95-203-26-194.mobileonline.telia.com. [95.203.26.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64c6dfasm30043e87.210.2025.05.08.10.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:46:07 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 19:46:04 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	edumazet@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aBzt3HIU3l0sp81_@pc636>
References: <20250508160800.12540-1-aha310510@gmail.com>
 <aBzYNsvccLZVxcV5@pc636>
 <CAO9qdTEZGPRB1XJ0U9fNVmG54sohC5hiP4u=9WdOPeO6htfFrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9qdTEZGPRB1XJ0U9fNVmG54sohC5hiP4u=9WdOPeO6htfFrQ@mail.gmail.com>

On Fri, May 09, 2025 at 01:26:14AM +0900, Jeongjun Park wrote:
> Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Fri, May 09, 2025 at 01:07:59AM +0900, Jeongjun Park wrote:
> > > The following data-race was found in show_numa_info():
> > >
> > > ==================================================================
> > > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> > >
> > > read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
> > >  show_numa_info mm/vmalloc.c:4936 [inline]
> > >  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
> > >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> > >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > > ....
> > >
> > > write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
> > >  show_numa_info mm/vmalloc.c:4934 [inline]
> > >  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
> > >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> > >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > > ....
> > >
> > > value changed: 0x0000008f -> 0x00000000
> > > ==================================================================
> > >
> > > According to this report,there is a read/write data-race because m->private
> > > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > > in proc_vmalloc_init() and passing the heap address to m->private,
> > > vmalloc_info_show() should allocate the heap.
> > >
> > > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > > Suggested-by: Eric Dumazet <edumazet@google.com>
> > > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > > ---
> > > v5: Change heap to be allocated only when CONFIG_NUMA is enabled
> > > - Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
> > > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> > >     And fix it to call smp_rmb() in the correct location.
> > > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> > >     to avoid printing uninitialized members of vm_struct.
> > > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > > ---
> > >  mm/vmalloc.c | 62 ++++++++++++++++++++++++++++------------------------
> > >  1 file changed, 34 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 3ed720a787ec..866f18766dfc 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
> > >       /*
> > >        * Before removing VM_UNINITIALIZED,
> > >        * we should make sure that vm has proper values.
> > > -      * Pair with smp_rmb() in show_numa_info().
> > > +      * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
> > >        */
> > >       smp_wmb();
> > >       vm->flags &= ~VM_UNINITIALIZED;
> > > @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
> > >  #endif
> > >
> > >  #ifdef CONFIG_PROC_FS
> > > -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > > -{
> > > -     if (IS_ENABLED(CONFIG_NUMA)) {
> > > -             unsigned int nr, *counters = m->private;
> > > -             unsigned int step = 1U << vm_area_page_order(v);
> > >
> > > -             if (!counters)
> > > -                     return;
> > > +/*
> > > + * Print number of pages allocated on each memory node.
> > > + *
> > > + * This function can only be called if CONFIG_NUMA is enabled
> > > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > > + */
> > > +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> > > +                              unsigned int *counters)
> > > +{
> > > +     unsigned int nr;
> > > +     unsigned int step = 1U << vm_area_page_order(v);
> > >
> > > -             if (v->flags & VM_UNINITIALIZED)
> > > -                     return;
> > > -             /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > -             smp_rmb();
> > > +     if (!counters)
> > > +             return;
> > >
> > > -             memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > > +     memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > >
> > > -             for (nr = 0; nr < v->nr_pages; nr += step)
> > > -                     counters[page_to_nid(v->pages[nr])] += step;
> > > -             for_each_node_state(nr, N_HIGH_MEMORY)
> > > -                     if (counters[nr])
> > > -                             seq_printf(m, " N%u=%u", nr, counters[nr]);
> > > -     }
> > > +     for (nr = 0; nr < v->nr_pages; nr += step)
> > > +             counters[page_to_nid(v->pages[nr])] += step;
> > > +     for_each_node_state(nr, N_HIGH_MEMORY)
> > > +             if (counters[nr])
> > > +                     seq_printf(m, " N%u=%u", nr, counters[nr]);
> > >  }
> > >
> > >  static void show_purge_info(struct seq_file *m)
> > > @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >       struct vmap_node *vn;
> > >       struct vmap_area *va;
> > >       struct vm_struct *v;
> > > +     unsigned int *counters = NULL;
> > >       int i;
> > >
> > > +     if (IS_ENABLED(CONFIG_NUMA))
> > > +             counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > +
> > >       for (i = 0; i < nr_vmap_nodes; i++) {
> > >               vn = &vmap_nodes[i];
> > >
> > > @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >                       }
> > >
> > >                       v = va->vm;
> > > +                     if (v->flags & VM_UNINITIALIZED)
> > > +                             continue;
> > > +
> > > +                     /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > +                     smp_rmb();
> > >
> > >                       seq_printf(m, "0x%pK-0x%pK %7ld",
> > >                               v->addr, v->addr + v->size, v->size);
> > > @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >                       if (is_vmalloc_addr(v->pages))
> > >                               seq_puts(m, " vpages");
> > >
> > > -                     show_numa_info(m, v);
> > > +                     if (counters)
> > > +                             show_numa_info(m, v, counters);
> > > +
> > Let's execute it for NUMA only.
> >
> > >                       seq_putc(m, '\n');
> > >               }
> > >               spin_unlock(&vn->busy.lock);
> > > @@ -5023,19 +5035,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >        * As a final step, dump "unpurged" areas.
> > >        */
> > >       show_purge_info(m);
> > > +     kfree(counters);
> > Let's execute it for NUMA only.
> >
> > >       return 0;
> > >  }
> > >
> > >  static int __init proc_vmalloc_init(void)
> > >  {
> > > -     void *priv_data = NULL;
> > > -
> > > -     if (IS_ENABLED(CONFIG_NUMA))
> > > -             priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > -
> > > -     proc_create_single_data("vmallocinfo",
> > > -             0400, NULL, vmalloc_info_show, priv_data);
> > > -
> > > +     proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
> > >       return 0;
> > >  }
> > >  module_init(proc_vmalloc_init);
> > > --
> >
> > You are so fast :)
> >
> 
> oops sorry.
> 
> I'm not sure why you'd want to avoid initializing "counters pointer" to
> NULL, but it's a simple change so I'll write a patch for it right away
> and send it out as a v6 patch.
> 
Because i would like to avoid of having such rule if someone decides to
drop your initialization later of after a code refactoring. This is a reason.

--
Uladzislau Rezki
