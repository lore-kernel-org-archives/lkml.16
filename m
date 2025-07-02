Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F72E0416
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469815; cv=none; b=XyaC3/vztawo2MWlbOJmlN0wiLPkBHIBFJMBLszlDctTNLXw7cQJDHVSMGLHZW8Bc3e0DWV22S+USi3fDzGRMi/J5DC8SAZ/dtjC88ei9/VF2drMrzTP4blOY1eHQ8OJtsY+yEU1J4c7f6XUUQSpq+syMP14PFqB9lyhWlzA39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469815; c=relaxed/simple;
	bh=n+hqv/gw2B01RaR1RCnaR1xKvDHWEyoitrMdU0c0lQ8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uaJsuOHRTmw2jlIOUfl37asrhFIyNjYu5zGJjxflHlFIPMtlo/LuKw/j4+UKAgO99cfb/qHINzvEzUr5R7dnbZwrnOm+Es+27NJ7PpOzouHP2pEVEShpN12VXmIB20jQF1/rCWyL4fdpK2GDBGGk8KEyiam3Raj7nmRM9WVVg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=fXngBZQN; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="fXngBZQN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7O7yM6FOAAZ9Lw5LrR+m9iOl69uHGSd1gh0GvTRbSuI=; b=fXngBZQNqBRx11QWqX1iw6+otj
	mgEvLAtcCw7EYJKCcejc5X7r8thWnLEs+ppCSW4Wj8E9GJIuKYElIHgixBc/VOhNjcw0yJLyRmdPo
	i0e55fFTz4ZItk46rm6B8x9/z0QrUYAkgBZnZgUXwMu9Mx4O741OtOxA7z9IgeFwzaTAbubfkkoVC
	WO+HvvQMvWehTkavIHBUiXyCsRyb06K8qNdS4XePHt/yAw1o/hL4sZi3jXu1FxMubOcgaq84wWm0W
	ALEi+k76Cgwenxk2NwtveWyDRwT9YULFDhF664LT8E0Bw1EHOIlUc+ob1Ye3FAH8H/JpOdKy8oi0E
	jHyWJOrQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uWzGR-000000003k8-0BQH;
	Wed, 02 Jul 2025 11:20:47 -0400
Message-ID: <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in
 flush_tlb_func
From: Rik van Riel <riel@surriel.com>
To: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	neeraj.upadhyay@kernel.org, paulmck@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org, 
	yury.norov@gmail.com
Cc: kernel-team <kernel-team@meta.com>, David Hildenbrand
 <david@redhat.com>,  Jann Horn <jannh@google.com>
Date: Wed, 02 Jul 2025 11:20:47 -0400
In-Reply-To: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-02 at 06:50 -0700, syzbot wrote:
>=20
> The issue was bisected to:
>=20
> commit a12a498a9738db65152203467820bb15b6102bd2
> Author: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Date:=C2=A0=C2=A0 Mon Jun 23 00:00:08 2025 +0000
>=20
> =C2=A0=C2=A0=C2=A0 smp: Don't wait for remote work done if not needed in
> smp_call_function_many_cond()

While that change looks like it would increase the
likelihood of hitting this issue, it does not look
like the root cause.

Instead, the stack traces below show that the
TLB flush code is being asked to flush the TLB
for an mm that is exiting.

One CPU is running the TLB flush handler, while
another CPU is freeing the mm_struct.

The CPU that sent the simultaneous TLB flush
is not visible in the stack traces below,
but we seem to have various places around the
MM where we flush the TLB for another mm,
without taking any measures to protect against
that mm being freed while the flush is ongoing.

I wonder if an easy, and low overhead way to
fix that is just to make the mm_struct RCU
freed, and hold the rcu_read_lock() in any place
where we zap the TLB for another mm.

Are there any places where that wouldn't work?

