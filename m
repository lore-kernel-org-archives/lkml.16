Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB52367DD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389074; cv=none; b=HcUDuzrQIE/ixuzmSLPgVvFH1u2OcjSwOYC4eslfLefowf7/JqDRTuerdKUQ+AvMDj+WvIGZhlvomIY9XX8TYfIaZUXccsHpteVMr2Zvb+86LpwhO+/QtXnMj5GDugGIl5UR4fVLBqG08MxWB/hArAu8yp1Ge3JdIvSfqwkDOtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389074; c=relaxed/simple;
	bh=JdMyPZWLKjIDO+6gO+hsOC52rpVnrI+wafADCdw3KfA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e/ZRXNbIDs4BVW4E1C/B911xaMVOA8wEeCehbSiSfQJF15iUswdnoQZ9irRayt42STqWH/pTiyV8Ui2tTbnB+xcKQSDTQ7Bs7DM5YJZXgaafWcpq2zF/g61q/EfyQRNV1vr2uoL0xosShc+oJKmdmMKjKal3zP/mSXg+Vegdw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sKzfHUnQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sKzfHUnQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-223fd6e9408so21380855ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744389072; x=1744993872; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9N1EqoNjnsOKUmYGxkB1iC5YpiDpL0Ua1f0JxAYa68=;
        b=sKzfHUnQVlrvIPGNvo4BBlDkCrP1ypUh7I2aJ8el/VvrRWRzQeFd+UYe0XkeiG+EIC
         txlvV91kW07K4+BA5ayCjQcJx5Xz1uB4xb+2DBK/hElnSx5e5YzO+vIgApEHkrPlSv4x
         7hHZxVUDPAyZ7vdKPjDNgd0jRfrKymcIDrBKMd5eHBIGPF9k8pIjueKvR7dLuxoPlZa4
         y8eFDbC9isODPJ4qukwEof2I/+ewS8x2rFgQEjasEoO8rYNtAxX7MbTGEtKf+4qLGDJW
         ARSo0Q6J2hrV+9du6C8j8RmCs3GNCWDZ8TO3jrc7H3nCdMGK2kbka43LUkeimKfdsGjn
         fJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744389072; x=1744993872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9N1EqoNjnsOKUmYGxkB1iC5YpiDpL0Ua1f0JxAYa68=;
        b=f9TngOfG1UUDRguewvgsIzrIwUky2BFlecHNwf2kBd9jYf3vKqtqs02HtxYmaORBYk
         x/EEoJK1Wy/kZrAm10dd/oyfeVR6aITFjCdT48IvdTLtVPqmkBnuflmxeUJrMgaQ+RnX
         ryRRKdRQL2CKLeh/j4kL+0BW7O+T1DJ8X25842eeL+yAU849Uu1Gira/OiJAm8TlGSXL
         DywnK2SOd0bhNWlP9GaY78q87SYZzJuxI5T98IZWZfPw3a1lVXQEylqci+F9FOdZY0LS
         R7lIRTYFICFSyJlY9olHpEpfCLwgRWUgb98Q/I0dvSQGpTqArmb0dr2DYQsmCOR3+v4W
         NwPg==
X-Forwarded-Encrypted: i=1; AJvYcCWinN20bTcshFcwrrXJMQJMLnsYo9mtkc7+j0E3+z5o/Hg1OjN8ZNfbZpA4d4MeqZDr0bO/U72GVmcyq50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhr2F8UsSTRSpXz4lpIhMJNvUKr64fUZgjMWHau8V9NcvAI6OG
	mhZQmoqINoY2JsfKS7KjYLSTEdtY5MTRb+eRkzAlORXqN4/Nb5oHcfFvIyQD/WSKvSQmwVMnPgw
	yzw==
