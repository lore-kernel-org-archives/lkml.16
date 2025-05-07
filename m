Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEB288C03
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623242; cv=none; b=QhJ+MR85sqdNk4cCLRG/IeYASvuX8mVfBWCyDpHe8ritygFLAA2d8ZxMV5gVwJHaj2OcrBu/fAEHrZ2JAJK45+TH4mqaLbq+KOrc1agJCXXm/Bx0iSMIz/DniJpHDfojyZ6JPUVn7AGmByah+OHgl2giYMlyfFrUntzSzWLhcWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623242; c=relaxed/simple;
	bh=paer5lB4pbDJC6mb4bIKdj4LiWzpncmdf0XRltX399I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skGUDuh3lKjpfFHt0pJ9Z/XDjaazIO9QX5l9tY/iN/L1O180uO5220htbYRoKmkXYysFOar37HDok6Cs6CdRPaP30uPpby+N/rpg53btfk6mKVCVpJD/yO46Qdoqn126eGtfmUyMiXl+u44Ccz00yorGYD4WEdNzHa4TuNFDTKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB+6PnIV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB+6PnIV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30828fc17adso6744068a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746623240; x=1747228040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SSLsX18w2X47vP3BkxY+cojPWShAtErFKfhrlUXjpUU=;
        b=fB+6PnIVVElbG91ZDB1GOXfgp3Zjsi/1Z4gnXPeAdDoC9qrmZppx+kHoP98MMYKCLq
         HdvNKXdNOcRH6eDD8zJ58QNEcKlenRpZ6eqOXrDuda8TYqOUdt8LKRiLdhOE8E74GZe5
         9SXCej0hGhqjeeUYEXO7vuiZtP8i3a6c1XoBbWkvkMO+3WwZ7c2G1bht5AFlc5M1ZvOz
         OSmhNnKA7dmU6JjYeAofMNQFkxQ/2Ywwb/dUkEAZevzSWWjmYpB+TuOZfBT3dPseWvLA
         M7F3IPB2ubUDLZXjx3q67xq40pgyVlSsqcoszGqHA1M3sTT8EbYv/l9CwkkUYXVtKbgf
         fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623240; x=1747228040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSLsX18w2X47vP3BkxY+cojPWShAtErFKfhrlUXjpUU=;
        b=VIBbRu9iBk02RJoVyISo6ebH7DHtlXi69kRkF3b92BN86/K6UJU+hJcomnngShjPaE
         bd8fbXX9VMNfegLU8gdfAwS4ZkVVL+kZizTb/n0y6BOC/ScQLsUGxzXcPRsYjZaECdxZ
         G9CfTn781JKPZmQHs1kI7JXsQfVQ91Fw2pXMBKirc0n8n7h6qGHDZLegzWQo6ocJZe7V
         OIl5RoRWCuIVHCXhEbrzKQ0+P1RrywQpQZcVuvv+QRQr0/bXsE036rbl1FGL6LLyfLqq
         ecPZS02YfdW5rrOZccxH5xIXFTMKO6i82LLPIyM/Oy+2lmXonKa6HGrdZI7IYk+m7QxO
         01pA==
X-Forwarded-Encrypted: i=1; AJvYcCUyv+PBAQ8uj39QrnuzL0QaWhpUirZ/OUndfMcI8EpVkT7/2OeTLDf5r00JRue9lkvK4aV4pTS3JUGxvCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9T0dyfcV+8zf/7hR2KbtEAZEIQab0T59o9qN/MNMSm+2Detvy
	x1s1aRZVjhdPpbtV83/VyZBbJU+buD4P2/nTT8SnH5GpbailxOneTT+591kLQrJ84ytHKUtjpZq
	4FBxobpk48ltmnOEqiWPMthR/bMs=
X-Gm-Gg: ASbGncsbgF8lMr5ECfvqIfGfIcydyG4Yr5gbsR2xCPeiT62leAcgc/GdN3f70QqPZSv
	gqlR7W1JDmGjv3zRcTzTnivcSdPFKNwh3ogxX8GIx5NKKr9JMkR4EANEfm1eSOID9Jax9BgWvG4
	zEsJw9UYBThEVQU6TTU5Lk473j
X-Google-Smtp-Source: AGHT+IHZU8VPs0UlD0F1OfxdDObBgX0RVrk248qkdHxD24y1phTRkZMWmECCDzeRnuCoPuYKEPCoEz4CHFQ450/qcKU=
X-Received: by 2002:a17:90a:d2c8:b0:2ff:7031:e380 with SMTP id
 98e67ed59e1d1-30aac19b58fmr5771948a91.10.1746623239537; Wed, 07 May 2025
 06:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506082520.84153-1-aha310510@gmail.com> <aBn4uqA7hnLBH2kL@pc636>
