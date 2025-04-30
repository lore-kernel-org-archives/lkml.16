Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8E1E990B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995075; cv=none; b=I4/Yv8TPJf9P0H9cevQn2s2XOpPXzrBTHAf1wK1tY5zSdBAR4s/wMLva3zYyCERaIhnbpcm+Tha0bzep2YyxGFG6sbOZz30op1PxTA+OUOSzJKAxWTp9SszLo0FWFpPZ00RxKY4K28kgs9f8zYfOZdHa9oEimE9sLbtdisrTprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995075; c=relaxed/simple;
	bh=D0H4SUGrkbfu1ECEDYMsmXH0RkJmSeH8R58c6NJrBCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9J28XENqsuZhFdqEtNvtOFqz/4pXUuKKeOb3kx8MBai7MB0ajqlPsiLtG4ZAcfeqNQ1uzWcnH9ao2PRsTqp0Ly3b6sZBRqqXWvaMujX7PUHqU+/EDeaXZ94hiUyi8A7FGZSqsZBA7egc7Z+1qdC4RcZ5uG77sraISy77NJyVDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RA0vhVBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RA0vhVBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78561C4CEEA;
	Wed, 30 Apr 2025 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745995075;
	bh=D0H4SUGrkbfu1ECEDYMsmXH0RkJmSeH8R58c6NJrBCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RA0vhVBbBsWHL6bQYIDmXUo62G6IfYvLF8zfYWq18VIUmAwyvfF6PplhxGLLsiV06
	 UAzj8Vo4W4Ony2sPkXHwQBkNQPhq7wteirh/DPh6nBY4psshFQu3IPSAUZTexD67/T
	 rbJKamoJlkkKd+Clor/fq7snlSCe5ji9BeZrm6VvJFCr0RUnpoOxIJ6PaNJ2GiFciF
	 42ovDTEEfKu8Xnki8+c6QLq9WaWT2iNdCOQGGCYe0Dlfcjsc4FnZzFtL548s1T7v1Z
	 QYCfnZ3sorytgx9d/cYKhTH0TLp/o0dkj03JGxPW2tdPg8UOJ4eJjCrpU6J5jhl8re
	 38sNvVFEUFgAA==
Message-ID: <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org>
Date: Wed, 30 Apr 2025 08:37:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 35/45] genirq/manage: Rework irq_set_irq_wake()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065422.128859754@linutronix.de>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250429065422.128859754@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29. 04. 25, 8:55, Thomas Gleixner wrote:
> Use the new guards to get and lock the interrupt descriptor and tidy up the
> code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> ---
>   kernel/irq/manage.c |   61 +++++++++++++++++++++++-----------------------------
>   1 file changed, 28 insertions(+), 33 deletions(-)
> 
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -845,44 +845,39 @@ static int set_irq_wake_real(unsigned in
>    */
>   int irq_set_irq_wake(unsigned int irq, unsigned int on)
>   {
> -	unsigned long flags;
> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
> -	int ret = 0;
> +	int ret = -EINVAL;

Hmm...

> -	if (!desc)
> -		return -EINVAL;
> +	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
> +		struct irq_desc *desc = scoped_irqdesc;
>   
> -	/* Don't use NMIs as wake up interrupts please */
> -	if (irq_is_nmi(desc)) {
> -		ret = -EINVAL;
> -		goto out_unlock;
> -	}
> +		/* Don't use NMIs as wake up interrupts please */
> +		if (irq_is_nmi(desc))
> +			return -EINVAL;
>   
> -	/* wakeup-capable irqs can be shared between drivers that
> -	 * don't need to have the same sleep mode behaviors.
> -	 */
> -	if (on) {
> -		if (desc->wake_depth++ == 0) {
> -			ret = set_irq_wake_real(irq, on);
> -			if (ret)
> -				desc->wake_depth = 0;
> -			else
> -				irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
> -		}
> -	} else {
> -		if (desc->wake_depth == 0) {
> -			WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
> -		} else if (--desc->wake_depth == 0) {
> -			ret = set_irq_wake_real(irq, on);
> -			if (ret)
> -				desc->wake_depth = 1;
> -			else
> -				irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
> +		/*
> +		 * wakeup-capable irqs can be shared between drivers that
> +		 * don't need to have the same sleep mode behaviors.
> +		 */
> +		if (on) {
> +			if (desc->wake_depth++ == 0) {
> +				ret = set_irq_wake_real(irq, on);
> +				if (ret)
> +					desc->wake_depth = 0;
> +				else
> +					irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
> +			}

So in this (imaginary) else branch (i.e. desc->wake_depth++ != 0), you 
return EINVAL now?

Previously, it was 0 (correctly), if I am looking correctly.

> +		} else {
> +			if (desc->wake_depth == 0) {
> +				WARN(1, "Unbalanced IRQ %d wake disable\n", irq);

And here too.

> +			} else if (--desc->wake_depth == 0) {
> +				ret = set_irq_wake_real(irq, on);
> +				if (ret)
> +					desc->wake_depth = 1;
> +				else
> +					irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
> +			}
>   		}
>   	}
> -
> -out_unlock:
> -	irq_put_desc_busunlock(desc, flags);
>   	return ret;
>   }
>   EXPORT_SYMBOL(irq_set_irq_wake);
> 
> 
> 


-- 
js
suse labs
