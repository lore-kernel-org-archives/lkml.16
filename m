Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5820A5CF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611651; cv=none; b=JXEcZRbEcZ0CNqecxvkqhYcDjCytv3l2nWWerp5NH1fPFPlUH5xcIdrdg+8+chbUOshwK7ou46rp81qGqEaTqi1Y6n5A6zPgHz5ScBFv4r3WHAJRi5PbwCEt0VJk3vDQA6y0uaYdq4f6aJNd0fur0wsCJF0d9EpQbFJQQ+cslPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611651; c=relaxed/simple;
	bh=lym4PlFCzsVidLXfRlwgX3KdEP4QyssDboyzjChGwKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n3Lk93jtwp2Tf5fo3myg5qvwVRa6OOupkgV0n8eIHTj+VAdwRRZ27YX89+z5v8bxkylTZwNNLm2BdIRrHSetlwzyHPNZFNc2IeEy8UXbKq1tZbh6XxaPLFzci7ygUzFKm5ERRPSc9TepWjRUjDMFO+HgryQCtnTJ9E1zaIggpQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wxw/HA60; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hQ/FCJFW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wxw/HA60";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hQ/FCJFW"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738611647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8bamtf8FlzWepHOfXBH2x2vuIbTirZb2yrFX6swijM=;
	b=wxw/HA60jlp0cZzPTW3rmnOszDP1eUn/SN7IkzslSyuer7GbDtwf4QbMck/VvP6E2oUGfp
	7ubPGvrNnhsSGDAIAIM+upKpgNTdEng9jsacs3xLR8EvIq+c6JoRREKlmrG156lGIEyjyZ
	47C7eWEEXJfYr0NaFvThY/DnaA/o+LhCpbgsX12oOs0xprCKSNnR+MzfiatirAMRsC4GAF
	nrVYwQL5WgnRHsEC/bp5+m/DPRuvPFvRSAw7atFbtcQ0YgzYEqtE5tyuSV80YP/eIetenH
	uPMFCmMSEV5x7XAynyQziMTwpCgCxzzayL7M0xEdy2dsrEs95V4AtCb3gdIARg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738611647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8bamtf8FlzWepHOfXBH2x2vuIbTirZb2yrFX6swijM=;
	b=hQ/FCJFWEcNAInI3CSBpSFAsMBrLVuZ5RaKssyR50w1MCDIcWxH9A9dIRhKR4BsugyHUMN
	qgEoqEA+7zq3LwBQ==
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 0/5] Make it easier to use nested locking for interrupt
 descriptors
In-Reply-To: <20250203175939.3133477-1-bvanassche@acm.org>
References: <20250203175939.3133477-1-bvanassche@acm.org>
Date: Mon, 03 Feb 2025 20:40:46 +0100
Message-ID: <87r04eolz5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bart!

On Mon, Feb 03 2025 at 09:59, Bart Van Assche wrote:
> The number of irq_set_lockdep_class() calls and IRQ_GC_INIT_NESTED_LOCK
> occurrences in the kernel tree shows that nested locking is common for
> interrupt descriptors.

I can see why you think it's cumbersome to nest interrupts, but calling
it common is pretty exaggerated. If my mental arithmetic is not
completely off, then this affects less than 5% of the interrupt
chip/handler implementations.

The restriction is there on purpose because nesting interrupts is the
exception and not the common case. If there is no real reason, i.e. a
hardware constraint, then interrupt nesting is a bug by definition.

> This patch series makes it easier to use nested
> locking by removing the function irq_set_lockdep_class() and also the
> IRQ_GC_INIT_NESTED_LOCK flag.
>
> As one can tell from the diffstat, this patch series removes more code
> than it adds.

Sure, but with that it removes a debug mechanism for the common case,
which is not nested. Line count is not a measure for quality, neither in
one nor in the other direction.

So if you want to go there, then you have to come up with a proper
explanation why removing the 'yell, if not annotated nesting'
functionality is not a problem and the 'simplificaiton' is actually
worth it.

Thanks,

        tglx




