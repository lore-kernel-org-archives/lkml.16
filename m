Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B51129824F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510267; cv=none; b=KeUp4gPpUhH2xRi9wzXuWAVmcLsdnHC3VUsPfwMg0sgIQDHDE/Nu5PibEv3C//PVNBRsiNHmvLm91hCSLGZjJAU8MaAR8hiEnKYupI3ar0vSGQAuudXBD6FJHLQqMboB1cMc3SMiZ/tS5wXHI8DCFkAZ5rV4vTK+Y8pkP8TVIEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510267; c=relaxed/simple;
	bh=wlUz1gkWFjXtz/qA8W2bLxdMBdcnLDVvjGX+kyo7ySk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqRyvwMt5fdLBf8Irsv/KLvkj+0Zmjes/aC3U+kF4Vrk8fgDGu1WCHzLxRAn8hlHuebGwZw9HCUxzfZHQOlRWysF/U0xeLp4jRzEay+FBRUOpISSN6fgO08w9fozj71X0vNBM49fiU7Pl1mDsDhZUSHy0W1fPdqr9ST3hauQgAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APOcon6M; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APOcon6M"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736b350a22cso4332265b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746510265; x=1747115065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNr9n7yrjlAA8esoJnmBNRXYidokO5rrsMXCXfOcgbM=;
        b=APOcon6MZCMbgezps1VtD8soN70Bzc6RQjJ+r28g5nCo2/iF/41xsk14UmGjPKmD1u
         4QkXTe8qTEhfnx2vboajEJl5ET2VY0J9UG1osjzUEBi3B66Y02mvzGdMvY+6X00oV9ao
         Tm+YhN9tJgskjW0mFlsmRcvMVEzP553oU1YMmaXxjMrakGFMwktxj+RcSEHn8k+1FkpD
         2Fd+gbceLvmveE/f+9XOzmrIpyEirhtDzKKWerwgOD4XB9qoI8HAxmPtR9lOCvt8c3gl
         jarnphxr9ucDllgY0uCcqsmuT2pp5s/TuPU1Z7X5re3swcHEuqV2D7NzAq2eRJVvBv1F
         35bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510265; x=1747115065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNr9n7yrjlAA8esoJnmBNRXYidokO5rrsMXCXfOcgbM=;
        b=pKn7OxdJvzgc+MasZ6zSt+YynnzCXPapG6mUyBm1joAbduVaR9KLoxLpbePfvXYHBF
         Gp6M9UY91V74NX0Ox94JSDiZUIh+DHB2UWhF4n5u7+sD7+3F8wGFx4Zax/bjbWy5ATt7
         SYP0JA2uE3CQChjVzR2sNmYOJ7p6tD/Xy+PFP47SHw7Jrrz42IHT3UmcTXafIsqxXRf4
         RvekYRql2wBPmF7utqfHnFlXPKAUHNCrT3SfgqhEHz1Rs671lcOkPRvOwReWGgCnJ8GB
         amqNaFCm5TB7CGHoPJJTwphPfqvQ+m7jNso7kpGqooicvg4bm9DAswQ0l9IwvWTtjwBP
         R/tA==
X-Forwarded-Encrypted: i=1; AJvYcCUk+fWpXek9u05JRouNtJqis0jVCjn0m0GsWg/LB0EZSvPw7ts8Th9/ZmKOPfPJLMETslGuUKfCwDlrQ90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzJBsNwVM0vIjkopbklNXoap6tS66PAgLrDwHhyJXvdgrfEM8
	pmiGIr5CUgtddy/aIn7IEcOBSLdGPbRr6cwwAIxaJJJf/FpALcYjIhWKoR0C8nFP7VK3zcb2Xho
	8Fa1T3OYbvNorXNXEHm2hGKLfHpE=
X-Gm-Gg: ASbGncsbsnaXAn4vM679x4sNj1WYRLYvh/ubEyKnNH++utqfZ/JOPBvRIOnkkXuAc6n
	ubxvC89D9BRx0oyuV/naGZfrtYcST5o7N4f5u3QO1DNjCSZi6uIT7ynQd0+p3PZwsSwJXCsCH14
	FHhcCv+AS032mhJRF28pla3i+V
X-Google-Smtp-Source: AGHT+IHstKrKthb+J+68aMtz+LTMO7Akm5jSagj3AGtcVJvnmKNj0jmcY+I6dvoApyJfSXXIJ/9DiftB1wTwUouxgoM=
X-Received: by 2002:a17:90b:5785:b0:30a:3dde:6af4 with SMTP id
 98e67ed59e1d1-30a4e6925dbmr20979137a91.31.1746510264552; Mon, 05 May 2025
 22:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505171948.24410-1-aha310510@gmail.com> <CANn89i+XaOxe+AOma=H+JuDuFm9b2_1x3x6r6BdhkHFxXAn8Hw@mail.gmail.com>
 <CANn89iJASmbYXMf4p4KWhAfBnpC7V_j1i0UXwvVmKkPtO+8Rvw@mail.gmail.com>
