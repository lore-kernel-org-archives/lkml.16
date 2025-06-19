Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1AD1B3923;
	Thu, 19 Jun 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343772; cv=none; b=jxz1DYFeNnftjTWEXjMlX2gyJ03mGBM5IU7Ww/treVJh1ADovA6hgXJZhvTKumFIsptqVBMNIH3HCFPga51steb5FMvVwYP5Nn1t5eMtINALRdOd+g1M6rmM0tlkXfT12tCC/7dN5qz2sydVJy/IxJfXhNYCK7bPcZAqO+1pFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343772; c=relaxed/simple;
	bh=TrQM8zZWOPOJoeXZtUsX+MK3ndkBL2WDH2l4576fBY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI5fwUTHCQe7RjmkHemmCTn3p3yZIt5NL3VFENZSZnAnuQREwdwpSl//M5ZFjAtX2xRUSLzNg2DHGC36upnoTZrxIK07VG6Onx7wx3UmU9GsItE1xnV/M3mRPP5/bY90xHxQZ3sfleWo4+13kdLB2sEMw+o7e1DndxkPFYB/YdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25747113E;
	Thu, 19 Jun 2025 07:35:50 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243363F66E;
	Thu, 19 Jun 2025 07:36:06 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:36:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
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
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <aFQgVPRvbrfcUrkY@J2N7QTR9R3>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
 <aFQXU5rK_HJE9zq0@J2N7QTR9R3>
 <20250619140442.GH1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619140442.GH1613376@noisy.programming.kicks-ass.net>

On Thu, Jun 19, 2025 at 04:04:42PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 19, 2025 at 02:57:55PM +0100, Mark Rutland wrote:
> > On Tue, Jun 17, 2025 at 12:36:18PM +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> > > > +	pcipmu->pmu = (struct pmu) {
> > > > +		.parent		= dev,
> > > > +		.task_ctx_nr	= perf_invalid_context,
> > > > +
> > > > +		.pmu_enable	= fujitsu_pci__pmu_enable,
> > > > +		.pmu_disable	= fujitsu_pci__pmu_disable,
> > > > +		.event_init	= fujitsu_pci__event_init,
> > > > +		.add		= fujitsu_pci__event_add,
> > > > +		.del		= fujitsu_pci__event_del,
> > > > +		.start		= fujitsu_pci__event_start,
> > > > +		.stop		= fujitsu_pci__event_stop,
> > > > +		.read		= fujitsu_pci__event_read,
> > > > +
> > > > +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> > > > +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> > > 
> > > Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
> > > being uncore they cannot generate samples.
> > 
> > These PMUs actually have an interrupt, so that might be a bit confusing.
> > That said, the counters seem to be 64-bit, so the interrupt doesn't seem
> > practically necessary today.
> 
> Yeah, I saw they had an interrupt. But them being uncore they must not
> sample, and NO_INTERRUPT means not being able to sample.
> 
> Naming urgh :-)

Yeah :)

FWIW, that came to mind due to:

  https://lore.kernel.org/lkml/20250618-perf-pmu-cap-docs-v1-1-0d34387d6e47@collabora.com/

... and if NO_INTERRUPT would be better-named as NO_SAMPLING, that might
be a good opportunity to clean that up.

> > Either way, the fujitsu_pci__event_init() function rejects sampling
> > events, so it correctly rejects sampling events.
> > 
> > IMO, it'd be a bit nicer to do the inverse, and have the perf core
> > reject sampling events by default for non-CPU PMUs.
> 
> Yeah, there's lots of cleanup to be done. Quite possibly also some
> unification between the various drivers.
> 
> Just need someone that knows what they're doing that has spare time,
> know anybody like that? :-)

I think a few folk likle that live in the nearest hall of mirrors...

If you're happy with that in concept, I can see about getting someone to
look at that -- the general idea has come up a few times.

Mark.
