Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206D27B4E1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720571; cv=none; b=AAZT69XK8i9EzXgNwv7Pn6zmzZE5ntERpxXJ0KFQnGyj6cITbZvRKxOnlotxjB859eC21BcMeZfyKDUXHSvDDjgibpFxaq+K2iPcSQA5AwK3/Z3ET8TGh99gZVc/yuMT1Mnrl5F2FQwWZcWkx1aVgEKVon2lKa0/HWICFnOp2dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720571; c=relaxed/simple;
	bh=ni6N0S/l3Wh8xkH1HwBK+j5Aqjugbd7rv9QSo6fLQdU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8XcAItF4frCMf8t5t14Gh1UsaISkAjOQYzIPPpjWLVAUyPcPA7at4Sxqzpav6T0lK3Dqxv010vp+ZDOMjzRAiLk/wHgOMLX/vAWDF4s94C3IwXt4XbuOVJyymbmfNWD6pcM5qGdRQgmTqV3lN7TK0t1ibiCRmlewbsRuh+XSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZLE/l3w; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZLE/l3w"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bc464dso10903931fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746720567; x=1747325367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8LnwTTCAQRFFQbMJT/nnes2GmWyTLkIS7KSh3yHicFo=;
        b=EZLE/l3wL9BGwKekowVf2oQ3PFmwLUiGd90DL9mm+TbOzTqORevtXBoK6Ymp6VV1+Y
         rK38GQGKOk1uzNIIOzs39fpH2RMeM+az/TfH/8OyApk0bu898BdR8EO3kTOKMvkoe+Ft
         f95eb/LCQzTUqtwqM9qIm2ogfcgpJTUvKQafLue0Aq2N3KL9FZMa/lq097nyatl/b5AQ
         EA91rfH9iW8JQMaHd3/WgNsFjyXYlZIyp5ndcA4ppPFbMoVIa705AWfg7Ix6Xv5GswMc
         LM0f7vPVWrgfaiszJwzd7qBE6iFrHLNCgkpPXHTSFpt026yHBcCvPrnKUg0w2lrRVWlt
         Ehbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720567; x=1747325367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LnwTTCAQRFFQbMJT/nnes2GmWyTLkIS7KSh3yHicFo=;
        b=vSHBEMYMQM9Cf+gyAm/rlHAX03f9D0lnGPw/fBm3kJZXmsknIOXcpJTu2qMRSRTtp0
         FlmG/b/oOtxN7oXRRIdFnsgkPgGEFIpQSMpAZ4LDqyseVFulA1xsNpv25kVhbiXZ1qvU
         HcOMmVO0OGFJNMZnpAeLWH8DYNydIkOEKEF4fZljunGRIUWqnunwh4GTzsDeGexRCRIc
         e5fuLcX20QZJJj4fphgxa7DdXtGag1PtE/PuhRfzu+nQylxMx9Ggiok0cwu9YsgKBb5R
         B9smZC9LNrJaBodfvdpsNUk/6KsEQsU04/xidZOJE+ssnYEvD1ias3qKcU0Ws2wU6RQ+
         9dew==
X-Forwarded-Encrypted: i=1; AJvYcCWoTA1YmW//9juQHX3BvPh/EwpoYZXhzAUjZXdZcTyArU4gL4q9t1sMfMvJgARt2yJRmz9RT6sx1/b5PDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pSgXmYTGyGRNbx6QuNW2+HvvRfyuFgm5MIwnZVQTxJV2SFdz
	p0hyUvgcHtaTYyaYIbyxGiBaXC3ahrVTQm5QlwSNoFQiyNTPEmbjF8+e7Q==
X-Gm-Gg: ASbGncu6MXdfLT06Fxs21KuLuo+NLGjUlgpQllvbRFyfNAtTTAmlIdMq3LC4C07hS42
	Mt6iGfY5oUWMnRjf1qzd9vWJDZCut73SuBmFHKVtXI3lp9lDKx2Rkk20LyevT+NIvNBPfQJIPBu
	d4wj6jKeNDZzEFbflQu5Ig+15Sg1ga+/LXv5GKgQnTHPYZhCg0VmHejb+zrQtQn+rllUo0+8Ewy
	lMl81c7e7FSn4QR/V/OygNJYaESx1OtpsupgY+NbBZanx6Q/+ymTHmPuq0TRyhO2GltEXDZXsRS
	he9zzQ8Z9lbxrjL6g9vq5nVtW+Ow4K56RIPYbp+CdQsDcXZU+MZt63LHmEbJ3CMXFKzp
