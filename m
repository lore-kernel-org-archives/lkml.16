Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FDB610D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034725; cv=none; b=FmNZC/Nqeudx6K63u6A51rGOSe4aDoem0BcwRj1N+PAT82wYBuABreLmQekGXfzdvWDVKEXAyjTUPLlpB98LrUJXC0PBUYyZfyRIszvAMwCZSXOPd4CQh60stIcSVQl7+bWxqrDjAhyX9dFVVK7p4yC+c29cbJSC64vmHXKSXVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034725; c=relaxed/simple;
	bh=crPLgghiOnNAL85BUbI/KFRTiOOI9zFhY8oyGArgjIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnLszBrNS1URhp2ZMBtQNQR3QH8/ClaIzG1Ty3/zhRWwzzqp8NQZpFiE2gL8trXk2beUDIwcUhWxEUBFo40Hh4v5Bi3zbL867qMlbP2j+QNu3fyaokZPXnMucUbYqN9X+HZBpQ88qNUxMLKY4DVu8+Q0ZfWYYUki3tUeRgaZtmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gefRfbrc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gefRfbrc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485DAC4CEE7;
	Mon, 12 May 2025 07:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747034724;
	bh=crPLgghiOnNAL85BUbI/KFRTiOOI9zFhY8oyGArgjIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gefRfbrcCkPL8q3XQo1al8dMQlsdLGjAYBbQQ3O5+FRVH77bH1/eB8UXK9cxyh9QA
	 Qq9hGSvKRDX8h0vAPky+V0/ZHCmsiSijYqmUhfOUbmMklTtijrGXxLDGGOL2rDLCFN
	 2pgbLoQj24pwQuEjLEEJu45DU7qJw/2KrVXDbTcyej/2oCvivvDe5Qv2EGM/qjoF8f
	 fcZsBZ/aU7PUhVMRy5PuChaoYv6DXqRSBWEPyHPjr4u1QNPvz2KyeAmXKriuc1+m5/
	 cfHmI0S1bj7vI/ln6nUMuvUfHstF5vxz8P8iYiuv6QjuzhPWQQRilCdUHqJ5WXnExY
	 o63BmDSjEmjnA==
Message-ID: <0a61672b-1782-43ea-bf10-b6088a1fd2fd@kernel.org>
Date: Mon, 12 May 2025 09:25:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 26/45] genirq/chip: Rework irq_set_handler() variants
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, tglx@linutronix.de
References: <20250509132211.GA3618294@ax162>
 <20250511172911.1008109-1-ojeda@kernel.org> <20250511174923.GA3193067@ax162>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250511174923.GA3193067@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11. 05. 25, 19:49, Nathan Chancellor wrote:
> On Sun, May 11, 2025 at 07:29:11PM +0200, Miguel Ojeda wrote:
>> On Fri, 09 May 2025 14:22:11 +0100 Nathan Chancellor <nathan@kernel.org> wrote:
>>>
>>> I am investigating some cases where
>>>
>>> WARN(!irqs_disabled(), "Interrupts were enabled early\n");
>>>
>>> in start_kernel() in init/main.c is triggered in certain builds with
>>> clang after patch 23 of this series (very bizarre since the conversion
>>> seems to be correct) and I happened to notice that this conversion seems
>>> to be incorrect? Should this be scoped_irqdesc_get_and_buslock() like
>>> below?
>>
>> Yeah, I am also seeing this in next-20250509 in a LLVM=1 arm64 defconfig + Rust
>> build under QEMU.
> 
> I noticed that the warning was reproducible with just the first patch of
> the series that adds the lock guards and patch 23 but also several other
> individual patches within the series, as I could not just revert patch
> 23 on next-20250509 to fix it. I have no idea why yet because I have not
> had the chance to actually sit down and dig into it but this diff fixes
> every instance of the warning that I saw in my tests... :/ could be a
> compiler bug or just some difference in behavior between compilers.
> 
> diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
> index bd2db6ebb98e..94f463de8f26 100644
> --- a/kernel/irq/internals.h
> +++ b/kernel/irq/internals.h
> @@ -176,10 +176,9 @@ __DEFINE_UNLOCK_GUARD(irqdesc_lock, struct irq_desc,
>   static inline class_irqdesc_lock_t class_irqdesc_lock_constructor(unsigned int irq, bool bus,
>   								  unsigned int check)
>   {
> -	class_irqdesc_lock_t _t = {
> -		.bus	= bus,
> -		.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check),

I assume the value stored by __irq_get_desc_lock() to &_t.flags is 
overwritten by 0 by the initializer. class_irqdesc_lock_t::flags is 
later than ::lock in the structure, so __irq_get_desc_lock() should be 
called, setting ::flags, then the initializer should set flags to 0.

> -	};
> +	class_irqdesc_lock_t _t = {};
> +	_t.bus	= bus;
> +	_t.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check);

That's why this works ^^.

>   	return _t;
>   }
>   


-- 
js
suse labs
