Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96902701DF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340312; cv=none; b=QtGfCGrxs7CvO+IHnBz5qU51c3nA5qvKhs3o0vYGVfC+xttSAvdQYAjHlzuq5aHEXtEXFN+SQU07fQgw/h147Nub2hJgLkJFpgA2Y918yB7KzMtCRr+kODZGeypr7rux6KLA1+taze3eNo/M5dK+gWDAdgsiE98fqYvQdOYNbQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340312; c=relaxed/simple;
	bh=MfB3Ra+rbkQPduQ1b/ldf7ZEAPf14E/2tIl7mOAuo3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzdnQ9H7p1RLdy3kO1G8kFhB99S0zJkTZPydeRCr4aao74DLgmTtZoucFglk+f38VlKNFBsMOR8WwlMz558ali3drAozyNYCRtAteFaYDGuGVsmfAQCfn0Vsdq9whfFkSyKKn7S1Nz6yzFki9vKDkMt71orL1yMFRru0Uz82mIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gVZfKllo; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gVZfKllo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XDt0BB7NT2lvVBZjPs41Ot7bzpKGdDcl50tiZrGAOPo=; b=gVZfKlloJH+QL4k+SoR+wUilla
	1KXo7VaQJEy/TD8E4Mavq1qxYSE8LZ9914N7ynj1urGbULlEutx4P9RyugwLpD59IhnNt1pAOcPrI
	7ow9axuRgIqHNOhZgYErRW8LHMyM+PC/Wlqq4lF2srFhXRsNpnf91rW9I0zLZNOEPLkvQ+CoD4hx8
	kmYNQHlSRQIPokx3s81HtxB1+z+A8aJQHZNSMvi7W7BwR2akJhgD86MZwr0awZdmolj94qb3u1EqN
	rvDXLZFkwpZvGOTWwESlSZJ93zue69eCS708qOsrzSN61KFKpAy8sX2cJ81/z/h4HSp6jhv2MRbTu
	tbg/dP2A==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFTE-00000008sSD-2utJ;
	Thu, 19 Jun 2025 13:38:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 599833088F2; Thu, 19 Jun 2025 15:38:23 +0200 (CEST)
Date: Thu, 19 Jun 2025 15:38:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
Message-ID: <20250619133823.GG1613376@noisy.programming.kicks-ass.net>
References: <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
 <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
 <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
 <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
 <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
 <5aabcb15-0def-4f73-b4dd-03c958192d67@linux.intel.com>
 <1bc9de32-2599-483f-8c6a-6da59f8d9549@linux.intel.com>
 <d97fc799-ab9b-4c6a-a77e-8b542ac82efa@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97fc799-ab9b-4c6a-a77e-8b542ac82efa@linux.intel.com>

On Thu, Jun 19, 2025 at 07:11:23AM -0400, Liang, Kan wrote:

> @@ -543,6 +544,24 @@ struct perf_event_attr {
>  	__u64	sig_data;
> 
>  	__u64	config3; /* extension of config2 */
> +
> +
> +	/*
> +	 * Defines set of SIMD registers to dump on samples.
> +	 * The sample_simd_req_enabled !=0 implies the
> +	 * set of SIMD registers is used to config all SIMD registers.
> +	 * If !sample_simd_req_enabled, sample_regs_XXX may be used to
> +	 * config some SIMD registers on X86.
> +	 */
> +	union {
> +		__u16 sample_simd_reg_enabled;
> +		__u16 sample_simd_pred_reg_qwords;
> +	};
> +	__u16 sample_simd_pred_reg_intr;
> +	__u16 sample_simd_pred_reg_user;

This limits things to max 16 predicate registers. ARM will fully fill
that with present hardware.

> +	__u16 sample_simd_reg_qwords;
> +	__u64 sample_simd_reg_intr;
> +	__u64 sample_simd_reg_user;

I would perhaps make this vec_reg.

>  };
> 
>  /*
> @@ -1016,7 +1035,15 @@ enum perf_event_type {
>  	 *      } && PERF_SAMPLE_BRANCH_STACK
>  	 *
>  	 *	{ u64			abi; # enum perf_sample_regs_abi
> -	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
> +	 *	  u64			regs[weight(mask)];
> +	 *	  struct {
> +	 *	  	u16 nr_vectors;
> +	 *	  	u16 vector_qwords;
> +	 *	  	u16 nr_pred;
> +	 *	  	u16 pred_qwords;
> +	 *	  	u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
> +	 *	  } && sample_simd_reg_enabled

Instead of using sample_simd_reg_enabled here I would perhaps extend
perf_sample_regs_abi. The current abi word is woefully underused.

Also, realistically, what you want to look at here is:

  sample_simd_{pred,vec}_reg_user;

If those are empty, there will be no registers.

> +	 *	} && PERF_SAMPLE_REGS_USER
>  	 *
>  	 *	{ u64			size;
>  	 *	  char			data[size];
