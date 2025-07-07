Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70BB299952
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893898; cv=none; b=dGN5V+WXW8qg3wyKg939eoki4CBInNyTHQo7wpZ5wM9gl/XNNGzL5Kdsy9jQ7hU9R3o8n6ECMBmEkyc6kg7ukSFPKmV1wxIsgo7l6WTjty+XRCdH7JP29/hUYz3KBQOWr3qmcFVvaMn/SspbgYpHwe1ea5Wg15yNBKOoy90ydRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893898; c=relaxed/simple;
	bh=XDiwfhbYrMjUL7vP4j8tnf5zRFoURkJAU/mBdb9ini0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1rD/uzmekK17Y/YrB2j6hCGrWziabhWyFt/h1SbA7NgHaw07X0XYz74dxfCLWeWdS4tkp3SmetuC3hutBG7GUkjptYz6H0UTKktGwzC+4hvjhm/63nyhlgzpWVEuT7L8Z7oKWBfqOQwpuM+A4DKjvew6tlXp0ry1nTo9awK+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYKxGUvF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYKxGUvF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C516C4CEE3;
	Mon,  7 Jul 2025 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751893897;
	bh=XDiwfhbYrMjUL7vP4j8tnf5zRFoURkJAU/mBdb9ini0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYKxGUvFvLp1X7YKUNCuxiU1im+h8dr6C37jG74LdI7bfLBZejumkBt5zYLjFHREP
	 bDWTICqmFS67BJ7JYJUbj7QQ0TnzThWL0xmayZ3iJUEC6C4m9Biv2eq4Tk1vsK39dk
	 iiYf+1BoYwsO9Uv3m5D60zmgCyCNQrLOzPHPa1ADjvO4ODyh9H6WuXZgBbjn5lG/Db
	 EBjuXcyquZpVKv75DbQNasIZ1/90VBuZqFQoYz5bxe6OL+okrLit5F/MbLcAkKwOGl
	 uS5BseU8vWSRG+gPXPSe1JDcKdpTpwcJV8i1MbEf18VvvnqmjjNjOa1kjxsUOkD6uf
	 pnWs9OmRRLo+A==
Date: Mon, 7 Jul 2025 15:11:34 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v7 7/7] timers: Exclude isolated cpus from timer migration
Message-ID: <aGvHhsWysTN3rmCt@localhost.localdomain>
References: <20250626114900.106061-1-gmonaco@redhat.com>
 <20250626114900.106061-8-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626114900.106061-8-gmonaco@redhat.com>

Le Thu, Jun 26, 2025 at 01:49:00PM +0200, Gabriele Monaco a écrit :
> The timer migration mechanism allows active CPUs to pull timers from
> idle ones to improve the overall idle time. This is however undesired
> when CPU intensive workloads run on isolated cores, as the algorithm
> would move the timers from housekeeping to isolated cores, negatively
> affecting the isolation.
> 
> Exclude isolated cores from the timer migration algorithm, extend the
> concept of unavailable cores, currently used for offline ones, to
> isolated ones:
> * A core is unavailable if isolated or offline;
> * A core is available if isolated and offline;

If not isolated and online ?

> +static int __init tmigr_init_isolation(void)
> +{
> +	cpumask_var_t cpumask;
> +
> +	if (!housekeeping_enabled(HK_TYPE_DOMAIN))
> +		return 0;
> +	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
> +		return -ENOMEM;
> +	cpumask_andnot(cpumask, tmigr_available_cpumask,
> +		       housekeeping_cpumask(HK_TYPE_DOMAIN));
> +	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
> +	on_each_cpu_mask(cpumask, tmigr_cpu_isolate, NULL, 1);
> +
> +	tmigr_exclude_isolated = true;

This should be set unconditionally, even if
!housekeeping_enabled(HK_TYPE_DOMAIN).

Otherwise future cpuset isolation followed by cpuset de-isolation
won't make the CPUs back available.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
