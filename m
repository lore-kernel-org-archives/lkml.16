Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927B1487FE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505740; cv=none; b=KMRyX5W17u5GAHWIkzsGf2eCJPPQt7V+o+fm08YUDRH1zbUGmWdUzuApcxBd114OaNGdLmSW4W+pVqYjpjWMLVGfs7OwncLgYbWeyjvFcdM03S4sKzjHVxO0VvEeiD3fn8Cqyix33uu7p2XsK5yAECXTciXxULKhwbsOhIthGFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505740; c=relaxed/simple;
	bh=H8Mj5c5jGcjrEiyABKfcTFYpGMkohXtJXFfgbrVsoVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPni8fMFf/YHORY72gS8H4fzmtAOXqZpcyYjybxwoqYyXXA/XabhMKB/g+oXprW9lDgGCaBYWrIqgd5CCVMi86TDSL6bnp6/0Csmk7M2XxWcIfKcga87gFutQ3RYVl2UokZInO+9XbKWkMC1LYpiL7k3J5PsQ59I0rw/MXkBu8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ucuaI7Wn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yt7PjhcN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ucuaI7Wn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yt7PjhcN"
Date: Thu, 24 Apr 2025 16:42:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745505736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8vMlkL+lIHjasAEJl+J38/UdVO5mJgPzQD6eJm4tSU=;
	b=ucuaI7Wnn0jg1oXdKKMJt8cBLvEWz+ylQEYyYb6u0Pe9XmXpSjzZmx1v4Z/3aWtd+KkvQI
	VsTJMQBzXu+h0fooHpuvjzkjvyLdoBXcz7O0o/0N1r9VtTIkqM4ja6cX6zOy/zRS21WwiF
	aJyCBzDkbKn1yZ/A9f4jrFIwmLfG0YHWo181Q/kAtCLdGBmMOE1AYX71z3Sum5djvSiWXo
	stTHfpLJafg7ZRX6V3Ej3L4qkjtFszKlQvgK+CkxbaMDvQHWwrN1RKMRy9o6kuFoGmkrGm
	EaF9FyGJvXrpIM6KRwkOHl+BwxWr6QuGnCBbdMgIUekzA1M7hXk5Y8tbU69hhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745505736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8vMlkL+lIHjasAEJl+J38/UdVO5mJgPzQD6eJm4tSU=;
	b=yt7PjhcNn9iS2ueEI9cj7dywq52hOhs96CHr8Z24A70lduz7Ic3uP4NP11zFrcciYaKiPb
	we9YIFNwx+WJfcBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
	vaibhav@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250424144215._ooDjDz9@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421102837.78515-2-sshegde@linux.ibm.com>

On 2025-04-21 15:58:36 [+0530], Shrikanth Hegde wrote:
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 19f4d298d..123539642 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -80,8 +80,8 @@
>  #include <asm/ultravisor.h>
>  #include <asm/dtl.h>
>  #include <asm/plpar_wrappers.h>
> -
>  #include <trace/events/ipi.h>
> +#include <linux/entry-kvm.h>
>  
>  #include "book3s.h"
>  #include "book3s_hv.h"
> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  	}
>  
>  	if (need_resched())
> -		cond_resched();
> +		schedule();

This looks unrelated and odd. I don't why but this should be a
cond_resched() so it can be optimized away on PREEMPT kernels.

>  	kvmppc_update_vpas(vcpu);
>  
> @@ -5097,10 +5097,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		return -EINVAL;
>  	}
>  
> -	/* No need to go into the guest when all we'll do is come back out */
> -	if (signal_pending(current)) {
> -		run->exit_reason = KVM_EXIT_INTR;
> -		return -EINTR;
> +	/* use generic frameworks to handle signals, need_resched  */
> +	if (__xfer_to_guest_mode_work_pending()) {
> +		r = xfer_to_guest_mode_handle_work(vcpu);
This could be unconditional.

> +		if (r)
> +			return r;
>  	}
>  
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 153587741..4ff334532 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -34,6 +34,7 @@
>  #endif
>  #include <asm/ultravisor.h>
>  #include <asm/setup.h>
> +#include <linux/entry-kvm.h>
>  
>  #include "timing.h"
>  #include "../mm/mmu_decl.h"
> @@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>  {
>  	int r;
>  
> +	/* use generic framework to handle need resched and signals */
> +	if (__xfer_to_guest_mode_work_pending()) {
> +		r = xfer_to_guest_mode_handle_work(vcpu);

there is nothing special you do checking and handling the work. Couldn't
you invoke xfer_to_guest_mode_handle_work() unconditionally?

> +		if (r)
> +			return r;
> +	}
> +
>  	WARN_ON(irqs_disabled());
>  	hard_irq_disable();
>  
>  	while (true) {
> -		if (need_resched()) {
> -			local_irq_enable();
> -			cond_resched();
> -			hard_irq_disable();
> -			continue;
> -		}
> -
> -		if (signal_pending(current)) {
> -			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
> -			vcpu->run->exit_reason = KVM_EXIT_INTR;
> -			r = -EINTR;
> -			break;

I don't how this works but couldn't SIGNAL_EXITS vanish now that it
isn't updated anymore? The stat itself moves in kvm_handle_signal_exit()
to a different counter so it is not lost. The reader just needs to look
somewhere else for it.

> -		}
> -
>  		vcpu->mode = IN_GUEST_MODE;
>  
>  		/*

Sebastian
