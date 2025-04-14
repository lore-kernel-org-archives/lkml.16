Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762CC190679
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624932; cv=none; b=lVz8RhxTuQdMpthVp3thb0Ybik4bj/Fnx5MiX0zwRHDCghqxF83uao+bDnmiLzfVx2wenE5k7E824m82edT6CBIgl01+oXtEac169HmHKTIYb/N5chDyffI1qY8kYG5HLxgdFCUEVH0M1SEIrzEV8U990lA4wDlWUL7IceMB4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624932; c=relaxed/simple;
	bh=lcK7X3iQv+Zne8itAS1kzk3u5ScenaZMxxqxFlK+we8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTLHjmt3YFfXSQKWTTN4vyMbIjWIGv/2NaX0NZ2W0j0evgIkRKN7cOsqk1YUNTop1hA4EnZD8nkqmdpiK0TpX5L0sVoHAyp5M1mN56B3qR1kYF5qpiVGCslL3p+ucQduKvjpCoXXR+OnoaNN4NPPaRAojTnYbSye87JXQksb2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIOj2QQI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIOj2QQI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3965c995151so1828223f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744624928; x=1745229728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4ZKeoonsQzsWasVmGrcgrBTCvUnJhFoTJL6BLuQVFU=;
        b=FIOj2QQIWXr0iieIcR4G30PIWgoV7QG9fdozefNduz6m1iR04NZ91JuRbIpovk4oLC
         8qgFVsC21p9cPJDhZ+wKfYwzPMnNAp5ppSOqJK+4WFqyFoqkN2FOYEYlFbuDLTzrXTIi
         iU02Rruvo0GpNjG4+f4mY/iyTHS5fa2PjzQe1usuOJ3w6SP761hXtQ5XOUYLTOJX4kk+
         LCFoEaYRrFgye/znhVOjeOf44kGdBlAaUsd0J53A+fHZ54H8krFXgZwPjH7Lxw6dJHzz
         oL4Prft9w1Te8A6YO9yeR2YUt+BInfhDoySCmdjJfDPI4UXlXzAS6ShDrYHqBEvpt/aG
         OqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624928; x=1745229728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4ZKeoonsQzsWasVmGrcgrBTCvUnJhFoTJL6BLuQVFU=;
        b=R/aM7lCBtkP1K9cyldW8ojyTh3U8gCBiYCCZv6bBGJpQe2/yoYsub1q+yPyo8phVuh
         OoGbgdfQDCRHgShQ6A55J+Xdk/x9D9Q2UMShwF/og3t0LDmYz+fYwEY9dtMFIGZ0IYem
         GVyen05jdbZEizPS6MLMRobHW/afj4kvNR/0DfBk++WP09taFqqI8Ux0Knon0krVVbKl
         7k+/TotGSBkU2xJmHY+RZX4R5EbRYFvydvgIqQXwpGNvymsqWQditVI3ZwUKXqVqUSOE
         +uJEAfFYCsqSyyutA3nmAnL7ITnqXdymrWBEtu1xWDTr+E6NpEUu5fZ4JCWCTqD/KBY1
         sNdA==
X-Forwarded-Encrypted: i=1; AJvYcCVtPNWKpsaY5HMnmk6B3KaEh5FrJX6aAzc4jksOO5KNKoAfba6oPxwtN6OkWl7bPAljLeb8IDNahpjVZ4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9UtbitMSb3Of1Vf3FEWMhrhzWLVwNGN1wWNq83Ba8XzjTb2N
	MnTHy4C+pIva3ddVDrHsZ4ofq9esCy1cltRE5rTDcT4UOVoePRGQ
