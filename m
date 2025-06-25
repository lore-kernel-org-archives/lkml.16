Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D06D274FC2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840236; cv=none; b=bMyWUp360xtTOKZPAs4JyC76NwCGXpo7uWGnYEOd2an+rvTk2ttwpY+0BMNmeMhR/jCTv1/hPnKcyoB2rnvAtu8qzHIDKa8W0cut/09tvHZvh2RpHvMAUuXR3Pi+qSLSJMA+ImWoLOZTDULC4o93fag+7ts03lkSuzbz1kfColg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840236; c=relaxed/simple;
	bh=oLeHmXMCyNzfi09MpzSPcz/nY0Q51SvV6LbPfzvfAz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCnBL5KUeW2vfO/CUL/eirkkNbw4Y9w1fjN0+AXCoi9BKXrAF2clVnxjv2fP8p63LGZz/y67rmiDpCSUOA1Nvv4w8IyvxZgPJ1EjPiPQzsW8lDbxFWlp6znGqjSDMFt9CvKMphyMET0ALkJIb7hTsRuVbKyhKEvoXA+wnsjMDaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vty8T+AR; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vty8T+AR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CLEu7aPuqNC0u8GFKcviIM3yEC5pObYHmNVH2td7310=; b=Vty8T+ARRYRxUFWR8kYb7GUV07
	h/49kuESGcvWJ7TW0YbTqJ6bxLy4b2N0BEpmfD8lFPPmNiqKmSUN3dUwBzgBGx/t/3KBtZXWgHc/i
	X62pW9MKUNfmOFhop3dgd1A8/Dr+/lCZMT2LnLycmMoYJaK+yR6cfGRzSNBlE3Jn/O/AfIk5d7oYX
	OpDCpDIUe2nPKIzqboveMR49jk5LSN+Y/dgd/spLDHJ8UCApCIAGOghpRZ00ikhmbN//bSvj1awlx
	GFWd3HtTb47oy8gWyS4r3UY3u00EEJpMF0qlm5nMoGUJtZpETg1yNrJocVE6AC77q2AByVlVIe7NE
	1JiPfvpQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULWP-00000008tOP-1JFl;
	Wed, 25 Jun 2025 08:30:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E8F0D308983; Wed, 25 Jun 2025 10:30:20 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:30:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH v3 2/2] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
Message-ID: <20250625083020.GB1613200@noisy.programming.kicks-ass.net>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-3-me@linux.beauty>
 <1b706790-2fec-4582-a425-55eeff36c32e@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b706790-2fec-4582-a425-55eeff36c32e@amd.com>

On Wed, Jun 25, 2025 at 11:15:22AM +0530, K Prateek Nayak wrote:

> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 3818b16c19e1..1793248d28cd 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -494,6 +494,8 @@ static struct sched_domain_topology_level x86_topology[] = {
>  static void __init build_sched_topology(void)
>  {
> +	struct sched_domain_topology_level *topology = x86_topology;
> +
>  	/*
>  	 * When there is NUMA topology inside the package invalidate the
>  	 * PKG domain since the NUMA domains will auto-magically create the
> @@ -504,7 +506,15 @@ static void __init build_sched_topology(void)
>  		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
>  	}
> -	set_sched_topology(x86_topology);
> +
> +	/*
> +	 * Drop the SMT domains if there is only one thread per-core
> +	 * since it'll get degenerated by the scheduler anyways.
> +	 */
> +	if (cpu_smt_num_threads <= 1)
> +		++topology;
> +
> +	set_sched_topology(topology);
>  }
>  void set_cpu_sibling_map(int cpu)

Yes, that is far saner.
