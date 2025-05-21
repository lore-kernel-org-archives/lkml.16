Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450D253942
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822771; cv=none; b=oIGofOqYJGM76yINRG+IPS6lvu5mSfOlIvEhBJYLvIwIeiVPDt2ejsfMcfN8JV0UkY6P2/dTksEIHMfcXLr7lqjlVItGi5TzZUEUxaYdXUvHbjL6FENipOYUsy9u5vN9gpjqockFO1HKdTfUuzwesEiDQut2Hq1sZxMzBct+PWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822771; c=relaxed/simple;
	bh=6OhtRBnX8Lzq1kHFX6Cw6Rw1kRjpxIfnQlKpHlZk7dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWDkaQOvYvo2CldRVu7A4NQ7/mtOBB0PnJ3n7yb0O4m/MUPQkMdd6Dd7WaJKtUWbP6+pKfV7PNbmSaxJf6fWLLkiqb1YfKGLLy3tmwpZQ2BHenmMjQk06l3HOjiyp1ONWxfm+ZuleLCJz0KlsSenohun4ul5m6QjTKFWbFGTF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlW799ZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlW799ZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDF3C4CEEA
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747822771;
	bh=6OhtRBnX8Lzq1kHFX6Cw6Rw1kRjpxIfnQlKpHlZk7dc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AlW799ZCuQaV3I0ZFS+z0jNn1Y+j4GBXy3D7XPkWYXkIfM5V/HqNHfBIh8E8NNOK+
	 zr9tQxYn/iXcDDzuSqw31lmpw+vQ19wtXF9Z9cAiZW4wuOM6ahy4IGYg73U68aww8q
	 qLJ7M5kyV54sku4hrWM+cUyxBX5F/d5gmv0CKIFG+UE39vwy966OjsdMDqrW7RhN+f
	 lktQ8soYJjZgp82TsHUugn/ojea2SLWCQ6W8kZTZ9PUmIoGGcaBHMQ8tLtDwTSfoa1
	 33DnD5Gz5BppJHG5tUn+Lq4z6KoAcIr9FcBKEWFlNVq93rH9SCbNyAWeRcsFh9cCut
	 4yVz8a+jiAcbg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso2352581a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:19:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSXFfWFrwGe9F+iJv5CdPYZQvRpROg7vRnwf+Eg5npw3daH74WOevv7IfZIWMFJaGzYswV4laVKb6Twvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJDIMJI7zGnbwcGy+A8q7iC43zE8iT0vd0IjN/+waLcmg3NVI
	y451tvi1zU0W+HXF3Bva2pk36A4+JLhWucNFNcsPL2oUByI3WSqKF43QXBd77ZHl23WhMwdk8tf
	3KI0qn0TF5/Nc1kt+wHsMB/ELhDPRKHQ=
X-Google-Smtp-Source: AGHT+IH8/SFfDLpDgggYvdQ4FQ7bmiKUpTYt8swAUKSJwVuWSbMaY4erDcvfpiabtQL4s3ZQJXdLuGd2bElY8Tel7es=
X-Received: by 2002:a05:6402:3511:b0:602:3b60:926e with SMTP id
 4fb4d7f45d1cf-6023b609398mr1518493a12.10.1747822769712; Wed, 21 May 2025
 03:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYSPR06MB71586268DF7C558479DB7248F69FA@TYSPR06MB7158.apcprd06.prod.outlook.com>
In-Reply-To: <TYSPR06MB71586268DF7C558479DB7248F69FA@TYSPR06MB7158.apcprd06.prod.outlook.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 21 May 2025 18:19:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5fcYEx0CrA-T1cCEJky2=02zmz2xdG3u4UDV7yC4X7UA@mail.gmail.com>
X-Gm-Features: AX0GCFtLQ9OD2s6HzwZNubaXv4ggt-48SyhQAqs1uXSmTZqqiKCHU3orFuj31Qg
Message-ID: <CAAhV-H5fcYEx0CrA-T1cCEJky2=02zmz2xdG3u4UDV7yC4X7UA@mail.gmail.com>
Subject: Re: KASAN: out-of-bounds Read in unwind_next_frame
To: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaji Qin <jjtan24@m.fudan.edu.cn>, 
	Shuoran Bai <baishuoran@hrbeu.edu.cn>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, All,

