Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129AB25D8E8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355429; cv=none; b=kR54VkFD7ItHD9/p6ADLz/TPmcoaXIpFdRZPOWwMp96oJOcvNsMKd+/nUDOtx/2a7M2li0yYAaAAPsNaVgp/az4m34V/4Tw+jKtY96Xs7B/4q+BlSZPqPsjsxTYLfqPYbmmaY428QkKTTWCLZfmyw7uGB+QoIAtAtZ2Kdc4L+VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355429; c=relaxed/simple;
	bh=rb/BmoYqR45KfnTXLrsaCgOveYC96BGwSqTyVshbTiQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LyqM6K6IC66UrEwJbYzzeb9tqqxSK/fCEndTzNRd0FH107w4XKr+jQBgBZP4vOgfM989DMB2r6JUJQH9mZcjEst3Xm8GRoV0TeeuEhLcvnO9J+RXpkwCqLFIT4dgH4Kn/gEWQAx17/F0gqzi+iTBp17vE77x2Jk5dj8E3mbzyBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Av6364/o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gx039uag; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Av6364/o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gx039uag"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751355426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52mJ6YXb074UclTAIIEI3gRqKYbFKCVVK/Nxy3/aK+s=;
	b=Av6364/ooJFMj2YGsmCfe1NGq4Cml642+RWjTyHCnImA0TdjXmKw5V8MgxVF4FZTA7eMNO
	zDCt6bnDym0MbXbvy5RN5zMQohJplezjTZvLxCUTG3x7m9x3+fSQTjlhNe3oNrh529w/kB
	rPgYjCsT91nZ42CVq7Fu40lBXhk+Hf8HG3ho/Rdft/9eiuCd1N9SR1d8kKk4crqNHIc8hN
	4WEyyQlqb5El1q2SU88L4cxdDme1npUcTJCUMARYrgXEf8DpJrXzB93J2mlaiese4S1inX
	dKq3tRN6vQ8pylNBMMWFK5L+VJQixzv8+44t+CHCpR4y1a69RXccTPGuyDEanw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751355426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52mJ6YXb074UclTAIIEI3gRqKYbFKCVVK/Nxy3/aK+s=;
	b=Gx039uag5rhfT7vkLCHyITf5tWargR0DnEVGcqJHr1KBjxJSe6u2MjVVhBQR5mc00SaNjm
	Fn9iE6nWHdrADIBw==
To: Wladislav Wiebe <wladislav.wiebe@nokia.com>, anna-maria@linutronix.de,
 frederic@kernel.org, mingo@kernel.org
Cc: akpm@linux-foundation.org, bigeasy@linutronix.de, peterz@infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
In-Reply-To: <9dcfe1fb-0361-4d13-a4d5-fbc274f68db7@nokia.com>
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
 <875xgdnsmr.ffs@tglx> <9dcfe1fb-0361-4d13-a4d5-fbc274f68db7@nokia.com>
Date: Tue, 01 Jul 2025 09:37:05 +0200
Message-ID: <87frfgmkf2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01 2025 at 08:10, Wladislav Wiebe wrote:
> On 30/06/2025 17:42, Thomas Gleixner wrote:
>> Define sufficient. That really depends on your use case. For a real-time
>> system a hard interrupt handler running longer than a few microseconds
>> can be problematic.
>>
>> So instead of adding some single purpose mechanism, can we please add
>> something flexible which can be used for a wide range of scenarios.
>
> the initial goal was to cover regular non-RT cores, as on isolated/tickless cores
> we should not have device interrupts.

Who is 'we'? If you refer to your use case that might be correct, but
you cannot make assumptions about the rest of the world. Real-Time
systems are as divers in setup and configuration as anything else.

Thanks,

        tglx
