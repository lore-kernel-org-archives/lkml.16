Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDCC1EEF9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994721; cv=none; b=RgXsKbnqBhj7jdUJ7Q6yTmqwkAnYJcnppZ8W+rygQFRyClRhjJswzUO7Rs79TuQxj8oryMQ1pwBwQVeEvqTyPBh9r8bbG9l96KIYl2vqEzZ9i4fpdCxyLQUDyUmUwHx1is6tn4oc6ti/s+zhiWOYhuXnnTa0bkK5Zvs4+vtwJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994721; c=relaxed/simple;
	bh=zKxTIRhTnDemJtW03EyrTf/Clp17d4R0kO2bq8NLl+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkygLkjaqx7hYid5Rr2aEUbeFjyUsK9Dll5+9G/LE/mnoSqg21hqT1KHewJA8Fucz+ELL5X7A/KD75W8BP6hcj6ksiYNI0OapJHHMs/LBfJqz4M1Wj7VdMia7Bu5erdi7QcSHsTrcK208EGFBqQnU+yi0Yz/qqarRTZVncaziCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRVcsESg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRVcsESg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CA5C4CEEA;
	Wed, 30 Apr 2025 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745994719;
	bh=zKxTIRhTnDemJtW03EyrTf/Clp17d4R0kO2bq8NLl+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hRVcsESgjITUnx4d9/2ily/yYmvvoNOnYF4fCzt/n5GESQhXSusEDy4+Hc3bCXYOO
	 EW8loj7XClYOkX2Cwu5J2KjF5B6FJ1+xhaYBfrAHoWZjrF5y7i42LhgXP+DVChqUm6
	 vEEi24kyi1UFnhBjtZk20YvmcvLTwaNEOzfuhAJANEm4bbLNSxFrE3dOFmWYPgvbuu
	 xCsb/v8ebHTNLCATTtMw2JGkRiqzpTh3fks5JZii9E/TrphkY/K7F8iVFr2PdEjZnc
	 /s7l2IMKOx9Po8jDP7fPuNGM9giVL6yaYEKHK3GpkmfOLhD/Vh0L5ONYYfjM6Me67g
	 hK1mDWCRd8sBw==
Message-ID: <4f323802-d31d-4ba0-8a55-6e9f5e3cd152@kernel.org>
Date: Wed, 30 Apr 2025 08:31:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 32/45] genirq/manage: Rework irq_set_vcpu_affinity()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065421.954584482@linutronix.de>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250429065421.954584482@linutronix.de>
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
>   kernel/irq/manage.c |   40 +++++++++++++++++-----------------------
>   1 file changed, 17 insertions(+), 23 deletions(-)
> 
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -627,32 +627,26 @@ int irq_setup_affinity(struct irq_desc *
>    */
>   int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info)
>   {
> -	unsigned long flags;
> -	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
> -	struct irq_data *data;
> -	struct irq_chip *chip;
> -	int ret = -ENOSYS;
> +	scoped_irqdesc_get_and_lock(irq, 0) {
> +		struct irq_desc *desc = scoped_irqdesc;
> +		struct irq_data *data;
> +		struct irq_chip *chip;
> +		int ret = -ENOSYS;
>   
> -	if (!desc)
> -		return -EINVAL;
> +		data = irq_desc_get_irq_data(desc);
> +		do {
> +			chip = irq_data_get_irq_chip(data);
> +			if (chip && chip->irq_set_vcpu_affinity)
> +				break;
>   
> -	data = irq_desc_get_irq_data(desc);
> -	do {
> -		chip = irq_data_get_irq_chip(data);
> -		if (chip && chip->irq_set_vcpu_affinity)
> -			break;
> -#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
> -		data = data->parent_data;
> -#else
> -		data = NULL;
> -#endif
> -	} while (data);
> +			data = irqd_get_parent_data(data);
> +		} while (data);
>   
> -	if (data)
> -		ret = chip->irq_set_vcpu_affinity(data, vcpu_info);
> -	irq_put_desc_unlock(desc, flags);
> -
> -	return ret;
> +		if (data)
> +			ret = chip->irq_set_vcpu_affinity(data, vcpu_info);
> +		return ret;

What about simpler:
   if (!data)
     return -ENOSYS;
   return chip->irq_set_vcpu_affinity(data, vcpu_info);

instead? No need for 'ret' at all then: it's always PITA to look up what 
ret is set to initially.

-- 
js
suse labs
