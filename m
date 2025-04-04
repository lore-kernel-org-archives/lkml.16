Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6AC1F4297
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779684; cv=none; b=ECuMmE2geMDzTcfjLD9V5QUcGq8t7l1OTXr48RgKhponc5eN3Nv40dL00mvNOVBirtwloO3dBQAdNS2brREZcV5C7jHHtcgOs2PS7wiwV7LPgImcIek8QBgzw4F2Od8Ot94AsMTDt13LYCOQpQG/g9tXIp7O8R+1LzO0nScWkQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779684; c=relaxed/simple;
	bh=Fpzy6nf/csUAvrf1UfxBaSVMMRwkZSljyYORST45H+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBfidkSK1vt6LbELvr8sUX2QjHdt9GbAsazXAY34un60ynKvccTn3DLzP7PAS9WFntH0dox9yYZdcOoUCBzNsX0gKj36nIzqEvhgF5pKWNgbjnguj74ne9FVTFk/wAqGXefWvi9IzR1EdlqXN7yKUC7y36f0LbhYJS6ee/EbbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso412082466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779679; x=1744384479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGgFt/FJxcsBVBPZ+wxj5eicPq1SgvHtVFTWj/q7mNo=;
        b=fFhUXlIR3Yc72MNreCQPcsSm+tbNwPsvy1Zyah+ekFD3Cxo/pENEXny3oSNqsWGFaT
         fDkDQB6XfR3ib2/P9dxLL+BeR/QhIMhj5Ym1TCM/0BB2kYcwBxreftXANHbxm4ScPQDs
         s2h9U2/JnKwbVHnbQ0UbEnn3SffoGy8v4jjhQkjVs+/jaD9vzo9hrXKdmP6u0DANrTnV
         JTencHxzem/CgnFKyu8aPT5XUWeSKMJ8jXPOkaUISzeBLSpj6kNj9hcu5kFJ3qDTWJA/
         Vc6I59iFf9UibrqPfKJQzIK1xSwDVupX8eBIbF1BJZyNf6+naEhCewmhV6oZOLQcsJ7o
         zxyg==
X-Forwarded-Encrypted: i=1; AJvYcCXBSsR5RQZgP3cpB+5ldjqNMqUWyMDl9Dp+srg4f5jHpvI0/NGFwpRaIno/wUjjSQNQIYeKJTCIASKXWik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHQm5B5RLCOtZBcbKrYfWORceGmTSzPGOMDEgR66NSjkxmoCD
	hN25CRRKIaR5FKGm9tuEPtbl0+2pKHxJCP5y3jQynzwsjJxFODtuXegBlg==
X-Gm-Gg: ASbGnctu4FjtgNPOIc1u+xQ4huAxKx9lPOaOgXHjGyITm6r3JZPZZ2BsETm+HtnMqww
	jZ/UDKErVlBwo93HDVcm5mwgliohOnbkX8IiNXrrfk+pcAMPmKyvJSKDxIalNXmYoWuOrm7H8mG
	/OO8UBtWrVmehcZNgWIX73/kRrZdaYv4aWQ3hrUt2cjLnmVAH8tj4J8pnYJdt0hZ6p7IPHYe24D
	a9MoVs59HNyMgMWx1ccHBn1pjiMbQ4m/VlqS2DSjO3O9IkTnTRFmAB3Y+UXZNxTKsM69j4iuaOA
	p7AVlKMS5lA74xv0dpdxX4/uY+MSAWLlPKo=
X-Google-Smtp-Source: AGHT+IH3Ya0zKt/YNqb6KNZINBaH1VnQweAAuQmgvCWnoPEaH4tNLPHK/l4CIQw5zhNh7b7+f3Db1g==
X-Received: by 2002:a17:907:2ce2:b0:ac6:dd50:9b4a with SMTP id a640c23a62f3a-ac7d6d8984dmr350319766b.36.1743779679118;
        Fri, 04 Apr 2025 08:14:39 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013fd98sm272920566b.106.2025.04.04.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:14:38 -0700 (PDT)
Date: Fri, 4 Apr 2025 08:14:36 -0700
From: Breno Leitao <leitao@debian.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	brauner@kernel.org, linux-kernel@vger.kernel.org,
	joel.granados@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
Message-ID: <Z+/3XO5Dh9mKiaE5@gmail.com>
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
 <CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
 <Z+/V5AzsSqY9ALqL@gmail.com>
 <20250404141623.GD3720@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404141623.GD3720@redhat.com>

