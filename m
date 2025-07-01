Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC41F1B0F0A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385686; cv=none; b=XQKeil0uxoJmE7eb4CI8lZdcKZMymgk9fpgIGLHDJ+WAdkYns3wHuIk38jIHnyNrV6UaieNL/uTej72U/Dx9lYmL6Ld5J8AAKtlnhlMbwls7L9gwRU7LGFSL+BRBOiMSwyI5eQdEP7QBnKBfdeBFXjxDzQwlOCJZtJfvZ6vLxtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385686; c=relaxed/simple;
	bh=XwhC72EFSmetw5arT4cscgMwonhpx1U7GgZDChuks/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCuOyJVnrcP9kF9HUq/eK83LAILmpD23M5tUG3v5wPxPm6GVNcCw8nx+IXj50SPL28rPU3KWGGS5df6X5UnpfjwfARPNwANTiARRMGWrYWdoprKruhnX/JIxgigrB1AuKrSN4jf6tXvvbTkbUNcaKeJaLreHATAPL2U/NdqNixg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0EotJPE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0EotJPE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313154270bbso3624593a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751385684; x=1751990484; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uisESkonBUWUBmIeoW49mxXUGOwwBm+Ncm8zQB5RiFA=;
        b=M0EotJPEHNQWEXd5sBHHOD547ZvUHpzVvdVV+8d9NbcVq1OvVrDwjlSErXWdxL9ng5
         /1UV7WqCAotao0/l4/dS6rhLBmnfp4IC+n5M+KOi24t10GrI/ppGqVdk9EQPtISgwnS7
         vCF8h3lXAIU06zMDZETBT4PRf5d4q88gh3QPAvVF8gPDDTm07uzLa2ypbD7IqFXWnuVG
         bEAw1BaBl33Nu/qxCkb5k5zyBpTR/ye7c9AHEgrQlQVCMQhcwVRTJ2fbnO7ek/le0MJP
         tJz/Ko9c1L6Bd/c2FP6keIqmyj9kABslLkhbmdrXQfbMFfFb1/A19baqGqpJWLs0beFh
         vsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385684; x=1751990484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uisESkonBUWUBmIeoW49mxXUGOwwBm+Ncm8zQB5RiFA=;
        b=h5Vtf8v1oYOcf9TkM0I8cJ2lNXYQ/rTPX6JbvTPsXAHP627ZCi2rLekVlbO6/Tesc2
         Ywq/P+1G4ZZ06+VHUlqqhaxsJxAVXuHsLOxFiGLhBv4C5kWzAgWULcIK4JXZfgUVGaPH
         HC62xhk1quG+zRLsoAHAKL+Y9SfBo7rDDZY8nz7HT78Je/gtlPBvh/l7UVYr1PuIaug4
         eEP9qh9IWUDoajUEodDl4buOMx0AYRjYKLBBvRnlhNpUWCU6TmWPDHkRGP7o5BM6873I
         QqOW1BZicbor4VX4wN04Yc7bxLakOwhEEg3lGsy2ZlHuhG7P27cJw/oM8JMJZxIn6gKT
         jf4g==
X-Forwarded-Encrypted: i=1; AJvYcCWTXERwFjU+rIOouu+Xwst3jmvMznHUxT2XhAuLX3uorcY/zoikzhcBICK+Q8gMxNH5fEYiZ6FwVPcwqXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw64/04WGQcFQObH7lN/5yNmfUh56JXjeq505ORFOe/gmsPFqQ
	ET6oQq6BShmdBGWdzSTlPkBuTHwbpjTzbBFaR60ghoKg1j0eIkw7tLq717yIiwpEkbqg1sKi37q
	BalkteA0pcTrVv/QVve6PdujzKIvCDB0=
X-Gm-Gg: ASbGnctRui6FTqpj+Yishcz6fO3cAd3clWoNYZW3XIxMRF7NfHLkWEonFwnEhUd7RLA
	mVTSaeXatPWoBdPtB1Efi1OuN4Rltn9XOrVzAKybKLQDQlHlB0jlkpxxbtb5F/PRH3Ug8LFx3Zn
	75YIlKu2WzlbA3muuf4gENd4/ZY6c6liPzQut8EmYizIMn3Q==
X-Google-Smtp-Source: AGHT+IH6Cx9Yc731Xxe2ydwQj2xiAkV7TV9T3hkfm6m9g8Kwhaxvt5PIVpOtZo27JQ1LkizhaXhQ5w02IZV2yYfdi54=
X-Received: by 2002:a17:90b:2ccf:b0:312:ea46:3e66 with SMTP id
 98e67ed59e1d1-318c9243c60mr23628437a91.21.1751385683857; Tue, 01 Jul 2025
 09:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508165620.15321-1-aha310510@gmail.com> <aBzuh0qb1UPrT86s@pc636>
 <aBzxqiX7unwAqVCY@pc636>