X-Google-Smtp-Source: AGHT+IFYLLFJmQ/FvVwKAA95MRGJg6hfd10yKQkY3IR5RLagRcfuY9cHIduK6deIm0ZRBPVcTFY8LESUWtQ=
X-Received: from pldy12.prod.google.com ([2002:a17:902:cacc:b0:226:453a:f2db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ab0:b0:224:3610:bef4
 with SMTP id d9443c01a7336-22b7f9221a9mr119481065ad.25.1744389072673; Fri, 11
 Apr 2025 09:31:12 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:31:11 -0700
In-Reply-To: <Z_khOuvPGEWBAQbp@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250326151204.67898-1-carlos.bilbao@kernel.org>
 <20250326151204.67898-2-carlos.bilbao@kernel.org> <Z_khOuvPGEWBAQbp@pathway.suse.cz>
Message-ID: <Z_lDzyXJ8JKqOyzs@google.com>
Subject: Re: [PATCH 1/2] panic: Allow archs to reduce CPU consumption after panic
From: Sean Christopherson <seanjc@google.com>
To: Petr Mladek <pmladek@suse.com>
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, bilbao@vt.edu, 
	akpm@linux-foundation.org, jan.glauber@gmail.com, jani.nikula@intel.com, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	takakura@valinux.co.jp, john.ogness@linutronix.de, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 11, 2025, Petr Mladek wrote:
> Added Linus and Jiri (tty) into Cc.
> 
> On Wed 2025-03-26 10:12:03, carlos.bilbao@kernel.org wrote:
> > From: Carlos Bilbao <carlos.bilbao@kernel.org>
> > 
> > After handling a panic, the kernel enters a busy-wait loop, unnecessarily
> > consuming CPU and potentially impacting other workloads including other
> > guest VMs in the case of virtualized setups.

Impacting other guests isn't the guest kernel's problem.  If the host has heavily
overcommited CPUs and can't meet SLOs because VMs are panicking and not rebooting,
that's a host problem.

This could become a customer problem if they're getting billed based on CPU usage,
but I don't know that simply doing HLT is the best solution.  E.g. advising the
customer to configure their kernels to kexec into a kdump kernel or to reboot
on panic, seems like it would provide a better overall experience for most.

QEMU (assuming y'all use QEMU) also supports a pvpanic device, so unless the VM
and/or customer is using a funky setup, the host should already know the guest
has panicked.  At that point, the host can make appropiate scheduling decisions,
e.g. userspace can simply stop running the VM after a certain timeout, throttle
it, jail it, etc.

> > Introduce cpu_halt_after_panic(), a weak function that archs can override
> > for a more efficient halt of CPU work. By default, it preserves the
> > pre-existing behavior of delay.
> >
> > Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> > Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
> > ---
> >  kernel/panic.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index fbc59b3b64d0..fafe3fa22533 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -276,6 +276,16 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
> >  		crash_smp_send_stop();
> >  }
> >  
> > +/*
> > + * Called after a kernel panic has been handled, at which stage halting
> > + * the CPU can help reduce unnecessary CPU consumption. In the absence of
> > + * arch-specific implementations, just delay
> > + */
> > +static void __weak cpu_halt_after_panic(void)
> > +{
> > +	mdelay(PANIC_TIMER_STEP);
> > +}
> > +
> >  /**
> >   *	panic - halt the system
> >   *	@fmt: The text string to print
> > @@ -474,7 +484,7 @@ void panic(const char *fmt, ...)
> >  			i += panic_blink(state ^= 1);
> >  			i_next = i + 3600 / PANIC_BLINK_SPD;
> >  		}
> > -		mdelay(PANIC_TIMER_STEP);
> > +		cpu_halt_after_panic();
> 
> The 2nd patch implements this functions using safe_halt().
> 
> IMHO, it makes perfect sense to halt a virtualized system or

I really, really don't want to arbitrarily single out VMs, especially in core
kernel code, as doing so risks creating problems that are unique to VMs.  If the
behavior is based on a virtualization-agnostic heuristic like "no console", then
by all means, but please don't condition something like this purely based on
running in a VM.

I also have no objection to the host/hypervisor prescribing specific behavior
(see below).  What I don't like is the kernel deciding to do things differently
because it's a VM, without any knowledge of the environment in which the VM is
running.

> a system without a registered "graphical" console.
>
> I think that the blinking diods were designed for desktops
> and laptops with some "graphical" terminal attached. The
> infinite loop allows to read the last lines, ideally
> the backtrace on the screen.
> 
> I wonder if we could make it more clever and do the halt
> only when the system is virtualized or when there is no
> "graphical" console registered.

Could we do something with panic_notifier_list?  E.g. let panic devices override
the default post-print behavior.  Then VMs with a paravirt panic interface could
make an explicit call out to the host instead of relying on arch specific code
to HLT and hope for the best.  And maybe console drivers that want/need to keep
the CPU running can nullify panic_halt?

E.g. with a rudimentary priority system so that paravirt devices can override
everything else.

diff --git a/kernel/panic.c b/kernel/panic.c
index d8635d5cecb2..fe9007222308 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -141,6 +141,18 @@ static long no_blink(int state)
 long (*panic_blink)(int state);
 EXPORT_SYMBOL(panic_blink);
 
+static void (*panic_halt)(void) = cpu_halt_after_panic;
+static int panic_hlt_priority;
+
+void panic_set_hlt(void (*fn)(void), int priority)
+{
+       if (priority <= panic_hlt_priority)
+               return;
+
+       panic_halt = fn;
+}
+EXPORT_SYMBOL_GPL(panic_set_hlt);
+
 /*
  * Stop ourself in panic -- architecture code may override this
  */
@@ -467,6 +479,9 @@ void panic(const char *fmt, ...)
        console_flush_on_panic(CONSOLE_FLUSH_PENDING);
        nbcon_atomic_flush_unsafe();
 
+       if (panic_halt)
+               panic_halt();
+
        local_irq_enable();
        for (i = 0; ; i += PANIC_TIMER_STEP) {
                touch_softlockup_watchdog();

