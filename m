Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2628A3FB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290729; cv=none; b=OWkKh6wTRreL1gIgkBELEyulGCpIQXoBFNvyS13VmK36/zuzFKQpTRj6ugg5cqwIqYR1uohVxskjmA2niyFDbYmJLeawDJFzcQDdvVlMHZXZtRZp5gt6Z8B6DGjm1bYSQguivx6TJdYA9MwgEYcVQNfMWb2ecNvvzLRDhn4A9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290729; c=relaxed/simple;
	bh=VnOjS1BcrM1dFbNaXGuQroXEGwjJQpp0qm5mchxF+So=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b2Yqt/5VfHDKdmxBZSpucv2snh+oq1NGMJnOWMJwTCLDPJgptrLehbulhMOrQmib4Y2dL90unvl5lyPO9wGWT/ErFte/TDIGpbVY2KxNRc8Ow5l6APIIkoKRlHYGvbXunpkc17Jy3IWG0ZfJGndd9f/cFaieZwH1kTHQp15EAvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=korCSXfN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KRRNXEV/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="korCSXfN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KRRNXEV/"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744290725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnOjS1BcrM1dFbNaXGuQroXEGwjJQpp0qm5mchxF+So=;
	b=korCSXfNG0xHCsMh/vELr+HMOkFPWnvB/oEFfGx2i4Nf1mqvFipW7qvZOFwEmJwBFwptfJ
	i9pkjDCDgPKrWCMUyH8E4Co07Olq1uLSGRU/waQ2vPnJQo7v0rT+ICAbaE6Ee7U3uWEdSr
	edUIrYSSnYYW9avx0tHuoWC/uTdh/rnja328XdmFdFwAuILz/Y48Ot1nPbFbbCQpMGqbw8
	4haYS3iQHFfum3bI+66t7hj0LxA6E1mRqJBUPEYzncYK8UYz/TVbPZriXYbF005HxpDNtt
	vBp1VKucDpOwFB5F51CHI4wxr7Wtxj8ifDRB/Awu+8MoHYirNFJy350jAnnctw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744290725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnOjS1BcrM1dFbNaXGuQroXEGwjJQpp0qm5mchxF+So=;
	b=KRRNXEV/p/KrPPw2HesUg5wRvt1D1wiq2tWuA/K9/WHFNopkwWPWplRhvpOmi2JTGO/OM9
	QwuSGbulFfZ8fNAQ==
To: Ingo Molnar <mingo@kernel.org>, Fernando Fernandez Mancera
 <ffmancera@riseup.net>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
 mhkelley@outlook.com
Subject: Re: [PATCH -v4] x86/i8253: Call clockevent_i8253_disable() with
 interrupts disabled
In-Reply-To: <Z-uwd4Bnn7FcCShX@gmail.com>
References: <20250327234357.3383-1-ffmancera@riseup.net>
 <Z-uwd4Bnn7FcCShX@gmail.com>
Date: Thu, 10 Apr 2025 15:12:04 +0200
Message-ID: <87zfgorwij.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 01 2025 at 11:23, Ingo Molnar wrote:

> I've cleaned up and simplified the changelog, see the patch below.
>
> Thomas, does this look good to you too?

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
