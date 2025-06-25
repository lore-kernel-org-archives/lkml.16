Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3426C398
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840120; cv=none; b=IIOOmbhR1KrZM84TtF24MK5NPFXQWkfbhPouanQgdubt39mOgUucRnFZTc9Vm0JjSWI6+YxJaBZpeHSmUgta0LV4QBX6/G1djGCZQBQ16E+nNPCIplZUxzv3nSMrvnAmkYtYP42GfNIbMYIVyuU03NcQaxR3X5EWbOGgJtLvY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840120; c=relaxed/simple;
	bh=oYm6EAfxKR3PW3gDzWvq2hY3FtZVxUU65xPxicZN8FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKTwWTTIR0ecCqXNnKabYMEcSl2YFACftpBjsLOl1p1H1qahOMx9GEPh+CmaEvpoYJeleIheDWmGiMyDPyNdKJZUDHB3u59Q+JCTy1zrGabIT6QXN67IBKrwcm0CEjOGRO9U9Q/OCgIG5Fxp0qGtLGmUv8cfTdo7VM7hIS3rFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CUB7svhV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CUB7svhV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jBrzgKyMH2BQwGWWuoUedXne7+asdcqno5NOL/oXBO0=; b=CUB7svhVPe8wPPIot34o2/Y85z
	nva+mpiJxXQWWLhj1ul0hz82SOShFMm4F8g4Dk3xngJkHDBQCNZX9LkF7yIIgv23Q7vhoQKcO1TWx
	SaQ9c3kTBhkRsSVUraubot3J4E6aB2/NZSJUiYoLHxv28Om5n2W5SGfAGdw3J9PLiAQXKMqxro30M
	xsPbIUBK35dCAqFseLcBLh63t0ek6wrMGm7c8RIsOA/B09pnyDc1yyXWFHOBP1541hoF2+aZKAv1r
	B0+J1NkZJ2feEHHE7/ADke3A7R04MzgKJx0coAup6zWKVm9cpJV16ZAUL4GVWvx3VBsNjAPRCRbYj
	X6mWI+eA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULUS-00000005ggZ-0z83;
	Wed, 25 Jun 2025 08:28:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8510E308983; Wed, 25 Jun 2025 10:28:19 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:28:19 +0200
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
	linux-kernel@vger.kernel.org, Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH v3 1/2] x86/smpboot: Decrapify build_sched_topology()
Message-ID: <20250625082819.GZ1613200@noisy.programming.kicks-ass.net>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-2-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625034552.42365-2-me@linux.beauty>

On Wed, Jun 25, 2025 at 11:45:49AM +0800, Li Chen wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The #ifdeffery and the initializers in build_sched_topology() are just
> disgusting. The SCHED_SMT #ifdef is also pointless because SCHED_SMT is
> unconditionally enabled when SMP is enabled.

On x86, but not across all archs. Yes this is x86 code, but how is one
supposed to keep all that nonsense straight in their head ;-)

> Statically initialize the domain levels in the topology array and let
> build_sched_topology() invalidate the package domain level when NUMA in
> package is available.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/x86/kernel/smpboot.c | 45 +++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index fc78c2325fd29..7d202f9785362 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -478,43 +478,32 @@ static int x86_cluster_flags(void)
>   */
>  static bool x86_has_numa_in_package;
>  
> -static struct sched_domain_topology_level x86_topology[6];
> +#define DOMAIN(maskfn, flagsfn, dname) { .mask = maskfn, .sd_flags = flagsfn, .name = #dname }
>  
> -static void __init build_sched_topology(void)
> -{
> -	int i = 0;
> -
> -#ifdef CONFIG_SCHED_SMT
> -	x86_topology[i++] = (struct sched_domain_topology_level){
> -		cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
> -	};
> -#endif
> +static struct sched_domain_topology_level x86_topology[] = {
> +	DOMAIN(cpu_smt_mask, cpu_smt_flags, SMT),
>  #ifdef CONFIG_SCHED_CLUSTER
> -	x86_topology[i++] = (struct sched_domain_topology_level){
> -		cpu_clustergroup_mask, x86_cluster_flags, SD_INIT_NAME(CLS)
> -	};
> +	DOMAIN(cpu_clustergroup_mask, x86_cluster_flags, CLS),
>  #endif
>  #ifdef CONFIG_SCHED_MC
> -	x86_topology[i++] = (struct sched_domain_topology_level){
> -		cpu_coregroup_mask, x86_core_flags, SD_INIT_NAME(MC)
> -	};
> +	DOMAIN(cpu_coregroup_mask, x86_core_flags, MC),
>  #endif
> -	/*
> -	 * When there is NUMA topology inside the package skip the PKG domain
> -	 * since the NUMA domains will auto-magically create the right spanning
> -	 * domains based on the SLIT.
> -	 */
> -	if (!x86_has_numa_in_package) {
> -		x86_topology[i++] = (struct sched_domain_topology_level){
> -			cpu_cpu_mask, x86_sched_itmt_flags, SD_INIT_NAME(PKG)
> -		};
> -	}
> +	DOMAIN(cpu_cpu_mask, x86_sched_itmt_flags, PKG),
> +	{ NULL },
> +};
>  
> +static void __init build_sched_topology(void)
> +{
>  	/*
> -	 * There must be one trailing NULL entry left.
> +	 * When there is NUMA topology inside the package invalidate the
> +	 * PKG domain since the NUMA domains will auto-magically create the
> +	 * right spanning domains based on the SLIT.
>  	 */
> -	BUG_ON(i >= ARRAY_SIZE(x86_topology)-1);
> +	if (x86_has_numa_in_package) {
> +		unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
>  
> +		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
> +	}
>  	set_sched_topology(x86_topology);
>  }

Urgh, this patch is doing at least 4 things and nigh on unreadable
because of that.

 - introduces DOMAIN() helper
 - drops (the now pointless) SD_INIT_NAME() helper
 - drops CONFIG_SCHED_SMT (x86 special)
 - moves to static initialize and truncate


