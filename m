Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C401A3172
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779289; cv=none; b=KOYNpVmd0y4pveOsppRkfUWfzZhKJ9+hbm9GZRcq6QJdChchjIbS/lK35+r179SqV32qFZS8TyRHzSC5v/CrqgCTA4ZBkEiF4Gubq7b/0GgGkyESYjW9Umk983WOU2XDRT0fy7BYJhPN20QxuRuHb5946StfwuOJqdXnTYuGWik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779289; c=relaxed/simple;
	bh=fImtVoKZcehNrFiEqXv9BQO4HeAdklV0phvEupbyixU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSyIEY1qqv48dVrRlJVf0g6qWniibk17b/CZC95jokHd3XnZRPV49wU5M490cDpcq7xgLc2xN4Ha/u7+OHox0gK1cHCh6POEDpCujellFvC12Me64puGbwktS5H3mEgyGefifLMcrsTZRcoUB/G20r9wId+DRnINwIzBtBpWFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso4188643a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779286; x=1744384086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLMN+Vmp7/jS8Kd+iF+cgoxrtw7KD3/tMYJ15Zl32iE=;
        b=MJnQr1alhavaD11Hb7uApDWhlL74pFh5+Czas42YcKYHrrnLQnxhl5LFLOFzoSkTaf
         Wz6dLX8Vy5HdBgagV2QHQZ+WIDTbswr37Lzvuj3RNnIEAErma56vqroTAtOjPMs5Zr4K
         XJ1pCooOxEgasEelsKrmlsmgxvmnxJ4jeRH4w57SSa6ZhiKeJfx3NnkD4z+MXsPBOifa
         skvJx0Hr6YszRyWBDI5QCT5lKk8kFuDizgU7qsiEfjReATUVIw0+GSWxIJynlJIochVg
         W2MBDoEluiBTciZaLAk+iDJN0S84EvX+eFeoR6N465u8qErLJFkaZl4D5DkZAoSX992w
         AZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUFbu3QSncEx5VH86bxkn5xbNEI9l/MA6EagydT3D0hABkragMfbW5RmEDO4Upl6bgIvm5NM8u9bUqgavk=@vger.kernel.org
X-Gm-Message-State: AOJu0YywaR9+65hnVKPr6BDmqizafNe6pfzDICLi7sqVGL/jPi8ZM3vE
	ab6sU0co8vNnXlpa7Ko7d9+VgKjbcewnkY7mDHEtOK/R6z5bkAsM
X-Gm-Gg: ASbGnctdybCLBxCMpR/Tfuk0025iniqFm3+uWwHaUCE/3TJoav62OzAyd+KNygbn4Cj
	jQRttVhOzFYgcTMi+qFwyDvg6j7mjnMhs1j4iFTXkI63Mvij8DVpMU+Cz4XKJiEXG+qCx06xR5u
	RFr/4FzYW4ZLPm7D8dtkC7cFwrJpMpboB4dk7D8QHrQjrp8TZALZ9E03VhDC4e7d/XB1Km8bgzJ
	QukS2TFjfbYJ3XpMuH1hfzkbxiEabYqRbDwjwkPrf/dBsNiueYumUO7AKfaC2aU/VJlVEXXUdKl
	xq0TNj+jOdfQ0Gux1y41dtdyxX+GK2eX5fxCIjzzwYdbpQ==
X-Google-Smtp-Source: AGHT+IFbvydKkVslTpEmlGcUYUqpZO2JZvKCbcC6GSOOPelIiGFprQDDo1TYT+guTEm2JbCFJrNG4w==
X-Received: by 2002:a05:6402:210c:b0:5e7:8efa:ba13 with SMTP id 4fb4d7f45d1cf-5f0b3b61098mr2884549a12.7.1743779284969;
        Fri, 04 Apr 2025 08:08:04 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a5204sm2510243a12.66.2025.04.04.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:08:04 -0700 (PDT)
Date: Fri, 4 Apr 2025 08:08:02 -0700
From: Breno Leitao <leitao@debian.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org,
	linux-kernel@vger.kernel.org, joel.granados@kernel.org,
	kernel-team@meta.com, oleg@redhat.com
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
Message-ID: <Z+/10vJb8YUVVxzg@gmail.com>
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
 <CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
 <Z+/V5AzsSqY9ALqL@gmail.com>
 <CAGudoHGYLB0GC2x3hr8aX835dQrQnJ5u0Si=Pw35=c_fjVC72A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHGYLB0GC2x3hr8aX835dQrQnJ5u0Si=Pw35=c_fjVC72A@mail.gmail.com>