In-Reply-To: <aBn4uqA7hnLBH2kL@pc636>
From: Jeongjun Park <aha310510@gmail.com>
Date: Wed, 7 May 2025 22:07:08 +0900
X-Gm-Features: ATxdqUEjuEtyhw43XJqZk91crVOvGCzd78Ivgf5Vy1ExAzawMOZpQI7L5pXs9xM
Message-ID: <CAO9qdTEXEZsA7rE8xJz6NLHTtCk0x4vWxCAd5_eXmPobbxEiNA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/vmalloc: fix data race in show_numa_info()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, edumazet@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Tue, May 06, 2025 at 05:25:19PM +0900, Jeongjun Park wrote:
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
> >  new_sync_read fs/read_write.c:489 [inline]
> >  vfs_read+0x5b4/0x740 fs/read_write.c:570
> >  ksys_read+0xbe/0x190 fs/read_write.c:713
> >  __do_sys_read fs/read_write.c:722 [inline]
> >  __se_sys_read fs/read_write.c:720 [inline]
> >  __x64_sys_read+0x41/0x50 fs/read_write.c:720
> >  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:1
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
> >  show_numa_info mm/vmalloc.c:4934 [inline]
> >  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
> >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> >  new_sync_read fs/read_write.c:489 [inline]
> >  vfs_read+0x5b4/0x740 fs/read_write.c:570
> >  ksys_read+0xbe/0x190 fs/read_write.c:713
> >  __do_sys_read fs/read_write.c:722 [inline]
> >  __se_sys_read fs/read_write.c:720 [inline]
> >  __x64_sys_read+0x41/0x50 fs/read_write.c:720
> >  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:1
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > value changed: 0x0000008f -> 0x00000000
> > ==================================================================
> >
> > According to this report, there is a read/write data-race because m->private
> > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > in proc_vmalloc_init() and passing the heap address to m->private,
> > show_numa_info() should allocate the heap.
> >
> > One thing to note is that show_numa_info() is called in a critical section
> > of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag.
> >
> > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > Suggested-by: Eric Dumazet <edumazet@google.com>
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > ---
> >  mm/vmalloc.c | 50 +++++++++++++++++++++++++-------------------------
> >  1 file changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3ed720a787ec..a5e795346141 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -4914,28 +4914,32 @@ bool vmalloc_dump_obj(void *object)
> >  #endif
> >
> >  #ifdef CONFIG_PROC_FS
> > +
> > +/*
> > + * Print number of pages allocated on each memory node.
> > + *
> > + * This function can only be called if CONFIG_NUMA is enabled
> > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > + */
> >  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> >  {
> > -     if (IS_ENABLED(CONFIG_NUMA)) {
> > -             unsigned int nr, *counters = m->private;
> > -             unsigned int step = 1U << vm_area_page_order(v);
> > +     unsigned int nr, *counters;
> > +     unsigned int step = 1U << vm_area_page_order(v);
> >
> > -             if (!counters)
> > -                     return;
> > +     counters = kcalloc(nr_node_ids, sizeof(unsigned int), GFP_ATOMIC);
> > +     if (!counters)
> > +             return;
> >
> > -             if (v->flags & VM_UNINITIALIZED)
> > -                     return;
> > -             /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > -             smp_rmb();
> > +     /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > +     smp_rmb();
> >
> > -             memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > +     for (nr = 0; nr < v->nr_pages; nr += step)
> > +             counters[page_to_nid(v->pages[nr])] += step;
> > +     for_each_node_state(nr, N_HIGH_MEMORY)
> > +             if (counters[nr])
> > +                     seq_printf(m, " N%u=%u", nr, counters[nr]);
> >
> > -             for (nr = 0; nr < v->nr_pages; nr += step)
> > -                     counters[page_to_nid(v->pages[nr])] += step;
> > -             for_each_node_state(nr, N_HIGH_MEMORY)
> > -                     if (counters[nr])
> > -                             seq_printf(m, " N%u=%u", nr, counters[nr]);
> > -     }
> > +     kfree(counters);
> >  }
> >
> >  static void show_purge_info(struct seq_file *m)
> > @@ -5013,7 +5017,10 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >                       if (is_vmalloc_addr(v->pages))
> >                               seq_puts(m, " vpages");
> >
> > -                     show_numa_info(m, v);
> > +                     if (!(v->flags & VM_UNINITIALIZED) &&
> >
> I think it makes sense to move the VM_UNINITIALIZED check before:
>
> <snip>
>                         v = va->vm;
>
>                         seq_printf(m, "0x%pK-0x%pK %7ld",
>                                 v->addr, v->addr + v->size, v->size);
> <snip>
>
> because it can be still un-initialized, thus flags like "nr_pages", etc
> will not be valid.
>
> Any thoughts? It has nothing to do with a patch, because it fixes other
> race issue and what i propose might well be a separate patch if we agree.
>
> Thanks!
>
> --
> Uladzislau Rezki

That's absolutely correct. If the VM_UNINITIALIZED bit is enabled, it
means there are uninitialized member variables, so printing the vm_struct
information is not very appropriate.

I think it would be better to add the VM_UNINITIALIZED bit check code
right after `v = va->vm;`.

This change isn't that complicated, so I'll add it to the v3 patch and
send it.

Regards,

Jeongjun Park
