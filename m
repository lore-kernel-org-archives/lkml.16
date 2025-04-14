Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C903827EC80
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628362; cv=none; b=CdYnLR9kj46Mv9YLT083WReAnRJzzQ5bcoP0rlvUWatbHC5FuBxL4cTzjjnekB+hUiPCOWSCyVyw5Yq5TZm0X8KcbXeyxeoNAOCUksOi3iIehn+XOHXgthHDGaXy10L9GiY/2gmBkLmUQD0L7WDSSqDefzLUucBAmI3iWdkmmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628362; c=relaxed/simple;
	bh=m3EU9kWckaL+2+tB6F557gCyHnKIrKb18rmQ9fgl0XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJ/Rw3F9cImCzDcI8CtVUh3OKQc+Z5dHbJ6REzrXRrAgAaISswQ1FKaRtKpdw8xfNmCC5k0KQId8BjNqKGXlwL6B2nMt3R4Qhm2eFnPI++6/26OZ448HlhB0vDVP1HCSARwwMSiHQE7am1lTDMRqZoY0XXQF/d569fbNplaRcpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fa5sa0cH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P2+pHO6w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fa5sa0cH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P2+pHO6w"
Date: Mon, 14 Apr 2025 12:59:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744628357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hiffthIPXULFGZtCVfW74tr4S/5IXupCFA9dsKwQfDg=;
	b=fa5sa0cHqToU6gMiGCw0NqeHLptV+O/5/wX/+1bUBOEZhR52S6yf2b8ud3w2pxvICFqUm0
	Ijgg/RA1B1Je2/jvrAmXwyI61eRN9+d1fz2zEciUjO+W9gA0yKiyQ19W2P6R511lgAnupu
	V8llWpSOehDcr+ZnEcvaAUxSXhsoARPi8O+/xd2Ubd0b7S/9glyxftG+ULppAZFo+MA2xS
	FGP0lmzYn7be1WP4Xl6i9cV1Eh3j1MQ0h+JxnmN+nV8ap8d9a+CQ3HLvcyn7fuQMtMxl40
	Up6Y9fLqcGjQ0yfiNG4UoKyyk0T7aaRj7Q/al/uBKKosUtN6K4l2TqfYzoGf+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744628357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hiffthIPXULFGZtCVfW74tr4S/5IXupCFA9dsKwQfDg=;
	b=P2+pHO6wLFIBOdhtQyHwzpfGpiZ3YIUC9aXm6pIvUyuHit01WOGs+wHcG0fGiMw13NppNl
	TG6v5KRWX0JkFjBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
Message-ID: <20250414125751-86262936-22cf-4ea9-8a68-ffed04d88d58@linutronix.de>
References: <20250414102301.332225-1-mingo@kernel.org>
 <20250414102301.332225-3-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414102301.332225-3-mingo@kernel.org>

On Mon, Apr 14, 2025 at 12:22:36PM +0200, Ingo Molnar wrote:
> We'd like to introduce timer_mod() in the kernel, so make
> sure the namespace is clear.
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
> ---
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
> 
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

Many changes in this patch look iffy and unnecessary.

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
>  {
>  	s3c64xx_pwm_variant.output_mask = BIT(SAMSUNG_PWM_NUM) - 1;
>  	s3c64xx_pwm_variant.output_mask &= ~(BIT(event) | BIT(source));

<snip>
