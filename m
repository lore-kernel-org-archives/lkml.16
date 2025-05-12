Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34731758B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058943; cv=none; b=gjjRBW3nJ204iGzrzA8IZo6f+TrO4uFYO7wm//YXDV2nRBkXGoD1UJBdVs+mKOP8/2ya923RWWm+ZdFc/Amh+Ff+IAn1uvwbv3MrmzkvVMQXbP6ZVjAcoD3Xm93Gc3NAz8V92KNw+QgxBt4rNRWV+Uj/tKr1gRLqX30JxUZYhXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058943; c=relaxed/simple;
	bh=+iywdlur6nphe1FJAlLFjto1jX5dtMomAgjsxCtm6Gc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rlhjDUbU87zi8OJqRG1Hd2q5YcWxG6tl/eX2bDy2DjiARqHwVlbRr62DqoOEMJ0Ot+HMW/JRaSnd2IGAPGd+gzWignD/5x3O1g0RaHHxZgJlmi7IAHXrE2K9zdWfrNV9Y5MruzS6WvdbgZijj3NXeGswudWr3hGIYWF3pIvQaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H4rOa3pz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H4rOa3pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747058940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=t6F/HXttFGEwh7CM5xDejgWccoHrgvvuQDWCPPftjIw=;
	b=H4rOa3pzWjyADHAyprVa218gzLi0L82GHgNd7LA7AluDwKXCO8IzujGYvAUxPPtocCQ304
	pICKOvzSRsos8NdKTsLa9eSrpMVCGZv/bhWPQpQB+gehByH0RFnefvkOlUft6szMQKcePG
	cywAfY5hPQHSoJUesfUo3X22ZhjQmrs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-0-4pt7xwMgiJ66jmYNOWbA-1; Mon, 12 May 2025 10:08:58 -0400
X-MC-Unique: 0-4pt7xwMgiJ66jmYNOWbA-1
X-Mimecast-MFC-AGG-ID: 0-4pt7xwMgiJ66jmYNOWbA_1747058934
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad22d68aa6fso239065666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058934; x=1747663734;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6F/HXttFGEwh7CM5xDejgWccoHrgvvuQDWCPPftjIw=;
        b=aafgxcfK9GyJziXfUBewWhujcPt6dYtlh9k43AjbfjNtvI4wzxU0VsKCT1naKO2dSV
         ucnoMbLJQpy29S+TZl3/DUDqn0V3SPUqloMiyU3m/GO6PD5Ze32hbFaDkil0oacJUwxL
         VWN7R6ddeSj2AGqgaGAxl8sYbtTmukKwaPeXlvKAk4h5/VaW50fbux/tfQ+Euk3qio0t
         2SGWmKi1bDk7FxrxNrfl5XxB8LPb8pKqE4gj8Qacr258K7GT12tP090/u4TpOgmhTAi0
         WCVFynDLxiKVFBrAQDDYz4IdwR3rwsGRjP1+PRQ3kd+WdbhRaZ82uDu/lC0ac79p5szU
         074g==
X-Forwarded-Encrypted: i=1; AJvYcCVgNOpOnKHE5rz4z/nGuz5AQzrx59/k+5fCwVg+Lshb3hBYqA4S4hUINya9pY/XCnYUv7047pnq/+GGVvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YydigrhIJ0hUFGE/NYVhxaZx0knyOgttEnBMww4LwFBBmPzgLEM
	BtvsnO9fw0/63bJHUPvs6zjXMFcm5DxvTRs739ZgxFqoQAI6X0478C53GFcurVKEeR5DWAxGlVC
	zEehLrYHsboZjPhNzFlW9jZ5WqfVdpT6mWvEiM5qAMsZYiXjsHx3Lkw4uquNQUFIVvY55YEgm2H
	IFks4L4QKbjM8QceTk+9uNpdryHe6lf6OP0OGY
X-Gm-Gg: ASbGnctgeOLMTVGuP1IAQLw9GrizffMaETM6eEwRRdpv4twvnvWReRl/QmysoNnWxJd
	0HvgBuxI0xAABThBa/pe9L0AjvvM9dxz6meITbLm1vkPz3TRE9mvEAk9tvcjvzX/8WWVYp6BLI3
	Fqq9KayK3ik09gDMf59b4+y68=
