Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF60539A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653782; cv=none; b=p9DTwFfadphKId1ceWxiPeQ1S1k24AVW/U8x1XmcTkdzGWnFU+2S09L02TEaqqOxOwVc3RAVxpFi7WEU/WZhmdLnVdypVwGr2u3ISaUtewV5sZaxJytqSHXM343/IL8b/mGVPROC15M971kq/dkI7c93ktKUH7a7gob/IJfryPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653782; c=relaxed/simple;
	bh=KZLZm38fvN7eoFZ7AVti9iLhoYnoSNpOttdP4s28SGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YkVTaoR1mk8Po7uB0YLHxDtVxLY4ay+Mx4m2JAwFpHHNVjJCuXZR2PT8+soBo9+IuCR4GiFo+UGBBjylLDUohlcsXWtb5N5FPSqVm7QZ66Jmi82XOC2L6vI7Gego0VziD5tGyJ9cRpCrABrwRfFl8/NcxRWvERQv8hB+dpVLLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kX5sbQsn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AwUh6FRP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kX5sbQsn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AwUh6FRP"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744653778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQqudjAlTHduY4Y4lsejGgZN+jnS3ffTjfYPiImdjK8=;
	b=kX5sbQsnGqQjYwhXNWSaLaFrUx5lZfl9GcoHnVRMgqVUSMQpbRXOPX8x1IIfdchV95ALuJ
	LduhJaRM3OoPSPg0/7Tu/j4ILsU5KJK0r8/pAhjTxy3EX3gR6YGNfsymJjlS+RSBrrsQYF
	iXbqhWtWUwF4WnWLJMj5qSwjrGtVL5lT3dPEby39dEheF4TayP+f7E7kMHPqsJie4iqiVw
	J/qtsCRtqxaenTTE6E41KoddeLKxHo185d84hfn97AGno2zoh7p2bETwMqvmES8cmXpAWO
	Hm1+UgV+psWPqL+ZNNYZyehQBsBX+mPRkVWSpGW+ww6l1Y/cygmhYXNd8UqMQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744653778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQqudjAlTHduY4Y4lsejGgZN+jnS3ffTjfYPiImdjK8=;
	b=AwUh6FRPoc+Kd0Doc70kww1SEms7JIeE2waKcZVJKL7vhimI6GRs9TwdXT6cMxNyUce7QO
	KRFMr1MrY1WsobDQ==
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>, "H . Peter Anvin"
 <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Anil
 Gurumurthy <anil.gurumurthy@qlogic.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Sudarsana Kalluru
 <sudarsana.kalluru@qlogic.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
In-Reply-To: <20250414102301.332225-3-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
 <20250414102301.332225-3-mingo@kernel.org>
Date: Mon, 14 Apr 2025 20:02:57 +0200
Message-ID: <87lds2sjse.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 14 2025 at 12:22, Ingo Molnar wrote:

> We'd like to introduce timer_mod() in the kernel, so make
> sure the namespace is clear.

Interesting.

