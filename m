Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BA1D63C7
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464283; cv=none; b=cuMT6kwV2UXnoXfFJGqPglYtKaWxSG7sn2b+SGNY9JTtqVgD1sPvaC5roLpmtWulU7ZbisFq7LvA26/AkGs3uy1jjm+Q/SOp3pl0oYdyjnURoCN6djAD3/vFgQelfhyaWdx9mlCMI70tUYNY/JtnwphpwVsPai+qOm+K4R8lFoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464283; c=relaxed/simple;
	bh=i2ZZOemJymWK3Oc+Vd/x/FxAAwmImh671Fx7RCrdgCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bh+u7UFwLP1xQRNTiSfzWpkM/jFT2iCSw3/VRL7zxcP5nM78vhXylTNnC0ACtL1OezbiV/mQxcgTeEWLWbxtmk2TOvqSmpkU0KZihFQ5oJzNw0V9iSbszHaZQbZ2kzVOCsNPDy1HAe3RIKmMEf3rvmqqwrM6aFLZusG0Vrm/xB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4pUtlLnH; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4pUtlLnH"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-48b7747f881so5711cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746464281; x=1747069081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVYWryXVx1kyoJr192E9T/rro2Hdu2UpnyIyWhhW1iQ=;
        b=4pUtlLnHyB6UTUGtM08/P+RJ8AlO++lXbFOzuVRTyZXuIC7x+XgkCltrdTL7p6iMQC
         paFF2EU0j2Vr7jd/CZWNXbOGcvUec+1fCg2LMF3b4x3VEQqQsfKz6Q8S5gT8Daf6+ayU
         uwfxDSe3F/dBwbbxf4vu1mrcOgo/yCRMmmXLrsoofzegAHKrT9JcGO+mbFPKivyAvVXz
         WMj0ANzvJDSs/NPn8BTezTv4IZNwfUiHtc+mYNtRyL3cIzP/LI0twU4ltn5HGIS8hUDn
         /+ehtdlBJB5IznzxiZfZEN3GAvJAAk/h3JK4C8wdHJ3eWNu0cT0wgBw/wpmg+K4131wT
         3OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746464281; x=1747069081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVYWryXVx1kyoJr192E9T/rro2Hdu2UpnyIyWhhW1iQ=;
        b=FwsConta8kqVFUwRoSCmREAC9LYfQUilCGARhJD37UGEqTIohbErtOmVZRv3v/5P49
         m89C6AGcVHkFuLpTZ/sf4vJzL6o35LUJ/lxXrRE+DpHnXry3AQRbPonDpldds08RULh3
         6Ug+2IzoTSzs4nwOpKl4q0Gfas7WuRtjtEfez5fWYr5T53gXJbhknaCgcx373e5yQvdT
         VGn/0f33zguiBvMmoFKk/OxpQlKfD3eh+TKFt7F3VRKUhqDEqAij1ISTazkiy7bs5KQl
         7/dGVWXjLeTnbNj+2nJ0jBE5H8hRV+jpunFNBmJH+ifthJS4rtGAtItfEQuVTA2vtvEk
         F1yw==
X-Forwarded-Encrypted: i=1; AJvYcCVmHZ0hUdGFKmUa0J62dOWnsyHt47m8ymDJ14LLT+tUaYWYDlpIFi8Id6r2MyGZsMRGUoiXhahCslxSmzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPr4vQlivugJqJtHnCViNjpKWD+YNAjQMKP14di6uj9obGvrV3
	NYJ3iL68b54yau1cUPZX+gMeiKwu91hVv864MjzRFIM324V6/hO9YqCoCtl2zYPuO7rR3zINVkE
	p/WKSvUXlOzkzfY0Mg6Wze9ES0UuD/dr+ixiF
