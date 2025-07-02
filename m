Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E0B2D0C77
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468466; cv=none; b=a7MfjYKhQfR9fohimwtZ2h/zj5mlcBiNOkK2VmkB3xAW7QNpeCWyEbpe7GQZZIjUEpYZtIAC3hAOxyDzSV/qq8yhaLFGsjLPpOGZ0oAtDJ8DDdamp15J86+cGpDGHIO/DLbyGxMEeZo8Xff9R0XMVeGD7CexeAllw/E1vhVm8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468466; c=relaxed/simple;
	bh=FgGVkzW82u0OAxI/+Ot3IYeNORvqiHriOAXtChOhbVM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUIphxNE3GZanexLYjcCEkmH52W/e/+ppg5oobLgeirZBUh8ribftMa9yrLyP6p/xQJ0cR0c5iOh1IVfjz1cFvBe3uXbcHpWSW6XWN5WLTxhId7K8sKTw6UlktG3Fu82SG2vrjP8BDhveI2XAup514koWcycA/kq7nZTO+/A6Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikpr6EhA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikpr6EhA"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-555163cd09aso3761038e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751468462; x=1752073262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb9oqMZgMTBAUwaOtSamD7a+s5czkzcGJgOvI3OEyFA=;
        b=ikpr6EhAKnIViP+/RNS2lDgy9GAlxFjqOKbs1FpCPWgDEfDzcWTAvPKgsxu27Hvtgi
         6EhlJBngViIkqbVxlKvE5okodg5J16TcpPx6X2Q9jnOWTWU93FpwIC6dsVF4zQtXyPsQ
         ZzlVoNN2tCFboYk8QREPvqX1mLnU6fpq26rKXCkhgj/3d2N0YZPGCfQVk/5+HbslkNgH
         F4NkWoa7TtjDmNloLAVN3WXGt3VXeyeBEOkt19F/eqMO95RAIrRspvVOkRWy/WL/ICXt
         4by4Ezv7FEJfcQVUhDUfSMKy86F/neix+5l9iuN1oD7VO5RLl4tEOf/r10NUgPfB3YGi
         Tm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468462; x=1752073262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mb9oqMZgMTBAUwaOtSamD7a+s5czkzcGJgOvI3OEyFA=;
        b=Txf5CcTNKEb9nSHpopv6No4gzqrv/frlO8GtJfVeNQofEi2YEIZtIrSkdtcgeriIal
         UPyChGumo2QP3GAn98n8KE3PGayWLeXf9IwbLKMX5qEWtC7ExyBcHaH1qDJkTSxFpYCy
         s1WJJjr2yu9FD09Q/C+KKMwYMRB0ezGXNZgqv6LhuiQFM0s2GUmGb4haWgLvs/T18x8F
         wO19DjmGA9fLexChcBta+urX1icklCCqKIqpP6huYZ/ioW99+FBqh2yyAT7KFXwYLakN
         MzEMy4eEGETGD3H7Mg8884/bAjS7Li+zaoBB6TCIhBu+MTxxbaiCe0mGdZ0VzAWCYbqJ
         80/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1NQ5HxDBKOE7kQmoHqzjm8lAUA93CcPcDMIn4Ut7m45snlGP6Qe3YC8tkSE3tX0wtyDXiwZdq3jAXQfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1R0UgNKHa6yGuor6gO1M2DnnSmH7ZyKL5uycmofs/jMAUr8q
	MKFBD/QP/sVptylDhDMEWQMrN7DokZc2Gb2REnf5C1XPUFOORqEOYuNSePIabQ==
X-Gm-Gg: ASbGnctesZe1C/QaKq3x29Werz8YqqfBm/1EDDIA3mSTwoV0VYUhCGHLG0ImHfJs1ch
	Y01qnldu3UKY3tK8rmhTXRr7v2jbPi3QC8BsQxmM6JWRkAIbOxK2PnnU6mWRqVUPPJ2Nvkp3dXQ
	00+BpeBkhN+ywiFM3iOM26J5L+Kh7JJDsoa+930VG38iDzgPF0arc/oXSDD/kzLnVeIHJfo+IFg
	pe533J36xnZfjaR+rx3EG1ZN84YQf+XJIvvpR9fwk/NVPaVAQByoKMUb8xrsQHkx+p+4bxVBZZ1
	1pN9STu9VU/1ZANyJtonsGASssHzo/vqZEwiMTVwXrDBCt3F3rH/UQc/NQ==
