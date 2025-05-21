Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203BA23506E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820601; cv=none; b=AdG6HsPWN32jqQqlXLstnJjCz3/YLr+uwB+gdurqVw4wNZ8UWnaEgjZEzurjJE4b1KyG9llOe+O3KSTcb/w+nQVCorOMfrpBaLDnXLGBqyKc3Tt1oQEGp1vqRo0crTDsfPLW3Ij3QNDZxJ0Xoq1JxZqbehT06Wv3bVRKRQt9LEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820601; c=relaxed/simple;
	bh=wNlIDxRKVIzfJNKE3Yzwp/kKjnqr+FQFZNDCSYg6NDw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ac7/tw1p/eY6aSwn3t8HDHL/bJRS+pP8p1JX9MfyABnf9z19UjSYObVti57D6WTNKsZQqVSMfFhgW9Oq7xLzvgc8cEXuFruiEoC3B6BiWd7ij3SKisS8FakmqwM5L4817kx0bihZYqG+s9ZnPBvLd2EY7EcLRDt0FD/bmuT93xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=yCobIU2F; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="yCobIU2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1747820536;
	bh=KRTKNd+TvCuHfC3gkUEnLHi6+nKNJuXiunK3jK4+BrQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=yCobIU2FUpmylBmdyzNsV5zYC9xXUc9YvzXc8EFXJJnPRjPJ69WngWIHv3p8b/s4N
	 nMSqXx0lk29/O5nnRJSX8ExGBX9BopFgYR6kXdbINfeXhGT793H2hi6gY44lWYQl4e
	 u2m3jKU8RCe57pJtPUEtTXBa/hXYh5DdP4n8XjsY=
X-QQ-mid: zesmtpip3t1747820533t6a38a173
X-QQ-Originating-IP: h7cXqADGaoiptxOnAXv2xTDzWJ8zV/2sswtxOYZPQA4=
Received: from TYSPR06MB7158.apcprd06.prod.out ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 17:42:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8463398514593646057
EX-QQ-RecipientCnt: 7
From: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
CC: Jiaji Qin <jjtan24@m.fudan.edu.cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Subject: KASAN: out-of-bounds Read in unwind_next_frame
Thread-Topic: KASAN: out-of-bounds Read in unwind_next_frame
Thread-Index: AQHbyZeyt4U4hIVkp0euwxnd9fTvtg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 21 May 2025 09:42:11 +0000
Message-ID:
	<TYSPR06MB71586268DF7C558479DB7248F69FA@TYSPR06MB7158.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NoS5wdqc5dY8u2JAu9efz37vyv6MCFypw4lDqwOrLVlFps1aVjEMVkuN
	CL4FhKKyJnEqVvFSrmf6O0JQLSdqVcOwrXENsr4ITwirOlpVYKpH7NdfJ1kZvp/7HwLdMfw
	Vzn6Gi3Wjga5c9H1nvyhRfqUn5RZXZgnav4ijdhu6LOpBKF6APVrwUJTRKaAoz4b10bN93i
	I+JvCKySPy4kQMS7ZytJztwfa720dpQv5OdPbb/YLVJizFmpbfHM8LWHeEnlF9TBl5MD3Iw
	QxdoTzYSaJjIWu/mOzFl6FLIDrC/XRAAOoP+zHHX3BAI0vpk6Z8KMN0UdTqKtmfFu4+T8Uu
	HuGSDKewOz5GmHTT0bNbxOa8CSvswugkl/CJOTqQJbCZgZo2Zk3Q53E6wttn+irIH8BEQLZ
	B3j5z9RSD+WDW5MblWQLmgEkikNg75iDFGGVQ9NPJ6/N5n5czQip5ef6tJOGU3Bp6LtLCne
	31+H4XIBnXy9Q2PVsGw1CQZOQfiQU3IjRcLxzy2EK9uHCTFKjcWoixb6L1bAoZB7Hd87txx
	OxiGTuQ+V1ASisrZMPxYg89k1y/ohay0BbSwzCkNZa/Zzy9h/5Y+LEjQMjuh1ZuiAHoQ/8D
	YGwd9QPpz5iKftawDxGGCHq4aJCaaoeXajtok5UN9N8dD7Yloveu1j9c+1+rccOFSBk/nv0
	63au4mYOUojnvwbyrkk76aGAQ9ct3SdfZKVqAK0iDiDQ61884v7Y+tfnuLvIZvRKgdfzuIP
	iGxbjRv/HH+2mp8+11z3bylDYFlpLyY/iMLd/c659CD9RLA37uGQodZMJgdUCL8qJ5N7yys
	zDtGQhjVQftolAgqp0xjwaHLaNuWP4FoOMB6lv/xRrVhG9aUtAfE11hDSdfFRV0TIhMJVZ5
	6CqeQqJcCkwvKE3oEnAzTPfYGb/Ia2bRkf5soy13VfgVDa+4w36eFy9DId7fKC2iHEOuK4s
	rLpsNKLFHVtNZ3FpjG03bxnnGfruLUfQEAog3ReppVV0aJrbqrveMKRDTZc+HtdVeI4t7/w
	5HZ7cF+Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Dear Maintainers,=0A=
