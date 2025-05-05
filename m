Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA621537DA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433859; cv=none; b=ncjZpMgcbjda9HwyS3mn30eDFcfDrk9JULmC3uKnDyReUPTonH+tY5jVjlbLxMJuX4zz/yM67TWlZWKffvz3Kvu+ctVvKInMdVL6foRz7vjnIuo4Z6baPhcvKEUPggft/qnhNgXh/gr2IXRmoh2ExWRaFP9C+WUxY0udtkBpCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433859; c=relaxed/simple;
	bh=NRXN//urkcHwyJGmxayQDIVbwFP1alUn7Fp6UQh+C40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DohKJV+p0QAhjAdtX4pJ0tyrdD/a0boHf9j3dSzIe3p9FAYFWJrdiFf2bK0jRA1OtVPo4zgubu1B1KljzCkemOt/RUEQJN09O8LhVFeCUtCf/psSca9a9dZF8FipZQ6G2UuEirQtlTx+dSeXjvbdzU/vzL4EJ3tLn48udCSiDZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NwCJWTXg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WDi/vF0X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NwCJWTXg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WDi/vF0X"
Date: Mon, 5 May 2025 10:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746433855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HC0Meut0CmVPYLyFRhz2i7zr2ED964J1e7GQg9+YYmQ=;
	b=NwCJWTXgU7Zjam6cyIrDZjMNW4A5smJnIZIibwl4XNJi6u4TwKJq5/IHX4XChVD2Dp95nO
	ES1Elh7kpZ3wuFzO0RORCrhvGHOzJrGxsvfAsrt7nUAd5kx7XUZUp0Xc7BL2j0FNg4D/rk
	rWUSKFzoMO5a6u5pBvbnR+BvUEpNegf4vizwWE1gm/IXktYWtFOkDQZEHfzRDCvbY5Ose+
	97rdmmBLLGVlHt2auxZvhjwGoF7XIWUIh1UtQr4eInlohm8MqzcUkUGs7tjMvjNqsMN32F
	ck1rixr++uPhy5G2tGIeDib42SWUJz4WgcLLY1vOVxvF0Vt8GGaiE6t1TZAAyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746433855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HC0Meut0CmVPYLyFRhz2i7zr2ED964J1e7GQg9+YYmQ=;
	b=WDi/vF0XwT457py3xow92X8gMH/giaz23LQZe24dY4zDjGEI9ptg1Dtm7AyPj4Z/c/zW2y
	NzFLUkGKXdD7GuAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] clocksource/i8253: Acquire the lock disabled interrupts.
Message-ID: <20250505083054.l7eNRXnn@linutronix.de>
References: <20250404133116.p-XRWJXf@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404133116.p-XRWJXf@linutronix.de>

On 2025-04-04 15:31:17 [+0200], To linux-kernel@vger.kernel.org wrote:
> On x86 during boot, clockevent_i8253_disable() can be invoked via
> x86_late_time_init -> hpet_time_init() -> pit_timer_init() which happens
> with enabled interrupts.
> If some of the old i8253 hardware is actually used then lockdep will
> notice that i8253_lock is used in hardirq context. This causes lockdep
> to complain because it observed the lock being acquired with enabled
> interrupts and in hardirq context.
> 
> Make clockevent_i8253_disable() acquire the lock with disabled
> interrupts.
> 
> Fixes: c8c4076723dac ("x86/timer: Skip PIT initialization on modern chipsets")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

A gentle reminder.

Sebastian
