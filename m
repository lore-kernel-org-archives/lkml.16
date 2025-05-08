Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E6210F5D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680667; cv=none; b=YPZqtuuv/bHcn72DEUgOT10LGTIuo8BDYRf57TOdkWhrVqDNUhuS7hm6neWu5nucYNQ2T4qyVUD35OVLoxJ2OCEK+QgAjuFUIxIYmCdOZEnpX0sVZzmQkU3Ef2lq0ohOC+lU/XqxchV1LcXmZ5aODam0QPkvw6Xy/M/RNrGk7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680667; c=relaxed/simple;
	bh=0oKZqtoQDXy14Xm46ipn1nmmqSa35Rh4tgKpbg8hA+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YU8cQavCzvxMau7TzBgifxuPxbHBIXhRwLTuA1PqE0atw+kGaoDb/OUPigOVAi+l0tISwjSJhJibN4BBwWM3ZTJEoCwk8b2g64Wne1ksDvwoNAscAoHi8HqygcvQfzCEi3b2mb1tQ3VVuHMl8IjMTd1lXXdt0tl5JCE0GkCietg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kquabRzW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kquabRzW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so874999a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746680664; x=1747285464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQh0QX+GxBXDNWFhTBGL8N6/5cYPcAZibMDGc6Bv1HI=;
        b=kquabRzWcgbMgNNqtf4b+87CSZYLvy0Qb6z71QInIgtyg5HjuusL7DUNwRcugHq+UA
         VX0VURLXHtDrtLuP3mvKm4l7V516Cadnms9OzLpJ1+Y+la7r3vHPE9vFaSVFpMwFgdz0
         7pwScplGwOEQ7/rnGOjTfM8qcubLgCVLxkhnkHggUjP/yOwZWzI9Z9fZQR3hYCnjClhm
         5KwHU12O2CQVyCK7YMSHComeiLMm0ghKV2OJbjTmtSDziQ9mxafLhcAh7t23poDv2qZg
         TIVY/7KATdYOsU2B4OHnHDB14ft0yG0XSMUUgsV/cddOzIoZCU5Q39ArawJMRtXikpWW
         W/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746680664; x=1747285464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQh0QX+GxBXDNWFhTBGL8N6/5cYPcAZibMDGc6Bv1HI=;
        b=SxbgyjRFNadSdxmR5Ts5EkBbCT150YkqPiA2bj4IrvzRGp8N4h7KbZ+UNMNXRVS6oO
         WQ2EmMruxO++TH4WuPVv+ngyr6Azsim8eiEpygVotgxckE28YuZC1XM4dgLzxC6XU2gw
         cOIbuTGGIOaYnuRymzBKkpcc7EnLRruRGgUc/2BQizPjTW93trLlYb2yVVbZaYgqDM+h
         jm4GpsoInXrmZrwymzSt+SjqTzb09JskY8S07rremvudgvLWwidsY6q1M6Sj3YmDJWyz
         e81N17liyTLfQlRhs1c9vhMIJ5RbFFD0VjqdD1NsXs5DMmQh+5DB7mRQKUiNrSZ+pkj4
         qeuA==
X-Forwarded-Encrypted: i=1; AJvYcCUvtGT8wIdfwJoO9vrmR/bCsjbAwEtOgjTCqidTlV189vPRyFTCfd13KJHwTSi4pAuJf2srNUUNRlJmDBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWECIhuarriAwaRFtZEkSuq4xTwfHUx9axah93cghCbMtZt+l
	DgjRO8GjsBeQ3caoiERjVF+pKAmL42877APe542X4pHrnsGVQb0Qho19VZuaOQLZd4Ss75vQI97
	/qfy+THukTeVWMM80eMeiNV6M3i8=
X-Gm-Gg: ASbGncuamzvvdS3+XcOS7Toi2u/BX8yDxpc4v/w7WWJ9oNhrrcBwDtU6bpz02As3o0C
	W6Tk1Wo+AUjsfIKVQTUkB2+T+Xo5vU8LY7Lkh7Rqa09yBFgsl6x33dGuoeyQt3uy296r7QCsTau
	4WHnkt31Dico0ObyZhsckEew==
X-Google-Smtp-Source: AGHT+IGl/HETb93TXqKDxSrQg5qUxDwQHMS3IdObPyIVFD2nSrAXGYTD3dByv+nexkRsxIUlLHFg5oOtOmC2pd0UnJU=
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id
 98e67ed59e1d1-30aac257b1dmr9558368a91.35.1746680664352; Wed, 07 May 2025
 22:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507142552.9446-1-aha310510@gmail.com> <01100196acf1ede5-ae116361-04f2-4e8f-b7a4-7079d6158ffb-000000@eu-north-1.amazonses.com>
In-Reply-To: <01100196acf1ede5-ae116361-04f2-4e8f-b7a4-7079d6158ffb-000000@eu-north-1.amazonses.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 8 May 2025 14:04:13 +0900
X-Gm-Features: ATxdqUHe5Xv7cyJUHGbeF5sFahI0R_3r6XfksT6zDge-vRMlk7yINrLjLUUdoCg
Message-ID: <CAO9qdTFupkXAzR0=AabByZPZZJbQzpKMbt5pzv5o8b5r6Ha2tg@mail.gmail.com>
Subject: Re: [PATCH v3] mm/vmalloc: fix data race in show_numa_info()
To: Ozgur Kara <ozgur@goosey.org>
Cc: akpm@linux-foundation.org, urezki@gmail.com, edumazet@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ozgur Kara <ozgur@goosey.org> wrote:
>
> Jeongjun Park <aha310510@gmail.com>, 7 May 2025 =C3=87ar, 17:32 tarihinde=
 =C5=9Funu yazd=C4=B1:
> >
> > The following data-race was found in show_numa_info():
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> >  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.=
h:1
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
> >  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.=
h:1
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > value changed: 0x0000008f -> 0x00000000
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > According to this report, there is a read/write data-race because m->pr=
ivate
> > is accessible to multiple CPUs. To fix this, instead of allocating the =
heap
> > in proc_vmalloc_init() and passing the heap address to m->private,
> > show_numa_info() should allocate the heap.
> >
> > One thing to note is that show_numa_info() is called in a critical sect=
ion
> > of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag=
.
> >
> > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > Suggested-by: Eric Dumazet <edumazet@google.com>
> > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforeha=
nd
> >         to avoid printing uninitialized members of vm_struct.
> > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310=
510@gmail.com/
> > v2: Refactoring some functions and fix patch as per Eric Dumazet sugges=
tion
> > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310=
510@gmail.com/
> > ---
> >  mm/vmalloc.c | 51 ++++++++++++++++++++++++++-------------------------
> >  1 file changed, 26 insertions(+), 25 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3ed720a787ec..9139025e20e5 100644
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
> > -       if (IS_ENABLED(CONFIG_NUMA)) {
> > -               unsigned int nr, *counters =3D m->private;
> > -               unsigned int step =3D 1U << vm_area_page_order(v);
> > +       unsigned int nr, *counters;
> > +       unsigned int step =3D 1U << vm_area_page_order(v);
> >
> > -               if (!counters)
> > -                       return;
> > +       counters =3D kcalloc(nr_node_ids, sizeof(unsigned int), GFP_ATO=
MIC);
> > +       if (!counters)
> > +               return;
> >
> > -               if (v->flags & VM_UNINITIALIZED)
>
> Hello,
>
> although skipping memory blocks with VM_UNINITIALIZED flag seems like
> a good idea maybe it might be a good idea to check correctness of
> memory areas.
>
> if (v && (v->flags & VM_UNINITIALIZED)) {
>     continue;
> }
>

Thanks for the suggestion! Not related to data-race, but it seems like
a good idea to add some check code in case null-deref occurs. I'll reflect
this in the v4 patch.

Regards,

Jeongjun Park

> > -                       return;
> > -               /* Pair with smp_wmb() in clear_vm_uninitialized_flag()=
 */
> > -               smp_rmb();
> > +       /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > +       smp_rmb();
> >
> > -               memset(counters, 0, nr_node_ids * sizeof(unsigned int))=
;
> > +       for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> > +               counters[page_to_nid(v->pages[nr])] +=3D step;
> > +       for_each_node_state(nr, N_HIGH_MEMORY)
> > +               if (counters[nr])
> > +                       seq_printf(m, " N%u=3D%u", nr, counters[nr]);
> >
> > -               for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> > -                       counters[page_to_nid(v->pages[nr])] +=3D step;
> > -               for_each_node_state(nr, N_HIGH_MEMORY)
> > -                       if (counters[nr])
> > -                               seq_printf(m, " N%u=3D%u", nr, counters=
[nr]);
> > -       }
> > +       kfree(counters);
> >  }
> >
> >  static void show_purge_info(struct seq_file *m)
> > @@ -4979,6 +4983,8 @@ static int vmalloc_info_show(struct seq_file *m, =
void *p)
> >                         }
> >
> >                         v =3D va->vm;
> > +                       if (v->flags & VM_UNINITIALIZED)
> > +                               continue;
> >
> >                         seq_printf(m, "0x%pK-0x%pK %7ld",
> >                                 v->addr, v->addr + v->size, v->size);
> > @@ -5013,7 +5019,9 @@ static int vmalloc_info_show(struct seq_file *m, =
void *p)
> >                         if (is_vmalloc_addr(v->pages))
> >                                 seq_puts(m, " vpages");
> >
> > -                       show_numa_info(m, v);
> > +                       if (IS_ENABLED(CONFIG_NUMA))
> > +                               show_numa_info(m, v);
> > +
> >                         seq_putc(m, '\n');
> >                 }
> >                 spin_unlock(&vn->busy.lock);
> > @@ -5028,14 +5036,7 @@ static int vmalloc_info_show(struct seq_file *m,=
 void *p)
> >
> >  static int __init proc_vmalloc_init(void)
> >  {
> > -       void *priv_data =3D NULL;
> > -
> > -       if (IS_ENABLED(CONFIG_NUMA))
> > -               priv_data =3D kmalloc(nr_node_ids * sizeof(unsigned int=
), GFP_KERNEL);
> > -
> > -       proc_create_single_data("vmallocinfo",
> > -               0400, NULL, vmalloc_info_show, priv_data);
> > -
> > +       proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show=
);
>
> proc_create_single function clean but it no longer receives data like
> priv_data right? so if priv_data is needed again code will not work.
> if use priv_data becomes necessary, a suitable memory allocation and
> release mechanism should be added for this.
> otherwise a memory leak could occur and perhaps the use of kfree
> instead of kmalloc could also be added.
>
> proc_create_single_data("vmallocinfo", 0400, NULL, vmalloc_info_show,
> priv_data);
>
> // use kfree and free priv_data
> kfree(priv_data);
>
> Regards
>
> Ozgur
>
> >         return 0;
> >  }
> >  module_init(proc_vmalloc_init);
> > --
> >
> >
> >