In-Reply-To: <CANn89iJASmbYXMf4p4KWhAfBnpC7V_j1i0UXwvVmKkPtO+8Rvw@mail.gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Tue, 6 May 2025 14:44:15 +0900
X-Gm-Features: ATxdqUG0EqDNzLp09M_BNbZXfu12F6SQH0C5f93L28Mn5AmV3TfdD61_J-k2BSk
Message-ID: <CAO9qdTHU6xGYFYVigMuUPeFZeMN+i9d-rRm+4Nx6vECOhPOtpw@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: fix data race in show_numa_info()
To: Eric Dumazet <edumazet@google.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eric Dumazet <edumazet@google.com> wrote:
>
> On Mon, May 5, 2025 at 11:06=E2=80=AFAM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Mon, May 5, 2025 at 10:20=E2=80=AFAM Jeongjun Park <aha310510@gmail.=
com> wrote:
> > >
> > > The following data-race was found in show_numa_info():
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> > >
> > > r
> > > value changed: 0x0000008f -> 0x00000000
> > >
> > > Reported by Kernel Concurrency Sanitizer on:
> > > CPU: 1 UID: 0 PID: 8287 Comm: syz.0.411 Not tainted 6.15.0-rc4-00256-=
g95d3481af6dc-dirty #1 PREEMPT(voluntary)
> > > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 =
04/01/2014
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > There is a read/write data-race in counter[]. This seems to be happen=
ing
> > > because only read memory barriers are currently applied, so we need t=
o
> > > modify the write operation to counters[] to be handled atomically.
> > >
> > > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > > ---
> > >  mm/vmalloc.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 3ed720a787ec..d93fa535bc21 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -4917,7 +4917,8 @@ bool vmalloc_dump_obj(void *object)
> > >  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > >  {
> > >         if (IS_ENABLED(CONFIG_NUMA)) {
> > > -               unsigned int nr, *counters =3D m->private;
> > > +               atomic_t *counters =3D m->private;
> > > +               unsigned int nr;
> > >                 unsigned int step =3D 1U << vm_area_page_order(v);
> > >
> > >                 if (!counters)
> > > @@ -4931,10 +4932,10 @@ static void show_numa_info(struct seq_file *m=
, struct vm_struct *v)
> > >                 memset(counters, 0, nr_node_ids * sizeof(unsigned int=
));
> > >
> > >                 for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> > > -                       counters[page_to_nid(v->pages[nr])] +=3D step=
;
> > > +                       atomic_add(step, &counters[page_to_nid(v->pag=
es[nr])]);
> > >                 for_each_node_state(nr, N_HIGH_MEMORY)
> > > -                       if (counters[nr])
> > > -                               seq_printf(m, " N%u=3D%u", nr, counte=
rs[nr]);
> > > +                       if (atomic_read(&counters[nr]))
> > > +                               seq_printf(m, " N%u=3D%u", nr, atomic=
_read(&counters[nr]));
> > >         }
> > >  }
> > >
> > > --
> >
> > This patch looks bogus to me.
> >
> > The race is about using m->private for storage, while the same file
> > can be read from multiple threads.
> >
> > Using atomic_t is going to silence syzbot, but the bug is still there.
>
> A more correct fix would be :
>

Thanks for your suggestion! It definitely looks much better this way.
I'll do some refactoring on show_numa_info() and send out a
v2 patch.

Regards,

Jeongjun Park

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a6e7acebe9adf5e6c8abd52dcf7d02a6a1bc3030..cb69b44587d2032a6192f3ceb=
518490a05eff541
> 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4921,24 +4921,24 @@ bool vmalloc_dump_obj(void *object)
>  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
>  {
>         if (IS_ENABLED(CONFIG_NUMA)) {
> -               unsigned int nr, *counters =3D m->private;
> +               unsigned int nr, *counters;
>                 unsigned int step =3D 1U << vm_area_page_order(v);
>
> +               if (v->flags & VM_UNINITIALIZED)
> +                       return;
> +               counters =3D kcalloc(nr_node_ids, sizeof(unsigned int),
> GFP_KERNEL);
>                 if (!counters)
>                         return;
>
> -               if (v->flags & VM_UNINITIALIZED)
> -                       return;
>                 /* Pair with smp_wmb() in clear_vm_uninitialized_flag() *=
/
>                 smp_rmb();
>
> -               memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> -
>                 for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
>                         counters[page_to_nid(v->pages[nr])] +=3D step;
>                 for_each_node_state(nr, N_HIGH_MEMORY)
>                         if (counters[nr])
>                                 seq_printf(m, " N%u=3D%u", nr, counters[n=
r]);
> +               kfree(counters);
>         }
>  }
>
> @@ -5032,13 +5032,7 @@ static int vmalloc_info_show(struct seq_file *m, v=
oid *p)
>
>  static int __init proc_vmalloc_init(void)
>  {
> -       void *priv_data =3D NULL;
> -
> -       if (IS_ENABLED(CONFIG_NUMA))
> -               priv_data =3D kmalloc(nr_node_ids * sizeof(unsigned
> int), GFP_KERNEL);
> -
> -       proc_create_single_data("vmallocinfo",
> -               0400, NULL, vmalloc_info_show, priv_data);
> +       proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
>
>         return 0;
>  }
