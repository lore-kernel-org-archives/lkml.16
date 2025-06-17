Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDE62E3AE5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171467; cv=none; b=qbD7FQfG2C8SsRJDaWJimVZDrs2tEENeUsk749GJ+FxhEPT2qh7gEq/UST8re8fHSdOlTJlVChgKoqrCE0QDoAUmog9FQ5LoPj2M/nVaWY82mV4rWL9wuRzl7vmaA1qpPKwcJCZmuJDVAT7uYgutRnIOBI33INd/aLAeBAW7Hko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171467; c=relaxed/simple;
	bh=jCDYe2aYeTh3eR/O/VIFINlb+8LgYhXkHgjAMV1IHXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOiscKvhCG6yHeb1umq5rlBXiQbTZZqaYLYQpl4EyPBSPyuRw3xK3tBLbnlEmEFIP5HxSjI+CO/VO4D66vzHmPtnr5MuSefaLYJFjOZYS4GIqhb9RlQRArfxfyJRVkExNG2kvHhjc3r+2xqVAL1EjtlgFiHraWuQs8F5mC6dAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N9vsPZm/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N9vsPZm/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kQ6J8TtBUCTZkdOZVOX3lXfTblBryoju8JB2ZactZKE=; b=N9vsPZm/8Z+IlgSRHWH75Qqywg
	1iwYHaiQIzL/dZ9KaDpu8YHUMWNBy4dH1FGpDOP+os5MlxelfVirJIbKPxflyGWZLkxEoNe/wGR3s
	2Nfz9vsxdiOf2ok5J/B2jLhOgXPw6b9QpH8lyqM+d2KPZmwzVHPVFFPb01zgje/kNiaQrjQsQcoJA
	OPsVD1nql859b6fB7gLd8+Hlj8SPnr3bP7CGZxUNqiX2Gqe0mUOJmIhw8K9ro70NLDJwQ1Uegub+w
	CfEvYE4Ntr03xYuO28/ecg94dYbsEQ35xAdTrJpXQF3EjHf0RhkN/M22jNoODAeYqfMPJ0tiAvHL1
	2HQD7C+g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXXt-0000000HGua-2HmK;
	Tue, 17 Jun 2025 14:44:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6F0130BDAD; Tue, 17 Jun 2025 16:44:16 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:44:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, kan.liang@linux.intel.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFF6gdxVyp36ADOi@J2N7QTR9R3>

On Tue, Jun 17, 2025 at 03:24:01PM +0100, Mark Rutland wrote:

> TBH, I don't think we can handle extended state in a generic way unless
> we treat this like a ptrace regset, and delegate the format of each
> specific register set to the architecture code.
> 
> On arm64, the behaviour is modal (with two different vector lengths for
> streaming/non-streaming SVE when SME is implemented), per-task
> configurable (with different vector lengths), can differ between
> host/guest for KVM, and some of the registers only exist in some
> configurations (e.g. the FFR only exists for SME if FA64 is
> implemented).

Well, much of this is per necessity architecture specific. But the
general form of vector registers is similar enough.

The main point is to not try and cram the vector registers into multiple
GP regs (sadly that is exactly what x86 started doing).

Anyway, your conditional length thing is 'fun' and has two solutions:

  - the arch can refuse to create per-cpu counters with SIMD samples, or

  - 0 pad all 'unobtainable state'.

Same when asking for wider vectors than the hardware supports; eg.
asking for 512 wide registers on Intel clients will likely end up in a
lot of 0s for the high bits -- seeing how AVX512 is mostly a server
thing on Intel.


