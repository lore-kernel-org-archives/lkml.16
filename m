Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575D26B085
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840189; cv=none; b=rCV7ea8XguQtWEjwKMVXlIPNX+RwWP9oj4Wm6dGs+0X1EgMPAWxZrMl2zaSPcrAdS8WtO5x1hKTgULacuTZXJlS9RHW18JGiqMrNmizFF7dDI5XoTsIvyaC5oRbbqoXdb1dYSxf143hWp0SM4ObrkDhh0qylfCRDm9fJnteob6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840189; c=relaxed/simple;
	bh=f+o8iEPouqOHBWyxZ8dTxNmU58i6ENQXee19SBZ0B3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qF/2Itt5uXiB4kmorO4nlAMENbKj1xXEB65IldX+XLrJfZwuweNNbfiRcYeiw03cTfniMvBVtF88sLYywlwq9YBs6ormLyWDO5nZ5qhh1N9BR5P9uwRMfBvLFNHridOhbUpO48IHW+maOF/s674UibHyN8unl3Xm2lDbJaRJhpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bpnhslPO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bpnhslPO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fWPaB80+3HWu+QPjwcL43NRsxuq/i0mNSJil+VDDtCE=; b=bpnhslPOuwpAv5MIFbclSTE58N
	VlQToVKxMVzWYNe4JgqmrVls+RsRyDCgNS/u99gI9xHeUQ2ryPxnfsNE+930VMvC0b+jSPLCANOFD
	8NZaA/ebsYPHP3LWprw5kZNcCFeZ0Wj5bApNkD7eZOLR9r/wwWVWkN7RQQ/RRg9+U96cjeZ3vBLCf
	i0TOGdJbRsJmTNBd3N6YyM6pxL368MBkqYkb9bAhd9ssq+z/rypi00eCiBRdFU40DT7dK/HnnJxWy
	C0ljmhqrYcdo04xTHkbFoPPGk4iqFS1nZ0NXSIwjD0SSg08bAXmUfPofSgGSPbxby7a1cl4d1pN0h
	MnXjq2qA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULVe-00000008tHl-0J2Y;
	Wed, 25 Jun 2025 08:29:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C49BF308983; Wed, 25 Jun 2025 10:29:32 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:29:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li Chen <me@linux.beauty>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH v3 2/2] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
Message-ID: <20250625082932.GA1613200@noisy.programming.kicks-ass.net>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-3-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625034552.42365-3-me@linux.beauty>

On Wed, Jun 25, 2025 at 11:45:50AM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> Currently, the SMT domain is added into sched_domain_topology by default.
> 
> If cpu_attach_domain() finds that the CPU SMT domain’s cpumask_weight
> is just 1, it will destroy it.
> 
> On a large machine, such as one with 512 cores, this results in
> 512 redundant domain attach/destroy operations.
> 
> Avoid these unnecessary operations by simply checking
> cpu_smt_num_threads and remove SMT domain if the SMT domain is not
> enabled, and adjust the PKG index accordingly if NUMA-in-package
> invalidates that level as well.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
> changelog:
> v2: fix wording issue as suggested by Thomas [1]
> v3: remove pointless memset and adjust PKG index accordingly,
>     as suggested by Thomas [2] 
> 
> [1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
> [2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/
> 
>  arch/x86/kernel/smpboot.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 7d202f9785362..4b6daa1545445 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -494,13 +494,29 @@ static struct sched_domain_topology_level x86_topology[] = {
>  
>  static void __init build_sched_topology(void)
>  {
> +	bool smt_dropped = false;
> +
> +	if (cpu_smt_num_threads <= 1) {
> +		/*
> +		 * SMT level is x86_topology[0].  Shift the array left by one,
> +		 */
> +		memmove(&x86_topology[0], &x86_topology[1],
> +			sizeof(x86_topology) - sizeof(x86_topology[0]));
> +		smt_dropped = true;
> +	}
> +
>  	/*
>  	 * When there is NUMA topology inside the package invalidate the
>  	 * PKG domain since the NUMA domains will auto-magically create the
>  	 * right spanning domains based on the SLIT.
>  	 */
>  	if (x86_has_numa_in_package) {
> -		unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
> +		unsigned int pkgdom;
> +
> +		if (smt_dropped)
> +			pkgdom = ARRAY_SIZE(x86_topology) - 3;
> +		else
> +			pkgdom = ARRAY_SIZE(x86_topology) - 2;
>  
>  		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
>  	}

Oh gawd, and you all really think this is better than dynamically
creating that array?

This is quite terrible.
