Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E8205E3C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747253; cv=none; b=GTerT3eFBpxJtPpCU2CD7Yvyk0GAwcwxoFdFufZSOpDNO/APjph+1wE7Zq3oVWq412oKeBxEt4ADAVWN0NEjExHoAVb4873kJeDrAyt9LfWdEJhIDp5gWwF/woAvq4MI1ard6px7CiJTS8X1RiY+/5gnp2V99EVoAGwwe68G7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747253; c=relaxed/simple;
	bh=mj+k4OczWE2nBk4phHALChgE04gPf2iyVYsuIh1S0oo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AJzAwtYOrbJo/62+V2PVNynl24fVjUb6Naiy8QcMLj3oCMlU0Yup2aQ5QPHvnY2h+ntNDvmo4MQhC+8OJ+a5algU6y9UFnzvqLzQ6FNuN/hDDhwQfvqiLidI0CYY2TMV67Tjk9P6tMDrjXoX/ZhvAiGaSuTXFGxdVHntuBaqG+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h/zlvl9+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y9ePSqHG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h/zlvl9+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y9ePSqHG"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738747249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNtZh6a1u+1I8lw/ffaLtPBIyQquD473YPZUQUeCQJc=;
	b=h/zlvl9+/FiiWa5VDw2dhrwHzuZ9ncxVLS7a6zDo8Y75w4YxwwSyY7dFqGCUjXlrYYujt/
	dE0873ljalbVRmiulkg+lGJZI9xr1mAwgdHACT3hPTXhUae1TjgPInoxpn0uOArd/tZTyg
	4cLrL/IEvqPbjQAs6Jxd1DnIptmDEwCbJJswAq+QhPeSpE3xZ4u6TFIIGI+zWBZpYVhARV
	/x8n6GoyfeMRyWMgIVGk7YnTpdEot6fSAjcZhNHxlTXDbRbdk/LR0OzuZxffD2g3/RGhLu
	u9bRfFd48UPw5TJaHgy6AcyCll8gp3PjDZ1mXdtOgO9PcfTDbESP6uUAiui3ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738747249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNtZh6a1u+1I8lw/ffaLtPBIyQquD473YPZUQUeCQJc=;
	b=y9ePSqHGWdwu+sl2jIadO9fRF0V42GE3Q6VblKjCbOOQrg+YHNDGRUHxmQYDifMFMRQe62
	Ws2opJQpm69W2YAg==
To: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Rik van Riel <riel@surriel.com>, Waiman Long
 <longman@redhat.com>
Subject: Re: [PATCH v4] x86/nmi: Add an emergency handler in nmi_desc & use
 it in nmi_shootdown_cpus()
In-Reply-To: <20241219150653.349177-1-longman@redhat.com>
References: <20241219150653.349177-1-longman@redhat.com>
Date: Wed, 05 Feb 2025 10:20:47 +0100
Message-ID: <87a5b0oihc.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Dec 19 2024 at 10:06, Waiman Long wrote:
> Depending on the type of panics, it was found that the
> __register_nmi_handler() function can be called in NMI context from
> nmi_shootdown_cpus() leading to a lockdep splat like the following.
>
> [ 1123.133573] ================================
> [ 1123.137845] WARNING: inconsistent lock state
> [ 1123.142118] 6.12.0-31.el10.x86_64+debug #1 Not tainted
> [ 1123.147257] --------------------------------
> [ 1123.151529] inconsistent {INITIAL USE} -> {IN-NMI} usage.
>   :
> [ 1123.261544]  Possible unsafe locking scenario:
> [ 1123.261544]
> [ 1123.267463]        CPU0
> [ 1123.269915]        ----
> [ 1123.272368]   lock(&nmi_desc[0].lock);
> [ 1123.276122]   <Interrupt>
> [ 1123.278746]     lock(&nmi_desc[0].lock);
> [ 1123.282671]
> [ 1123.282671]  *** DEADLOCK ***
>   :
> [ 1123.314088] Call Trace:
> [ 1123.316542]  <NMI>
> [ 1123.318562]  dump_stack_lvl+0x6f/0xb0
> [ 1123.322230]  print_usage_bug.part.0+0x3d3/0x610
> [ 1123.330618]  lock_acquire.part.0+0x2e6/0x360
> [ 1123.357217]  _raw_spin_lock_irqsave+0x46/0x90
> [ 1123.366193]  __register_nmi_handler+0x8f/0x3a0
> [ 1123.374401]  nmi_shootdown_cpus+0x95/0x120
> [ 1123.378509]  kdump_nmi_shootdown_cpus+0x15/0x20
> [ 1123.383040]  native_machine_crash_shutdown+0x54/0x160
> [ 1123.388095]  __crash_kexec+0x10f/0x1f0
> [ 1123.421465]  ? __ghes_panic.cold+0x4f/0x5d
> [ 1123.482648]  </NMI>

Can you please trim backtraces properly according to documentation:

    https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages

> In this particular case, the following panic message was printed before.
> One way to address this problem is to remove all the panic() calls from
> NMI context, but that can be too restrictive.
>
> Another way to fix this problem while allowing panic() calls from

Fix it by doing ....

> NMI context is by adding a new emergency NMI handler to the nmi_desc
> structure and provide a new set_emergency_nmi_handler() helper to
> atomically set crash_nmi_callback() in any context. The new emergency
> handler will preempt other handlers in the linked list. That will
> eliminate the need to take any lock and serve the panic in NMI use case.
> +/*
> + * An emergency handler can be set in any context including NMI
> + */
>  struct nmi_desc {
>  	raw_spinlock_t lock;
> +	nmi_handler_t emerg_handler;	/* Emergency handler */

This tail comment is not only useless

> +/**
> + * set_emergency_nmi_handler - Set emergency handler
> + * @type:    NMI type
> + * @handler: the emergency handler to be stored
> + * Return: 0 if success, -EEXIST if a handler had been stored
> + *
> + * Atomically set an emergency NMI handler which, if set, will preempt all
> + * the other handlers in the linked list. If a NULL handler is passed in,
> + * it will clear it.
> + */
> +int set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler)
> +{
> +	struct nmi_desc *desc = nmi_to_desc(type);
> +	nmi_handler_t orig = NULL;
> +
> +	if (!handler) {
> +		orig = READ_ONCE(desc->emerg_handler);
> +		WARN_ON_ONCE(!orig);
> +	}
> +
> +	if (try_cmpxchg(&desc->emerg_handler, &orig, handler))
> +		return 0;

What's the point of this cmpxchg()? What's the concurrency problem this
tries to address?

> +	if (WARN_ON_ONCE(orig == handler))
> +		return 0;
> +	WARN_ONCE(1, "%s: failed to set emergency NMI handler!\n", __func__);
> +	return -EEXIST;

These return values are there to be ignored at the only call site. So
what's the point of having them in the first place?

Thanks,

        tglx