=0A=
=0A=
=0A=
When using our customized Syzkaller to fuzz the latest Linux kernel, the fo=
llowing crash (100th)was triggered.=0A=
=0A=
=0A=
HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2=0A=
git tree: upstream=0A=
Output:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/100_KAS=
AN%3A%20out-of-bounds%20Read%20in%20unwind_next_frame/100report.txt=0A=
Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/=
config.txt=0A=
C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/1=
00_KASAN%3A%20out-of-bounds%20Read%20in%20unwind_next_frame/100repro.c=0A=
Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15=
-rc6/100_KASAN%3A%20out-of-bounds%20Read%20in%20unwind_next_frame/100repro.=
txt=0A=
=0A=
=0A=
The issue might occur in the stack_access_ok function call, which attempts =
to validate whether an address is within a valid stack range. In theASAN re=
port, we see an out-of-bounds read of size 2, corresponding to the address =
ffff c90013b67600 Note the on_stack function within the stack_access_ok fun=
ction, which triggers the out-of-bounds read when checking if an address is=
 within the stack range, and invalid address is calculated when preparing t=
o execute p =3D (unsigned long *)(state->sp   orc->ra_offset); or regs =3D =
(struct pt_regsstate->sp;=0A=
Most likely, a pointer calculation in the unwind_next_frame function result=
ed in an invalid address, and KASAN detected the out-of- access when the co=
de tried to read data via that address.=0A=
We have reproduced this issue several times on 6.15-rc6 again.=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
If you fix this issue, please add the following tag to the commit:=0A=
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.=
cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>=0A=
=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
BUG: KASAN: out-of-bounds in unwind_next_frame+0xd87/0x1c20=0A=
Read of size 2 at addr ffffc90013b67600 by task kworker/3:3/14224=0A=
=0A=
CPU: 3 UID: 0 PID: 14224 Comm: kworker/3:3 Not tainted 6.15.0-rc6 #1 PREEMP=
T(full) =0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1=
.1 04/01/2014=0A=
Workqueue: events console_callback=0A=
Call Trace:=0A=
 <IRQ>=0A=
 dump_stack_lvl+0x116/0x1b0=0A=
 print_report+0xc1/0x630=0A=
 kasan_report+0x96/0xd0=0A=
 unwind_next_frame+0xd87/0x1c20=0A=
 show_trace_log_lvl+0x20c/0x380=0A=
 sched_show_task+0x410/0x660=0A=
 show_state_filter+0xf7/0x390=0A=
 k_spec+0xeb/0x140=0A=
 kbd_event+0xdd9/0x3930=0A=
 input_handle_events_default+0x10a/0x1a0=0A=
 input_pass_values+0x68d/0x870=0A=
 input_event_dispose+0x4db/0x640=0A=
 input_handle_event+0x122/0xde0=0A=
 input_event+0x83/0xb0=0A=
 hidinput_hid_event+0xa7b/0x2040=0A=
 hid_process_event+0x4a6/0x5d0=0A=
 hid_input_array_field+0x4dc/0x670=0A=
 hid_report_raw_event+0xa53/0x1230=0A=
 __hid_input_report.constprop.0+0x33d/0x440=0A=
 hid_irq_in+0x35d/0x850=0A=
 __usb_hcd_giveback_urb+0x2e5/0x6b0=0A=
 usb_hcd_giveback_urb+0x391/0x450=0A=
 dummy_timer+0x124b/0x3580=0A=
 __hrtimer_run_queues+0x1af/0xc60=0A=
 hrtimer_run_softirq+0x17f/0x2e0=0A=
 handle_softirqs+0x1be/0x850=0A=
 irq_exit_rcu+0xfd/0x150=0A=
 sysvec_apic_timer_interrupt+0xa8/0xc0=0A=
 </IRQ>=0A=
 <TASK>=0A=
 asm_sysvec_apic_timer_interrupt+0x1a/0x20=0A=
RIP: 0010:bit_putcs+0x5f4/0xd80=0A=
Code: 41 89 c5 e8 7e 27 9a fc 48 89 ef 48 83 c5 01 48 b9 00 00 00 00 00 fc =
ff df 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 0f b6 04 08 <38> d0 7f 08 84 c=
0 0f 85 24 06 00 00 4c 89 e0 4c 89 e1 0f b6 55 ff=0A=
RSP: 0018:ffffc9000865f838 EFLAGS: 00000202=0A=
RAX: 0000000000000000 RBX: ffff8880430a1822 RCX: dffffc0000000000=0A=
RDX: 0000000000000007 RSI: ffff8880774d8000 RDI: ffffffff8bf73a3f=0A=
RBP: ffffffff8bf73a40 R08: 0000000000000000 R09: 0000000000000000=0A=
R10: fffffbfff2107af3 R11: ffffffff9083d79f R12: ffff8880430a1fa2=0A=
R13: 0000000000000000 R14: ffff888028d06000 R15: 0000000000000000=0A=
 fbcon_putcs+0x37a/0x4b0=0A=
 do_update_region+0x2e5/0x3f0=0A=
 redraw_screen+0x62d/0x750=0A=
 complete_change_console+0x110/0x3b0=0A=
 change_console+0x1a5/0x2e0=0A=
 console_callback+0x1a1/0x4c0=0A=
 process_scheduled_works+0x5de/0x1bd0=0A=
 worker_thread+0x5a9/0xd10=0A=
 kthread+0x447/0x8a0=0A=
 ret_from_fork+0x48/0x80=0A=
 ret_from_fork_asm+0x1a/0x30=0A=
 </TASK>=0A=
=0A=
The buggy address belongs to the virtual mapping at=0A=
 [ffffc90013b60000, ffffc90013b69000) created by:=0A=
 kernel_clone+0xea/0xee0=0A=
=0A=
The buggy address belongs to the physical page:=0A=
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x51f4d=
=0A=
memcg:ffff888000901b02=0A=
flags: 0x4fff00000000000(node=3D1|zone=3D1|lastcpupid=3D0x7ff)=0A=
raw: 04fff00000000000 0000000000000000 dead000000000122 0000000000000000=0A=
raw: 0000000000000000 0000000000000000 00000001ffffffff ffff888000901b02=0A=
page dumped because: kasan: bad access detected=0A=
page_owner tracks the page as allocated=0A=
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP=
_KERNEL|__GFP_HIGHMEM|__GFP_ZERO|__GFP_NOWARN), pid 708, tgid 708 (kworker/=
u19:2), ts 86243875317, free_ts 0=0A=
 prep_new_page+0x1b0/0x1e0=0A=
 get_page_from_freelist+0x1c80/0x3a40=0A=
 __alloc_frozen_pages_noprof+0x2fd/0x6d0=0A=
 alloc_pages_mpol+0x209/0x550=0A=
 alloc_pages_noprof+0x1c/0x250=0A=
 __vmalloc_node_range_noprof+0xa75/0x13a0=0A=
 __vmalloc_node_noprof+0x73/0xa0=0A=
 copy_process+0x439c/0x77f0=0A=
 kernel_clone+0xea/0xee0=0A=
 user_mode_thread+0xc5/0x110=0A=
 call_usermodehelper_exec_work+0xd0/0x180=0A=
 process_scheduled_works+0x5de/0x1bd0=0A=
 worker_thread+0x5a9/0xd10=0A=
 kthread+0x447/0x8a0=0A=
 ret_from_fork+0x48/0x80=0A=
 ret_from_fork_asm+0x1a/0x30=0A=
