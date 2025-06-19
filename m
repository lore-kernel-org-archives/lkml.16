Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCCB263F4A;
	Thu, 19 Jun 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341905; cv=none; b=l3p1PrS4qhvQdlIbDS5pMl29g5pLPnXA597mC+SlFTwQ87yr1Ydc6y9JnD3FCIJKmNwS7tYoy8/pInbLAXJqvAZWKuVwS0WkS/H5jG/YO/Q+cG+UK3wrSvAZW89pxtE/xknM4a5t588A19PbB0sETQcqwOvJ08QFSknkUeO5nMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341905; c=relaxed/simple;
	bh=fCZ6K5MIym/kw9Lkht+ZPQGdYCIJYoEvY8PbQ22a4tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVWpPQSToXhunP+wZravUb37p9KKhzTw0X78zugOig0h+C0zfQVIqD18oO9IwjWWtF3PgNPPhDFmJ2vcSmmztf6SIWkDln8oovlcFgM6cBFFQMP9TDPPc67Avsiv/SQV2nSLuOJzeGHCk8R3DIsHKT+gkOtKOmfb3pU36uqO9lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mRU05Xto; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mRU05Xto"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VRdhn3un9kG/iMEN06yqFgmDCh1WcgJoraC+AXdndW0=; b=mRU05XtoCzZHXAYiz1I1GFiNxJ
	E4HCkQA87dhGDBGItkGmLJ5c+of+1ISMYEdZRxk6JNlD1B2gr9H6IEEe7TX4RTBUamXxcMRtqmGXG
	KnyY5UWzxsv+/FWNmW3ApDJs2GMLEWD5sa6vIrvLDoHBJae6iMiJU9A+luMK2pXWg/Yt6Pj0Qf+/Z
	xZyFsYyNgCs8vWjAZ0Lrq0EsqlvzL8YKyIMf1g9mE1K528HNE1xbijzOWuNu/1o2sl0/GxNJSJle/
	enVZLsF1SGCuP+K/BKGcqRlnMQqTDM6wRkW2ToEesH66tZenSuMj00SK2PgOPcZwUxRVf/iO1E0H3
	6yMz84uA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFsi-00000004SAu-1oOU;
	Thu, 19 Jun 2025 14:04:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D5ABB3088F2; Thu, 19 Jun 2025 16:04:42 +0200 (CEST)
Date: Thu, 19 Jun 2025 16:04:42 +0200
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
Message-ID: <20250619140442.GH1613376@noisy.programming.kicks-ass.net>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
 <aFQXU5rK_HJE9zq0@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQXU5rK_HJE9zq0@J2N7QTR9R3>

On Thu, Jun 19, 2025 at 02:57:55PM +0100, Mark Rutland wrote:
> On Tue, Jun 17, 2025 at 12:36:18PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> > > +	pcipmu->pmu = (struct pmu) {
> > > +		.parent		= dev,
> > > +		.task_ctx_nr	= perf_invalid_context,
> > > +
> > > +		.pmu_enable	= fujitsu_pci__pmu_enable,
> > > +		.pmu_disable	= fujitsu_pci__pmu_disable,
> > > +		.event_init	= fujitsu_pci__event_init,
> > > +		.add		= fujitsu_pci__event_add,
> > > +		.del		= fujitsu_pci__event_del,
> > > +		.start		= fujitsu_pci__event_start,
> > > +		.stop		= fujitsu_pci__event_stop,
> > > +		.read		= fujitsu_pci__event_read,
> > > +
> > > +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> > > +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> > 
> > Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
> > being uncore they cannot generate samples.
> 
> These PMUs actually have an interrupt, so that might be a bit confusing.
> That said, the counters seem to be 64-bit, so the interrupt doesn't seem
> practically necessary today.

Yeah, I saw they had an interrupt. But them being uncore they must not
sample, and NO_INTERRUPT means not being able to sample.

Naming urgh :-)

> Either way, the fujitsu_pci__event_init() function rejects sampling
> events, so it correctly rejects sampling events.
> 
> IMO, it'd be a bit nicer to do the inverse, and have the perf core
> reject sampling events by default for non-CPU PMUs.

Yeah, there's lots of cleanup to be done. Quite possibly also some
unification between the various drivers.

Just need someone that knows what they're doing that has spare time,
know anybody like that? :-)
