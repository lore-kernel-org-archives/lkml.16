Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12120295DA5;
	Tue, 17 Jun 2025 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156599; cv=none; b=Sl+XYPpXrZEYOgj4wyWVQK31eqS/K8I0l3gArYeGzdkPrDndXomp68RfXspM8TYEPLUEmp5WYqvVu1TqHrxR71zbTK8Igelv4FcmXQOOlLEmjV9jTdSKgjmYPMZP8BLio4CmV1hcrmzqz50O0eJTz6U8DHjvYsVE2ixaMhnOQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156599; c=relaxed/simple;
	bh=Mt4oHekiA92rE/VwZpu/nA4D4ECjqqc2xguHzhD9/qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCSgMYMDSNJD/26lSyp9H2dhA8xi9giFDwCFhqBRUuISzna3QGve7k3uxmmDOSTkco3xqJL7UxmrhygPLoHtxXNE6j5KzCm1r5zz0kIOXglSSwi2uoeWOLNCyjDY2KuXKGIEZexs2LBt8t1GZTHNj48tg6AVuvKYC8kKIoNMZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j6UCKw5+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j6UCKw5+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=coH03vPFT2rsdcf33PRUsXpuL1g7ZkrTHF5F6QDpPTw=; b=j6UCKw5+yqg03P3VhjtZ9xHG8P
	e4cSe5GL2d0JRvRqNrvswgi6bodPQzOEVUO5+zrI4dSd94fYfRq81jJ68n3ymYKF3kgnqk1w7PlQD
	2rs0P1TaU43pNhvwf8LQj0XqJwyn/ztplssurZC7V2hUpBegF42QbnoqQ4qKCFRDc8vBV5jpcsLKm
	fYB9/KUDmQJpBm1HuRUzFUIWtp1HTUjk6gitVpAulJxDtYup8LIzJTEbrlS/wy1njjaew/4jiN6sq
	Pj03UWhF7nhi3p0cn7WieeXViPmoo4yWwK3V+nl+/JQqU9jQcTOADPV3/FKrc6GyLg8jeH2AB7Rkt
	svxY6k8w==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTfv-0000000H0cK-2kRJ;
	Tue, 17 Jun 2025 10:36:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 02E7A30BDAD; Tue, 17 Jun 2025 12:36:19 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:36:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Koichi Okuno <fj2767dz@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617102819.3685543-3-fj2767dz@fujitsu.com>

On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> +	pcipmu->pmu = (struct pmu) {
> +		.parent		= dev,
> +		.task_ctx_nr	= perf_invalid_context,
> +
> +		.pmu_enable	= fujitsu_pci__pmu_enable,
> +		.pmu_disable	= fujitsu_pci__pmu_disable,
> +		.event_init	= fujitsu_pci__event_init,
> +		.add		= fujitsu_pci__event_add,
> +		.del		= fujitsu_pci__event_del,
> +		.start		= fujitsu_pci__event_start,
> +		.stop		= fujitsu_pci__event_stop,
> +		.read		= fujitsu_pci__event_read,
> +
> +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,

Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
being uncore they cannot generate samples.

> +	};


