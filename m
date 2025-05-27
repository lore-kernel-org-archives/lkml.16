Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688BC2472AF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349811; cv=none; b=QeKYIca4Dgxc8UuE/0HdJbzQkcsnC/ENII94uISv3KDmpMo2gwQR26ZcMHCSC222T16w2gZPCerpB+BQtzeypdMl82QHnq3rMi+57qtov2TI7LxdrJA9TIumTGVuaGgnKethW7eY+Qy15gPjVvpkCnKMLEy9T7O7V66SyWczV4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349811; c=relaxed/simple;
	bh=rUnhLEryivUI8dDXO05+YOqnvj0dLEgjJGq5M9Xh5rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxTQ9eWE97JG7i5vaIeBjHZ6YGj8l+CZGDuC3Hc8iBKhT+TZsCgzkhxmSd3bfk7n+jEUAAfELpUo0f5Wi0TKWf/BXljVDJyU1ry6xzqZ1xTWuRATlyXIjsJO6vfG3W26cblqm99/dT5PGzRs5EP8BhHzoHPTreN0ACl/LaVWVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i7PZaP9A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=viaqKrMs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i7PZaP9A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="viaqKrMs"
Date: Tue, 27 May 2025 14:43:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748349808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GgGYluBZK38NIiosfn6Rm3FdAkQ1QV8pdfCCpCblFvA=;
	b=i7PZaP9AiMsoiNqBYwqqWOX9fbuBiPSQWo43XkjpnPTUJDQSn9j6LHjbWOokNNH38ZOCIl
	tPPup4CxASxozt26huj+zqmLffgW03whNYpPxldB0LUd4/ajBYquh9jhz2Jxglrkwcw/+S
	4nqcL6zYRYeO2JVT52LhtSFGqPxLTheKgDdVjhwqlembi6Xmod7ZPCELodTDFKermc1rPs
	/fgzHvcrBjdeG72U9GtZGhxpU5jUzhHFLo1QOofe1mCyuAXqh+fzB5N/pDbDQrXbe9fbPW
	sQacrVGOgAJVUih7MKQCX7yZbgYrVNN+SG5lDyTzrm1ltf25cjDAqmIRG8xOTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748349808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GgGYluBZK38NIiosfn6Rm3FdAkQ1QV8pdfCCpCblFvA=;
	b=viaqKrMsfSO/9w6O4x2AO3+Uf0XerRufyi0ZsrpL5xVhUZG16Fnbj3Y0PwROA+ruEe8VIn
	KTxbh1p2PXjbhjDA==
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
Message-ID: <20250527124327.5UDnm-ho@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
 <20250527122332.M0ucxhwh@linutronix.de>
 <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>

On 2025-05-27 13:35:50 [+0100], Mark Brown wrote:
> On Tue, May 27, 2025 at 02:23:32PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-05-27 12:28:00 [+0100], Mark Brown wrote:
> 
> > > This newly added test is not running successfully on arm64, it looks
> > > like it's just a straightforward integration issue:
> 
> > > # Usage: futex_priv_hash
> > > #   -c    Use color
> > > #   -g    Test global hash instead intead local immutable 
> > > #   -h    Display this help message
> > > #   -v L  Verbosity level: 0=QUIET 1=CRITICAL 2=INFO
> 
> > That is odd. If I run ./run.sh then it passes. I tried it with forcing
> > COLOR=-c and without it. This is the only option that is passed. That is on
> > x86 however but I doubt arm64 is doing anything special here.
> 
> > A bit puzzled here.
> 
> Yeah, I was a bit confused as well.  This is running with an installed
> copy of the selftests and IIRC the build is out of tree so it's possible
> something is different with that path compared to what you're doing?
> It's a common source of problems?

It shouldn't be. The test is self-contained and as long as the run.sh
script invokes all is good.  I don't see what futex_priv_hash might be
is doing different compared to the previous test.

I just noticed that after the two futex_priv_hash invocations there
should be one futex_numa_mpol invocation. That one is missing in the
output. Any idea why?

Sebastian