page_owner free stack trace missing=0A=
=0A=
Memory state around the buggy address:=0A=
 ffffc90013b67500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=0A=
 ffffc90013b67580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=0A=
>ffffc90013b67600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=0A=
                   ^=0A=
 ffffc90013b67680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=0A=
 ffffc90013b67700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
----------------=0A=
Code disassembly (best guess):=0A=
   0:	41 89 c5             	mov    %eax,%r13d=0A=
   3:	e8 7e 27 9a fc       	callq  0xfc9a2786=0A=
   8:	48 89 ef             	mov    %rbp,%rdi=0A=
   b:	48 83 c5 01          	add    $0x1,%rbp=0A=
   f:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx=0A=
  16:	fc ff df=0A=
  19:	48 89 f8             	mov    %rdi,%rax=0A=
  1c:	48 89 fa             	mov    %rdi,%rdx=0A=
  1f:	48 c1 e8 03          	shr    $0x3,%rax=0A=
  23:	83 e2 07             	and    $0x7,%edx=0A=
  26:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax=0A=
* 2a:	38 d0                	cmp    %dl,%al <-- trapping instruction=0A=
  2c:	7f 08                	jg     0x36=0A=
  2e:	84 c0                	test   %al,%al=0A=
  30:	0f 85 24 06 00 00    	jne    0x65a=0A=
  36:	4c 89 e0             	mov    %r12,%rax=0A=
  39:	4c 89 e1             	mov    %r12,%rcx=0A=
  3c:	0f b6 55 ff          	movzbl -0x1(%rbp),%edx=0A=
=0A=
=0A=
thanks,=0A=
Kun Hu=