X-Received: by 2002:a17:907:968c:b0:ad2:49cc:b460 with SMTP id a640c23a62f3a-ad249ccb8admr547320466b.3.1747058934183;
        Mon, 12 May 2025 07:08:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcevVH/6lfbagTqi3aUM91UYOgKGprVmNOb7KEb7kx03tC64DbltJnK+NyYmxZkUg533PKLhSRjs6BhSQjRa8=
X-Received: by 2002:a17:907:968c:b0:ad2:49cc:b460 with SMTP id
 a640c23a62f3a-ad249ccb8admr547316466b.3.1747058933669; Mon, 12 May 2025
 07:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 12 May 2025 16:08:42 +0200
X-Gm-Features: AX0GCFuzKy6TASLqPCYoKUqmLQ_eFSaYPnjVvRbm7JyBu8Rsq5dtBEaauvM2WF4
Message-ID: <CAP4=nvS2r=-1GgnmsEA9s7JPs1EVg9R63FLLNboN=f1cq0WEqQ@mail.gmail.com>
Subject: [BUG?] perf_event_open fails on synthetic event created through dynamic_events
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Dear perf and tracing maintainers,

I would like to report a bug in perf/tracing (not sure where the bug
actually is) with synthetic events and perf, on the latest 6.15-rc6
kernel.

Tracefs allows creating synthetic events through the
/sys/kernel/tracing/dynamic_events file, which show up in perf as
synthetic:test_event:

$ echo 's:test_event u64 arg;' > /sys/kernel/tracing/dynamic_events
$  cat /sys/kernel/tracing/dynamic_events
s:synthetic/test_event  u64 arg
$  perf list | grep test_event
 synthetic:test_event                               [Tracepoint event]

However, perf_event_open is failing on those events:

$ perf record -e synthetic:test_event
Error:
The sys_perf_event_open() syscall returned with 22 (Invalid argument)
for event (synthetic:test_event).
/bin/dmesg | grep -i perf may provide additional information.

dmesg shows this:

[   81.136609] ------------[ cut here ]------------
[   81.136614] WARNING: CPU: 12 PID: 5384 at kernel/tracepoint.c:142
tracepoint_add_func+0x351/0x3a0
[   81.136621] Modules linked in: rpcrdma rdma_cm iw_cm ib_cm ib_core
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reje
ct_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables
nfnetlink b
infmt_misc intel_rapl_msr intel_rapl_common
intel_uncore_frequency_common intel_pmc_core pmt_telemetry pmt_class
intel_vsec kvm_intel kvm sn
d_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi
snd_hda_codec snd_hda_core irqbypass rapl snd_hwdep snd_seq snd_seq_de
vice snd_pcm iTCO_wdt snd_timer intel_pmc_bxt joydev snd
iTCO_vendor_support i2c_i801 soundcore pcspkr virtio_balloon lpc_ich
i2c_smbus nfsd
auth_rpcgss nfs_acl lockd grace nfs_localio sunrpc xfs polyval_clmulni
polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 virtio
_gpu virtio_net sha1_ssse3 net_failover failover virtio_dma_buf
serio_raw fuse qemu_fw_cfg
[   81.136653] CPU: 12 UID: 0 PID: 5384 Comm: perf Kdump: loaded Not
tainted 6.15.0-rc6 #24 PREEMPT(lazy)
[   81.136657] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.16.3-3.fc41 04/01/2014
[   81.136658] RIP: 0010:tracepoint_add_func+0x351/0x3a0
[   81.136660] Code: fe ff ff 49 8b 7e 18 48 85 ff 0f 84 8c fe ff ff
49 8b 56 28 49 8b 76 20 4c 89 04 24 e8 e8 d6 10 00 4c 8b 04 24 e9 72
fe
ff ff <0f> 0b b8 ea ff ff ff 45 84 e4 0f 85 4a fd ff ff e9 9f fe ff ff 49
[   81.136661] RSP: 0018:ffffcfd2408779c0 EFLAGS: 00010246
[   81.136663] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000001
[   81.136666] RDX: 000000000000000a RSI: ffffcfd240877a00 RDI: 0000000000000000
[   81.136667] RBP: 000000000000000a R08: ffff8881d901e090 R09: ffffefd23fcaf600
[   81.136667] R10: ffffffffb7f07720 R11: 0000000000000080 R12: 0000000000000001
[   81.136668] R13: ffffcfd240877a00 R14: ffff8881d8302120 R15: 0000000000000000
[   81.136669] FS:  00007f5bd4b3e2c0(0000) GS:ffff8883ed610000(0000)
knlGS:0000000000000000
[   81.136670] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   81.136671] CR2: 000055a33b2c5248 CR3: 0000000127ed9001 CR4: 0000000000772ef0
[   81.136674] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   81.136674] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[   81.136675] PKRU: 55555554
[   81.136676] Call Trace:
[   81.136677]  <TASK>
[   81.136679]  tracepoint_probe_register+0x5b/0x90
[   81.136680]  perf_trace_event_reg+0xfd/0x1f0
[   81.136685]  perf_trace_event_init+0x33/0x160
[   81.136688]  ? trace_event_dyn_try_get_ref+0x61/0x80
[   81.136691]  perf_trace_init+0x73/0xc0
[   81.136692]  perf_tp_event_init+0x24/0x50
[   81.136695]  perf_try_init_event+0x4a/0x2c0
[   81.136701]  perf_init_event+0xd7/0x190
[   81.136703]  ? __pfx_perf_event_output_forward+0x10/0x10
[   81.136705]  perf_event_alloc+0x3cf/0x840
[   81.136709]  ? __pfx_perf_event_output_forward+0x10/0x10
[   81.136711]  __do_sys_perf_event_open+0x268/0xb90
[   81.136716]  do_syscall_64+0x82/0x170
[   81.136720]  ? __mod_memcg_state+0xad/0x1d0
[   81.136723]  ? refill_stock+0x79/0xc0
[   81.136724]  ? __memcg_slab_free_hook+0x114/0x170
[   81.136726]  ? event_function_call+0x1a5/0x1b0
[   81.136729]  ? __memcg_slab_free_hook+0x114/0x170
[   81.136731]  ? __x64_sys_close+0x3d/0x80
[   81.136733]  ? kmem_cache_free+0x340/0x450
[   81.136735]  ? syscall_exit_to_user_mode_prepare+0x154/0x190
[   81.136738]  ? syscall_exit_to_user_mode+0x10/0x210
[   81.136740]  ? do_syscall_64+0x8e/0x170
[   81.136741]  ? count_memcg_events.constprop.0+0x1a/0x30
[   81.136743]  ? handle_mm_fault+0x233/0x350
[   81.136745]  ? do_user_addr_fault+0x2d0/0x8b0
[   81.136748]  ? syscall_exit_to_user_mode+0x10/0x210
[   81.136749]  ? clear_bhb_loop+0x35/0x90
[   81.136751]  ? clear_bhb_loop+0x35/0x90
[   81.136752]  ? clear_bhb_loop+0x35/0x90
[   81.136753]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   81.136754] RIP: 0033:0x7f5bd41076cd
[   81.136756] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e
fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1b 17 0f 00 f7 d8 64 89 01 48
[   81.136757] RSP: 002b:00007ffcfd937af8 EFLAGS: 00000246 ORIG_RAX:
000000000000012a
[   81.136760] RAX: ffffffffffffffda RBX: 00000000ffffffff RCX: 00007f5bd41076cd
[   81.136761] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 000055a33b2a57b0
[   81.136761] RBP: 00007ffcfd937bf0 R08: 0000000000000008 R09: 0000000000000000
[   81.136762] R10: 00000000ffffffff R11: 0000000000000246 R12: 0000000000000008
[   81.136763] R13: 0000000000000000 R14: 0000000000000000 R15: 000055a33b2a57a0
[   81.136764]  </TASK>
[   81.136765] ---[ end trace 0000000000000000 ]---

(repeated multiple times)

It seems that it is trying to access a struct tracepoint object whose
func field is NULL. I have not tried attaching to dynamic events
through perf before, so I don't know whether this is just
unimplemented and poorly handled or a regression. For what it's worth,
it also happens on CentOS Stream 9 kernel (5.14.0-578.el9).

Thanks,
Tomas