X-Google-Smtp-Source: AGHT+IEP9JGw0k8/AP3WA/Ob7waQ2MI68kC4hrHLxC8UG8+x0WnIlp6PUM/dnUad4yg8FsA12xibvw==
X-Received: by 2002:a05:6512:2310:b0:553:2cc1:2bba with SMTP id 2adb3069b0e04-5562832eba1mr1391418e87.31.1751468461572;
        Wed, 02 Jul 2025 08:01:01 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cec41sm2151493e87.185.2025.07.02.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:01:00 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Wed, 2 Jul 2025 17:00:59 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	edumazet@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aGVJq4zcQh550cRQ@pc638.lan>
References: <20250508165620.15321-1-aha310510@gmail.com>
 <aBzuh0qb1UPrT86s@pc636>
 <aBzxqiX7unwAqVCY@pc636>
 <CAO9qdTF3vN5veO3HhGbrq-CkfR1fH_3ueCLjtcY8LOYKCG2mjg@mail.gmail.com>
 <aGUas7_fcLS07mnL@pc636>
 <CAO9qdTGJ14Gz3nzi+pn--POFP-VK_Rsege6TpATSXubLm7GAUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9qdTGJ14Gz3nzi+pn--POFP-VK_Rsege6TpATSXubLm7GAUA@mail.gmail.com>

