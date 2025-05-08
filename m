Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1236F227B95
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711348; cv=none; b=RKLR6xHFdX2n7kXuM9GurM4FaSFEakI5GHKuHeGtCv67zhIYCtqbKRx6y7uyVSXSAVZpTwtdN6SKc68LTP9Zs36ExzhSd9ss4IMH4jl1UMvQTvfVG3X+ZwN6RK9YTb7iwEezl+wInRJXPR7bQqB7NS+Z0FdsFQydeeCwhIReaqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711348; c=relaxed/simple;
	bh=oCPXCYBLis5NqUUv9gRdM5qCAERiXaTaexkD+erWwhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu7NOnN/Cwlitu2idlIbenGntpLCJ636Gka5wzFKoIqlLeCff9b5/8672ryQiSIWNUw2VJ3FmXgzrzFpPC+sRao4VWwuXlDXmZ6PjmOGyLPOQoVG/bmVNd18SZL7BDpFXscD+pSgVEfzfDYd0A05GExX8+0JbMZyr1FZooorDPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbIWQJE8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbIWQJE8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso274094b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746711346; x=1747316146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5cd1JuMxkuWCim9GZfUS6E7KDoCCe0+9iFH893TFEo=;
        b=UbIWQJE8lam4gdMRhIxsr0b0g8hNcEyXK1QHvO/OOIFRz+OAU4OYvk/pPAHaawN05N
         YBTviuRHOYxj60QVWdeiUbOy5e1p2TG9jdhbSm97HgvZNxQFu5qOm1CNa35FcPHDdYSF
         j/hDykmYJ8+7G/tU580EYhKLN5z8aslZy+Wemyfc6nS1gxx4CgObLfTAhGIIy9Y3vy3u
         kqHSDf21lLHCx40XrahLUIbwz1npp45wp8pzE3IiQdsdtJf+DN1H4ttp6+rySCkK2CBG
         3hipXsUcKcgh+qmMrazM1M7Hz9cL4Jg4j+4h1Gsa012+9WYFnfiJvS2I7STitSBu4l1f
         zvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711346; x=1747316146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5cd1JuMxkuWCim9GZfUS6E7KDoCCe0+9iFH893TFEo=;
        b=GsbyGVTNOlaUIt/ZmIWi0iPxRSXqCpouQCjdMOtcF0UY/eTx+g1mSXirjQL4XYpDKR
         f4idjEeRxgNtCxRfbO7pMMxWZQZqB0uTXZbsEjhvd3SucH9+cxXBTTnjAowQEvgocwMg
         j/8yYFo0eEXbTKt6Mk4YCRlUk8Ifn2gtRFAXMbB9dmpvrUcFIlRnuLcEc5u8Ev9ZwgBQ
         I6bNVwhl4Oya+QcCDMQEtLE9fwt0qlOvY0jdtdo8XHslsTKOzgLADVwAaOOBLjqMPwLb
         v539p5UkFzQM1OqwyeQ4plxn2/N/UDkg+upxQAl+dd6YTOj19xQa8bEpiF9J/3JLh0z1
         cqrg==
X-Forwarded-Encrypted: i=1; AJvYcCWzdHryKeZ5kGAb8JXA5sGIDtkNJcV0HkA3hRvWpiMlMvioUIbU3II0T3TUWCkY3IKX5GXlCpLbH8HDEJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfIIhn5KyRdz5O293f8DaV+LOkGw5uim/Za3Z891nM9KcsiSB+
	a0Dq4RNLPkdUNKkQnC0eFaVFJuSNgUnclcqWKjAV6Ax0WJbddQevrgVNAFa9XcqEkvFiPddbg8S
	jf72C8wZGHUno9qiUhf+a5KQJ8kJfTKT0l6M=
X-Gm-Gg: ASbGncuLT7OQeLhlC3/OLdXyCBLhaYJR+PgcmkJk4SvZcI4A+Bv94JqewLy9dICaabb
	XW5qRzlvBVYga8zEhryP7Nl95u1gYonNFNdCUSj1WWihQv/XJ4DxkVHSZS/AB+xz4hp/8J9iAKc
	VPM3lKRydTes7EOgtU/qUNgrgV
