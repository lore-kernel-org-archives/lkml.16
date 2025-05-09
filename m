Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620A2918F2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796935; cv=none; b=eeQjBypn6u1effLBHI7UZnMcL9Y2jc3EdjkUJJkBZia+mJJ59yyRmEHYpqZy8DMdR1F2Mrd+/mdkePf4CaE9Xvhlc32UGbZr647S1o1qgTqKFw6yplCeI4KXpCLuYsM0Rn1vD/S8eydSg7XtXulNF7sq5jK60sZ6pHWSXGL+36s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796935; c=relaxed/simple;
	bh=MvHoq4E8dKf+/jz+D9CgI62BTRuxk1z/875ygLCAnJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sudCzE4FYG55PWstHJPZdNj7OM4u142RqrzewMjZa5KbzadWQwTp74TsqdkVPPOoriECgQ5756o6yRXa+xPjMGtGEO05EwOrhGxV9H/hibFxT88b8PD8ZWfKEN0+PgsisfR1FUPq4s5+HBk8Z/+M0GColHtRrOhQWonYn4JmR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpoFXK6+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpoFXK6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78DEC4CEE4;
	Fri,  9 May 2025 13:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746796935;
	bh=MvHoq4E8dKf+/jz+D9CgI62BTRuxk1z/875ygLCAnJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpoFXK6+NrampI+I9B0h14NiicaKaZzjoTMEHNhto4317+JGFGJ3nql+wZJrfTULY
	 B9q81/l2C1t6zklW56CZUH7qCvFu5tB7I16cXwQv4w3lbyOcnn+dofRxugVZZXCLUV
	 Zj0w7ykyZgc+JP/3ozR+tU8iBuxi0noqSVWeXb6oulcv8XYSyLL7jl0onYn6iEJUDA
	 RvHBl5/TkdaMprKH5E11tS+N9RicXoqIBFlruRhfXhiogUObgjAPey/avBt1pRu/2x
	 b/5u4o8lyGLya7OwA5JDFjzYoH8lX2JVoEMyScZXP8jryyDzJLg6zO6tI+evCOOzU2
	 KQyVrL7UFIxew==
Date: Fri, 9 May 2025 14:22:11 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch V2 26/45] genirq/chip: Rework irq_set_handler() variants
Message-ID: <20250509132211.GA3618294@ax162>
References: <20250429065337.117370076@linutronix.de>
 <20250429065421.590753128@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429065421.590753128@linutronix.de>

Hi Thomas,

On Tue, Apr 29, 2025 at 08:55:26AM +0200, Thomas Gleixner wrote:
> Use the new guards to get and lock the interrupt descriptor and tidy up the
> code.
> 
> Fixup the kernel doc comment while at it.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> ---
>  kernel/irq/chip.c |   34 +++++++++++-----------------------
>  1 file changed, 11 insertions(+), 23 deletions(-)
> 
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -973,35 +973,23 @@ static void
>  	}
>  }
>  
> -void
> -__irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
> -		  const char *name)
> +void __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
> +		       const char *name)
>  {
> -	unsigned long flags;
> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, 0);
> -
> -	if (!desc)
> -		return;
> -
> -	__irq_do_set_handler(desc, handle, is_chained, name);
> -	irq_put_desc_busunlock(desc, flags);
> +	scoped_irqdesc_get_and_lock(irq, 0)

I am investigating some cases where

  WARN(!irqs_disabled(), "Interrupts were enabled early\n");

in start_kernel() in init/main.c is triggered in certain builds with
clang after patch 23 of this series (very bizarre since the conversion
seems to be correct) and I happened to notice that this conversion seems
to be incorrect? Should this be scoped_irqdesc_get_and_buslock() like
below?

> +		__irq_do_set_handler(scoped_irqdesc, handle, is_chained, name);
>  }
>  EXPORT_SYMBOL_GPL(__irq_set_handler);
>  
> -void
> -irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t handle,
> -				 void *data)
> +void irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t handle,
> +				      void *data)
>  {
> -	unsigned long flags;
> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, 0);
> -
> -	if (!desc)
> -		return;
> +	scoped_irqdesc_get_and_buslock(irq, 0) {
> +		struct irq_desc *desc = scoped_irqdesc;
>  
> -	desc->irq_common_data.handler_data = data;
> -	__irq_do_set_handler(desc, handle, 1, NULL);
> -
> -	irq_put_desc_busunlock(desc, flags);
> +		desc->irq_common_data.handler_data = data;
> +		__irq_do_set_handler(desc, handle, 1, NULL);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(irq_set_chained_handler_and_data);
>  
> 
> 
> 
