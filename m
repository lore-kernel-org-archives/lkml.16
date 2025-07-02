Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F90225A31
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456443; cv=none; b=kcms3woaF1D4//gGdytpCsJo84nnDXEn/oeVrcafM/zetKXvVSz4+tVIOwk5Org2EZDvdafdP0VCd9Ctn2hXSRSfDBCnpUMhBXzFwduvr/JQKfXEK0v3hBjCmsXtPppGH8M5bnFJLhJrSbDIDAyoWtB96rWxhg1z5BufZRapwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456443; c=relaxed/simple;
	bh=u8AI38z9yeUQMKFEvtc/Npp1so5aKMVDqybWaYoLr28=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucwLm7zPuiAf6QnvDWAiv6EZL5lEt6wS8XTQi0OGIfOubCLq0RgQ9PU6WdmTK12uoN8yXm6bTxzVgDiY6ExDeKi88/Lsaij152Hl2wZkjuWfOtFzR48TLCa31HnrOAhqLHG5OxqNGk/e3DhQ8O4MYYP0QIEclhcBewHqwuuBnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUSkBhcg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUSkBhcg"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553c31542b1so5040563e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751456439; x=1752061239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Jy2XDv76GfEXHS2fhU8oEAWy8scUGa8s5bkchLIRx4=;
        b=TUSkBhcgfag+UEOsQBeTWjCbX96PnCURK2Ikr6+3nYWLIvXE/+8QBJb9rnZeWSOPR6
         f4jdKo+lRvgicWRfF0HkNckU+wtVzKwM0cd4g6csNOdkV6ZbZlwNtBcfeH+cjnkXrMGb
         84tAjaSWUDRvxkDLZpn+mfjf3tsHgoDChTHQMTM3LaxW+DS+K/gWNFZfyIHTi8Ow12OS
         Feruvsv5IQpj0kyGbEi5NVFnASQoVy4Gz6ITnvh5e6YbCPszbZgziu9Wac9PDWKdFDwg
         dZkl3DNI4LPg4OVRuCgOl2bJ9+WveuGJv1QG8hUj0u4y6IOsztzOv25NHP1HIc315ku5
         tUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456439; x=1752061239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Jy2XDv76GfEXHS2fhU8oEAWy8scUGa8s5bkchLIRx4=;
        b=PEjg6x07hdNJfndiUHmTNNddaujxNG0rh/HLVwddbw130rHQsvXvHC++lFfef42if6
         zJDjc2+VBGK6SU7GhH6tERfQBafU2xmB9GS8MyLwht7dmN+SGETBn+8S+Y5x/Zzi1Qkk
         1qnjeG7OeUCuQadLJUqnVSMmgzoxOmdwSvceNy0lUf4o6h3jqT2M2YkitErfLR/jdAVt
         HqfDNLI3p2Qm1HzJvBf1mohIwPL4CN/zSarjy84qSbaRnP89ouatuPMWHrXHVbbx8phC
         r7/rQXpD4OhP4IBDFXjYu3QI8O3pG5TuJooLM0rD6/OpZP8N6oSqzMVpdSHlo0qSrclP
         MwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMx/dknr/7rSrFGnaZrQ0V34ahwCFiN9vTTip9Nok41viwaa9bBzKK6C/xZ9Kur1fd6nes0WGZHxErZx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTLEUJ0Hlt1gCzHBYt9SD5x/e1M9LGHXhRqd1jpd+s2qlfDrm
	hUdmSoYCIw2gzScM5sWCCSEP9vuh+S26NE/gU4rHVUd4v5+cFllW7jWBr8vl8Q==
X-Gm-Gg: ASbGncvA4gy+uCmPqEl7BqNYJ0rGHMjx2vaTYAwEomYK1P4eVRz8ZvnvJvYGoUUGnmW
	RMKPupDYU+H67x6P//byYMRqhh+cF3J0EC176+M/I3yB6yey+9+K0Jjm5zf8nemX19EmgwIxgdz
	KWd8/anT5MvE7PihawATK3SgdHm9RxilJRighcpNnKj36FDjdJH1m/8KlHdPJ3LfrgoLhimwllQ
	KS+pRvMZl2Vr9VL9fpGmFUBG4xfE/BnMBU64vV870iulIccd5hh0kJ5L5tAMLUJKcMLW/p9rTXm
	ZNsCcMwcQkWjESrjofiGAU/qjKgR4TDBcVvn9WoD+JCoRgDYMpSJrXi1IznNuUn+NNJJiM7wwRv
	T+4Dt1pLGS5E=
