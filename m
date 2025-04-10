Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B75284B55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286075; cv=none; b=RRbg85dq0Cb2SLvVxyjkk+Ei0uuuQW2VzV9KqBDeXqwbnRJCfwIY6QU2YHVkBgOwZwGY+fBQL/kNXEWGw1FOHrVhg9I8iKFjKMdOXpnulHwh8CUrErUSLL891TMHOi0FxiL8FmflajukoyXXbGuhjJORjszh7gWs01Qnhz0iOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286075; c=relaxed/simple;
	bh=CzZmPeBc1WaePCOkdHE+T7Dnl1T2xzNm3sJ4FxltIlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DC1sipNMCGRRVaUj5nkAIXf1h+P3dRecWOByX59Rr1qzFPR0U6wFEB1UOW6wiCGVtUkO+kYHTt6svWcBItOK3Roj+Cik4pUEiXZXhPFheze8tlqfgu4pnwCMXu6B7aIiu735otiLVQlweAApVvZqnlUrRYnk7Cf8nJdftzjJfP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=bUgL77Uq; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="bUgL77Uq"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4ZYJBq0VQPz9s8s;
	Thu, 10 Apr 2025 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1744286067; bh=CzZmPeBc1WaePCOkdHE+T7Dnl1T2xzNm3sJ4FxltIlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bUgL77UqUaxh9PgUkqB1TrRBKiwJArt3Y2f3EXMSUryn2pnes0SRD6UAj+4T2JivO
	 mrFK6PxF/vAIm5vzwxxHOPsPQMjEWGMDle6E+HkwGDZDbUbq7Cv9HQ3K9P258x2xRJ
	 rSsiloBqMve2smphvHW8yOs3LxWxuK40Tp9mFKew=
X-Riseup-User-ID: 96F09E97E326B1C7E79261F01462ECA5DF0D15A6911EBA13188A0766900E0430
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4ZYJBm3MYnzFvby;
	Thu, 10 Apr 2025 11:54:24 +0000 (UTC)
Message-ID: <f457186f-2abf-4a23-8285-da876c83b7c6@riseup.net>
Date: Thu, 10 Apr 2025 13:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH -v4] x86/i8253: Call clockevent_i8253_disable() with
 interrupts disabled
To: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
 mhkelley@outlook.com
References: <20250327234357.3383-1-ffmancera@riseup.net>
 <Z-uwd4Bnn7FcCShX@gmail.com>
Content-Language: en-US
From: "Fernando F. Mancera" <ffmancera@riseup.net>
In-Reply-To: <Z-uwd4Bnn7FcCShX@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2025 11:23, Ingo Molnar wrote:
> 
> I've cleaned up and simplified the changelog, see the patch below.
> 

Thank you. To me it looks good. Should I repost it?

Thanks,
Fernando.

> Thomas, does this look good to you too?
> 
> Thanks,
> 
> 	Ingo
> 
> =========================>
> From: Fernando Fernandez Mancera <ffmancera@riseup.net>
> Date: Fri, 28 Mar 2025 00:43:57 +0100
> Subject: [PATCH] x86/i8253: Call clockevent_i8253_disable() with interrupts disabled
> 
> There's a lockdep false positive warning related to i8253_lock:
> 
>    WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
>    ...
>    systemd-sleep/3324 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
>    ffffffffb2c23398 (i8253_lock){+.+.}-{2:2}, at: pcspkr_event+0x3f/0xe0 [pcspkr]
> 
>    ...
>    ... which became HARDIRQ-irq-unsafe at:
>    ...
>      lock_acquire+0xd0/0x2f0
>      _raw_spin_lock+0x30/0x40
>      clockevent_i8253_disable+0x1c/0x60
>      pit_timer_init+0x25/0x50
>      hpet_time_init+0x46/0x50
>      x86_late_time_init+0x1b/0x40
>      start_kernel+0x962/0xa00
>      x86_64_start_reservations+0x24/0x30
>      x86_64_start_kernel+0xed/0xf0
>      common_startup_64+0x13e/0x141
>    ...
> 
> Lockdep complains due pit_timer_init() using the lock in an IRQ-unsafe
> fashion, but it's a false positive, because there is no deadlock
> possible at that point due to init ordering: at the point where
> pit_timer_init() is called there is no other possible usage of
> i8253_lock because the system is still in the very early boot stage
> with no interrupts.
> 
> But in any case, pit_timer_init() should disable interrupts before
> calling clockevent_i8253_disable() out of general principle, and to
> keep lockdep working even in this scenario.
> 
> Use scoped_guard() for that, as suggested by Thomas Gleixner.
> 
> [ mingo: Cleaned up the changelog. ]
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Fernando Fernandez Mancera <ffmancera@riseup.net>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lore.kernel.org/r/20250327234357.3383-1-ffmancera@riseup.net
> ---
>   arch/x86/kernel/i8253.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/i8253.c b/arch/x86/kernel/i8253.c
> index 80e262bb627f..cb9852ad6098 100644
> --- a/arch/x86/kernel/i8253.c
> +++ b/arch/x86/kernel/i8253.c
> @@ -46,7 +46,8 @@ bool __init pit_timer_init(void)
>   		 * VMMs otherwise steal CPU time just to pointlessly waggle
>   		 * the (masked) IRQ.
>   		 */
> -		clockevent_i8253_disable();
> +		scoped_guard(irq)
> +			clockevent_i8253_disable();
>   		return false;
>   	}
>   	clockevent_i8253_init(true);

