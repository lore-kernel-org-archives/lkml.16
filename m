Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599004A35
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738268800; cv=none; b=fcJWe3o3Yjj+Eu8Gl2uN6gsGPIHA15kPaYa76FK6bUe91wZjphthALFB5AK6OfaRnx0UTlCKsjx4hRLoDCCkjJW6OWxgAI17/zn19QFOh64sPLzJIuCdqe+RJCoLk4NjdsdkabFgNPjRx+wpMBNDOLumOTMtRtqJzOUQX2lzA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738268800; c=relaxed/simple;
	bh=96TCbnC06LiDkWQVhnQQKMqfY2RjsADjMkvAHJ4kSsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO3VY10tiM/Gz8OBqhU5/GWaQeJovB1GLRlFbjaZyI+Z9FVyjcURUhhK1/GrL3pQwCRaDMGtqlyJPOjyViaI8ZGvlTernozwUtWAg8Nb/Mbln9up7ohrQCab/XRLxrg2Injj/d6MbrYyBDiWDwEMRxUkBov/mGDc2I6PgLnLv7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0ko0sTai; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MaqkWpfu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0ko0sTai";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MaqkWpfu"
Date: Thu, 30 Jan 2025 21:26:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738268796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=raKStGmQ1HgcDzebMHePJVys7D0i3X8hHAKlsWuJCIA=;
	b=0ko0sTaiJJwaxW8bhn13GnM7LjqYjETxlX1v5/dPILw7a8h+A1dw+OPBtBgHpD3MWPMQvK
	+7fabej8mr1u1GhgVImjjm1oI5HgPf+PvJY2UCuunyGfZvYwSOvAIYdyuuo8TVD8DpvRtQ
	FjV/9KY14DF6G38sW2l/RJVWnyJu1rFJznFAIkAn5E9NRU3Bf/h0mT8qEoPpGiI8wAw43F
	QIZP/i7RtljRdDPAYGxF5pezvSLzHPNXup1IUw7m1QpGkaTW/kBrD6bh+EQTgk/RH7/Bv4
	7AJX+68opRRVXyy/F8N0SNicKhlAMUHzTJhNimmcQD7WXUmYGj2PJP1SkIF+DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738268796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=raKStGmQ1HgcDzebMHePJVys7D0i3X8hHAKlsWuJCIA=;
	b=MaqkWpfuGWBc1JyZ5Qgj5qBjueGmZfGBO1JQrK/JVn4QpWW3wFPIpaDe2Of2y95FyM228e
	AZe2qZ2c0igSNVDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
Message-ID: <20250130202634.eeb9TfkW@linutronix.de>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
 <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>

On 2025-01-30 22:27:07 [+0530], Shrikanth Hegde wrote:
> > | #DEFINE need_irq_preemption() \
> > |          (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> > |
> > | 	if (need_irq_preemption()) {
> > 
> > be a bit smaller/ quicker? This could be a fast path ;)
> 
> I am okay with either way. I did try both[1], there wasn't any significant difference,
> hence chose a simpler one. May be system size, workload pattern might matter.
> 
> Let me do some more testing to see which one wins.
> Is there any specific benchmark which might help here?

No idea. As per bean counting: preempt_model_preemptible() should
resolve in two function calls + conditional in the dynamic case. This
should be more expensive compared to a nop/ branch ;)
But you would still need preempt_model_preemptible() for the !DYN case.

> > > +	       preempt_model_voluntary() ? "voluntary" :
> > > +	       preempt_model_full()      ? "full" :
> > > +	       preempt_model_lazy()      ? "lazy" :
> > > +	       "",
> > 
> > So intend to rework this part. I have patches stashed at
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=preemption_string
> > 
> > which I didn't sent yet due to the merge window. Just a heads up ;)
> 
> Makes sense. I had seen at-least two places where this code was there, ftrace/powerpc.
> There were way more places..
> 
> You want me to remove this part?

No, just be aware.
I don't know how this will be routed I guess we merge the sched pieces
first and then I submit the other pieces via the relevant maintainer
tree. In that case please be aware that all parts get removed/ replaced
properly.

Sebastian