X-Google-Smtp-Source: AGHT+IGB8LMgoDGUxGACb96551FPJlIGGiA3rNJPCqbdbSbM0625POuaXaLxR/vzwTHli9sg34Kwiw==
X-Received: by 2002:a05:6512:b0b:b0:553:350a:32d9 with SMTP id 2adb3069b0e04-55628304703mr844130e87.23.1751456438912;
        Wed, 02 Jul 2025 04:40:38 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0d0cesm18127441fa.37.2025.07.02.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:40:38 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 2 Jul 2025 13:40:35 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	edumazet@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aGUas7_fcLS07mnL@pc636>
References: <20250508165620.15321-1-aha310510@gmail.com>
 <aBzuh0qb1UPrT86s@pc636>
 <aBzxqiX7unwAqVCY@pc636>
 <CAO9qdTF3vN5veO3HhGbrq-CkfR1fH_3ueCLjtcY8LOYKCG2mjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9qdTF3vN5veO3HhGbrq-CkfR1fH_3ueCLjtcY8LOYKCG2mjg@mail.gmail.com>

On Wed, Jul 02, 2025 at 01:01:13AM +0900, Jeongjun Park wrote:
> Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Thu, May 08, 2025 at 07:48:55PM +0200, Uladzislau Rezki wrote:
> > > On Fri, May 09, 2025 at 01:56:20AM +0900, Jeongjun Park wrote:
> > > > The following data-race was found in show_numa_info():
> > > >
> > > > ==================================================================
> > > > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> > > >
> > > > read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
> > > >  show_numa_info mm/vmalloc.c:4936 [inline]
> > > >  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
> > > >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> > > >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > > > ....
> > > >
> > > > write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
> > > >  show_numa_info mm/vmalloc.c:4934 [inline]
> > > >  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
> > > >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> > > >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > > > ....
> > > >
> > > > value changed: 0x0000008f -> 0x00000000
> > > > ==================================================================
> > > >
> > > > According to this report,there is a read/write data-race because m->private
> > > > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > > > in proc_vmalloc_init() and passing the heap address to m->private,
> > > > vmalloc_info_show() should allocate the heap.
> > > >
> > > > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > > > Suggested-by: Eric Dumazet <edumazet@google.com>
> > > > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > > > ---
> > > > v6: Change CONFIG_NUMA to must be check before doing any work related to the counters array.
> > > > - Link to v5: https://lore.kernel.org/all/20250508160800.12540-1-aha310510@gmail.com/
> > > > v5: Change heap to be allocated only when CONFIG_NUMA is enabled
> > > > - Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
> > > > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> > > >     And fix it to call smp_rmb() in the correct location.
> > > > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > > > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> > > >     to avoid printing uninitialized members of vm_struct.
> > > > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > > > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > > > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > > > ---
> > > >  mm/vmalloc.c | 63 +++++++++++++++++++++++++++++-----------------------
> > > >  1 file changed, 35 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > index 3ed720a787ec..c1ea9713a1c0 100644
> > > > --- a/mm/vmalloc.c
> > > > +++ b/mm/vmalloc.c
> > > > @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
> > > >     /*
> > > >      * Before removing VM_UNINITIALIZED,
> > > >      * we should make sure that vm has proper values.
> > > > -    * Pair with smp_rmb() in show_numa_info().
> > > > +    * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
> > > >      */
> > > >     smp_wmb();
> > > >     vm->flags &= ~VM_UNINITIALIZED;
> > > > @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
> > > >  #endif
> > > >
> > > >  #ifdef CONFIG_PROC_FS
> > > > -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > > > -{
> > > > -   if (IS_ENABLED(CONFIG_NUMA)) {
> > > > -           unsigned int nr, *counters = m->private;
> > > > -           unsigned int step = 1U << vm_area_page_order(v);
> > > >
> > > > -           if (!counters)
> > > > -                   return;
> > > > +/*
> > > > + * Print number of pages allocated on each memory node.
> > > > + *
> > > > + * This function can only be called if CONFIG_NUMA is enabled
> > > > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > > > + */
> > > > +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> > > > +                            unsigned int *counters)
> > > > +{
> > > > +   unsigned int nr;
> > > > +   unsigned int step = 1U << vm_area_page_order(v);
> > > >
> > > > -           if (v->flags & VM_UNINITIALIZED)
> > > > -                   return;
> > > > -           /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > > -           smp_rmb();
> > > > +   if (!counters)
> > > > +           return;
> > > >
> > > > -           memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > > > +   memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > > >
> > > > -           for (nr = 0; nr < v->nr_pages; nr += step)
> > > > -                   counters[page_to_nid(v->pages[nr])] += step;
> > > > -           for_each_node_state(nr, N_HIGH_MEMORY)
> > > > -                   if (counters[nr])
> > > > -                           seq_printf(m, " N%u=%u", nr, counters[nr]);
> > > > -   }
> > > > +   for (nr = 0; nr < v->nr_pages; nr += step)
> > > > +           counters[page_to_nid(v->pages[nr])] += step;
> > > > +   for_each_node_state(nr, N_HIGH_MEMORY)
> > > > +           if (counters[nr])
> > > > +                   seq_printf(m, " N%u=%u", nr, counters[nr]);
> > > >  }
> > > >
> > > >  static void show_purge_info(struct seq_file *m)
> > > > @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > >     struct vmap_node *vn;
> > > >     struct vmap_area *va;
> > > >     struct vm_struct *v;
> > > > +   unsigned int *counters;
> > > >     int i;
> > > >
> > > > +   if (IS_ENABLED(CONFIG_NUMA))
> > > > +           counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > > +
> > > >     for (i = 0; i < nr_vmap_nodes; i++) {
> > > >             vn = &vmap_nodes[i];
> > > >
> > > > @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > >                     }
> > > >
> > > >                     v = va->vm;
> > > > +                   if (v->flags & VM_UNINITIALIZED)
> > > > +                           continue;
> > > > +
> > > > +                   /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > > > +                   smp_rmb();
> > > >
> > > >                     seq_printf(m, "0x%pK-0x%pK %7ld",
> > > >                             v->addr, v->addr + v->size, v->size);
> > > > @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > >                     if (is_vmalloc_addr(v->pages))
> > > >                             seq_puts(m, " vpages");
> > > >
> > > > -                   show_numa_info(m, v);
> > > > +                   if (IS_ENABLED(CONFIG_NUMA))
> > > > +                           show_numa_info(m, v, counters);
> > > > +
> > > >                     seq_putc(m, '\n');
> > > >             }
> > > >             spin_unlock(&vn->busy.lock);
> > > > @@ -5023,19 +5035,14 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > > >      * As a final step, dump "unpurged" areas.
> > > >      */
> > > >     show_purge_info(m);
> > > > +   if (IS_ENABLED(CONFIG_NUMA))
> > > > +           kfree(counters);
> > > >     return 0;
> > > >  }
> > > >
> > > >  static int __init proc_vmalloc_init(void)
> > > >  {
> > > > -   void *priv_data = NULL;
> > > > -
> > > > -   if (IS_ENABLED(CONFIG_NUMA))
> > > > -           priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > > > -
> > > > -   proc_create_single_data("vmallocinfo",
> > > > -           0400, NULL, vmalloc_info_show, priv_data);
> > > > -
> > > > +   proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
> > > >     return 0;
> > > >  }
> > > >  module_init(proc_vmalloc_init);
> > > > --
> > > LGTM:
> > >
> > > Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
> > >
> > > Thank you!
> > >
> > Also one thing i have just noticed. The "Fixes tag" should be updated to
> > this: Fixes: 8e1d743f2c26 ("mm: vmalloc: support multiple nodes in vmallocinfo")
> >
> > the below one should not be blamed:
> >
> > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> >
> > Thanks!
> >
> > --
> > Uladzislau Rezki
> 
> I've been looking through the stable tree and it seems like this issue
> still exists in the stable tree, so I think this patch needs to be
> backported.
> 
> What do you think?
> 
If the stable does not have it, we should backport it. But it has to be
done only for those where a vmap-node logic is in place. It was delivered
starting from the v6.9 kernel version.

--
Uladzislau Rezki