X-Gm-Gg: ASbGncuG30tVST8jUdEE6DSWfU3rDAHeeF0dAL5Hu4WWaSI4p3/4t5Q9H+bpOydMv4D
	xITsPGyt3imVnwpwQjWmCh/LjNOWU2zg0bBdh0m9f3s6rJyWwEQIdKmpwQrYjqFMR0c9kmBGQu0
	L+0d0XV/Vr3Kgr/j+zcydQ4gd8PlGO5jo=
X-Google-Smtp-Source: AGHT+IGvh+wINaeDvLyVSrEgm1YCFELNntHpZgMsM3y8BK1dAI63+jBaQ9fnatPW6J2lpWfCnLWDz3LjS48D/IOgtqM=
X-Received: by 2002:a05:622a:586:b0:477:1f86:178c with SMTP id
 d75a77b69052e-490cdae6292mr671211cf.26.1746464280291; Mon, 05 May 2025
 09:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504151659.9b09c785-lkp@intel.com> <bcb2407.16c1.19695fc582d.Coremail.00107082@163.com>
In-Reply-To: <bcb2407.16c1.19695fc582d.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 May 2025 09:57:48 -0700
X-Gm-Features: ATxdqUE8LYpXDPRuesKJWCsvfbcso97J4oLlqMxz7X9mFosiSCnDR0k1MdutzD8
Message-ID: <CAJuCfpHdSRKK5uyMTQd3A5mwFEktZdSUJgyy_y+pEnJCiqYqdw@mail.gmail.com>
Subject: Re: [linus:master] [alloc_tag] 93d5440ece: WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub
To: David Wang <00107082@163.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Minchan Kim <minchan@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sourav Panda <souravpanda@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhao <yuzhao@google.com>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 4:51=E2=80=AFAM David Wang <00107082@163.com> wrote:
>
> Hi,
>
> I have been running my system with CONFIG_MEM_ALLOC_PROFILING_DEBUG=3Dy f=
or a long while, trying to
> reproduce this. Though I have not yet hit the exact call traces, but I go=
t the same warning via a "simpler"
> trace:
>
> [Fri May  2 15:07:00 2025] alloc_tag was not set
> [Fri May 2 15:07:00 2025] WARNING: CPU: 0 PID: 677 at
>                         ./include/linux/alloc_tag.h:156
>                         ./include/linux/alloc_tag.h:154
>                         ./include/linux/pgalloc_tag.h:182
>                         mm/page_alloc.c:1163
> ___free_pages           mm/page_alloc.c:5072 <---- code[1] below
>                         drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1417=
          <---code[2] below
> iwl_pcie_rx_handle      drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1568=
 iwlwifi
>
> <other traces are irrelevant...I think>
>
> code[1]:
> 5063 static void ___free_pages(struct page *page, unsigned int order,
> 5064                           fpi_t fpi_flags)
> 5065 {
> 5066         /* get PageHead before we drop reference */
> 5067         int head =3D PageHead(page);
> 5068
> 5069         if (put_page_testzero(page))
> 5070                 __free_frozen_pages(page, order, fpi_flags);
> 5071         else if (!head) {
> 5072                 pgalloc_tag_sub_pages(page, (1 << order) - 1);  <---=
--at this point, page[0] may already be returned.
> 5073                 while (order-- > 0)
> 5074                         __free_frozen_pages(page + (1 << order), ord=
er,
> 5075                                             fpi_flags);
> 5076         }
> 5077 }
>
> code[2]:
> 1415         /* page was stolen from us -- free our reference */
> 1416         if (page_stolen) {
> 1417                 __free_pages(rxb->page, trans_pcie->rx_page_order);
> 1418                 rxb->page =3D NULL;
> 1419         }
>
>
>
> From those codes above, my guess is:
>
> Thread1                                    Thread2
> iwlwifi alloc page of order "0"
>                                            some callback use get_page to =
"steal" the memory.
> iwlwifi notice the page is "stolen",
> and call __free_pages to release its
> reference to the page, and
> if (put_page_testzero(page)) failed
>                                            call put_page to release its r=
eference, and page's
>                                            reference count drop to 0 now,=
 and the page is released
