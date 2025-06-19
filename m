Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D01AA782;
	Thu, 19 Jun 2025 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344189; cv=none; b=RZlaolZBBNssyNiwCjSsc8rZsgLDF7BHufOLhlQBZ+fz92HgnU/YwWNq4QEhrD0ur6/Qd64CbFZBNHYObLMIWvnZPDFBrMiBnCkwiPJNTSnSUNw24nlfnqGigAeLpCNHnBcTda59kDuCRRjjKxRje3IlY1jYaudCZ+4qoGi+5pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344189; c=relaxed/simple;
	bh=/ELZptTBhqBUeDBGAiBxuTC6IoEc0cQXwy2tejgFxig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEUafKHcdYnm8mIpn5b25d1h/Ms0BapJ4HQUZR2DBBs0q1R5dXmfk1X/Yk69c17DhRU93wUiJuHkH6cPjPJXbc1zE3nC5BLlxDMMLBGuhFq2FtGie5tTw3WlaTWT9w2KQePOaCTjrdQT/TFhf9DI9B8AY97KbTl2rj+970PvcVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dwvJA3FN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dwvJA3FN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BNuxxZdvnFJv9N7bIABQrfSlQ4FsyW6sCUROC/TVYZs=; b=dwvJA3FNkttNq+bMx2HmmenkhQ
	j8FBAiEdFQLEcocmeS5dIupozZFVjf3dlJW+dgd05mbaTedMUNbKx7l5rtBeWfm0tyHVk60+Mpr4R
	l43CfxpcnYDkLkdu6BM9Jwp3G+JM1hMH7UBw0ELGiIGf/ZidM8OjsCOlvCQmOIFVgLjEs6aVFlyML
	gRH+c/fdlX8MtrUw5SeZx9VDIeFLFdkdb3iSEKjRWSZJfV3DvuPfby/vHKDtjoYfnJa7MFDlr47Uu
	qMrolJeOwIYTkTV/F73lchzfdIUF2xPRhjMRXUDspUpklFwU2vSmJOgfhWf8KK27LncNnA4o1Czup
	9P/ClWFQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGTg-00000004SQQ-1Keq;
	Thu, 19 Jun 2025 14:42:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8723130890E; Thu, 19 Jun 2025 16:42:54 +0200 (CEST)
Date: Thu, 19 Jun 2025 16:42:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Koichi Okuno <fj2767dz@fujitsu.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <20250619144254.GK1613376@noisy.programming.kicks-ass.net>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
 <aFQXU5rK_HJE9zq0@J2N7QTR9R3>
 <20250619140442.GH1613376@noisy.programming.kicks-ass.net>
 <aFQgVPRvbrfcUrkY@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQgVPRvbrfcUrkY@J2N7QTR9R3>

On Thu, Jun 19, 2025 at 03:36:04PM +0100, Mark Rutland wrote:
> On Thu, Jun 19, 2025 at 04:04:42PM +0200, Peter Zijlstra wrote:
> > On Thu, Jun 19, 2025 at 02:57:55PM +0100, Mark Rutland wrote:
> > > On Tue, Jun 17, 2025 at 12:36:18PM +0200, Peter Zijlstra wrote:
> > > > On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> > > > > +	pcipmu->pmu = (struct pmu) {
> > > > > +		.parent		= dev,
> > > > > +		.task_ctx_nr	= perf_invalid_context,
> > > > > +
> > > > > +		.pmu_enable	= fujitsu_pci__pmu_enable,
> > > > > +		.pmu_disable	= fujitsu_pci__pmu_disable,
> > > > > +		.event_init	= fujitsu_pci__event_init,
> > > > > +		.add		= fujitsu_pci__event_add,
> > > > > +		.del		= fujitsu_pci__event_del,
> > > > > +		.start		= fujitsu_pci__event_start,
> > > > > +		.stop		= fujitsu_pci__event_stop,
> > > > > +		.read		= fujitsu_pci__event_read,
> > > > > +
> > > > > +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> > > > > +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> > > > 
> > > > Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
> > > > being uncore they cannot generate samples.
> > > 
> > > These PMUs actually have an interrupt, so that might be a bit confusing.
> > > That said, the counters seem to be 64-bit, so the interrupt doesn't seem
> > > practically necessary today.
> > 
> > Yeah, I saw they had an interrupt. But them being uncore they must not
> > sample, and NO_INTERRUPT means not being able to sample.
> > 
> > Naming urgh :-)
> 
> Yeah :)
> 
> FWIW, that came to mind due to:
> 
>   https://lore.kernel.org/lkml/20250618-perf-pmu-cap-docs-v1-1-0d34387d6e47@collabora.com/

Oh hey, look at that.. Clearly that is still stuck in my unread pile :/

> ... and if NO_INTERRUPT would be better-named as NO_SAMPLING, that might
> be a good opportunity to clean that up.

Yeah, that's more or less what it does, look at the few sites in
perf/events/core.c that test it.

> > Yeah, there's lots of cleanup to be done. Quite possibly also some
> > unification between the various drivers.
> > 
> > Just need someone that knows what they're doing that has spare time,
> > know anybody like that? :-)
> 
> I think a few folk likle that live in the nearest hall of mirrors...
> 
> If you're happy with that in concept, I can see about getting someone to
> look at that -- the general idea has come up a few times.

Sure.