In-Reply-To: <aBzxqiX7unwAqVCY@pc636>
From: Jeongjun Park <aha310510@gmail.com>
Date: Wed, 2 Jul 2025 01:01:13 +0900
X-Gm-Features: Ac12FXyegzFC6xqckWv5nEFdajf7y1d6733Mt2qrt4c49r4d2EE_cE6cWOkSVyY
Message-ID: <CAO9qdTF3vN5veO3HhGbrq-CkfR1fH_3ueCLjtcY8LOYKCG2mjg@mail.gmail.com>
Subject: Re: [PATCH v6] mm/vmalloc: fix data race in show_numa_info()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, edumazet@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, May 08, 2025 at 07:48:55PM +0200, Uladzislau Rezki wrote:
> > On Fri, May 09, 2025 at 01:56:20AM +0900, Jeongjun Park wrote:
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
> > > v6: Change CONFIG_NUMA to must be check before doing any work related to the counters array.
> > > - Link to v5: https://lore.kernel.org/all/20250508160800.12540-1-aha310510@gmail.com/
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
> > >  mm/vmalloc.c | 63 +++++++++++++++++++++++++++++-----------------------
> > >  1 file changed, 35 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 3ed720a787ec..c1ea9713a1c0 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
> > >     /*
> > >      * Before removing VM_UNINITIALIZED,
> > >      * we should make sure that vm has proper values.
> > > -    * Pair with smp_rmb() in show_numa_info().
> > > +    * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
> > >      */
> > >     smp_wmb();
> > >     vm->flags &= ~VM_UNINITIALIZED;
> > > @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
> > >  #endif
> > >
> > >  #ifdef CONFIG_PROC_FS
> > > -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > > -{
> > > -   if (IS_ENABLED(CONFIG_NUMA)) {
> > > -           unsigned int nr, *counters = m->private;
> > > -           unsigned int step = 1U << vm_area_page_order(v);
> > >
> > > -           if (!counters)
> > > -                   return;
> > > +/*
> > > + * Print number of pages allocated on each memory node.
> > > + *
> > > + * This function can only be called if CONFIG_NUMA is enabled
> > > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > > + */
> > > +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> > > +                            unsigned int *counters)
> > > +{
> > > +   unsigned int nr;
> > > +   unsigned int step = 1U << vm_area_page_order(v);
> > >
> > > -           if (v->flags & VM_UNINITIALIZED)
> > > -                   return;
> > > -           /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > -           smp_rmb();
> > > +   if (!counters)
> > > +           return;
> > >
> > > -           memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > > +   memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > >
> > > -           for (nr = 0; nr < v->nr_pages; nr += step)
> > > -                   counters[page_to_nid(v->pages[nr])] += step;
> > > -           for_each_node_state(nr, N_HIGH_MEMORY)
> > > -                   if (counters[nr])
> > > -                           seq_printf(m, " N%u=%u", nr, counters[nr]);
> > > -   }
> > > +   for (nr = 0; nr < v->nr_pages; nr += step)
> > > +           counters[page_to_nid(v->pages[nr])] += step;
> > > +   for_each_node_state(nr, N_HIGH_MEMORY)
> > > +           if (counters[nr])
> > > +                   seq_printf(m, " N%u=%u", nr, counters[nr]);
> > >  }
> > >
> > >  static void show_purge_info(struct seq_file *m)
> > > @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >     struct vmap_node *vn;
> > >     struct vmap_area *va;
> > >     struct vm_struct *v;
> > > +   unsigned int *counters;
> > >     int i;
> > >
> > > +   if (IS_ENABLED(CONFIG_NUMA))
> > > +           counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > +
> > >     for (i = 0; i < nr_vmap_nodes; i++) {
> > >             vn = &vmap_nodes[i];
> > >
> > > @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >                     }
> > >
> > >                     v = va->vm;
> > > +                   if (v->flags & VM_UNINITIALIZED)
> > > +                           continue;
> > > +
> > > +                   /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > +                   smp_rmb();
> > >
> > >                     seq_printf(m, "0x%pK-0x%pK %7ld",
> > >                             v->addr, v->addr + v->size, v->size);
> > > @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >                     if (is_vmalloc_addr(v->pages))
> > >                             seq_puts(m, " vpages");
> > >
> > > -                   show_numa_info(m, v);
> > > +                   if (IS_ENABLED(CONFIG_NUMA))
> > > +                           show_numa_info(m, v, counters);
> > > +
> > >                     seq_putc(m, '\n');
> > >             }
> > >             spin_unlock(&vn->busy.lock);
> > > @@ -5023,19 +5035,14 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >      * As a final step, dump "unpurged" areas.
> > >      */
> > >     show_purge_info(m);
> > > +   if (IS_ENABLED(CONFIG_NUMA))
> > > +           kfree(counters);
> > >     return 0;
> > >  }
> > >
> > >  static int __init proc_vmalloc_init(void)
> > >  {
> > > -   void *priv_data = NULL;
> > > -
> > > -   if (IS_ENABLED(CONFIG_NUMA))
> > > -           priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > -
> > > -   proc_create_single_data("vmallocinfo",
> > > -           0400, NULL, vmalloc_info_show, priv_data);
> > > -
> > > +   proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
> > >     return 0;
> > >  }
> > >  module_init(proc_vmalloc_init);
> > > --
> > LGTM:
> >
> > Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
> >
> > Thank you!
> >
> Also one thing i have just noticed. The "Fixes tag" should be updated to
> this: Fixes: 8e1d743f2c26 ("mm: vmalloc: support multiple nodes in vmallocinfo")
>
> the below one should not be blamed:
>
> Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
>
> Thanks!
>
> --
> Uladzislau Rezki

I've been looking through the stable tree and it seems like this issue
still exists in the stable tree, so I think this patch needs to be
backported.

What do you think?

Regards,
Jeongjun Park
