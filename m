Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28502236F7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878529; cv=none; b=eq75OFapUcG9DqwNuwdG9c4iW0KQeEWORWpWlot2NMqgKoIKuFmAAiRLNrTr6vdcrnQKRTxYbw7gROwo23DxTHva/ptwvUU5fwBprnUfa4slSDd1miRnivBVvweeIP92AOZb6MvwBGRqXS7AIfP86lK4WXWE42S7kwiPx3NASaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878529; c=relaxed/simple;
	bh=fMifUbcKIH9GL+WlgPHCW9MRWEZw+luUyryUY67BA/g=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=izTlrUZT3xSdFi0mpjwC2UtH6WL810WgS3GrePahCem+ZwEn3YSebM6bbnSZAwGT03tiGW++wK+wQke5iFho7kxaQe3JigWr9bBp+fYEgI0s2pljIYWzHrGBBKvTZSNyRx2WQWR+Xsvt2l1cFSdZO11Td+MU0ifGk4DC+x1LW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NAhBI6pz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sb9/RQfd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NAhBI6pz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sb9/RQfd"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738878525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okjra5JRtwM/IFJ9mPzxqaiBp8JvAfbCwj9QaFuulks=;
	b=NAhBI6pzQjp7dYdfNRnYjGfq2iSE/6vkTzxenP9nrrLMKbAubz7cpwrtzrOsXS5ieLPucG
	9qmxRXEP0nGPBiVu3DQUqrYTJrvqJyTvxBITXoRCZrmZ0pK6dMy8gucVrEp0SsbuZYcedB
	7hG30fZpfn0bUCLLeN6yFxyhmR/bjyiDRm1a0blciWw9AuPfQAN1MS0oORIXXIQAdIuTPZ
	X6YGbBgOoFPi7OKjGh7YTLEIUMYmkQykl7keW44GHVYzRFtgE7oV2/KPbmw54ILF6w+hS0
	9HfJFJyyZrC02vE0LAUIvKnDtOf+gggLKhQk4nEdUgi/TYeTJmYJq69BfvcDUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738878525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okjra5JRtwM/IFJ9mPzxqaiBp8JvAfbCwj9QaFuulks=;
	b=sb9/RQfd5Np/5/WVrMUbkyeGhuOQjHHCsKmhI9dPw66FCgmMxX9mwt/m0YdnLeqjhxnHnk
	K1EARZYwbyJxNcDA==
To: Jens Axboe <axboe@kernel.dk>, Nam Cao <namcao@linutronix.de>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/12] io_uring: Use helper function
 hrtimer_update_function()
In-Reply-To: <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk>
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
 <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk> <87y0yjm4hi.ffs@tglx>
 <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk>
Date: Thu, 06 Feb 2025 22:48:45 +0100
Message-ID: <87h656n3r6.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 06 2025 at 13:05, Jens Axboe wrote:
> On 2/6/25 9:18 AM, Thomas Gleixner wrote:
>> On Wed, Feb 05 2025 at 11:45, Jens Axboe wrote:
>>> On 2/5/25 3:55 AM, Nam Cao wrote:
>>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>>> index ceacf6230e34..936f8b4106cf 100644
>>>> --- a/io_uring/io_uring.c
>>>> +++ b/io_uring/io_uring.c
>>>> @@ -2421,7 +2421,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
>>>>  			goto out_wake;
>>>>  	}
>>>>  
>>>> -	iowq->t.function = io_cqring_timer_wakeup;
>>>> +	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
>>>>  	hrtimer_set_expires(timer, iowq->timeout);
>>>>  	return HRTIMER_RESTART;
>>>>  out_wake:
>>>
>>> The timer is known expired here, it's inside the callback. Is this
>>> really necessary or useful?
>> 
>> It's not strictly required here, but in the end this allows to make the
>> .function member private, which prevents stupid code fiddling with it
>> without proper sanity checks in the debug case.
>
> While that makes sense, this is also a potentially hot path for min
> timeout usage, which with small timeouts for batch/latency reasons
> can be run tens of thousand times per second. Adding a lock and IRQ
> dance would be counter productive.

I fundamentally hate the fact that C does not enforce encapsulation in
the first place. :)

> How about we just add a comment on why this is fine, rather than

Comments are the worst of a solution as you know.

> slow down a case that's perfectly fine by wrapping it in something
> much more expensive than a simple memory write? Or perhaps have
> a basic helper to set it that doesn't do the unnecessary irq lock
> guard? That would still allow you to make .function private.

The right solution is to add a hotpath helper, which falls back to the
more expensive variant with some anyway expensive debug option, or make
the expensive part of hrtimer_update_function() depend on that debug
option in the first place and otherwise fall back to a simple store.

The latter is the right thing to do. Let me fix that up in mainline.

Thanks,

        tglx