On Fri, Apr 04, 2025 at 04:20:53PM +0200, Mateusz Guzik wrote:
> On Fri, Apr 4, 2025 at 2:52 PM Breno Leitao <leitao@debian.org> wrote:
> >
> > Hello Mateusz,
> >
> >
> > On Fri, Apr 04, 2025 at 07:40:45AM +0200, Mateusz Guzik wrote:
> > > On Thu, Apr 3, 2025 at 8:01 PM Breno Leitao <leitao@debian.org> wrote:
> > > >
> > > > When the system is shutting down due to pid 1 exiting, which is common
> > > > on virtual machines, a warning message is printed.
> > > >
> > > >         WARNING: CPU: 0 PID: 1 at kernel/exit.c:897 do_exit+0x7e3/0xab0
> > > >
> > > > This occurs because do_exit() is called after kernel_power_off(), which
> > > > disables interrupts. native_machine_shutdown() expliclty disable
> > > > interrupt to avoid receiving the timer interrupt, forcing scheduler load
> > > > balance during the power off phase.
> > > >
> > > > This is the simplified code path:
> > > >
> > > >         kernel_power_off()
> > > >           - native_machine_shutdown()
> > > >                 - local_irq_disable()
> > > >         do_exit()
> > > >
> > > > Modify the warning condition in do_exit() to only trigger the warning if
> > > > the system is not powering off, since it is expected to have the irq
> > > > disabled in that case.
> > > >
> > > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > > ---
> > > >  kernel/exit.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/kernel/exit.c b/kernel/exit.c
> > > > index 3485e5fc499e4..97ec4f8bfd98f 100644
> > > > --- a/kernel/exit.c
> > > > +++ b/kernel/exit.c
> > > > @@ -878,7 +878,7 @@ void __noreturn do_exit(long code)
> > > >         struct task_struct *tsk = current;
> > > >         int group_dead;
> > > >
> > > > -       WARN_ON(irqs_disabled());
> > > > +       WARN_ON(irqs_disabled() && system_state != SYSTEM_POWER_OFF);
> > > >
> > > >         synchronize_group_exit(tsk, code);
> > > >
> > > >
> > >
> > > Can you share the backtrace?
> >
> > Sure. Here is the decoded stack from the the latest net-next
> > 0907e7fb35756  ("Add linux-next specific files for 20250117")
> >
> >         [  254.466712] ACPI: PM: Preparing to enter system sleep state S5
> >         [  254.474273] reboot: Power down
> >         [  254.479332] ------------[ cut here ]------------
> >         [  254.479934] WARNING: CPU: 0 PID: 1 at kernel/exit.c:881 do_exit (kernel/exit.c:881)
> >         [  254.480597] Modules linked in: evdev(E) serio_raw(E) button(E) virtio_mmio(E) 9pnet_virtio(E) 9p(E) 9pnet(E) netfs(E)
> >         [  254.483163] Tainted: [E]=UNSIGNED_MODULE, [N]=TEST
> >         [  254.483736] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> >         [  254.484912] RIP: 0010:do_exit (kernel/exit.c:881)
> >         [ 254.485348] Code: 00 00 45 31 f6 f7 c3 00 02 00 00 41 0f 94 c6 48 c7 c7 48 8b 5d 87 44 89 f6 31 d2 31 c9 e8 c8 c5 41 00 f7 c3 00 02 00 00 75 02 <0f> 0b 48 c7 c7 78 8b 5d 87 44 89 f6 31 d2 31 c9 e8 ab c5 41 00 48
> >         All code
> >         ========
> >         0:   00 00                   add    %al,(%rax)
> >         2:   45 31 f6                xor    %r14d,%r14d
> >         5:   f7 c3 00 02 00 00       test   $0x200,%ebx
> >         b:   41 0f 94 c6             sete   %r14b
> >         f:   48 c7 c7 48 8b 5d 87    mov    $0xffffffff875d8b48,%rdi
> >         16:   44 89 f6                mov    %r14d,%esi
> >         19:   31 d2                   xor    %edx,%edx
> >         1b:   31 c9                   xor    %ecx,%ecx
> >         1d:   e8 c8 c5 41 00          call   0x41c5ea
> >         22:   f7 c3 00 02 00 00       test   $0x200,%ebx
> >         28:   75 02                   jne    0x2c
> >         2a:*  0f 0b                   ud2             <-- trapping instruction
> >         2c:   48 c7 c7 78 8b 5d 87    mov    $0xffffffff875d8b78,%rdi
> >         33:   44 89 f6                mov    %r14d,%esi
> >         36:   31 d2                   xor    %edx,%edx
> >         38:   31 c9                   xor    %ecx,%ecx
> >         3a:   e8 ab c5 41 00          call   0x41c5ea
> >         3f:   48                      rex.W
> >
> >         Code starting with the faulting instruction
> >         ===========================================
> >         0:   0f 0b                   ud2
> >         2:   48 c7 c7 78 8b 5d 87    mov    $0xffffffff875d8b78,%rdi
> >         9:   44 89 f6                mov    %r14d,%esi
> >         c:   31 d2                   xor    %edx,%edx
> >         e:   31 c9                   xor    %ecx,%ecx
> >         10:   e8 ab c5 41 00          call   0x41c5c0
> >         15:   48                      rex.W
> >         [  254.487377] RSP: 0018:ffa000000001fb80 EFLAGS: 00010046
> >         [  254.487947] RAX: 49739800a6a6bf00 RBX: 0000000000000016 RCX: 0000000000000000
> >         [  254.488735] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff875d8b48
> >         [  254.489545] RBP: ffa000000001fd10 R08: dffffc0000000000 R09: 1ffffffff13312b6
> >         [  254.490406] R10: dffffc0000000000 R11: fffffbfff13312b7 R12: 000000004321fedc
> >         [  254.491330] R13: dffffc0000000000 R14: 0000000000000001 R15: dffffc0000000000
> >         [  254.492200] FS:  00007f658bad6780(0000) GS:ff110004c6000000(0000) knlGS:0000000000000000
> >         [  254.493005] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >         [  254.493667] CR2: 00007f7769811000 CR3: 000000010eebe004 CR4: 0000000000771ef0
> >         [  254.494555] PKRU: 55555554
> >         [  254.495006] Call Trace:
> >         [  254.495305]  <TASK>
> >         [  254.495609] ? __warn (kernel/panic.c:242 kernel/panic.c:748)
> >         [  254.496046] ? do_exit (kernel/exit.c:881)
> >         [  254.496675] ? do_exit (kernel/exit.c:881)
> >         [  254.497124] ? report_bug (lib/bug.c:? lib/bug.c:219)
> >         [  254.497564] ? handle_bug (arch/x86/kernel/traps.c:285)
> >         [  254.497984] ? exc_invalid_op (arch/x86/kernel/traps.c:309)
> >         [  254.498394] ? asm_exc_invalid_op (./arch/x86/include/asm/idtentry.h:621)
> >         [  254.498874] ? do_exit (kernel/exit.c:881)
> >         [  254.499355] ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:182)
> >         [  254.499892] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:445)
> >         [  254.500311] ? atomic_notifier_call_chain (./include/linux/rcupdate.h:337 ./include/linux/rcupdate.h:849 kernel/notifier.c:222)
> >         [  254.500864] ? __pfx_do_exit (kernel/exit.c:877)
> >         [  254.501302] ? __pfx_ftrace_likely_update (kernel/trace/trace_branch.c:203)
> >         [  254.501825] ? native_machine_shutdown (arch/x86/kernel/reboot.c:765)
> >         [  254.502380] ? atomic_notifier_call_chain (./include/linux/rcupdate.h:337 ./include/linux/rcupdate.h:849 kernel/notifier.c:222)
> >         [  254.502984] __x64_sys_reboot (kernel/reboot.c:?)
> >         [  254.503407] ? __pfx___x64_sys_reboot (kernel/reboot.c:722)
> >         [  254.503952] ? __pfx_ftrace_likely_update (kernel/trace/trace_branch.c:203)
> >         [  254.504527] ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:182)
> >         [  254.505067] ? __pfx_ftrace_likely_update (kernel/trace/trace_branch.c:203)
> >         [  254.505599] ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:182)
> >         [  254.506159] ? __pfx_ftrace_likely_update (kernel/trace/trace_branch.c:203)
> >         [  254.506712] ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:182)
> >         [  254.507263] ? do_syscall_64 (./arch/x86/include/asm/irqflags.h:42 ./arch/x86/include/asm/irqflags.h:97 ./include/linux/entry-common.h:198 arch/x86/entry/common.c:79)
> >         [  254.507865] do_syscall_64 (arch/x86/entry/common.c:83)
> >         [  254.508317] ? exc_page_fault (arch/x86/mm/fault.c:1542)
> >         [  254.508781] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> >         [  254.509315] RIP: 0033:0x7f658b904a27
> >         [ 254.509879] Code: 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 89 fa be 69 19 12 28 bf ad de e1 fe b8 a9 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 c1 43 0f 00 f7 d8 64 89 02 b8
> >         All code
> >         ========
> >         0:   64 89 01                mov    %eax,%fs:(%rcx)
> >         3:   48 83 c8 ff             or     $0xffffffffffffffff,%rax
> >         7:   c3                      ret
> >         8:   66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
> >         f:   00 00 00
> >         12:   90                      nop
> >         13:   f3 0f 1e fa             endbr64
> >         17:   89 fa                   mov    %edi,%edx
> >         19:   be 69 19 12 28          mov    $0x28121969,%esi
> >         1e:   bf ad de e1 fe          mov    $0xfee1dead,%edi
> >         23:   b8 a9 00 00 00          mov    $0xa9,%eax
> >         28:   0f 05                   syscall
> >         2a:*  48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax         <-- trapping instruction
> >         30:   77 01                   ja     0x33
> >         32:   c3                      ret
> >         33:   48 8b 15 c1 43 0f 00    mov    0xf43c1(%rip),%rdx        # 0xf43fb
> >         3a:   f7 d8                   neg    %eax
> >         3c:   64 89 02                mov    %eax,%fs:(%rdx)
> >         3f:   b8                      .byte 0xb8
> >
> >         Code starting with the faulting instruction
> >         ===========================================
> >         0:   48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax
> >         6:   77 01                   ja     0x9
> >         8:   c3                      ret
> >         9:   48 8b 15 c1 43 0f 00    mov    0xf43c1(%rip),%rdx        # 0xf43d1
> >         10:   f7 d8                   neg    %eax
> >         12:   64 89 02                mov    %eax,%fs:(%rdx)
> >         15:   b8                      .byte 0xb8
> >         [  254.511720] RSP: 002b:00007ffec6b608c8 EFLAGS: 00000217 ORIG_RAX: 00000000000000a9
> >         [  254.512535] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f658b904a27
> >         [  254.513332] RDX: 000000004321fedc RSI: 0000000028121969 RDI: 00000000fee1dead
> >         [  254.514243] RBP: 000000000000000a R08: 000055b7f5e58690 R09: 0000000000000000
> >         [  254.515058] R10: 0000000000000000 R11: 0000000000000217 R12: 0000000000000011
> >         [  254.515833] R13: 00007ffec6b60c88 R14: 000055b7f5e3828c R15: 000000000000000a
> >         [  254.516702]  </TASK>
> >         [  254.517021] irq event stamp: 1438412
> >         [  254.517510] hardirqs last enabled at (1438411): _raw_spin_unlock_irqrestore (./arch/x86/include/asm/irqflags.h:26 ./arch/x86/include/asm/irqflags.h:87 ./arch/x86/include/asm/irqflags.h:147 ./include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> >         [  254.518554] hardirqs last disabled at (1438412): native_machine_shutdown (arch/x86/kernel/reboot.c:?)
> >         [  254.519466] softirqs last enabled at (1438324): handle_softirqs (./arch/x86/include/asm/preempt.h:26 kernel/softirq.c:408 kernel/softirq.c:589)
> >         [  254.520398] softirqs last disabled at (1438303): __irq_exit_rcu (./arch/x86/include/asm/jump_label.h:36 kernel/softirq.c:664)
> >
> >
> > > Note first thing synchronize_group_exit() is going to do is cycle
> > > through an irq-protected lock, so by the time it unlocks irqs are
> > > enabled again.
> >
> > When pid=1 is being killed, then synchronize_group_exit() will be called
> > with irq enabled (as shown by the warning above), and
> > synchronize_group_exit()->spin_unlock_irq() will restore the interrupt
> > (once it got disabled in spin_lock_irq() pair).
> >
> > On the other side, if irqs are disabled when synchronize_group_exit() is
> > called, then synchronize_group_exit->spin_unlock_irq() will not enable
> > the interrupts, right?
> 
> It will enable interrupts. spin_lock_irq() blindly disables them, but
> in your case they are already off and this bit is a nop.
> spin_unlock_irq() blindly enables them and this is where they are back
> regardless of the initial state.
> 
> Thus even with the buggy caller interrupts are enabled after
> synchronize_group_exit() returns.

In fact this WARN_ON(irqs_disabled()); doesn't mean much, since it
doesn't matter what is the interrupt state just before
synchronize_group_exit, becaue it will disabled it, and enable it
anyway.

That means that WARN_ON() is useless(!?)

> I think this is the only reason there are no further warnings about
> the state when proceeding with exit.
> 
> Preferably this would be fixed so that nobody calls here with irqs off.

Does it really matter what is the interrupt state when calling do_exit()
since it will be enabled anyway?

Thanks!
--breno