I found this is a x86-specific bug, why report it to the LoongArch list?

Huacai

On Wed, May 21, 2025 at 5:42=E2=80=AFPM huk23@m.fudan.edu.cn
<huk23@m.fudan.edu.cn> wrote:
>
> Dear Maintainers,
>
>
>
> When using our customized Syzkaller to fuzz the latest Linux kernel, the =
following crash (100th)was triggered.
>
>
> HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
> git tree: upstream
> Output:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/100_K=
ASAN%3A%20out-of-bounds%20Read%20in%20unwind_next_frame/100report.txt
> Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc=
6/config.txt
> C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6=
/100_KASAN%3A%20out-of-bounds%20Read%20in%20unwind_next_frame/100repro.c
> Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.=
15-rc6/100_KASAN%3A%20out-of-bounds%20Read%20in%20unwind_next_frame/100repr=
o.txt
>
>
> The issue might occur in the stack_access_ok function call, which attempt=
s to validate whether an address is within a valid stack range. In theASAN =
report, we see an out-of-bounds read of size 2, corresponding to the addres=
s ffff c90013b67600 Note the on_stack function within the stack_access_ok f=
unction, which triggers the out-of-bounds read when checking if an address =
is within the stack range, and invalid address is calculated when preparing=
 to execute p =3D (unsigned long *)(state->sp   orc->ra_offset); or regs =
