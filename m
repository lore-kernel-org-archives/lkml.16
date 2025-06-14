Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABC23DE
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749882093; cv=none; b=js3+Lx8d2cBH6LuEnnSJ1l3Y324zfSkS7IT3442boTtJ4cU8VY+pvGfikSIuvsBHZVvy+ghfEtbClWgn3Gd+40L4cic9aBFilyVJM3/IrOU/19GlytWg1beyZx3JFHwGnKHkaLaUCF4125hhnvNqxkhtXEznARiO9p2bTwUOHK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749882093; c=relaxed/simple;
	bh=95ADFEQiX9IdK/42dudIAHQRBZOvoSf4FhC7jAxAVzU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D2aJR7tXKIe0eZZLgtSlVvyoILbm1L/3Xr3/u9CkTR+hh44AReh/pEcyV6eOr1X4xzEbM8+XT9xcORh9pdroFHpZqs68b3JZYi/2cUmkvw0jx2tSR1bfHhorAtYP5i4WBfLYKLmZI1/Nhs9Mi3XC2pnRnQZauQkMn02/tLh+Ii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Le9uwJ+B; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GmrAYV5+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Le9uwJ+B";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GmrAYV5+"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749882089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PT1ufglcQ9xgw3VQ6T3yx45DKatuJau9u16ovQXuOIk=;
	b=Le9uwJ+BBj6pjO5o1HMnCsLFR9vEIZpEql+r4WKrSyEM1iiiADFC22DvUIZjFU6clY5T+K
	5b3oVecLtDKi+rgROBYXrNcxRgixGPBjXfIw0xNbs3aqarW1IkaG+aNmcnYCdhfs7xpfEr
	Jwwq21Q6LRWFh/UKrRkd79t+NNnfdXcqJx1dtQ5mFpl7KT8d/DSXZ22u9F+kfwIm4QPc2g
	dpXY/Kd/PWA2NRRFsYnJrwzZLFqdK4/9dxsH8Iv4AG+6AtxV7DLt6Zqll4t+ETwco4nIrX
	vt/95gHzw0Hy1FOgWeH5S6D6HU8Zyk5gVCAkYbyykQINkVqfrrUtZ7DONfU0tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749882089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PT1ufglcQ9xgw3VQ6T3yx45DKatuJau9u16ovQXuOIk=;
	b=GmrAYV5+KR4X9J7nifgoIhV3/TIrqILJIsjKWLiAEWpC0tmSsmRXZVqDQFzDVxmFAteVnG
	+HzMwjU0Jutky1Ag==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/entry: Remove some redundancy checks on syscall
 works
In-Reply-To: <20250613202937.679-1-khaliidcaliy@gmail.com>
References: <20250613202937.679-1-khaliidcaliy@gmail.com>
Date: Sat, 14 Jun 2025 08:21:28 +0200
Message-ID: <87frg2q1w7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Can you please reply to the mail you received, so that there are proper
In-Reply-To and References tags in the mail, which are required for mail
threading?

I almost missed your replies because they ended up as single mail
threads without reference somewhere in my endless mail pile.

On Fri, Jun 13 2025 at 20:28, Khalid Ali wrote:

> First if we are talking about performance then we may need likely() on
> SYSCALL_WORK_ENTER since the probability of condition evaluating as
> true is very high.

That depends on the system configuration scenario and the likely() has
been omitted on purpose.

> Second syscall_enter_audit() missing SYSCALL_WORK_SYSCALL_AUDIT
> evaluation, aren't we supposed to call it only if
> SYSCALL_WORK_SYSCALL_AUDIT is set?

That's redundant as syscall_enter_audit() checks for a valid audit
context already. Both are valid indicators and go in lockstep. So it
might be arguable that evaluating the work bit is cheaper than the
context check, but I doubt it's measurable.

Thanks,

        tglx
