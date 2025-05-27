Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED831F09B2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348618; cv=none; b=HxcIEaWrQCXGKLSEekA7+NkErq62/VBQ3byGhyz/2L4R24ifoGS6uVZ2KQo3G0tG2wfzof40TKoFdD8ym1EbWwZvoTE+Go2gCQtATQ1yZTtbRiVAV/vrsL3OVgp3NcWwqXdtxbscMHWsH/7meb6DkXNIs+x03nkG2DjgcchkYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348618; c=relaxed/simple;
	bh=d/1RsDDv55BRkRMEmqeGaiiiCLIIUEennlNc4GmVXds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hmudqk3H6UurZKyd+3R7QmoUX9JbfN0RLYqmo5aqARn3drYTohj1+NVTsdqmzIdN0nGvn7EZq7eJoz04Ac1pJS5o3wy1KFjZgGKv8j3Rm5BUvR4QBcgOoAkoRkBiA2TtLWbk1VxNu7ggcHD8PqxIRQuZ6fwJfsgwErKwvYCcK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EZTAz1bo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M+xnelkp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EZTAz1bo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M+xnelkp"
Date: Tue, 27 May 2025 14:23:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748348614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XVG7gAlIrgtQR+PeU2zLWq6LhBQi4+/RyudodX+lgw=;
	b=EZTAz1boJkebluTPIbhI60oWaIXiYmQKtRE6V2N8tBFNIw/Okt7hx2XfF/AKmZUfjuQIgP
	tWv4Hv1AOATGP0dxDGmNHmB6SoYb9CXqEupAwrVcnJqXy3TpxQHYnyLwM+1Ygt+yA16DWu
	IHtUekdIz1e++lrxvGQkgWCWf98eWEBiCsj8UUvBCAjlrdf1p6sqvZz21CFFe1rOyA0+K9
	BhHBi0V+l44fWFWSj5f1cOTSnZFL+8sFOfcVyQBq4t7nej5ZvoCulPM3w9WGI3DZY70JSZ
	WOj7F7JI70P1MAZVRwCimq2Bko2hAIDTNNjmaVfasCrGGKPun49knZCcdoQ9PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748348614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XVG7gAlIrgtQR+PeU2zLWq6LhBQi4+/RyudodX+lgw=;
	b=M+xnelkpsJGSwv/MYS0Y4swKbkClyvpv85tU6pICsm2907RcFr1CiP2oh1yZwjbzJeK1Km
	iFK56jvSYbL8eXDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Message-ID: <20250527122332.M0ucxhwh@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>

On 2025-05-27 12:28:00 [+0100], Mark Brown wrote:
> On Wed, Apr 16, 2025 at 06:29:20PM +0200, Sebastian Andrzej Siewior wrote:
> > Test the basic functionality of the private hash:
> > - Upon start, with no threads there is no private hash.
> > - The first thread initializes the private hash.
> > - More than four threads will increase the size of the private hash if
> >   the system has more than 16 CPUs online.
> 
> This newly added test is not running successfully on arm64, it looks
> like it's just a straightforward integration issue:
> 
> # Usage: futex_priv_hash
> #   -c    Use color
> #   -g    Test global hash instead intead local immutable 
> #   -h    Display this help message
> #   -v L  Verbosity level: 0=QUIET 1=CRITICAL 2=INFO
> # Usage: futex_priv_hash
> #   -c    Use color
> #   -g    Test global hash instead intead local immutable 
> #   -h    Display this help message
> #   -v L  Verbosity level: 0=QUIET 1=CRITICAL 2=INFO
> not ok 1 selftests: futex: run.sh # exit=1

That is odd. If I run ./run.sh then it passes. I tried it with forcing
COLOR=-c and without it. This is the only option that is passed. That is on
x86 however but I doubt arm64 is doing anything special here.

A bit puzzled here.

> Full log:
> 
>    https://lava.sirena.org.uk/scheduler/job/1414260#L9910

Sebastian