> pgalloc_tag_sub_pages is called to
> sub "0" page, but the page is already
> gone, hence the warning.
>
>
>
> It is potentially dangerous to pgalloc_tag_sub_pages a released page.
> Kind of feel the pgalloc_tag_sub_pages here should be removed:
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5669baf2a6fe..63c160537045 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5069,7 +5069,6 @@ static void ___free_pages(struct page *page, unsign=
ed int order,
>         if (put_page_testzero(page))
>                 __free_frozen_pages(page, order, fpi_flags);
>         else if (!head) {
> -               pgalloc_tag_sub_pages(page, (1 << order) - 1);
>                 while (order-- > 0)
>                         __free_frozen_pages(page + (1 << order), order,
>                                             fpi_flags);
>

Hi David,
As discussed on the patch you posted, let's store the tag before
put_page_testzero() and operate on that tag without using the page
that might be freed from under us.

>
> And about the warning in the origianl report by "kernel test robot", it i=
s not the same.
> I think there are places where high-order pages are released via several =
low-order pages, and my understanding
> is that only the first page has the tag, but I am not quite sure, correct=
 me if I am wrong...

That might happen but the high-order page would be split before its
parts are freed. During the split pgalloc_tag_split() will make each
split page point to the original tag, so each resulting page should
have a valid reference to a tag.

>  (The whole MM is quite complicated to me.).
> And I believe when the lower-order page is released without a tag, a debu=
g warning should follow
> The warning is kind of "benign" under those conditions, though
>
>
> Thanks
> David
>
>
>
>
>
>
>
> At 2025-04-15 16:35:47, "kernel test robot" <oliver.sang@intel.com> wrote=
:
> >
> >
> >Hello,
> >
> >
>
> >
> >
> >
> >If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
> >the same patch/commit), kindly add following tags
> >| Reported-by: kernel test robot <oliver.sang@intel.com>
> >| Closes: https://lore.kernel.org/oe-lkp/202504151659.9b09c785-lkp@intel=
.com
> >
> >
> >[  147.337988][ T2016] ------------[ cut here ]------------
> >[  147.338915][ T2016] alloc_tag was not set
> >[ 147.339502][ T2016] WARNING: CPU: 0 PID: 2016 at include/linux/alloc_t=
ag.h:152 __pgalloc_tag_sub (include/linux/alloc_tag.h:152 include/linux/all=
oc_tag.h:195 mm/page_alloc.c:1089)
> >[  147.341127][ T2016] Modules linked in:
> >[  147.341672][ T2016] CPU: 0 UID: 0 PID: 2016 Comm: grep Tainted: G    =
            T  6.14.0-rc6-00062-g93d5440ece3c #1 c08622b3723459177a60d59577=
3689e527750d0d
> >[  147.343295][ T2016] Tainted: [T]=3DRANDSTRUCT
> >[  147.343867][ T2016] Hardware name: QEMU Standard PC (i440FX + PIIX, 1=
996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> >[ 147.345236][ T2016] RIP: 0010:__pgalloc_tag_sub (include/linux/alloc_t=
ag.h:152 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089)
> >[ 147.345982][ T2016] Code: 41 5e 41 5f 5d c3 49 c7 47 e0 00 00 00 00 80=
 3d 25 ef 66 0a 00 75 a9 48 c7 c7 e0 91 39 8e c6 05 15 ef 66 0a 01 e8 3f bb=
 ad ff <0f> 0b eb 92 48 c7 c0 20 2b e6 90 48 ba 00 00 00 00 00 fc ff df 48
> >All code
> >=3D=3D=3D=3D=3D=3D=3D=3D
> >   0:  41 5e                   pop    %r14
> >   2:  41 5f                   pop    %r15
> >   4:  5d                      pop    %rbp
> >   5:  c3                      ret
> >   6:  49 c7 47 e0 00 00 00    movq   $0x0,-0x20(%r15)
> >   d:  00
> >   e:  80 3d 25 ef 66 0a 00    cmpb   $0x0,0xa66ef25(%rip)        # 0xa6=
6ef3a
> >  15:  75 a9                   jne    0xffffffffffffffc0
> >  17:  48 c7 c7 e0 91 39 8e    mov    $0xffffffff8e3991e0,%rdi
> >  1e:  c6 05 15 ef 66 0a 01    movb   $0x1,0xa66ef15(%rip)        # 0xa6=
6ef3a
> >  25:  e8 3f bb ad ff          call   0xffffffffffadbb69
> >  2a:* 0f 0b                   ud2             <-- trapping instruction
> >  2c:  eb 92                   jmp    0xffffffffffffffc0
> >  2e:  48 c7 c0 20 2b e6 90    mov    $0xffffffff90e62b20,%rax
> >  35:  48 ba 00 00 00 00 00    movabs $0xdffffc0000000000,%rdx
> >  3c:  fc ff df
> >  3f:  48                      rex.W
> >
> >Code starting with the faulting instruction
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   0:  0f 0b                   ud2
> >   2:  eb 92                   jmp    0xffffffffffffff96
> >   4:  48 c7 c0 20 2b e6 90    mov    $0xffffffff90e62b20,%rax
> >   b:  48 ba 00 00 00 00 00    movabs $0xdffffc0000000000,%rdx
> >  12:  fc ff df
> >  15:  48                      rex.W
> >[  147.348298][ T2016] RSP: 0018:ffffc90001def730 EFLAGS: 00010282
> >[  147.349063][ T2016] RAX: dffffc0000000000 RBX: 1ffff920003bdee7 RCX: =
0000000000000001
> >[  147.350021][ T2016] RDX: 0000000000000027 RSI: 0000000000000004 RDI: =
ffffffff9059d5a8
> >[  147.354294][ T2016] RBP: ffffc90001def7a0 R08: ffffffff87fd99d0 R09: =
fffffbfff20b3ab5
> >[  147.355329][ T2016] R10: ffffffff9059d5ab R11: 0000000000000001 R12: =
ffff888106402c58
> >[  147.356345][ T2016] R13: 0000000000000000 R14: 0000000000000001 R15: =
ffffc90001def778
> >[  147.357317][ T2016] FS:  0000000000000000(0000) GS:ffffffff904be000(0=
000) knlGS:0000000000000000
> >[  147.358402][ T2016] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >[  147.359199][ T2016] CR2: 00007fedda922200 CR3: 0000000155129000 CR4: =
00000000000406f0
> >[  147.360209][ T2016] DR0: 0000000000000000 DR1: 0000000000000000 DR2: =
0000000000000000
> >[  147.361208][ T2016] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: =
0000000000000400
> >[  147.362220][ T2016] Call Trace:
> >[  147.362713][ T2016]  <TASK>
> >[ 147.363178][ T2016] ? show_regs (arch/x86/kernel/dumpstack.c:479)
> >[ 147.363763][ T2016] ? __warn (kernel/panic.c:748)
> >[ 147.364366][ T2016] ? __wake_up_klogd (arch/x86/include/asm/preempt.h:=
94 kernel/printk/printk.c:4525)
> >[ 147.365015][ T2016] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152=
 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089)
> >[ 147.365689][ T2016] ? report_bug (lib/bug.c:201 lib/bug.c:219)
> >[ 147.366349][ T2016] ? page_ext_get (include/linux/rcupdate.h:337 inclu=
de/linux/rcupdate.h:849 mm/page_ext.c:525)
> >[ 147.366988][ T2016] ? handle_bug (arch/x86/kernel/traps.c:285)
> >[ 147.367583][ T2016] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (dis=
criminator 1))
> >[ 147.368249][ T2016] ? asm_exc_invalid_op (arch/x86/include/asm/idtentr=
y.h:574)
> >[ 147.368921][ T2016] ? irq_work_queue (arch/x86/include/asm/atomic.h:23=
 arch/x86/include/asm/atomic.h:145 include/linux/atomic/atomic-arch-fallbac=
k.h:1690 include/linux/atomic/atomic-instrumented.h:954 kernel/irq_work.c:6=
1 kernel/irq_work.c:119)
> >[ 147.369562][ T2016] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152=
 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089)