=3D (struct pt_regsstate->sp;
> Most likely, a pointer calculation in the unwind_next_frame function resu=
lted in an invalid address, and KASAN detected the out-of- access when the =
code tried to read data via that address.
> We have reproduced this issue several times on 6.15-rc6 again.
>
>
>
>
>
>
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.ed=
u.cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: out-of-bounds in unwind_next_frame+0xd87/0x1c20
> Read of size 2 at addr ffffc90013b67600 by task kworker/3:3/14224
>
> CPU: 3 UID: 0 PID: 14224 Comm: kworker/3:3 Not tainted 6.15.0-rc6 #1 PREE=
MPT(full)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubunt=
u1.1 04/01/2014
> Workqueue: events console_callback
> Call Trace:
>  <IRQ>
>  dump_stack_lvl+0x116/0x1b0
>  print_report+0xc1/0x630
>  kasan_report+0x96/0xd0
>  unwind_next_frame+0xd87/0x1c20
>  show_trace_log_lvl+0x20c/0x380
>  sched_show_task+0x410/0x660
>  show_state_filter+0xf7/0x390
>  k_spec+0xeb/0x140
>  kbd_event+0xdd9/0x3930
>  input_handle_events_default+0x10a/0x1a0
>  input_pass_values+0x68d/0x870
>  input_event_dispose+0x4db/0x640
>  input_handle_event+0x122/0xde0
>  input_event+0x83/0xb0
>  hidinput_hid_event+0xa7b/0x2040
>  hid_process_event+0x4a6/0x5d0
>  hid_input_array_field+0x4dc/0x670
>  hid_report_raw_event+0xa53/0x1230
>  __hid_input_report.constprop.0+0x33d/0x440
>  hid_irq_in+0x35d/0x850
>  __usb_hcd_giveback_urb+0x2e5/0x6b0
>  usb_hcd_giveback_urb+0x391/0x450
>  dummy_timer+0x124b/0x3580
>  __hrtimer_run_queues+0x1af/0xc60
>  hrtimer_run_softirq+0x17f/0x2e0
>  handle_softirqs+0x1be/0x850
>  irq_exit_rcu+0xfd/0x150
>  sysvec_apic_timer_interrupt+0xa8/0xc0
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20
> RIP: 0010:bit_putcs+0x5f4/0xd80
> Code: 41 89 c5 e8 7e 27 9a fc 48 89 ef 48 83 c5 01 48 b9 00 00 00 00 00 f=
c ff df 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 0f b6 04 08 <38> d0 7f 08 84=
 c0 0f 85 24 06 00 00 4c 89 e0 4c 89 e1 0f b6 55 ff
> RSP: 0018:ffffc9000865f838 EFLAGS: 00000202
> RAX: 0000000000000000 RBX: ffff8880430a1822 RCX: dffffc0000000000
> RDX: 0000000000000007 RSI: ffff8880774d8000 RDI: ffffffff8bf73a3f
> RBP: ffffffff8bf73a40 R08: 0000000000000000 R09: 0000000000000000
> R10: fffffbfff2107af3 R11: ffffffff9083d79f R12: ffff8880430a1fa2
> R13: 0000000000000000 R14: ffff888028d06000 R15: 0000000000000000
>  fbcon_putcs+0x37a/0x4b0
>  do_update_region+0x2e5/0x3f0
>  redraw_screen+0x62d/0x750
>  complete_change_console+0x110/0x3b0
>  change_console+0x1a5/0x2e0
>  console_callback+0x1a1/0x4c0
>  process_scheduled_works+0x5de/0x1bd0
>  worker_thread+0x5a9/0xd10
>  kthread+0x447/0x8a0
>  ret_from_fork+0x48/0x80
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
>
> The buggy address belongs to the virtual mapping at
>  [ffffc90013b60000, ffffc90013b69000) created by:
>  kernel_clone+0xea/0xee0
>
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x51f4=
d
> memcg:ffff888000901b02
> flags: 0x4fff00000000000(node=3D1|zone=3D1|lastcpupid=3D0x7ff)
> raw: 04fff00000000000 0000000000000000 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000000000000 00000001ffffffff ffff888000901b02
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(G=
FP_KERNEL|__GFP_HIGHMEM|__GFP_ZERO|__GFP_NOWARN), pid 708, tgid 708 (kworke=
r/u19:2), ts 86243875317, free_ts 0
>  prep_new_page+0x1b0/0x1e0
>  get_page_from_freelist+0x1c80/0x3a40
>  __alloc_frozen_pages_noprof+0x2fd/0x6d0
>  alloc_pages_mpol+0x209/0x550
>  alloc_pages_noprof+0x1c/0x250
>  __vmalloc_node_range_noprof+0xa75/0x13a0
>  __vmalloc_node_noprof+0x73/0xa0
>  copy_process+0x439c/0x77f0
>  kernel_clone+0xea/0xee0
>  user_mode_thread+0xc5/0x110
>  call_usermodehelper_exec_work+0xd0/0x180
>  process_scheduled_works+0x5de/0x1bd0
>  worker_thread+0x5a9/0xd10
>  kthread+0x447/0x8a0
>  ret_from_fork+0x48/0x80
>  ret_from_fork_asm+0x1a/0x30
> page_owner free stack trace missing
>
> Memory state around the buggy address:
>  ffffc90013b67500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  ffffc90013b67580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffffc90013b67600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>                    ^
>  ffffc90013b67680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  ffffc90013b67700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ----------------
> Code disassembly (best guess):
>    0:   41 89 c5                mov    %eax,%r13d
>    3:   e8 7e 27 9a fc          callq  0xfc9a2786
>    8:   48 89 ef                mov    %rbp,%rdi
>    b:   48 83 c5 01             add    $0x1,%rbp
>    f:   48 b9 00 00 00 00 00    movabs $0xdffffc0000000000,%rcx
>   16:   fc ff df
>   19:   48 89 f8                mov    %rdi,%rax
>   1c:   48 89 fa                mov    %rdi,%rdx
>   1f:   48 c1 e8 03             shr    $0x3,%rax
>   23:   83 e2 07                and    $0x7,%edx
>   26:   0f b6 04 08             movzbl (%rax,%rcx,1),%eax
> * 2a:   38 d0                   cmp    %dl,%al <-- trapping instruction
>   2c:   7f 08                   jg     0x36
>   2e:   84 c0                   test   %al,%al
>   30:   0f 85 24 06 00 00       jne    0x65a
>   36:   4c 89 e0                mov    %r12,%rax
>   39:   4c 89 e1                mov    %r12,%rcx
>   3c:   0f b6 55 ff             movzbl -0x1(%rbp),%edx
>
>
> thanks,
> Kun Hu