X-Gm-Gg: ASbGncu+VVDDvga6kw+tpF8kNIq61xURQyZZtPSZoyBzulDd6ls9Umipd5aU36470XH
	VV8k3ynspPWYdcXWq2En6PVpH3Da0/8XS29oxwGpOSVroxVIWUnNrrC5T3ddz7tMZoow+iRElSc
	JKf65CGRE0dju6ZOBDuL05AklN4rkwxtJT+Ad7SRa6v4ew2dB6CxuOGGK7WiOgRoU9UE5k+eV3E
	5+WtumL0aPyrux2mKXklklYJ2srhaR/TJ62HuKcafE8K6+j5ymAblnMFYIsBjRkBL7Hcx4BliZG
	lJfgQq8BsPSqVq3wPSh/fCjpGWB+OHqSoBoL4RYkbnijZmKDLytTo9fxUijoTBBjFm84fMEDJSd
	MGcRYFMtX9Q==
X-Google-Smtp-Source: AGHT+IFbBxLE++THY8ROhquoXOANvcm/rSABNsNRiAUR39w2OT4ynLUupTNZmW0NhuczP4AfA2t7Ow==
X-Received: by 2002:a05:6000:18a2:b0:39c:1258:7e18 with SMTP id ffacd0b85a97d-39eaaec7d0amr8689950f8f.57.1744624927197;
        Mon, 14 Apr 2025 03:02:07 -0700 (PDT)