On Fri, Apr 04, 2025 at 04:16:24PM +0200, Oleg Nesterov wrote:
> On 04/04, Breno Leitao wrote:
> >
> > 	[  254.474273] reboot: Power down
> > 	[  254.479332] ------------[ cut here ]------------
> > 	[  254.479934] WARNING: CPU: 0 PID: 1 at kernel/exit.c:881 do_exit (kernel/exit.c:881)
>                                        ^^^^^^
> confused... so it seems that the init task does
> sys_reboot(LINUX_REBOOT_CMD_POWER_OFF) and exits?
> 
> But if the init task exits for any reason it should trigger
> 
> 	if (unlikely(is_global_init(tsk)))
> 		panic("Attempted to kill init! exitcode=0x%08x\n"

That is showing up later (sorry for not decoding it, but I don't think
it is super important)


	[   64.447039] ACPI: PM: Preparing to enter system sleep state S5
	[   64.454964] reboot: Power down
	[   64.460014] ------------[ cut here ]------------
	[   64.460597] WARNING: CPU: 0 PID: 1 at kernel/exit.c:881 do_exit+0xd0/0x2470
	[   64.461600] Modules linked in: evdev(E) serio_raw(E) button(E) virtio_mmio(E) 9pnet_virtio(E) 9p(E) 9pnet(E) netfs(E)
	[   64.462929] CPU: 0 UID: 0 PID: 1 Comm: virtme-ng-init Tainted: G            E    N 6.13.0-rc7-next-20250117-upstream #45
	[   64.464075] Tainted: [E]=UNSIGNED_MODULE, [N]=TEST
	[   64.464683] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
	[   64.465960] RIP: 0010:do_exit+0xd0/0x2470
	[   64.466427] Code: 00 00 45 31 f6 f7 c3 00 02 00 00 41 0f 94 c6 48 c7 c7 48 8b 5d 87 44 89 f6 31 d2 31 c9 e8 c8 c5 41 00 f7 c3 00 02 00 00 75 02 <0f> 0b 48 c7 c7 78 8b 5d 87 44 89 f6 31 d2 31 c9 e8 ab c5 41 00 48
	[   64.468353] RSP: 0018:ffa000000001fb80 EFLAGS: 00010046
	[   64.468949] RAX: b246b26687739d00 RBX: 0000000000000016 RCX: 0000000000000000
	[   64.469832] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff875d8b48
	[   64.470648] RBP: ffa000000001fd10 R08: dffffc0000000000 R09: 1ffffffff13312b6
	[   64.471451] R10: dffffc0000000000 R11: fffffbfff13312b7 R12: 000000004321fedc
	[   64.472320] R13: dffffc0000000000 R14: 0000000000000001 R15: dffffc0000000000
	[   64.473200] FS:  00007ff47a8a0780(0000) GS:ff110004c6000000(0000) knlGS:0000000000000000
	[   64.474141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
	[   64.474841] CR2: 00007f4eb4ba1648 CR3: 000000010dcde004 CR4: 0000000000771ef0
	[   64.475667] PKRU: 55555554
	[   64.476058] Call Trace:
	[   64.476360]  <TASK>
	[   64.476907]  ? __warn+0x130/0x500
	[   64.477358]  ? do_exit+0xd0/0x2470
	[   64.477794]  ? do_exit+0xd0/0x2470
	[   64.478210]  ? report_bug+0x1bd/0x400
	[   64.478675]  ? handle_bug+0x63/0x90
	[   64.479082]  ? exc_invalid_op+0x1a/0x50
	[   64.479498]  ? asm_exc_invalid_op+0x1a/0x20
	[   64.479976]  ? do_exit+0xd0/0x2470
	[   64.480457]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.481071]  ? __rcu_read_unlock+0xf3/0x630
	[   64.481513]  ? atomic_notifier_call_chain+0x26/0x110
	[   64.482075]  ? __pfx_do_exit+0x10/0x10
	[   64.482594]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.483493]  ? native_machine_shutdown+0x12c/0x1f0
	[   64.484248]  ? atomic_notifier_call_chain+0x26/0x110
	[   64.484854]  __x64_sys_reboot+0x339/0x340
	[   64.485275]  ? __pfx___x64_sys_reboot+0x10/0x10
	[   64.485986]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.486564]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.487118]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.487668]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.488211]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.488772]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.489317]  ? do_syscall_64+0x77/0x260
	[   64.489902]  do_syscall_64+0xd6/0x260
	[   64.490349]  ? exc_page_fault+0xc8/0x130
	[   64.490811]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
	[   64.491332] RIP: 0033:0x7ff47a704a27
	[   64.491789] Code: 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 89 fa be 69 19 12 28 bf ad de e1 fe b8 a9 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 c1 43 0f 00 f7 d8 64 89 02 b8
	[   64.493809] RSP: 002b:00007ffed123b8e8 EFLAGS: 00000217 ORIG_RAX: 00000000000000a9
	[   64.494601] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007ff47a704a27
	[   64.495454] RDX: 000000004321fedc RSI: 0000000028121969 RDI: 00000000fee1dead
	[   64.496254] RBP: 000000000000000a R08: 000056492265c690 R09: 0000000000000000
	[   64.497111] R10: 0000000000000000 R11: 0000000000000217 R12: 0000000000000011
	[   64.498048] R13: 00007ffed123bca8 R14: 000056492263c28c R15: 000000000000000a
	[   64.498940]  </TASK>
	[   64.499238] irq event stamp: 1436466
	[   64.499677] hardirqs last  enabled at (1436465): [<ffffffff847d9edb>] _raw_spin_unlock_irqrestore+0x8b/0x150
	[   64.500762] hardirqs last disabled at (1436466): [<ffffffff81369164>] native_machine_shutdown+0xc4/0x1f0
	[   64.501815] softirqs last  enabled at (1436194): [<ffffffff8142617f>] handle_softirqs+0xa0f/0xb80
	[   64.502716] softirqs last disabled at (1436175): [<ffffffff81426532>] __irq_exit_rcu+0xc2/0x200
	[   64.503728] ---[ end trace 0000000000000000 ]---
	[   64.504458] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
	[   64.505337] CPU: 0 UID: 0 PID: 1 Comm: virtme-ng-init Tainted: G        W   E    N 6.13.0-rc7-next-20250117-upstream #45
	[   64.506249] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
	[   64.506874] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
	[   64.507881] Call Trace:
	[   64.508136]  <TASK>
	[   64.508452]  dump_stack_lvl+0x8e/0x1b0
	[   64.508975]  ? __pfx_dump_stack_lvl+0x10/0x10
	[   64.509448]  ? __pfx__printk+0x10/0x10
	[   64.509891]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.510363]  panic+0x256/0x550
	[   64.510745]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.511209]  ? __pfx_panic+0x10/0x10
	[   64.511665]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.512269]  ? _raw_spin_unlock_irq+0x66/0x80
	[   64.512757]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.513200]  ? seccomp_filter_release+0xf9/0x130
	[   64.513696]  do_exit+0x623/0x2470
	[   64.514073]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.514523]  ? __rcu_read_unlock+0xf3/0x630
	[   64.514937]  ? __pfx_do_exit+0x10/0x10
	[   64.515342]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.515949]  ? native_machine_shutdown+0x12c/0x1f0
	[   64.516437]  ? atomic_notifier_call_chain+0x26/0x110
	[   64.516941]  __x64_sys_reboot+0x339/0x340
	[   64.517302]  ? __pfx___x64_sys_reboot+0x10/0x10
	[   64.517793]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.518288]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.518775]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.519363]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.519889]  ? __pfx_ftrace_likely_update+0x10/0x10
	[   64.520350]  ? srso_alias_return_thunk+0x5/0xfbef5
	[   64.520828]  ? do_syscall_64+0x77/0x260
	[   64.521192]  do_syscall_64+0xd6/0x260
	[   64.521537]  ? exc_page_fault+0xc8/0x130
	[   64.521922]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
	[   64.522510] RIP: 0033:0x7ff47a704a27
	[   64.522918] Code: 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 89 fa be 69 19 12 28 bf ad de e1 fe b8 a9 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 c1 43 0f 00 f7 d8 64 89 02 b8
	[   64.524412] RSP: 002b:00007ffed123b8e8 EFLAGS: 00000217 ORIG_RAX: 00000000000000a9
	[   64.525153] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007ff47a704a27
	[   64.525966] RDX: 000000004321fedc RSI: 0000000028121969 RDI: 00000000fee1dead
	[   64.526651] RBP: 000000000000000a R08: 000056492265c690 R09: 0000000000000000
	[   64.527392] R10: 0000000000000000 R11: 0000000000000217 R12: 0000000000000011
	[   64.528059] R13: 00007ffed123bca8 R14: 000056492263c28c R15: 000000000000000a
	[   64.528847]  </TASK>
	[   64.529287] Kernel Offset: disabled
	[   64.530125] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---

> 
> below?
> 
> OK, it can be multi-threaded, but still this look like we have more
> problems than just WARN_ON(irqs_disabled()).
> 
> > When pid=1 is being killed, then synchronize_group_exit() will be called
> > with irq enabled (as shown by the warning above),
> 
> Hmm. synchronize_group_exit() is called right after WARN_ON(irqs_disabled())
> you observe, WARN_ON() won't enable irqs?

That is Mateusz raised as well. We are discussing it on the other
thread. TL;DR: Is that warning wrongly placed, since IRQs will be
enabled after synchronize_group_exit()?!

Let's move this discussion to that thread, please.