X-Google-Smtp-Source: AGHT+IE3Bs4L6ztk2NvjDutjeHV0IpdZ0dbBwPVx19un/W2Mp7T80XlS7pmJ7742fYtAMct4/kZahQ==
X-Received: by 2002:a05:651c:221b:b0:30d:b49d:7fb7 with SMTP id 38308e7fff4ca-326c458a5f3mr545281fa.16.1746720566588;
        Thu, 08 May 2025 09:09:26 -0700 (PDT)
Received: from pc636 (host-95-203-26-194.mobileonline.telia.com. [95.203.26.194])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a324sm372141fa.4.2025.05.08.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:09:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 18:09:23 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	edumazet@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aBzXMzBNie447bYs@pc636>
References: <20250508065558.149091-1-aha310510@gmail.com>
 <aByo6wgsvkxTg1fI@pc636>
 <CAO9qdTHWvTafDrdkyXh1k7ix0=3_HnVYuAzOhg3x-iP8dv0NmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9qdTHWvTafDrdkyXh1k7ix0=3_HnVYuAzOhg3x-iP8dv0NmA@mail.gmail.com>

On Thu, May 08, 2025 at 10:35:37PM +0900, Jeongjun Park wrote:
> Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Thu, May 08, 2025 at 03:55:58PM +0900, Jeongjun Park wrote:
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
> > > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> > >     And fix it to call smp_rmb() in the correct location.
> > > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> > >     to avoid printing uninitialized members of vm_struct.
> > > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > > ---
> > >  mm/vmalloc.c | 61 ++++++++++++++++++++++++++++------------------------
> > >  1 file changed, 33 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 3ed720a787ec..112df5a86106 100644
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
> > > @@ -4962,8 +4963,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >       struct vmap_node *vn;
> > >       struct vmap_area *va;
> > >       struct vm_struct *v;
> > > +     unsigned int *counters = NULL;
> > >
> > Setting NULL can be dropped.
> >
> > >       int i;
> > >
> > > +     counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > "if (IS_ENABLED(CONFIG_NUMA))"? If no NUMA, allocating and freeing sounds
> > like without any reason.
> >
> > > +
> > >       for (i = 0; i < nr_vmap_nodes; i++) {
> > >               vn = &vmap_nodes[i];
> > >
> > > @@ -4979,6 +4983,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
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
> > > @@ -5013,7 +5022,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >                       if (is_vmalloc_addr(v->pages))
> > >                               seq_puts(m, " vpages");
> > >
> > > -                     show_numa_info(m, v);
> > > +                     if (IS_ENABLED(CONFIG_NUMA))
> > > +                             show_numa_info(m, v, counters);
> > > +
> > >                       seq_putc(m, '\n');
> > >               }
> > >               spin_unlock(&vn->busy.lock);
> > > @@ -5023,19 +5034,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> > >        * As a final step, dump "unpurged" areas.
> > >        */
> > >       show_purge_info(m);
> > > +     kfree(counters);
> > >
> > Maybe check for NULL before and IS_ENABLED(CONFIG_NUMA)?
> >
> > --
> > Uladzislau Rezki
> 
> Hmm....then I think patching vmalloc_info_show() like this should
> work.
> 
> ---
>  mm/vmalloc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..b60355256211 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4962,8 +4962,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>     struct vmap_node *vn;
>     struct vmap_area *va;
>     struct vm_struct *v;
> +   unsigned int *counters = NULL;
>     int i;
> 
> +   if (IS_ENABLED(CONFIG_NUMA))
> +       counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> +
>     for (i = 0; i < nr_vmap_nodes; i++) {
>         vn = &vmap_nodes[i];
> 
> @@ -5013,7 +5017,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>             if (is_vmalloc_addr(v->pages))
>                 seq_puts(m, " vpages");
> 
> -           show_numa_info(m, v);
> +           if (counters)
> +               show_numa_info(m, v, counters);
> +
>             seq_putc(m, '\n');
>         }
>         spin_unlock(&vn->busy.lock);
> @@ -5023,6 +5029,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>      * As a final step, dump "unpurged" areas.
>      */
>     show_purge_info(m);
> +   kfree(counters);
>     return 0;
>  }
> 
> --
> 
> This way, we won't allocate heap unnecessarily when
> CONFIG_NUMA is disabled, and we only need to check if
> counters are NULL or not before calling show_numa_info().
> 
Yep, makes sense to me!

>
> However, if you change it like this, counters must always be
> initialized to NULL.
>
or:

<snip>
+   unsigned int *counters;
...
...
if (IS_ENABLED(CONFIG_NUMA))
  kfree(counters);
<snip>

if NUMA, you always do kmalloc() on entry, so it points to NULL
or to a real allocated memory. Apart of that, it is probably better
to avoid of checking "counters" before invoking the show_numa_info()
and replace it also by the IS_ENABLED().

It implies that you bail out if "counters" is NULL in the
show_numa_info().

--
Uladzislau Rezki
