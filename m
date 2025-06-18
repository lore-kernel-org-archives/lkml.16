Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC1327E1C3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253413; cv=none; b=Qf23gY/xm4gvhlDxFuSrIb/kyocJGVU51QvSTI5w9IVW+ARVJtAhKSb+UYeDcR3SSn44IwCVlRryUgTls6pD4yJmlImWqYUd/6wtU5uscN6zZ96NUgMK9UGc3yxuP2vwGEz20BtKEN0ZoJkjiFMB7KLFafqY+ARJlFJWo72hHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253413; c=relaxed/simple;
	bh=CUdYwHjpfN9yqk7ew7xfu2PvyAnQygAStPl6RmQaPHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtgJ5ae/4Dt1mFmtg8AKChIePUHpbX3YFhETlOW09G70ewOaLqetozJZuKNeyyZnoEjkY033RrOH3Taxu27Ne+bfSyJM5LO6vjvNXCoEtPWdCyDsKZ8O0SWHeu7/V5v4XRqtz+PSe1Ovz1c0Yk3sV0zljnd8ZpezeDFESTwVmI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CpOZJr9m; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CpOZJr9m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LnEHQ0EYQw6B1hzi83rKPaI4LXCQaqQAumElzeZ06OY=; b=CpOZJr9mLxavdXNrRcOwjSM4Y6
	h7bIKxZOEkdEqzrCC+zZSB502jy7HFBtBMUguZMaq8jKvuqEdcZTw7UcJa6qN5cxSPP2wnwgJfEg6
	rvtHolg2hcveYeuBig8S9gfqGFjShM8zD9G2Ye03VVbcJlfYMApIpoYSGZbY4FFxs4g17Wdnk0xdB
	QQYVstYKivogPRG9OLS2Z7V7Su5UgmLb1h9Q5AJaBpK6y/tosQ6pw74nCyZDbPmX7Lc1Cw9VKYBCg
	+0CHUiVCGwP3onVjZP70KanN0G3aduT1z7x1PNckwqLSsCYCD5lM/yLxdSy2Jn7VUE0DBZNoI0MNM
	ohVFWHqw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsrd-00000003ZxJ-0WW5;
	Wed, 18 Jun 2025 13:30:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E58DC307FB7; Wed, 18 Jun 2025 15:30:03 +0200 (CEST)
Date: Wed, 18 Jun 2025 15:30:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com, broonie@kernel.org
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250618133003.GC1613200@noisy.programming.kicks-ass.net>
References: <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
 <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
 <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>

On Wed, Jun 18, 2025 at 06:10:20AM -0400, Liang, Kan wrote:

> Maybe we should use a mask to replace the nr_vectors.
> Because Dave mentioned that the XSAVES may fail.

XSAVE is a pain in the arse :/

> PERF_SAMPLE_SIMD_REGS := {
> 	u64 vectors_mask;
> 	u16 vector_length;
> 	u64 pred_mask;
> 	u16 pred_length;

That is not u64 aligned...

> 	u64 data[];
> }
