Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C4C2749E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462252; cv=none; b=Yo+AXF+6SVzkzZBPgJuXJV2xSMwDyVZ5a7/fQB2p9TiHUSc2fW/sBNS2KBo2sF+57L+DtKQqN11WrhhpUvJ/swBvxIam6sXINVcwJuCyMmXXJwR8+jSG5CWLTonifFvWHgBmSEHf2oscMxIFItmO9U+O7IeJHH1CBz+UO0hfg6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462252; c=relaxed/simple;
	bh=3+cJ9NuTZnx3r7RUfiS4LYqQhxrxwDz1VemTjzAj8dM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F4Xvo6suo+83reHHt0eyrVFX4YbzX0aiyCcp2kNUQpbNTruOQObZS2USy4ejzIRrV74pUv1csEEIpH1N17qca/YHTrRODh+RPRkFDgkCW+/EZlvHwdsloHfRCIGXocBdxi2YAffoXDFxgICaZXdG6ZX/tu5/QB1A7GEDQpP3SmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GsOdZ0eA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WBaVqayZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GsOdZ0eA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WBaVqayZ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751462247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIJOLGTcMIMLsVZT9Bj349U4hxk85fC4NcpkSsFUAaY=;
	b=GsOdZ0eA1gPL71yxtzxGBvo6Qoq5gFSr6hPXux25qCB22t5Ylfs/JaBjk+trohYLU2kfmC
	wh2n0kx2Z9Js6DKoyq2JuXe/M4seiMGIT3tQEDgZwskh8z2Z5VQOo0bTbmNcz3cJZ1DTDT
	oQmU/1QgPlzqo2cDtSHF+yy76rkeDlFPU9OM7120ZUwGpoEqZ94d1VovmgOTs3fxMV2hOF
	pLwwBXKEwDQePrTsD87bmdLDbW9ah1XF8ZtbdN162Br9cUxgFw6fxINsWbzYBxsL8p7BFE
	BG0wOdZjDVCOmwfHDEjDZbcuDXeIRnKUJPpDJpVTX8096S9hcnlm9aTTX2sVYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751462247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIJOLGTcMIMLsVZT9Bj349U4hxk85fC4NcpkSsFUAaY=;
	b=WBaVqayZwHI/x3JWNoioQZh2JfEQCWAXdWKFUp3Wuw+1JgDdODd+UjLqYOhu00CrRN2NxF
	hROBOocvfjwVEcCQ==
To: Liangyan <liangyan.peng@bytedance.com>
Cc: linux-kernel@vger.kernel.org, Liangyan <liangyan.peng@bytedance.com>,
 Yicong Shen <shenyicong.1023@bytedance.com>
Subject: Re: [RFC] genirq: Fix lockup in handle_edge_irq
In-Reply-To: <20250701163558.2588435-1-liangyan.peng@bytedance.com>
References: <20250701163558.2588435-1-liangyan.peng@bytedance.com>
Date: Wed, 02 Jul 2025 15:17:26 +0200
Message-ID: <87a55mlok9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 02 2025 at 00:35, Liangyan wrote:
>  void handle_edge_irq(struct irq_desc *desc)
>  {
> +	bool need_unmask = false;
> +
>  	guard(raw_spinlock)(&desc->lock);
>  
>  	if (!irq_can_handle(desc)) {
> @@ -791,12 +793,16 @@ void handle_edge_irq(struct irq_desc *desc)
>  		if (unlikely(desc->istate & IRQS_PENDING)) {
>  			if (!irqd_irq_disabled(&desc->irq_data) &&
>  			    irqd_irq_masked(&desc->irq_data))
> -				unmask_irq(desc);
> +				need_unmask = true;
>  		}
>  
>  		handle_irq_event(desc);
>  
>  	} while ((desc->istate & IRQS_PENDING) && !irqd_irq_disabled(&desc->irq_data));
> +
> +	if (need_unmask && !irqd_irq_disabled(&desc->irq_data) &&
> +	    irqd_irq_masked(&desc->irq_data))
> +		unmask_irq(desc);

This might work in your setup by some definition of "works", but it
breaks the semantics of this handler because of this:

device interrupt        CPU0                            CPU1
                        handle_edge_irq()
                        set(INPROGRESS);

                        do {
                               handle_event();

device interrupt
                                                        handle_edge_irq()
                                                           if (INPROGRESS) {
                                                             set(PENDING);
                                                             mask();
                                                             return;
                                                           }

                               ...
                               if (PENDING) {
                                  need_unmask = true;
                               }
                               handle_event();

device interrupt   << possible FAIL

because there are enough edge type interrupt controllers out there which
lose an edge when the line is masked at the interrupt controller
level. As edge type interrupts are fire and forget from the device
perspective, the interrupt is not retriggered when unmasking later.

That's the reason why this handler is written the way it is and this
cannot be changed for obvious reasons.

So no, this is not going to happen.

The only possible solution for this is to analyze all interrupt
controllers, which are involved in the delivery chain, and establish
whether they are affected by the above problem. If not, then that
particular delivery chain combination of interrupt controllers can be
changed to use a different flow handler along with a profound
explanation why this is correct under all circumstances.

As you failed to provide any information about the involved controllers,
I cannot even give any hint about a possible solution.

Thanks,

        tglx