X-Google-Smtp-Source: AGHT+IE56KfqX3gxisy1zZ+EZNu7DWCHUYLZbZ7arwvjCNqBZsK/byADttzPPnDqlOOI/RQ2bPzL6mIsBpNRCSIRZIU=
X-Received: by 2002:a05:6a20:394d:b0:1f5:709d:e0cc with SMTP id
 adf61e73a8af0-2148d63dcb9mr12759568637.40.1746711346123; Thu, 08 May 2025
 06:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508065558.149091-1-aha310510@gmail.com> <aByo6wgsvkxTg1fI@pc636>
In-Reply-To: <aByo6wgsvkxTg1fI@pc636>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 8 May 2025 22:35:37 +0900
X-Gm-Features: ATxdqUGmB4SFgx7KWzfPXB2ytFLx8C_yqKkywCIeBIwxDqEjIseu0ZDsugTUaOI
Message-ID: <CAO9qdTHWvTafDrdkyXh1k7ix0=3_HnVYuAzOhg3x-iP8dv0NmA@mail.gmail.com>
Subject: Re: [PATCH v4] mm/vmalloc: fix data race in show_numa_info()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, edumazet@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, May 08, 2025 at 03:55:58PM +0900, Jeongjun Park wrote:
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
> > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> >     And fix it to call smp_rmb() in the correct location.
> > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> >     to avoid printing uninitialized members of vm_struct.
> > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > ---
> >  mm/vmalloc.c | 61 ++++++++++++++++++++++++++++------------------------
> >  1 file changed, 33 insertions(+), 28 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3ed720a787ec..112df5a86106 100644
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
> > @@ -4962,8 +4963,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >       struct vmap_node *vn;
> >       struct vmap_area *va;
> >       struct vm_struct *v;
> > +     unsigned int *counters = NULL;
> >
> Setting NULL can be dropped.
>
> >       int i;
> >
> > +     counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> "if (IS_ENABLED(CONFIG_NUMA))"? If no NUMA, allocating and freeing sounds
> like without any reason.
>
> > +
> >       for (i = 0; i < nr_vmap_nodes; i++) {
> >               vn = &vmap_nodes[i];
> >
> > @@ -4979,6 +4983,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
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
> > @@ -5013,7 +5022,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >                       if (is_vmalloc_addr(v->pages))
> >                               seq_puts(m, " vpages");
> >
> > -                     show_numa_info(m, v);
> > +                     if (IS_ENABLED(CONFIG_NUMA))
> > +                             show_numa_info(m, v, counters);
> > +
> >                       seq_putc(m, '\n');
> >               }
> >               spin_unlock(&vn->busy.lock);
> > @@ -5023,19 +5034,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >        * As a final step, dump "unpurged" areas.
> >        */
> >       show_purge_info(m);
> > +     kfree(counters);
> >
> Maybe check for NULL before and IS_ENABLED(CONFIG_NUMA)?
>
> --
> Uladzislau Rezki

Hmm....then I think patching vmalloc_info_show() like this should
work.

---
 mm/vmalloc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..b60355256211 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4962,8 +4962,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
    struct vmap_node *vn;
    struct vmap_area *va;
    struct vm_struct *v;
+   unsigned int *counters = NULL;
    int i;

+   if (IS_ENABLED(CONFIG_NUMA))
+       counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
+
    for (i = 0; i < nr_vmap_nodes; i++) {
        vn = &vmap_nodes[i];

@@ -5013,7 +5017,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
            if (is_vmalloc_addr(v->pages))
                seq_puts(m, " vpages");

-           show_numa_info(m, v);
+           if (counters)
+               show_numa_info(m, v, counters);
+
            seq_putc(m, '\n');
        }
        spin_unlock(&vn->busy.lock);
@@ -5023,6 +5029,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
     * As a final step, dump "unpurged" areas.
     */
    show_purge_info(m);
+   kfree(counters);
    return 0;
 }

--

This way, we won't allocate heap unnecessarily when
CONFIG_NUMA is disabled, and we only need to check if
counters are NULL or not before calling show_numa_info().

However, if you change it like this, counters must always be
initialized to NULL.

Regards,

Jeongjun Park
