Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479B1FFC69
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597206; cv=none; b=F64LFKO+MXeUhaRHRy0IZnQ16y/fzha3mt4ZRno/8YKt9I3zLl++upA/TlaU8j7GCIlhlc0asa8aSH51MwzG+I/Rt6N6NuYctmLDZIoi7lb9AYEZ5LAhmOW2I+WBMQxdOD7H1P+mCeHlzYEEgvyctRWLxwbg8/xd6HiGCRA4orc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597206; c=relaxed/simple;
	bh=Q2R4wVJZw/CxiXFjJ998r15Bob07Ai87muTmjPh9CbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS+j1CugXH6owSbd948KDGEXKPlNOQ6KUca/vfRiN/vEOjwc5oAbCXa3Z/8W3ukW+Zn3J93HF+o5lJ37x7swSNjozEVBG/KzwxuND9rJWMXYzLCQUUOw7FWFe3DaDPoW1iRL2abAuhlWJy+8S4/AQUHMl+dDTmiIUEzv1czG3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=saJlK5jy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="saJlK5jy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q2R4wVJZw/CxiXFjJ998r15Bob07Ai87muTmjPh9CbE=; b=saJlK5jyRYlA3PqSkPoOfBC1Yl
	QD51fgKXhb5xakGjp3PBCEyOEjw2ygZzKdtIWHEJ2j7xWjS7YiZfKSZURH4mQiIPIZw5Xo/KUVHDd
	cmXXuM50xtgVwSUX7Txl+bFrBPgnRaIMmqMIntOYEVkrg+rY6NEkNCa+yCYafKsR49Oh1BP51oYfy
	YUApD23f4QhFIPotMlWCHYuNyQORfnkkwv2Q37+YIJaapsFRs7GYlRrYy9qCs0yWYBUikh2lwf67j
	zBr8f6Pk/8gsR0yhTjL5ajRbIQv5FV4fqxnDgnvtCcBXUjstN9Gh99eyBRmexeSoe/LR1sNKlyB4g
	IS2/4fFA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1teyYK-00000001GoP-1o95;
	Mon, 03 Feb 2025 15:40:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 03F3C30035F; Mon,  3 Feb 2025 16:39:59 +0100 (CET)
Date: Mon, 3 Feb 2025 16:39:58 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250203153958.GM8385@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203144101.GL7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203144101.GL7145@noisy.programming.kicks-ass.net>

On Mon, Feb 03, 2025 at 03:41:02PM +0100, Peter Zijlstra wrote:
> Because the shorter hash invocation only cares about being private, not
> about having fhb.

While driving to pick up kid from high school, I realized I was full of
crap. Short hash is very much specific to local thing.

Carry on.
