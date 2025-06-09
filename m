Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797C1D5145;
	Mon,  9 Jun 2025 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483279; cv=none; b=BZvCcqMAoILL+7lasex2I/V2ytb13nPnVNkcwy/uPilCoVSVMlEcDGTO8xHnfECbUvHKaRkyUKjy+fzBchmOdDk+BZqX6pTSt4YxVzDR731iTedbXt9X+etclIISDY1X3nMSaMpjpxFzI+0nU7KPJlHx/0rI3VTBqn8KnFalWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483279; c=relaxed/simple;
	bh=rJ0dKCI6FizSqv1KsmJCxjCnLfD7wV+uXaYhQiwtVyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5+2PZ3P5PuEXd0/iJ9NEzmAS5x3NAegGGvYxwteaQUayFAuIlHlquQS9P5M8cDBRKl5PbTtRnQeEEXxLc12fRKDIpxlJ3YT80b8gDsWSmFK6/N2XHfsWGMrbN0aj0pnnYBi9PlYU7m6/dqqLrmpXOYDcJ/vj+5FXsUQeReVPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SyaH7X2A; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SyaH7X2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749483274;
	bh=rJ0dKCI6FizSqv1KsmJCxjCnLfD7wV+uXaYhQiwtVyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SyaH7X2AjTdpmHREtSCNh+inUQ81NzASls6AVx1xftSWlXoSsoHAha+lLWLfOWPH7
	 3t6w10VagEIJgtmPS0I8C3Bt6sXKQxQkVfbEtKgddptuOQNMX9cMO+StgD7ele+l18
	 pngksDER6b6aQnIVsNfUAJns+QQZzXKby2rBOTuk=
Date: Mon, 9 Jun 2025 17:34:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: Provide vfork()
Message-ID: <df6f5620-5986-4080-bb00-c7bee856bf66@t-8ch.de>
References: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
 <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>

Small followup review, sorry for the noise.

On 2025-06-09 16:08:56+0100, Mark Brown wrote:
<snip>

> +#ifndef sys_vfork

This ifndef is not necessary here.
No architecture has a special version.

> +static __attribute__((unused))
> +pid_t sys_vfork(void)
> +{
> +#ifdef __NR_vfork

For consistency:
#if defined(__NR_vfork)

> +	return my_syscall0(__NR_vfork);
> +#elif defined(__NR_clone3)
> +	/*
> +	 * clone() could be used but has different argument orders per
> +	 * architecture.
> +	 */
> +	struct clone_args args = {
> +		.flags		= CLONE_VM | CLONE_VFORK,
> +		.exit_signal	= SIGCHLD,
> +	};
> +
> +	return my_syscall2(__NR_clone3, &args, sizeof(args));
> +#else
> +	return __nolibc_enosys(__func__);
> +#endif
> +}
> +#endif
