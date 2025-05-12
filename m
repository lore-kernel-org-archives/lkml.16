Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833FB296D32
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070395; cv=none; b=nTRYh4oYxZ3Qz/brABd3ujLld85lAWvW4adJr/jSmiJnD0rgjtIawLzmSiS14ulZoSXQqu3H4Jl7CoG9wIcVRh845ABc/lbrhoe1iZqe53XyGDgHy6RxNxMpEoWWn576E4ixUIt0XDvxbOpC+3Bv/MD0kVElHgxJQcREdlBzPVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070395; c=relaxed/simple;
	bh=2KGHEqoUXoSNT3Av3wticQPT6uCXsOqGUANUSuTE0cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaBVJ2BobDjp8Uby8LQ0XsuTaDuCbDpHOpevipXpaZc79usdBnxJiWlEbJdrBZIHoJ7e9/zR8tRhOGAU3sv8VCmNGDbFv4STwXDnkvqnG6zCO4D+EGHAXcJZiRktbYjp+Fdn3AlEhBSyGg3bSQwU2lIxkRw2uItjYZO3kW0XdlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4BfCBpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4BfCBpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFA3C4CEE7;
	Mon, 12 May 2025 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747070394;
	bh=2KGHEqoUXoSNT3Av3wticQPT6uCXsOqGUANUSuTE0cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4BfCBpOdyWcGd5VTWAcziXqh8e7nZScn2XpARli4xKBP/ygC+gMLRxzhD/WMSle/
	 33elWYYkhBdnPh+IKwsgb9B1YZ6BAyvejXwFDI8OpTCHUGlSsEYHnZHXTsaoglW/Mr
	 CDEPBiM2U+q7TJ4hoa0O9UwSfdtJbyi8qctOBjXcGEL4ZLiznVE3+yHTb332Y51Tva
	 0wGMUgpYTBA/VK7b2tQFVv+9bzvM1QUgIHcf4s6Jt7V0LQMG7E8Pc4xOA1pxxiEHmN
	 YUHaRpqBhy13L5d2MdhsFXeBWnGZzqF2fzT0qUBgQWE6lhvYlWFOx3b+Z+D+LXN6ZQ
	 dw9j2YPzOOvtw==
Date: Mon, 12 May 2025 07:19:53 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <aCItuWh-BLp3jC6h@slm.duckdns.org>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512151743.42988-3-arighi@nvidia.com>

Hello,

On Mon, May 12, 2025 at 05:14:56PM +0200, Andrea Righi wrote:
>  #ifdef CONFIG_SMP
> +	/*
> +	 * If called from an unlocked context, try to acquire
> +	 * cpus_read_lock() to avoid races with CPU hotplug.
> +	 */
> +	if (scx_kf_allowed_if_unlocked())
> +		if (!cpus_read_trylock())
> +			return -EBUSY;

Is this meaningful? The idle CPU selection is already racy against CPU
hotplugs and we depend on the scheduler core to fix it up afterwards. Even
if scx_bpf_select_cpu_and() is not racy, it will drop the cpus lock before
returning and becomes racy again right there. ie. This doesn't add any
meaningful protection.

Thanks.

-- 
tejun
