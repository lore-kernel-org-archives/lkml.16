Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671BE1D9663
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273304; cv=none; b=tLEuiNvolA17RtThO38oZ+LPJtTbk9S7KSEqHz8jleiJ6X6OlzxF11vATIr6u5ZUe8FGmvLclMx8cHz9BccpQeksYpGzSI+/cNV7WupgM6ieJZwsgwfe1RGXcALJanWHOxb9CbxzSfjmwGXTopnQOyArqr05FkkaeVoQHwtPtzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273304; c=relaxed/simple;
	bh=GLyuwmhfQTbO6A0KpqxLq0nFrLsDd5zxBBhnfG9f2ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC0weDHBqi5GlZfjfWpxWfRcusL5h2VUwqbRnoOL/lDa6bvvbHuqwToWrwO7g+SwQdj4Q3N5nkPfUDLrFqEdPVEX3Ek5NzG4UllS8yOqLnpQI4UK6ToxijHWMpGumLW2fHo5KGgw6r6IoEA8Z4CM0hnFoI1IHhzSftbIVsxK/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m/eEcyjR; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m/eEcyjR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aZUzmgr4awk2OfqDwSA49N0EKn2TsPmuSjz/m/RegPQ=; b=m/eEcyjRCcdugCM6rkkWkm7M93
	Bx47kBqlwjxKiY7ZRPwO0ae0JRCqZ2RK2a6CUwp2PvRw8KUWJ2PWp/YoQTr5waa3fXT/RMri5NDDa
	WbuxrVpQweEsW7NKXmVaHYTshttKTjSsQmcrimXo8BP6bGphzBkQJ6RlTyp4ALS2BY8pzN9Duk99i
	U6WIR68onUX5amQX6gworqxx2EEJSrBb2DiGAmOb2YHaY1Uhw9+LC1eNsWQGbLCakAk+0niEUUiPB
	COFY3kJzQuzlQRLI8PUhBKbYXo3RcMp/KG72P8IpTZnK4352WcANip9rX+88H1vvLIRn7ZiPQttZk
	KH/EtBdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWABO-00000003Ktl-0L60;
	Mon, 30 Jun 2025 08:48:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EAADD300125; Mon, 30 Jun 2025 10:48:08 +0200 (CEST)
Date: Mon, 30 Jun 2025 10:48:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	James Morse <james.morse@arm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [RFC PATCH] kernel/cpu: in freeze_secondary_cpus() ensure
 primary cpu is of domain type
Message-ID: <20250630084808.GH1613376@noisy.programming.kicks-ass.net>
References: <20250630082103.829352-1-shashank.mahadasyam@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630082103.829352-1-shashank.mahadasyam@sony.com>

On Mon, Jun 30, 2025 at 05:20:59PM +0900, Shashank Balaji wrote:
> On an x86 machine, when cpu 0 is isolated with "isolcpus=", on initiating
> suspend to memory, a warning is triggered, followed by a kernel crash. This is
> on a defconfig + CONFIG_ENERGY_MODEL kernel:

> This happens because in order to offline the last secondary cpu, i.e. cpu 1,
> build_sched_domains() ends up being passed an empty cpumask, since the only remaining
> cpu (cpu 0) is isolated. It warns and fails, after which perf domains are
> are attempted to be built, which crashes the kernel. The same problem occurs
> during cpu hotplug, but that was fixed by
> commit 38685e2a0476127d ("cpu/hotplug: Don't offline the last non-isolated CPU").
> 
> Fix this by ensuring that the primary cpu, the last standing cpu, is of domain
> type, so that build_sched_domains() is not passed an empty cpumask.
> 

> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  kernel/cpu.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index a59e009e0be4..d9167b0559a5 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1902,12 +1902,28 @@ int freeze_secondary_cpus(int primary)
>  
>  	cpu_maps_update_begin();
>  	if (primary == -1) {
> -		primary = cpumask_first(cpu_online_mask);
> -		if (!housekeeping_cpu(primary, HK_TYPE_TIMER))
> -			primary = housekeeping_any_cpu(HK_TYPE_TIMER);
> +		primary = cpumask_first_and_and(cpu_online_mask,
> +								housekeeping_cpumask(HK_TYPE_TIMER),
> +								housekeeping_cpumask(HK_TYPE_DOMAIN));

That's terrible indenting, please align after the opening bracket like:

		primary = cpumask_first_and_and(cpu_online_mask,
						housekeeping_cpumask(HK_TYPE_TIMER),
						housekeeping_cpumask(HK_TYPE_DOMAIN));

Also, IIRC HK_TYPE_HRTIMER is deprecated and should be something like
HK_TYPE_NOISE or somesuch. Frederic?

> +		if (primary >= nr_cpu_ids) {
> +			error = -ENODEV;
> +			pr_err("No suitable primary CPU found. Ensure at least one non-isolated, non-nohz_full CPU is online\n");
> +			goto abort;
> +		}
>  	} else {
> -		if (!cpu_online(primary))
> -			primary = cpumask_first(cpu_online_mask);
> +		if (!cpu_online(primary)) {
> +			primary = cpumask_first_and(cpu_online_mask,
> +								housekeeping_cpumask(HK_TYPE_DOMAIN));

Indenting again.

> +			if (primary >= nr_cpu_ids) {
> +				error = -ENODEV;
> +				pr_err("No suitable primary CPU found. Ensure at least one non-isolated CPU is online\n");
> +				goto abort;
> +			}
> +		} else if (!housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
> +			error = -ENODEV;
> +			pr_err("Primary CPU %d should not be isolated\n", primary);
> +			goto abort;
> +		}
>  	}
>  
>  	/*
> @@ -1943,6 +1959,7 @@ int freeze_secondary_cpus(int primary)
>  	else
>  		pr_err("Non-boot CPUs are not disabled\n");
>  
> +abort:
>  	/*
>  	 * Make sure the CPUs won't be enabled by someone else. We need to do
>  	 * this even in case of failure as all freeze_secondary_cpus() users are


Also; doesn't the above boil down to something like:

	if (primary == -1) {
		primary = cpumask_first_and_and(cpu_online_mask,
						housekeeping_cpumask(HK_TYPE_TIMER),
						housekeeping_cpumask(HK_TYPE_DOMAIN));
	} if (!cpu_online(primary)) {
		primary = cpumask_first_and(cpu_online_mask,
					    housekeeping_cpumask(HK_TYPE_DOMAIN));
	} 

	if (primary >= nr_cpu_ids || !housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
		error = -ENODEV;
		pr_err("Primary CPU %d should not be isolated\n", primary);
		goto abort;
	}

Yes, this has less error string variation, but the code is simpler.
