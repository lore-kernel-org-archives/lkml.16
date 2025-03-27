Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0D13B2A4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743110268; cv=none; b=CS187BNiAnWpDwIVxKZ+LGx/TXWKFpvkAft1gferKvr3ZbsiGAMdi5OF8vOZ3rbEP3n/jrNjmRLplDHq6wOG46laM13MFIOhEUjS5ewU6M5waSs6qRYVFSuaoZsLEOJSRL5xiqv9NNfYar1loZiFCFzSj3TbHwLuVGASJuSxCno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743110268; c=relaxed/simple;
	bh=BvQRbaxQSlqx7m4nFBaztuJuHW298zewoYkTunMMC+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LSqLNjW/tQMR7Lj4eiIzk82oATq/+UZY2HP/YUcnlpWqtqf9MPZ3EcCzfTCG2O0srePPJarzJYUqx1v948T4Bx5ZFBauWxa8bJ2dapsrVqGgEomISBw7XYHIyln4WRkOnFJcFsqj2vT26R+teJP9YajewkmD+wlVwbHe9DojqHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oRCLK39D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PtgfXGEe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oRCLK39D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PtgfXGEe"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743110265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PbzxBwwliX9UUa4bAwoiTk/55Lz/PeEvdivq0KT3Ong=;
	b=oRCLK39DkVLi29aRLFGH9UiWaEm12L+XdVXerV399/f15CGqjr1xd+tvoj3uLZqUJBrkzQ
	+2MZb6mCMo0gK+WrGDXNmNrv/k8j0AM2z1FkjVCCcVLJCNafa7P19pv8p4vBlLWs5T+jzZ
	h5N9lZAABqrS0Jk3pd25DTH4zJ4RB1kiKFtr5keTZEq5DdIcv8ttv/4yXHCbtQTlq5jw1m
	wKCjeKXOP+aRRWye66juSj7KIFQoVPA6PRviLq5xnhdpIz7OL205hdbvhQ27gZoayJINRI
	XXXb1ifu0fhs8rCSj/lb92Z5R/Nb7c1kJ6mFrmdJYtQAu3O4RUAUFqHPTSE9Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743110265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PbzxBwwliX9UUa4bAwoiTk/55Lz/PeEvdivq0KT3Ong=;
	b=PtgfXGEe2oqHP9LZhDJHXIWMBZNVnW/l8KJK/hrOsIGpxicjcLQmfuRf0bZs9MTJwQuF0z
	xAjpJgZCSAXxD2Cg==
To: Fernando Fernandez Mancera <ffmancera@riseup.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, mhkelley@outlook.com, mingo@kernel.org
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off
 the PIT
In-Reply-To: <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net>
References: <20250327152258.3097-1-ffmancera@riseup.net>
 <87ecyixuna.ffs@tglx> <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net>
Date: Thu, 27 Mar 2025 22:17:43 +0100
Message-ID: <878qoqxjew.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Mar 27 2025 at 20:54, Fernando Fernandez Mancera wrote:
> On 3/27/25 6:15 PM, Thomas Gleixner wrote:
> I followed Ingo's suggestions on V1 [1]. It made sense to me, if the 
> problem was the one described on the commit message. So, is there 
> consensus about this being a false positive? If so, I will send a new 
> patch just suppressing the warning as suggested below.

I personally don't care whether there is consensus simply because it's a
matter of fact, that at the point where pit_timer_init() is invoked there
can't be concurrency on the lock by any means. Therefore it _is_ a false
positive.

Ingo is right that pit_timer_init() should disable interrupts before
invoking clockevent_i8253_disable() and not inflicting the irqsave() on
the callback function.

But it should do so for the sake of consistency and correctness and not
to "fix" a impossible deadlock or an magically assumed invalid assumption.

The assumption,

    - assumed that the author of the offending commit made
      any assumptions at all (pun intended) -

that invoking clockevent_i8253_disable() with interrupts enabled at this
point in the boot process is harmless, is completely correct.

Therefore I really prefer to have this described as:

  x86/i8253: Invoke clockevent_i8253_disable() with interrupts disabled

with a proper explanation that the current code makes lockdep
(rightfully) complain, but that it has no actual deadlock potential in
the current state of the code.

That means the code change serves two purposes:

   1) Prevent lockdep from detecting a false positive

   2) Future proving the code

#1 is a matter of fact with the current code
 
#2 is valuable despite the fact that PIT is a legacy, which won't
   suddenly roar its ugly head in unexpected ways.

I know that's word smithing, but I'm observing a increasing tendency of
"fixing" problems based on tooling output without any further analysis.

I'm absolutely not blaming you for that and your patch is fine, except
for the technical details I pointed out and the change log related
issues.

Though I really want people to sit down and think about the factual
impact of a tool based problem observation. Tools are good in detecting
problems, but they are patently bad in properly analysing them. And no,
AI is not going to fix that anytime soon, quite the contrary.

Taking the tools output at face value leads exactly to what triggered my
response:

  "fix possible deadlock when turning off the PIT"

which is misleading at best as I explained before.

Wording matters, but maybe that's just me...

Thanks,

        tglx