> >[ 147.370244][ T2016] ? __alloc_contig_migrate_range (mm/page_alloc.c:10=
84)
> >[ 147.371016][ T2016] free_frozen_pages (mm/page_alloc.c:1211 mm/page_al=
loc.c:2738)
> >[ 147.371700][ T2016] __free_slab (mm/slub.c:2669)
> >[ 147.372331][ T2016] free_slab (mm/slub.c:2692)
> >[ 147.372900][ T2016] free_to_partial_list (mm/slub.c:4414)
> >[ 147.373569][ T2016] ? qlist_free_all (mm/kasan/quarantine.c:163 mm/kas=
an/quarantine.c:179)
> >[ 147.374213][ T2016] __slab_free (mm/slub.c:4534)
> >[ 147.374819][ T2016] ? __kasan_check_read (mm/kasan/shadow.c:32)
> >[ 147.375470][ T2016] ? mark_lock (arch/x86/include/asm/bitops.h:227 (di=
scriminator 3) arch/x86/include/asm/bitops.h:239 (discriminator 3) include/=
asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 3) kernel/l=
ocking/lockdep.c:230 (discriminator 3) kernel/locking/lockdep.c:4729 (discr=
iminator 3))
> >[ 147.376062][ T2016] ? mark_held_locks (kernel/locking/lockdep.c:4323)
> >[ 147.376701][ T2016] ___cache_free (mm/slub.c:4681)
> >[ 147.377248][ T2016] qlist_free_all (mm/kasan/quarantine.c:174)
> >[ 147.377795][ T2016] kasan_quarantine_reduce (include/linux/srcu.h:357 =
mm/kasan/quarantine.c:287)
> >[ 147.378470][ T2016] __kasan_slab_alloc (mm/kasan/common.c:329)
> >[ 147.379088][ T2016] kmem_cache_alloc_noprof (include/linux/kasan.h:250=
 mm/slub.c:4128 mm/slub.c:4177 mm/slub.c:4184)
> >[ 147.379784][ T2016] getname_flags (include/linux/sched.h:2248 fs/namei=
.c:139)
> >[ 147.380436][ T2016] getname (fs/namei.c:224)
> >[ 147.380969][ T2016] do_sys_openat2 (fs/open.c:1422)
> >[ 147.381587][ T2016] ? build_open_flags (fs/open.c:1414)
> >[ 147.382258][ T2016] __x64_sys_openat (fs/open.c:1454)
> >[ 147.382899][ T2016] ? __ia32_compat_sys_open (fs/open.c:1454)
> >[ 147.383611][ T2016] x64_sys_call (arch/x86/entry/syscall_64.c:36)
> >[ 147.384281][ T2016] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86=
/entry/common.c:83)
> >[ 147.384977][ T2016] entry_SYSCALL_64_after_hwframe (arch/x86/entry/ent=
ry_64.S:130)
> >[  147.385724][ T2016] RIP: 0033:0x7fedda9e895d
>
> >
> >The kernel config and materials to reproduce are available at:
> >https://download.01.org/0day-ci/archive/20250415/202504151659.9b09c785-l=
kp@intel.com
> >
> >
> >
> >--
> >0-DAY CI Kernel Test Service
> >https://github.com/intel/lkp-tests/wiki