Received: from ika2 (ip-091-089-044-011.um28.pools.vodafone-ip.de. [91.89.44.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb43sm10603339f8f.65.2025.04.14.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:02:06 -0700 (PDT)
From: Jan Glauber <jan.glauber@gmail.com>
X-Google-Original-From: Jan Glauber <jglauber@digitalocean.com>
Date: Mon, 14 Apr 2025 12:02:04 +0200
To: Sean Christopherson <seanjc@google.com>
Cc: Petr Mladek <pmladek@suse.com>, carlos.bilbao@kernel.org,
	tglx@linutronix.de, bilbao@vt.edu, akpm@linux-foundation.org,
	jan.glauber@gmail.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	takakura@valinux.co.jp, john.ogness@linutronix.de,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 1/2] panic: Allow archs to reduce CPU consumption after
 panic
Message-ID: <b39ba05d-7c40-45ce-bb26-1021d292b82f@ika.local>
References: <20250326151204.67898-1-carlos.bilbao@kernel.org>
 <20250326151204.67898-2-carlos.bilbao@kernel.org>
 <Z_khOuvPGEWBAQbp@pathway.suse.cz>
 <Z_lDzyXJ8JKqOyzs@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_lDzyXJ8JKqOyzs@google.com>

On Fri, Apr 11, 2025 at 09:31:11AM -0700, Sean Christopherson wrote:
> On Fri, Apr 11, 2025, Petr Mladek wrote:
> > Added Linus and Jiri (tty) into Cc.
> > 
> > On Wed 2025-03-26 10:12:03, carlos.bilbao@kernel.org wrote:
> > > From: Carlos Bilbao <carlos.bilbao@kernel.org>
> > > 
> > > After handling a panic, the kernel enters a busy-wait loop, unnecessarily
> > > consuming CPU and potentially impacting other workloads including other
> > > guest VMs in the case of virtualized setups.
> 
> Impacting other guests isn't the guest kernel's problem.  If the host has heavily
> overcommited CPUs and can't meet SLOs because VMs are panicking and not rebooting,
> that's a host problem.

Agreed, and it might be worth having the host detect panics.

> This could become a customer problem if they're getting billed based on CPU usage,
> but I don't know that simply doing HLT is the best solution.  E.g. advising the
> customer to configure their kernels to kexec into a kdump kernel or to reboot
> on panic, seems like it would provide a better overall experience for most.

Reboot on panic would probably make most sense. But this is not about
the lack of configuration options or possibilites to deal with paniced
guests. This is plainly about the default option that we set. And
while there are good alternatives, most people or setups will just stick
to the defaults in my experience.

So is a busy loop for panicked virtual guest the default that we want to set or
can we change that case to something more sensible?

> QEMU (assuming y'all use QEMU) also supports a pvpanic device, so unless the VM
> and/or customer is using a funky setup, the host should already know the guest
> has panicked.  At that point, the host can make appropiate scheduling decisions,
> e.g. userspace can simply stop running the VM after a certain timeout, throttle
> it, jail it, etc.

pvpanic is the right solution, but again this is an external solution
that requires additional setup.

--Jan

> > > Introduce cpu_halt_after_panic(), a weak function that archs can override
> > > for a more efficient halt of CPU work. By default, it preserves the
> > > pre-existing behavior of delay.
> > >
> > > Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> > > Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
> > > ---
> > >  kernel/panic.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/panic.c b/kernel/panic.c
> > > index fbc59b3b64d0..fafe3fa22533 100644
> > > --- a/kernel/panic.c
> > > +++ b/kernel/panic.c
> > > @@ -276,6 +276,16 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
> > >  		crash_smp_send_stop();
> > >  }
> > >  
> > > +/*
> > > + * Called after a kernel panic has been handled, at which stage halting
> > > + * the CPU can help reduce unnecessary CPU consumption. In the absence of
> > > + * arch-specific implementations, just delay
> > > + */
> > > +static void __weak cpu_halt_after_panic(void)
> > > +{
> > > +	mdelay(PANIC_TIMER_STEP);
> > > +}
> > > +
> > >  /**
> > >   *	panic - halt the system
> > >   *	@fmt: The text string to print
> > > @@ -474,7 +484,7 @@ void panic(const char *fmt, ...)
> > >  			i += panic_blink(state ^= 1);
> > >  			i_next = i + 3600 / PANIC_BLINK_SPD;
> > >  		}
> > > -		mdelay(PANIC_TIMER_STEP);
> > > +		cpu_halt_after_panic();
> > 
> > The 2nd patch implements this functions using safe_halt().
> > 
> > IMHO, it makes perfect sense to halt a virtualized system or
> 
> I really, really don't want to arbitrarily single out VMs, especially in core
> kernel code, as doing so risks creating problems that are unique to VMs.  If the
> behavior is based on a virtualization-agnostic heuristic like "no console", then
> by all means, but please don't condition something like this purely based on
> running in a VM.
> 
> I also have no objection to the host/hypervisor prescribing specific behavior
> (see below).  What I don't like is the kernel deciding to do things differently
> because it's a VM, without any knowledge of the environment in which the VM is
> running.
> 
> > a system without a registered "graphical" console.
> >
> > I think that the blinking diods were designed for desktops
> > and laptops with some "graphical" terminal attached. The
> > infinite loop allows to read the last lines, ideally
> > the backtrace on the screen.
> > 
> > I wonder if we could make it more clever and do the halt
> > only when the system is virtualized or when there is no
> > "graphical" console registered.
> 
> Could we do something with panic_notifier_list?  E.g. let panic devices override
> the default post-print behavior.  Then VMs with a paravirt panic interface could
> make an explicit call out to the host instead of relying on arch specific code
> to HLT and hope for the best.  And maybe console drivers that want/need to keep
> the CPU running can nullify panic_halt?
> 
> E.g. with a rudimentary priority system so that paravirt devices can override
> everything else.
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index d8635d5cecb2..fe9007222308 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -141,6 +141,18 @@ static long no_blink(int state)
>  long (*panic_blink)(int state);
>  EXPORT_SYMBOL(panic_blink);
>  
> +static void (*panic_halt)(void) = cpu_halt_after_panic;
> +static int panic_hlt_priority;
> +
> +void panic_set_hlt(void (*fn)(void), int priority)
> +{
> +       if (priority <= panic_hlt_priority)
> +               return;
> +
> +       panic_halt = fn;
> +}
> +EXPORT_SYMBOL_GPL(panic_set_hlt);
> +
>  /*
>   * Stop ourself in panic -- architecture code may override this
>   */
> @@ -467,6 +479,9 @@ void panic(const char *fmt, ...)
>         console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>         nbcon_atomic_flush_unsafe();
>  
> +       if (panic_halt)
> +               panic_halt();
> +
>         local_irq_enable();
>         for (i = 0; ; i += PANIC_TIMER_STEP) {
>                 touch_softlockup_watchdog();
> 
