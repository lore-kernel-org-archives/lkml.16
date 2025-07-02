Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F923C51B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447179; cv=none; b=WE0a9TLFXMa++JCQaCuUZF+He2b814xSyHV8c0veGGoSgrXHqV7UTgIEfTuHoQZiTxEYxNNaYxy3nBlwC6yHP41EJkH8CwbJW9Z/MKOFHxlnNM5WyQuEbvwBNEmjn0EJhfHIsE4iFnP7mhsetYFwEAtoWPY5Ox7ZeDWtCWtgIYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447179; c=relaxed/simple;
	bh=qWQYLcF2AAGRx/CVILM4+Wh16U+upllGo9FxrHP/1Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNin7rVj+uslrfaprtfZLLbZXfgoLe3ZB7SwHSXwsmH/XhhidAjRtZxf58xpV2k69xjdMaYyVZ2JHl4NGKbvzIZqS4ZC1Fqk/mEgrN6t17UXV7sOsiZ2VOjXhcet1S4GdrXpBfSYoiSgcmwLdcduDl8B/YB/rcB7k8YsVVqPsRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jkvUt3rD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jkvUt3rD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7yYZ7D7mpffybeFSkvi6sI8K1ligOfKZH0hDhP/Vqkw=; b=jkvUt3rDuZLsmNB7ZfpPh5T0eM
	Yk9gcQFZstXnAun8aN2212Xx5mlMXtLy/w1+Mb71EIkDfrnF4Xx+Y8m7aAZmy39lEhkIQylym6ARF
	KmHFQgHl85xmuV+LV5UWtZFm+6J/pBibs+iPi7o1q+ClbPFn3GSYoUqwowPWzIuuIS6/hS5LWmIh/
	aH4x/vFt1bEaKZNppcFJB8sP61a60DBmAP4784dScXUEGEPfZvFNU+3J/zikoWvJ/Ygs3mseYNajx
	iUEmzaS3jdQV18KOWXBnr2fxfoRiMdivAtNSTsvy8N6JwkVtTskjRkOugrOLhPBM/cs/ujW8D9o59
	jakZKQ/w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtPz-00000009Led-0Sfd;
	Wed, 02 Jul 2025 09:06:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AE2D7300125; Wed, 02 Jul 2025 11:06:14 +0200 (CEST)
Date: Wed, 2 Jul 2025 11:06:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Wladislav Wiebe <wladislav.wiebe@nokia.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org, mingo@kernel.org,
	tglx@linutronix.de, akpm@linux-foundation.org,
	bigeasy@linutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
Message-ID: <20250702090614.GP1613200@noisy.programming.kicks-ass.net>
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
 <20250630132517.GM1613376@noisy.programming.kicks-ass.net>
 <c77690ff-9f3d-4ab8-9443-b377134e90ca@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c77690ff-9f3d-4ab8-9443-b377134e90ca@nokia.com>

On Mon, Jun 30, 2025 at 03:59:17PM +0200, Wladislav Wiebe wrote:
> 
> On 30/06/2025 15:25, Peter Zijlstra wrote:
> > CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
> >
> >
> >
> > On Mon, Jun 30, 2025 at 02:46:44PM +0200, Wladislav Wiebe wrote:
> >> Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
> >> IRQ handlers take an unusually long time to execute.
> >>
> >> When triggered, the warning includes the CPU, IRQ number, handler address,
> >> name, and execution duration, for example:
> >>
> >>   [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)
> >>
> >> To keep runtime overhead minimal, this implementation uses a jiffies-based
> >> timing mechanism. While coarse, it is sufficient to detect problematic IRQs.
> > local_clock() was found to be excessively expensive?
> 
> Perhaps not excessively expensive, but jiffies is the lowest-overhead option here, isn't it?

Yeah, but since it varies in length and even the shortest (1ms) might be
too long for some, it is of very limited use.
