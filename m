Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193818AE2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105260; cv=none; b=E6fUvX/A2sVUVhD7MThHRh9QgmGSl8drJ6S5p5+eCvOQzXE07M5+oyxmu0C6WFfShwOgTWvPNmgRePRZoctjmCw0+pr3M2aFVQrQaOrMnGABEhovnH7pMdxPB7akZd5NU3SeaoLUZRnCy7Jf8vgekrkZdZCbI7WHFkKVGgY37Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105260; c=relaxed/simple;
	bh=eBpNSGuVPssjgUGC8PA/BU88KH1iITq0UyJ33TKvc0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foZ0otJvR5Ui7rn5LoOj6piRmVxXMQVOBsgNDn7Hb8S6knKfjjd9wKv/yJXevTkETpLRqAN66Q6V+L6KieKfcyomr6/jEBiE7R1teJuDsLaXavP+bHNMtnc8eEMM+AKt+3hjfJZNWYIi3U0aIHMNwPea3KYsYDk+U0SOfnMor6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=EbJLz+SA; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="EbJLz+SA"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4ZNvVx3mThzDq8V;
	Thu, 27 Mar 2025 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1743105257; bh=eBpNSGuVPssjgUGC8PA/BU88KH1iITq0UyJ33TKvc0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EbJLz+SA0FfkWIop7kVURaMRZNCJc2NjrFVITIUWgS0yXIEF9nBqkLK+d9ox3nrF5
	 2lxp2sKf2biFpJfKwPUvv5WkzlLZB3ecL06OUTZkLUUvTokrnkAZLyhrGGxWuewAjI
	 qCtamKqler0MtHsQ6nPY+eBl+FWjwwNQ1zWGDmTE=
X-Riseup-User-ID: E65CD4A0DAD85FE86D5D9C399ED394A8AC308DAE58D0505E4337FA9118A3EDCA
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4ZNvVv6lWtzJtXW;
	Thu, 27 Mar 2025 19:54:15 +0000 (UTC)
Message-ID: <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net>
Date: Thu, 27 Mar 2025 20:54:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off the
 PIT
To: Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, mhkelley@outlook.com, mingo@kernel.org
References: <20250327152258.3097-1-ffmancera@riseup.net> <87ecyixuna.ffs@tglx>
Content-Language: en-US
From: Fernando Fernandez Mancera <ffmancera@riseup.net>
In-Reply-To: <87ecyixuna.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/27/25 6:15 PM, Thomas Gleixner wrote:
> On Thu, Mar 27 2025 at 16:22, Fernando Fernandez Mancera wrote:
>> As the PIT could be disabled during the init, it can possibly cause a
>> deadlock. hpet_time_init()->pit_timer_init() is called without IRQ off.
>> It assumes that clockevent_i8253_disable() is IRQ-safe, which it isn't.
> 
> It assumes nothing and all the missing interrupt disable is causing is a
> lockdep false positive.
> 
> Lockdep complains correctly due to the observed contexts, but in reality
> there is no possible deadlock at all. Definitely not the one your
> subject line is claiming to be possible.
> 
> At the point where pit_timer_init() is invoked there is no other usage
> of 8253_lock possible because the system is still in the very early boot
> stage.
> 

Thanks for taking the time to review the patch.

I was not aware of this. I took a look to other functions that used 
i8253_lock like pcspkr_event() and thought it could be possible.

> So disabling interrupt here just prevents lockdep triggering a false
> positive and not more.
> 
> Please analyze problems properly instead of assuming that the lockdep
> splat is the ultimate truth.

I tried, but it seems I failed. I just found out this while working on 
something else not related in a VM.

> 
>>   bool __init pit_timer_init(void)
>>   {
>> +	unsigned long flags;
>> +
>>   	if (!use_pit()) {
>>   		/*
>>   		 * Don't just ignore the PIT. Ensure it's stopped, because
>>   		 * VMMs otherwise steal CPU time just to pointlessly waggle
>>   		 * the (masked) IRQ.
>>   		 */
>> +		local_irq_save(flags);
> 
> Why save()? You just established that interrupts are enabled here, so
> this really wants to be:
> 

I followed Ingo's suggestions on V1 [1]. It made sense to me, if the 
problem was the one described on the commit message. So, is there 
consensus about this being a false positive? If so, I will send a new 
patch just suppressing the warning as suggested below.

[1] https://lore.kernel.org/linux-kernel/Z-B6ob0zLZr81e8i@gmail.com/

>                  scoped_guard(irq)()
> 	              	clockevent_i8253_disable();
>    		return false;
> 
> Thanks,
> 
>          tglx

