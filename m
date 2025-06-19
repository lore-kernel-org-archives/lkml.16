Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6E235052;
	Thu, 19 Jun 2025 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341494; cv=none; b=XVhXFe8oD9XLrF7cKHE5MLF6yF4gSBGoX8ZlG6noNvFeYGPa3ZmkFSpsjzFd08fVlSYg60EXhC+oKoQnHYQGEhkbSGCzzb9ydZJnxulMVl9nWDIRpzGLWv0VKr5EpB3VV5O1Zjtzup9kQqExZQd7IqOIxmpaJeM4aiaiLvUCSws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341494; c=relaxed/simple;
	bh=AF+s+rjYV05y/4oIRj+xN8Yj55tK9KUZD4Vl0vaRV/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqbmbTZMX/xviZDjPbP4lXckBpfx/f8CCpxC7J+S2Z00eFoAFbPC0Iy5Pbze/z0ciehDBYTO4gfoTyy+dAM+ozXkesWgpSVveIXTqELgHooXHrD91520a/jC7jxMi967vwt2eVzTm0f2uTkqNrMEiSRMK6njDN41t0uv3woRkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92CFB12FC;
	Thu, 19 Jun 2025 06:57:51 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F5953F66E;
	Thu, 19 Jun 2025 06:58:08 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:57:55 +0100
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
Message-ID: <aFQXU5rK_HJE9zq0@J2N7QTR9R3>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617103618.GT1613376@noisy.programming.kicks-ass.net>

On Tue, Jun 17, 2025 at 12:36:18PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> > +	pcipmu->pmu = (struct pmu) {
> > +		.parent		= dev,
> > +		.task_ctx_nr	= perf_invalid_context,
> > +
> > +		.pmu_enable	= fujitsu_pci__pmu_enable,
> > +		.pmu_disable	= fujitsu_pci__pmu_disable,
> > +		.event_init	= fujitsu_pci__event_init,
> > +		.add		= fujitsu_pci__event_add,
> > +		.del		= fujitsu_pci__event_del,
> > +		.start		= fujitsu_pci__event_start,
> > +		.stop		= fujitsu_pci__event_stop,
> > +		.read		= fujitsu_pci__event_read,
> > +
> > +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> > +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> 
> Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
> being uncore they cannot generate samples.

These PMUs actually have an interrupt, so that might be a bit confusing.
That said, the counters seem to be 64-bit, so the interrupt doesn't seem
practically necessary today.

Either way, the fujitsu_pci__event_init() function rejects sampling
events, so it correctly rejects sampling events.

IMO, it'd be a bit nicer to do the inverse, and have the perf core
reject sampling events by default for non-CPU PMUs.

Mark.