>  arch/arm/mach-omap1/pm.c                         |  2 +-
>  arch/arm/mach-s3c/s3c64xx.c                      |  4 +--
>  arch/arm/mach-s3c/s3c64xx.h                      |  6 ++---
>  arch/x86/kvm/cpuid.c                             |  4 +--
>  arch/x86/kvm/lapic.c                             | 18 ++++++-------
>  arch/x86/kvm/lapic.h                             |  4 +--
>  drivers/clocksource/timer-ti-32k.c               |  4 +--
>  drivers/clocksource/timer-ti-dm.c                |  6 ++---
>  drivers/comedi/drivers/addi_apci_3120.c          | 20 +++++++-------
>  drivers/comedi/drivers/addi_apci_3501.c          |  2 +-
>  drivers/counter/rz-mtu3-cnt.c                    | 16 +++++------
>  drivers/fpga/dfl-n3000-nios.c                    | 20 +++++++-------
>  drivers/gpu/drm/msm/msm_drv.h                    |  4 +--
>  drivers/gpu/drm/msm/msm_io_utils.c               |  4 +--
>  drivers/leds/leds-netxbig.c                      |  4 +--
>  drivers/scsi/bfa/bfa.h                           |  2 +-
>  drivers/scsi/bfa/bfa_core.c                      |  4 +--
>  drivers/scsi/bfa/bfa_ioc.c                       | 20 +++++++-------
>  drivers/scsi/bfa/bfa_ioc.h                       | 10 +++----
>  drivers/scsi/bfa/bfa_modules.h                   |  2 +-
>  drivers/scsi/bfa/bfad.c                          |  2 +-
>  fs/timerfd.c                                     |  2 +-
>  include/clocksource/timer-ti-dm.h                |  2 +-
>  include/linux/hrtimer.h                          | 24 ++++++++---------
>  include/linux/torture.h                          |  2 +-
>  include/trace/events/rxrpc.h                     | 16 +++++------
>  include/trace/events/timer.h                     | 14 +++++-----
>  io_uring/rw.c                                    |  2 +-
>  io_uring/timeout.c                               |  8 +++---
>  io_uring/timeout.h                               |  2 +-
>  kernel/bpf/helpers.c                             |  2 +-
>  kernel/time/hrtimer.c                            | 34 ++++++++++++------------
>  kernel/time/posix-timers.c                       |  2 +-
>  kernel/time/sleep_timeout.c                      |  6 ++---
>  kernel/torture.c                                 |  2 +-
>  net/rxrpc/ar-internal.h                          |  4 +--
>  net/rxrpc/call_event.c                           |  2 +-
>  net/rxrpc/input.c                                |  4 +--
>  net/rxrpc/input_rack.c                           | 10 +++----
>  net/rxrpc/output.c                               |  2 +-
>  rust/kernel/time/hrtimer.rs                      | 32 +++++++++++-----------
>  tools/testing/selftests/bpf/progs/test_vmlinux.c |  4 +--
>  42 files changed, 167 insertions(+), 167 deletions(-)

All of that is related to 'scsi: bfa:', right?

> diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
> index 6a5815aa05e6..ce9295ca2960 100644
> --- a/arch/arm/mach-omap1/pm.c
> +++ b/arch/arm/mach-omap1/pm.c
> @@ -118,7 +118,7 @@ void omap1_pm_idle(void)
>  #endif
>  
>  #ifdef CONFIG_OMAP_DM_TIMER
> -	use_idlect1 = omap_dm_timer_modify_idlect_mask(use_idlect1);
> +	use_idlect1 = omap_dm_timer_moduleify_idlect_mask(use_idlect1);

I have no idea how this is related to the subject or the change log of
this patch.

>  #endif
>  
>  	if (omap_dma_running())
> diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
> index 6c70ea7f2931..6c1d020b181e 100644
> --- a/arch/arm/mach-s3c/s3c64xx.c
> +++ b/arch/arm/mach-s3c/s3c64xx.c
> @@ -165,8 +165,8 @@ static struct samsung_pwm_variant s3c64xx_pwm_variant = {
>  	.tclk_mask	= (1 << 7) | (1 << 6) | (1 << 5),
>  };
>  
> -void __init s3c64xx_set_timer_source(enum s3c64xx_timer_mode event,
> -				     enum s3c64xx_timer_mode source)
> +void __init s3c64xx_set_timer_source(enum s3c64xx_timer_modulee event,
> +				     enum s3c64xx_timer_modulee source)

> -enum s3c64xx_timer_mode {
> +enum s3c64xx_timer_modulee {

> -			apic->lapic_timer.timer_mode_mask = 3 << 17;
> +			apic->lapic_timer.timer_modulee_mask = 3 << 17;

> -	u32 timer_mode;
> -	u32 timer_mode_mask;
> +	u32 timer_modulee;
> +	u32 timer_modulee_mask;

> -	struct bfa_timer_mod_s	*timer_mod;
> +	struct bfa_timer_module_s	*timer_module;

> -static void __init ti_32k_timer_module_init(struct device_node *np,
> +static void __init ti_32k_timer_moduleule_init(struct device_node *np,

Seriously?

Has AI gone wild or what?

There is not a single instance of change in this pile, which actually
makes sense.

This thing definitely qualifies for the 'garbage of the year' award and
already leads the decade rankings by far.

Thanks,

        tglx
