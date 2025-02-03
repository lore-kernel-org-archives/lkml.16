Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F27202C45
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581891; cv=none; b=dVQVp+d4j/9ubMb7PoZs7nBPCmpXUq68TPJk3pRM+dhiBELOstr6ByeDwF4Wzs8C0s4wjCIh32cx39PkJInijYwcqVkjMl53IT7MGGjGQuwYagMacGNVru0QUdq1YX1OuWK5pRsrX5JbnFMeqSHo1NCu5E68xP9mdGVOqtvFbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581891; c=relaxed/simple;
	bh=5X72Hai7//H5vVuAskmLF2YjNMHNMMYAiw7J8/Iu5lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jD/gK8KdgNl4jZwobs+kux1hy+1LLPZrwTibhE/7NheHBgeYAWtT4ylFW6Xad7moMYn93HRrNX6o9nXSnc3q2euLTzJKiglrS1W4imUsXBbXw9a499kok0o3vU81YJ5+QCK1U3vmFSPaXMxVbTKcphdARXK5Qx3G3rVni2brgeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g5JtSVjd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g5JtSVjd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dDbJLZWS9M+Qr7lPnraTaHsKQLmLmaYljUbDsiPJC0A=; b=g5JtSVjdT2O6LRzmbctw7kRGDp
	ZZ5snZG4RleB4EyQV8FQ10BpX5ZG9PJcOkz23C5/Dze97Td8tVSZp9/j/KUC7cpoxzS+glyLYD/3F
	PHayJugeFGIRPCazIgGunARQupgAZHJ1stI4HJ9VI/0+UX8q8JO+uRfWPCIAsjpfn54XmRKanXXpG
	U4b6+W9nHE5aw75h9bSbPZQuk6TS8klBe/lXRrj7QaJrGvHNLgHZG2B2rqZdH5cOzcw/w81SGhcpn
	dp3xYu7eZllJuTWU/r5c5RVafZuskuZAqFN/KQDD9jxVjuk91RJ2OHkd2zYV1Ki7QABnr/+viZWkZ
	5I9kCpJg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1teuZK-0000000G4qT-385t;
	Mon, 03 Feb 2025 11:24:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B3DDE30035F; Mon,  3 Feb 2025 12:24:45 +0100 (CET)
Date: Mon, 3 Feb 2025 12:24:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <llong@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] locking/lockdep: Disable KASAN instrumentation of
 lockdep.c
Message-ID: <20250203112445.GE505@noisy.programming.kicks-ass.net>
References: <20250131165020.878944-1-longman@redhat.com>
 <14eb5880-7df1-4717-8f6e-e667328c369d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14eb5880-7df1-4717-8f6e-e667328c369d@redhat.com>

On Fri, Jan 31, 2025 at 04:47:06PM -0500, Waiman Long wrote:
> On 1/31/25 11:50 AM, Waiman Long wrote:
> > Both KASAN and LOCKDEP are commonly enabled in building a debug kernel.
> > Each of them can significantly slow down the speed of a debug kernel.
> > Enabling KASAN instrumentation of the LOCKDEP code will further slow
> > thing down.
> > 
> > Since LOCKDEP is a high overhead debugging tool, it will never get
> > enabled in a production kernel. The LOCKDEP code is also pretty mature
> > and is unlikely to get major changes. There is also a possibility of
> > recursion similar to KCSAN. As the small advantage of enabling KASAN
> > instrumentation to catch potential memory access error is probably
> > not worth the drawback of further slowing down a debug kernel, disable
> > KASAN instrumentation to enable a debug kernel to gain a little bit of
> > speed back.
> > 
> > With a debug kernel with both LOCKDEP and KASAN enabled running on a
> > 2-socket 144-thread system, the time to do a "make -j144" kernel build
> > was 18m40.641s. After applying this patch, the parallel kernel build
> > time was reduced to 17m35.136s. This is a reduction of about 66s (5.8%).
> > 
> > Signed-off-by: Waiman Long <longman@redhat.com>
> > ---
> >   kernel/locking/Makefile | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
> > index 0db4093d17b8..8a588b0227b1 100644
> > --- a/kernel/locking/Makefile
> > +++ b/kernel/locking/Makefile
> > @@ -6,6 +6,7 @@ KCOV_INSTRUMENT		:= n
> >   obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
> >   # Avoid recursion lockdep -> sanitizer -> ... -> lockdep.
> > +KASAN_SANITIZE_lockdep.o := n
> >   KCSAN_SANITIZE_lockdep.o := n
> >   ifdef CONFIG_FUNCTION_TRACER
> 
> The rationale behind this patch is due to the fact that a similar configured
> PREEMPT_RT debug kernel is found to be about 3 times slower than the non-RT
> debug kernel. For the test same system, the parallel build runtime is
> 59m56.722s. After applying this patch, it is reduced to 38m3.348s. Its more
> than 1/3 reduction is more than I would have expected. So the lockdep code
> is much more heavily used in a PREEMPT_RT debug kernel.

Perhaps put that in the changelog instead?

Its not like RT is this secret out of tree project :-)

Also, any quick clues as to what causes the extra lockdep overhead?
Initially I thought perhaps local-lock, but that should also cause
lockdep on !RT builds.
