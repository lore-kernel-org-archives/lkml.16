Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E024E019
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945591; cv=none; b=QsHKlWm5Gi0KZdGLiZerfEkQ0ZXmDRldKf8FLJAyXimpf1FwlLMKogg/7gpvwwgOFD/p8ruMsJC5ebN4X17sIg1mIk/V1B9RbUDAlZ4nFAGUr1z0MuKtLlSgu6MPUKEpG5R7WRLFb02G/pKqyRJakrX/zsv6Hrhgq5pGZHeWoP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945591; c=relaxed/simple;
	bh=rvwMq98Jt3B7MUrEb6li9y6+5IG8nlslNnMRtOYSVD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nb4ZUIl5NU+z4PKl6wGYmRnSMq90m6Q+Qm7E4D2ancLw1QoigJFIr5y/RthBwKAvi6WcIuaOsUcwLTqct237GhJUx71+acYbDzhXpaRAM6UKAdFnnJmgQ0Bs7TJN8MdLior1EDqt4g8QmtIdzPbXz2SydMUSh2s7ZLhNvK6wrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VO+7bP1W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+1FCOKXe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VO+7bP1W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+1FCOKXe"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745945587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WwmLgDT1WO4FJ/Bs9AFg3veV+pfKiE4cEwup8QWcbz8=;
	b=VO+7bP1WdP/OS+2p+GoZn7eBoUerGIbD7HePipSVnm4ogbKWNAHcWb6rmzyNclWyQK06Oi
	049uSv4E0ZPvswnFRvNe1Fb/0NIq9eaxtvjB/WSTtZ1tJkzseFMNIvmPlF1JzoDwd+5xOF
	vrYis1NAEA37rOcEjribAA7uY8TDSIdXbfpQ1H/+U+6lYgWYn71WxKLtCktcCynROJGATV
	59VM9DsyFQ+x9E0yKPbO7CBLYPN8+RHXkCsr2stTtGcaqKpAPrC5LO0dNsDU1EMGdrs6qQ
	slTb9JZrTjXWjZv3BftR0Vm0jrdMPq4vMxwyol/sbUZBJFtFsnDK0Sa1SZpIUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745945587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WwmLgDT1WO4FJ/Bs9AFg3veV+pfKiE4cEwup8QWcbz8=;
	b=+1FCOKXeX5IVkra6/CGRF/997U00GhA7QwKWQX0rmv0YFRE+asHHGwF82hcs8ww6g713Ju
	0NEChJGMO8H8X5CQ==
To: carlos.bilbao@kernel.org, tglx@linutronix.de, seanjc@google.com,
 jan.glauber@gmail.com
Cc: bilbao@vt.edu, pmladek@suse.com, akpm@linux-foundation.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp, Carlos Bilbao
 <carlos.bilbao@kernel.org>
Subject: Re: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default
 post-panic behavior
In-Reply-To: <20250428215952.1332985-3-carlos.bilbao@kernel.org>
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
 <20250428215952.1332985-3-carlos.bilbao@kernel.org>
Date: Tue, 29 Apr 2025 18:59:07 +0206
Message-ID: <84ldri7vv0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-04-28, carlos.bilbao@kernel.org wrote:
> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>
> Add function x86_panic_handler() as the default behavior for x86 for
> post-panic stage via panic_set_handling(). Instead of busy-wait loop, it
> will halt if there's no console to save CPU cycles.
>
> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 9d2a13b37833..3bfef55e9adb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -16,6 +16,7 @@
>  #include <linux/initrd.h>
>  #include <linux/iscsi_ibft.h>
>  #include <linux/memblock.h>
> +#include <linux/panic.h>
>  #include <linux/panic_notifier.h>
>  #include <linux/pci.h>
>  #include <linux/root_dev.h>
> @@ -837,6 +838,15 @@ static void __init x86_report_nx(void)
>  	}
>  }
>  
> +
> +static void x86_panic_handler(void)
> +{
> +	if (console_trylock()) {
> +		console_unlock();
> +		safe_halt();
> +	}

I do not understand what you are trying to accomplish with the
console_trylock(). At this point in the panic, all the messages are
already output. The console lock is totally irrelevant.

Also, the console lock is only valid for legacy consoles.

I see no reason why you don't just use safe_halt() as your panic
handler.

John Ogness