On Wed, Jul 02, 2025 at 11:01:23PM +0900, Jeongjun Park wrote:
> Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Jul 02, 2025 at 01:01:13AM +0900, Jeongjun Park wrote:
> > > Uladzislau Rezki <urezki@gmail.com> wrote:
> > > >
> > > > On Thu, May 08, 2025 at 07:48:55PM +0200, Uladzislau Rezki wrote:
> > > > > On Fri, May 09, 2025 at 01:56:20AM +0900, Jeongjun Park wrote:
> > > > > > The following data-race was found in show_numa_info():
> > > > > >
> > > > > > ==================================================================
> > > > > > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> > > > > >
> > > > > > read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
> > > > > >  show_numa_info mm/vmalloc.c:4936 [inline]
> > > > > >  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
> > > > > >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> > > > > >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > > > > > ....
> > > > > >
> > > > > > write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
> > > > > >  show_numa_info mm/vmalloc.c:4934 [inline]
> > > > > >  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
> > > > > >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> > > > > >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > > > > > ....
> > > > > >
> > > > > > value changed: 0x0000008f -> 0x00000000
> > > > > > ==================================================================
> > > > > >
> > > > > > According to this report,there is a read/write data-race because m->private
> > > > > > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > > > > > in proc_vmalloc_init() and passing the heap address to m->private,
> > > > > > vmalloc_info_show() should allocate the heap.
> > > > > >
> > > > > > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > > > > > Suggested-by: Eric Dumazet <edumazet@google.com>
> > > > > > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > > > > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > > > > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > > > > > ---
> > > > > > v6: Change CONFIG_NUMA to must be check before doing any work related to the counters array.
> > > > > > - Link to v5: https://lore.kernel.org/all/20250508160800.12540-1-aha310510@gmail.com/
> > > > > > v5: Change heap to be allocated only when CONFIG_NUMA is enabled
> > > > > > - Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
> > > > > > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> > > > > >     And fix it to call smp_rmb() in the correct location.
> > > > > > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > > > > > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> > > > > >     to avoid printing uninitialized members of vm_struct.
> > > > > > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > > > > > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > > > > > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > > > > > ---
> > > > > >  mm/vmalloc.c | 63 +++++++++++++++++++++++++++++-----------------------
> > > > > >  1 file changed, 35 insertions(+), 28 deletions(-)
> > > > > >
> > > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > > index 3ed720a787ec..c1ea9713a1c0 100644
> > > > > > --- a/mm/vmalloc.c
> > > > > > +++ b/mm/vmalloc.c
> > > > > > @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
> > > > > >     /*
> > > > > >      * Before removing VM_UNINITIALIZED,
> > > > > >      * we should make sure that vm has proper values.
> > > > > > -    * Pair with smp_rmb() in show_numa_info().
> > > > > > +    * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
> > > > > >      */
> > > > > >     smp_wmb();
> > > > > >     vm->flags &= ~VM_UNINITIALIZED;
> > > > > > @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
> > > > > >  #endif
> > > > > >
> > > > > >  #ifdef CONFIG_PROC_FS
> > > > > > -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > > > > > -{
> > > > > > -   if (IS_ENABLED(CONFIG_NUMA)) {
> > > > > > -           unsigned int nr, *counters = m->private;
> > > > > > -           unsigned int step = 1U << vm_area_page_order(v);
> > > > > >
> > > > > > -           if (!counters)
> > > > > > -                   return;
> > > > > > +/*
> > > > > > + * Print number of pages allocated on each memory node.
> > > > > > + *
> > > > > > + * This function can only be called if CONFIG_NUMA is enabled
> > > > > > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > > > > > + */
> > > > > > +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> > > > > > +                            unsigned int *counters)
> > > > > > +{
> > > > > > +   unsigned int nr;
> > > > > > +   unsigned int step = 1U << vm_area_page_order(v);
> > > > > >
> > > > > > -           if (v->flags & VM_UNINITIALIZED)
> > > > > > -                   return;
> > > > > > -           /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > > > > -           smp_rmb();
> > > > > > +   if (!counters)
> > > > > > +           return;
> > > > > >
> > > > > > -           memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > > > > > +   memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > > > > >
> > > > > > -           for (nr = 0; nr < v->nr_pages; nr += step)
> > > > > > -                   counters[page_to_nid(v->pages[nr])] += step;
> > > > > > -           for_each_node_state(nr, N_HIGH_MEMORY)
> > > > > > -                   if (counters[nr])
> > > > > > -                           seq_printf(m, " N%u=%u", nr, counters[nr]);
> > > > > > -   }
> > > > > > +   for (nr = 0; nr < v->nr_pages; nr += step)
> > > > > > +           counters[page_to_nid(v->pages[nr])] += step;
> > > > > > +   for_each_node_state(nr, N_HIGH_MEMORY)
> > > > > > +           if (counters[nr])
> > > > > > +                   seq_printf(m, " N%u=%u", nr, counters[nr]);
> > > > > >  }
> > > > > >
> > > > > >  static void show_purge_info(struct seq_file *m)
> > > > > > @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > > > >     struct vmap_node *vn;
> > > > > >     struct vmap_area *va;
> > > > > >     struct vm_struct *v;
> > > > > > +   unsigned int *counters;
> > > > > >     int i;
> > > > > >
> > > > > > +   if (IS_ENABLED(CONFIG_NUMA))
> > > > > > +           counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > > > > +
> > > > > >     for (i = 0; i < nr_vmap_nodes; i++) {
> > > > > >             vn = &vmap_nodes[i];
> > > > > >
> > > > > > @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > > > >                     }
> > > > > >
> > > > > >                     v = va->vm;
> > > > > > +                   if (v->flags & VM_UNINITIALIZED)
> > > > > > +                           continue;
> > > > > > +
> > > > > > +                   /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > > > > +                   smp_rmb();
> > > > > >
> > > > > >                     seq_printf(m, "0x%pK-0x%pK %7ld",
> > > > > >                             v->addr, v->addr + v->size, v->size);
> > > > > > @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > > > >                     if (is_vmalloc_addr(v->pages))
> > > > > >                             seq_puts(m, " vpages");
> > > > > >
> > > > > > -                   show_numa_info(m, v);
> > > > > > +                   if (IS_ENABLED(CONFIG_NUMA))
> > > > > > +                           show_numa_info(m, v, counters);
> > > > > > +
> > > > > >                     seq_putc(m, '\n');
> > > > > >             }
> > > > > >             spin_unlock(&vn->busy.lock);
> > > > > > @@ -5023,19 +5035,14 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > > > >      * As a final step, dump "unpurged" areas.
> > > > > >      */
> > > > > >     show_purge_info(m);
> > > > > > +   if (IS_ENABLED(CONFIG_NUMA))
> > > > > > +           kfree(counters);
> > > > > >     return 0;
> > > > > >  }
> > > > > >
> > > > > >  static int __init proc_vmalloc_init(void)
> > > > > >  {
> > > > > > -   void *priv_data = NULL;
> > > > > > -
> > > > > > -   if (IS_ENABLED(CONFIG_NUMA))
> > > > > > -           priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > > > > -
> > > > > > -   proc_create_single_data("vmallocinfo",
> > > > > > -           0400, NULL, vmalloc_info_show, priv_data);
> > > > > > -
> > > > > > +   proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
> > > > > >     return 0;
> > > > > >  }
> > > > > >  module_init(proc_vmalloc_init);
> > > > > > --
> > > > > LGTM:
> > > > >
> > > > > Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
> > > > >
> > > > > Thank you!
> > > > >
> > > > Also one thing i have just noticed. The "Fixes tag" should be updated to
> > > > this: Fixes: 8e1d743f2c26 ("mm: vmalloc: support multiple nodes in vmallocinfo")
> > > >
> > > > the below one should not be blamed:
> > > >
> > > > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > > >
> > > > Thanks!
> > > >
> > > > --
> > > > Uladzislau Rezki
> > >
> > > I've been looking through the stable tree and it seems like this issue
> > > still exists in the stable tree, so I think this patch needs to be
> > > backported.
> > >
> > > What do you think?
> > >
> > If the stable does not have it, we should backport it. But it has to be
> > done only for those where a vmap-node logic is in place. It was delivered
> > starting from the v6.9 kernel version.
> >
> 
> Then I guess I should backport to 6.12, 6.15. Thanks for letting me know!
> 
You are welcome!

--
Uladzislau Rezki
