Received: from e240-7.smtp-out.eu-north-1.amazonses.com (e240-7.smtp-out.eu-north-1.amazonses.com [23.251.240.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2441FBCAD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658262; cv=none; b=XfzRlqQhmaFW18Q5qyGosM2pNidVRVi2tpBRduZCKCNxgXr7zi1QClYdSJZATb5sQM/kXmpxAXPsWVQOdpJ5YUOrZcxJ5Tdnx6QYKCX5ugFh5pZDBxWJ8D5+8FZ+Y58+PjFU3pH9JVvDT4g/CSdY/5h8BlmwthOB24eB+caG45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658262; c=relaxed/simple;
	bh=u/VxZyRVwVVWCb17n9SiizIdCucyimsALLFuxK9V/v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buVSUGc8c+H4PYtaK80tlC1Uv66ePVNgXr6ckJ5NK22EmiKv1px3GMLQh+8aAtFsfsBHZ3ydi6W8GIqBBDK2S27lL0/i6DctqogDZ/qspnMtP/ZNlpif9j9oNBRt/XMOuQMKb8DyJwVNPdXvF7Dl2q+tEFJ+f4wW4HCVZlWIaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=K+bBaPyZ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=bIVgQ3cK; arc=none smtp.client-ip=23.251.240.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="K+bBaPyZ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="bIVgQ3cK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1746658258;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u/VxZyRVwVVWCb17n9SiizIdCucyimsALLFuxK9V/v8=;
	b=K+bBaPyZg6DkQkS6VKv4UlwAm/TB1GGBa4YpQ7Vm3DtiVjqq1DAgOtAl+Fd5Eqo+
	FHG9eXD+88pBogtJKZb0vh00ZPEiEt24Tk8ta6FMUT3P0UJFcSPXJgUfa4PZYq4uKYO
	ZD60NjAEtkx6fRHw20jHJFr9BFUK745/fhPa/Oa4tLv3z/0BAeBjkDjWVjacr1X9KE2
	oB6frY233r0orLXNYPI2gkXxqbXGoi1feX21Q9GzzGWUPwnU96uCn9dOyR+9h+n9sbz
	lVQ6ZMLe6DDP3PvxMMCl4eM1JiwRNTK3kLhdVm/B2Va896kRimL/4O4wGDPpHLyDBg7
	wGUd7Wqa6g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1746658258;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=u/VxZyRVwVVWCb17n9SiizIdCucyimsALLFuxK9V/v8=;
	b=bIVgQ3cKnA7if2SzZwxvlcxdpKX2PmP86s1saCzFwdYVAkffeCO5bq9rFLu/dU+I
	ukGs5xXIdFNVA4LJ2ZNiQw5mnAaUjxlCaCgOOQ+3YbykDMxh0WuKodngVWByeVs4ut2
	2jxKiFwZ0c7GrH99VgOCy4UfNTXULfT/VJ8byrqU=
X-Forwarded-Encrypted: i=1; AJvYcCVFFhqMjmvv4Jo9PWF8dbRDmE7oB4fT+g1iRP0Tm5DHi2bww7lOX9Rxgv+nFihjZg5+4bCUTzO8xYIiiSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZtZTCrbiPKN152CL1meM5eTK366Nqdh1dZGddVG+ehaHVQ5n
	xzO667F+q+IGr3nF+LuyODTWWOcBjGKA7jXOQaeUg4WPyqPI24ro1FSaCumuE4b+eHRLdGZL4uC
	+K7TjtnjVjV6bACMmkMROx550cWo=
X-Google-Smtp-Source: AGHT+IGYe4C//wRw1MydI9tDxP1BkXsgbQVwhKzvXB8b4Q2Wx/Ai6WIh6rV6vC7JP/xcoguyIqDCpOzYJKldHFl35+w=
X-Received: by 2002:a17:90a:da87:b0:2fe:b907:3b05 with SMTP id
 98e67ed59e1d1-30aac29bf2bmr7379060a91.29.1746658255869; Wed, 07 May 2025
 15:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507142552.9446-1-aha310510@gmail.com>
In-Reply-To: <20250507142552.9446-1-aha310510@gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Wed, 7 May 2025 22:50:58 +0000
X-Gmail-Original-Message-ID: <CADvZ6EqLDcQ9Ag3JD5_VdJOc9WnvP7Sek9gP7sDw9xanieJGcw@mail.gmail.com>
X-Gm-Features: ATxdqUHzT-vjZuEaAAjESbWCVqFEXkWEYdlqR6AAnE_BlEpPNCKX6_n7HsKgm4M
Message-ID: <01100196acf1ed92-b7371c69-31bd-42d4-b691-55216da8cc93-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH v3] mm/vmalloc: fix data race in show_numa_info()
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, edumazet@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.07-23.251.240.7

Jeongjun Park <aha310510@gmail.com>, 7 May 2025 =C3=87ar, 17:32 tarihinde =
=C5=9Funu yazd=C4=B1:
>
> The following data-race was found in show_numa_info():
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
>
> read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
>  show_numa_info mm/vmalloc.c:4936 [inline]
>  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
>  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
>  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
>  new_sync_read fs/read_write.c:489 [inline]
>  vfs_read+0x5b4/0x740 fs/read_write.c:570
>  ksys_read+0xbe/0x190 fs/read_write.c:713
>  __do_sys_read fs/read_write.c:722 [inline]
>  __se_sys_read fs/read_write.c:720 [inline]
>  __x64_sys_read+0x41/0x50 fs/read_write.c:720
>  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:=
1
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
>  show_numa_info mm/vmalloc.c:4934 [inline]
>  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
>  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
>  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
>  new_sync_read fs/read_write.c:489 [inline]
>  vfs_read+0x5b4/0x740 fs/read_write.c:570
>  ksys_read+0xbe/0x190 fs/read_write.c:713
>  __do_sys_read fs/read_write.c:722 [inline]
>  __se_sys_read fs/read_write.c:720 [inline]
>  __x64_sys_read+0x41/0x50 fs/read_write.c:720
>  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:=
1
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> value changed: 0x0000008f -> 0x00000000
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> According to this report, there is a read/write data-race because m->priv=
ate
> is accessible to multiple CPUs. To fix this, instead of allocating the he=
ap
> in proc_vmalloc_init() and passing the heap address to m->private,
> show_numa_info() should allocate the heap.
>
> One thing to note is that show_numa_info() is called in a critical sectio=
n
> of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag.
>
> Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
>         to avoid printing uninitialized members of vm_struct.
> - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha31051=
0@gmail.com/
> v2: Refactoring some functions and fix patch as per Eric Dumazet suggesti=
on
> - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha31051=
0@gmail.com/
> ---
>  mm/vmalloc.c | 51 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..9139025e20e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4914,28 +4914,32 @@ bool vmalloc_dump_obj(void *object)
>  #endif
>
>  #ifdef CONFIG_PROC_FS
> +
> +/*
> + * Print number of pages allocated on each memory node.
> + *
> + * This function can only be called if CONFIG_NUMA is enabled
> + * and VM_UNINITIALIZED bit in v->flags is disabled.
> + */
>  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
>  {
> -       if (IS_ENABLED(CONFIG_NUMA)) {
> -               unsigned int nr, *counters =3D m->private;
> -               unsigned int step =3D 1U << vm_area_page_order(v);
> +       unsigned int nr, *counters;
> +       unsigned int step =3D 1U << vm_area_page_order(v);
>
> -               if (!counters)
> -                       return;
> +       counters =3D kcalloc(nr_node_ids, sizeof(unsigned int), GFP_ATOMI=
C);
> +       if (!counters)
> +               return;
>
> -               if (v->flags & VM_UNINITIALIZED)

Hello,

although skipping memory blocks with VM_UNINITIALIZED flag seems like
a good idea maybe it might be a good idea to check correctness of
memory areas.

if (v && (v->flags & VM_UNINITIALIZED)) {
    continue;
}

> -                       return;
> -               /* Pair with smp_wmb() in clear_vm_uninitialized_flag() *=
/
> -               smp_rmb();
> +       /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> +       smp_rmb();
>
> -               memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> +       for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> +               counters[page_to_nid(v->pages[nr])] +=3D step;
> +       for_each_node_state(nr, N_HIGH_MEMORY)
> +               if (counters[nr])
> +                       seq_printf(m, " N%u=3D%u", nr, counters[nr]);
>
> -               for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> -                       counters[page_to_nid(v->pages[nr])] +=3D step;
> -               for_each_node_state(nr, N_HIGH_MEMORY)
> -                       if (counters[nr])
> -                               seq_printf(m, " N%u=3D%u", nr, counters[n=
r]);
> -       }
> +       kfree(counters);
>  }
>
>  static void show_purge_info(struct seq_file *m)
> @@ -4979,6 +4983,8 @@ static int vmalloc_info_show(struct seq_file *m, vo=
id *p)
>                         }
>
>                         v =3D va->vm;
> +                       if (v->flags & VM_UNINITIALIZED)
> +                               continue;
>
>                         seq_printf(m, "0x%pK-0x%pK %7ld",
>                                 v->addr, v->addr + v->size, v->size);
> @@ -5013,7 +5019,9 @@ static int vmalloc_info_show(struct seq_file *m, vo=
id *p)
>                         if (is_vmalloc_addr(v->pages))
>                                 seq_puts(m, " vpages");
>
> -                       show_numa_info(m, v);
> +                       if (IS_ENABLED(CONFIG_NUMA))
> +                               show_numa_info(m, v);
> +
>                         seq_putc(m, '\n');
>                 }
>                 spin_unlock(&vn->busy.lock);
> @@ -5028,14 +5036,7 @@ static int vmalloc_info_show(struct seq_file *m, v=
oid *p)
>
>  static int __init proc_vmalloc_init(void)
>  {
> -       void *priv_data =3D NULL;
> -
> -       if (IS_ENABLED(CONFIG_NUMA))
> -               priv_data =3D kmalloc(nr_node_ids * sizeof(unsigned int),=
 GFP_KERNEL);
> -
> -       proc_create_single_data("vmallocinfo",
> -               0400, NULL, vmalloc_info_show, priv_data);
> -
> +       proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);

proc_create_single function clean but it no longer receives data like
priv_data right? so if priv_data is needed again code will not work.
if use priv_data becomes necessary, a suitable memory allocation and
release mechanism should be added for this.
otherwise a memory leak could occur and perhaps the use of kfree
instead of kmalloc could also be added.

proc_create_single_data("vmallocinfo", 0400, NULL, vmalloc_info_show,
priv_data);

// use kfree and free priv_data
kfree(priv_data);

Regards

Ozgur

>         return 0;
>  }
>  module_init(proc_vmalloc_init);
> --
>
>
>