Do we need to take refcounts on the mm_struct,
instead?

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in instrument_atomic_write
> include/linux/instrumented.h:82 [inline]
> BUG: KASAN: slab-use-after-free in clear_bit include/asm-
> generic/bitops/instrumented-atomic.h:41 [inline]
> BUG: KASAN: slab-use-after-free in cpumask_clear_cpu
> include/linux/cpumask.h:628 [inline]
> BUG: KASAN: slab-use-after-free in flush_tlb_func+0x23d/0x6c0
> arch/x86/mm/tlb.c:1132
> Write of size 8 at addr ffff88805f1dca80 by task kworker/1:1/43
>=20
> CPU: 1 UID: 0 PID: 43 Comm: kworker/1:1 Not tainted 6.16.0-rc4-next-
> 20250630-syzkaller #0 PREEMPT(full)=20
> Hardware name: Google Google Compute Engine/Google Compute Engine,
> BIOS Google 05/07/2025
> Workqueue: usb_hub_wq hub_event
> Call Trace:
> =C2=A0<IRQ>
> =C2=A0dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
> =C2=A0print_address_description mm/kasan/report.c:408 [inline]
> =C2=A0print_report+0xd2/0x2b0 mm/kasan/report.c:521
> =C2=A0kasan_report+0x118/0x150 mm/kasan/report.c:634
> =C2=A0check_region_inline mm/kasan/generic.c:-1 [inline]
> =C2=A0kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
> =C2=A0instrument_atomic_write include/linux/instrumented.h:82 [inline]
> =C2=A0clear_bit include/asm-generic/bitops/instrumented-atomic.h:41
> [inline]
> =C2=A0cpumask_clear_cpu include/linux/cpumask.h:628 [inline]
> =C2=A0flush_tlb_func+0x23d/0x6c0 arch/x86/mm/tlb.c:1132
> =C2=A0csd_do_func kernel/smp.c:134 [inline]
> =C2=A0__flush_smp_call_function_queue+0x370/0xaa0 kernel/smp.c:540
> =C2=A0__sysvec_call_function_single+0xa8/0x3d0 arch/x86/kernel/smp.c:271
> =C2=A0instr_sysvec_call_function_single arch/x86/kernel/smp.c:266 [inline=
]
> =C2=A0sysvec_call_function_single+0x9e/0xc0 arch/x86/kernel/smp.c:266
> =C2=A0</IRQ>
> =C2=A0<TASK>
> =C2=A0asm_sysvec_call_function_single+0x1a/0x20
> arch/x86/include/asm/idtentry.h:709
> RIP: 0010:console_flush_all+0x7f7/0xc40 kernel/printk/printk.c:3227
> Code: 48 21 c3 0f 85 e9 01 00 00 e8 65 2d 1f 00 48 8b 5c 24 20 4d 85
> f6 75 07 e8 56 2d 1f 00 eb 06 e8 4f 2d 1f 00 fb 48 8b 44 24 28 <42>
> 80 3c 20 00 74 08 48 89 df e8 3a 41 83 00 48 8b 1b 48 8b 44 24
> RSP: 0018:ffffc90000b36fc0 EFLAGS: 00000293
> RAX: 1ffffffff1d36a63 RBX: ffffffff8e9b5318 RCX: ffff88801faa9e00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc90000b37110 R08: ffffffff8fa17437 R09: 1ffffffff1f42e86
> R10: dffffc0000000000 R11: fffffbfff1f42e87 R12: dffffc0000000000
> R13: 0000000000000001 R14: 0000000000000200 R15: ffffffff8e9b52c0
> =C2=A0__console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
> =C2=A0console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
> =C2=A0vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
> =C2=A0dev_vprintk_emit+0x337/0x3f0 drivers/base/core.c:4916
> =C2=A0dev_printk_emit+0xe0/0x130 drivers/base/core.c:4927
> =C2=A0_dev_info+0x10a/0x160 drivers/base/core.c:4985
> =C2=A0announce_device+0x117/0x2c0 drivers/usb/core/hub.c:2417
> =C2=A0usb_new_device+0x4ef/0x16f0 drivers/usb/core/hub.c:2680
> =C2=A0hub_port_connect drivers/usb/core/hub.c:5571 [inline]
> =C2=A0hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
> =C2=A0port_event drivers/usb/core/hub.c:5871 [inline]
> =C2=A0hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5953
> =C2=A0process_one_work kernel/workqueue.c:3239 [inline]
> =C2=A0process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
> =C2=A0worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
> =C2=A0kthread+0x70e/0x8a0 kernel/kthread.c:463
> =C2=A0ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
> =C2=A0ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> =C2=A0</TASK>
>=20
> Allocated by task 5962:
> =C2=A0kasan_save_stack mm/kasan/common.c:47 [inline]
> =C2=A0kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
> =C2=A0unpoison_slab_object mm/kasan/common.c:319 [inline]
> =C2=A0__kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
> =C2=A0kasan_slab_alloc include/linux/kasan.h:250 [inline]
> =C2=A0slab_post_alloc_hook mm/slub.c:4180 [inline]
> =C2=A0slab_alloc_node mm/slub.c:4229 [inline]
> =C2=A0kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4236
> =C2=A0dup_mm kernel/fork.c:1466 [inline]
> =C2=A0copy_mm+0xdb/0x4b0 kernel/fork.c:1528
> =C2=A0copy_process+0x1706/0x3c00 kernel/fork.c:2168
> =C2=A0kernel_clone+0x21e/0x870 kernel/fork.c:2598
> =C2=A0__do_sys_clone kernel/fork.c:2741 [inline]
> =C2=A0__se_sys_clone kernel/fork.c:2725 [inline]
> =C2=A0__x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2725
> =C2=A0do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> =C2=A0do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
> =C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> Freed by task 8084:
> =C2=A0kasan_save_stack mm/kasan/common.c:47 [inline]
> =C2=A0kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
> =C2=A0kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
> =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
> =C2=A0__kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
> =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
> =C2=A0slab_free_hook mm/slub.c:2417 [inline]
> =C2=A0slab_free mm/slub.c:4680 [inline]
> =C2=A0kmem_cache_free+0x18f/0x400 mm/slub.c:4782
> =C2=A0exit_mm+0x1da/0x2c0 kernel/exit.c:581
> =C2=A0do_exit+0x648/0x2300 kernel/exit.c:947
> =C2=A0do_group_exit+0x21c/0x2d0 kernel/exit.c:1100
> =C2=A0__do_sys_exit_group kernel/exit.c:1111 [inline]
> =C2=A0__se_sys_exit_group kernel/exit.c:1109 [inline]
> =C2=A0__x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1109
> =C2=A0x64_sys_call+0x21ba/0x21c0
> arch/x86/include/generated/asm/syscalls_64.h:232
> =C2=A0do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> =C2=A0do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
> =C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> The buggy address belongs to the object at ffff88805f1dc080
> =C2=A0which belongs to the cache mm_struct of size 2584
> The buggy address is located 2560 bytes inside of
> =C2=A0freed 2584-byte region [ffff88805f1dc080, ffff88805f1dca98)
>=20
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000
> index:0xffff88805f1dcb40 pfn:0x5f1d8
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0
> pincount:0
> memcg:ffff88805f612801
> anon flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
> page_type: f5(slab)
> raw: 00fff00000000040 ffff88801a44bb40 0000000000000000
> dead000000000001
> raw: ffff88805f1dcb40 00000000000b0009 00000000f5000000
> ffff88805f612801
> head: 00fff00000000040 ffff88801a44bb40 0000000000000000
> dead000000000001
> head: ffff88805f1dcb40 00000000000b0009 00000000f5000000
> ffff88805f612801
> head: 00fff00000000003 ffffea00017c7601 00000000ffffffff
> 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff
> 0000000000000008
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 3, migratetype Unmovable, gfp_mask
> 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP
> _NOMEMALLOC), pid 5719, tgid 5719 (dhcpcd-run-hook), ts 61767719991,
> free_ts 61767008311
> =C2=A0set_page_owner include/linux/page_owner.h:32 [inline]
> =C2=A0post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1848
> =C2=A0prep_new_page mm/page_alloc.c:1856 [inline]
> =C2=A0get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3855
> =C2=A0__alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5145
> =C2=A0alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
> =C2=A0alloc_slab_page mm/slub.c:2487 [inline]
> =C2=A0allocate_slab+0x8a/0x370 mm/slub.c:2655
> =C2=A0new_slab mm/slub.c:2709 [inline]
> =C2=A0___slab_alloc+0xbeb/0x1410 mm/slub.c:3891
> =C2=A0__slab_alloc mm/slub.c:3981 [inline]
> =C2=A0__slab_alloc_node mm/slub.c:4056 [inline]
> =C2=A0slab_alloc_node mm/slub.c:4217 [inline]
> =C2=A0kmem_cache_alloc_noprof+0x283/0x3c0 mm/slub.c:4236
> =C2=A0dup_mm kernel/fork.c:1466 [inline]
> =C2=A0copy_mm+0xdb/0x4b0 kernel/fork.c:1528
> =C2=A0copy_process+0x1706/0x3c00 kernel/fork.c:2168
> =C2=A0kernel_clone+0x21e/0x870 kernel/fork.c:2598
> =C2=A0__do_sys_clone kernel/fork.c:2741 [inline]
> =C2=A0__se_sys_clone kernel/fork.c:2725 [inline]
> =C2=A0__x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2725
> =C2=A0do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> =C2=A0do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
> =C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f
> page last free pid 5719 tgid 5719 stack trace:
> =C2=A0reset_page_owner include/linux/page_owner.h:25 [inline]
> =C2=A0free_pages_prepare mm/page_alloc.c:1392 [inline]
> =C2=A0__free_frozen_pages+0xb80/0xd80 mm/page_alloc.c:2892
> =C2=A0__folio_put+0x21b/0x2c0 mm/swap.c:112
> =C2=A0put_netmem net/core/skbuff.c:7372 [inline]
> =C2=A0skb_page_unref include/linux/skbuff_ref.h:43 [inline]
> =C2=A0__skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
> =C2=A0skb_release_data+0x49a/0x7c0 net/core/skbuff.c:1081
> =C2=A0skb_release_all net/core/skbuff.c:1152 [inline]
> =C2=A0napi_consume_skb+0x158/0x1e0 net/core/skbuff.c:1480
> =C2=A0skb_defer_free_flush net/core/dev.c:6632 [inline]
> =C2=A0net_rx_action+0x51b/0xe30 net/core/dev.c:7625
> =C2=A0handle_softirqs+0x286/0x870 kernel/softirq.c:579
> =C2=A0__do_softirq kernel/softirq.c:613 [inline]
> =C2=A0invoke_softirq kernel/softirq.c:453 [inline]
> =C2=A0__irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
> =C2=A0irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
> =C2=A0common_interrupt+0xbb/0xe0 arch/x86/kernel/irq.c:285
> =C2=A0asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693
>=20
> Memory state around the buggy address:
> =C2=A0ffff88805f1dc980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff88805f1dca00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff88805f1dca80: fb fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0ffff88805f1dcb00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
> =C2=A0ffff88805f1dcb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ----------------
> Code disassembly (best guess):
> =C2=A0=C2=A0 0:	48 21 c3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	and=C2=A0=C2=A0=C2=A0 %rax,%rbx
> =C2=A0=C2=A0 3:	0f 85 e9 01 00 00=C2=A0=C2=A0=C2=A0=C2=A0	jne=C2=A0=C2=A0=
=C2=A0 0x1f2
> =C2=A0=C2=A0 9:	e8 65 2d 1f 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=
call=C2=A0=C2=A0 0x1f2d73
> =C2=A0=C2=A0 e:	48 8b 5c 24 20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=
mov=C2=A0=C2=A0=C2=A0 0x20(%rsp),%rbx
> =C2=A0 13:	4d 85 f6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0	test=C2=A0=C2=A0 %r14,%r14
> =C2=A0 16:	75 07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	jne=C2=A0=C2=A0=C2=A0 0x1f
> =C2=A0 18:	e8 56 2d 1f 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	call=
=C2=A0=C2=A0 0x1f2d73
> =C2=A0 1d:	eb 06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	jmp=C2=A0=C2=A0=C2=A0 0x25
> =C2=A0 1f:	e8 4f 2d 1f 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	call=
=C2=A0=C2=A0 0x1f2d73
> =C2=A0 24:	fb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	sti
> =C2=A0 25:	48 8b 44 24 28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	mov=
=C2=A0=C2=A0=C2=A0 0x28(%rsp),%rax
> * 2a:	42 80 3c 20 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	cmpb=C2=A0=
=C2=A0 $0x0,(%rax,%r12,1) <--
> trapping instruction
> =C2=A0 2f:	74 08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	je=C2=A0=C2=A0=C2=A0=C2=A0 0x39
> =C2=A0 31:	48 89 df=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0	mov=C2=A0=C2=A0=C2=A0 %rbx,%rdi
> =C2=A0 34:	e8 3a 41 83 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	call=
=C2=A0=C2=A0 0x834173
> =C2=A0 39:	48 8b 1b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0	mov=C2=A0=C2=A0=C2=A0 (%rbx),%rbx
> =C2=A0 3c:	48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	rex.W
> =C2=A0 3d:	8b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	.byte 0x8b
> =C2=A0 3e:	44=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	rex.R
> =C2=A0 3f:	24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	.byte 0x24
>=20
>=20
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ=C2=A0for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>=20
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status=C2=A0for how to communicate with syzbot.
> For information about bisection process see:
> https://goo.gl/tpsmEJ#bisection
>=20
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>=20
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before
> testing.
>=20
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>=20
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>=20
> If you want to undo deduplication, reply with:
> #syz undup
>=20

--=20
All Rights Reversed.
