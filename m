Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA231DEFE8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486369; cv=none; b=U8m8UFDxOdwbANhabj2w7gnnnbS6jDBKBX8qtt1rv8itkcvaqJ2SN9pcGAkfJJbCsiAA74S/8SrRsGwZKBbEXV7PzxO7wqoJCFhcpOAHLjVOQuTb6jNlH9fmJOFx6/Y2Y7+Xr8v//iyTCLWu9EEffcBBS8XMRdq8AIir/1Q0DTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486369; c=relaxed/simple;
	bh=9ougo49U8Jli9bzh/lX1P61wDzEtlGygZMNxFz0RfUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atVMMElKbJS4js+V4GwO0sPNRnWsagiBCBHBFR4pDvMOf7nBanul8EOXhBDswR88EYEAAhkg5swF7Y7ZdVfp+de696llTG3c4FB7l2Hvo9ZFtiGojRTPTiZ1No8JVyq+HaeQJKh+NQGNG1EPIyNLXigVYy3dz6Ra6kxcgN0uJ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7BPYthw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7BPYthw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069B5C4CEEB;
	Mon,  9 Jun 2025 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749486369;
	bh=9ougo49U8Jli9bzh/lX1P61wDzEtlGygZMNxFz0RfUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7BPYthwglUZNFa0WeaMiSZgyV4gJmK3L/dxR+Mn3/69YUXk3E8CiTAyOpvKls64j
	 vSg6ezU4UrSmGfOECO2fBjOdxPbswGBiSDbTLMhTGZDheKk2sg24vQWMhbIzsuCVDG
	 hT+YPqqdtbKG4lZznKtpi52cP7sNLR5taqViJIWF0eNd5PYRVz8YUJi9gRDEPP8Z5+
	 qQ+U+3/jrgoz2cMRMm2ZS+hcOYDliEqJxMtO1UbSLfY0ANqEUSB9ndK6pRorP5HbpZ
	 iC2gJ7Csh+LOXPcq74lqFGaI1gJJUtS+fcZQhyDUd8zkFAVQMZnxpC8/OmXX19W8Jd
	 +N1AP+q/bjJVA==
Date: Mon, 9 Jun 2025 06:26:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sched_ext: Improve code modularization
Message-ID: <aEcLIGNPZZMOZVtz@slm.duckdns.org>
References: <20250604143547.708202-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604143547.708202-1-arighi@nvidia.com>

On Wed, Jun 04, 2025 at 04:33:10PM +0200, Andrea Righi wrote:
> Despite the unusual structure of the scheduler code, where the source code
> of all scheduler classes is included in a single .c file, we should still
> structure the code as if each .c file were a standalone build unit. This
> means marking internal functions as static, declaring shared symbols via
> proper function prototypes in a header file, etc.
> 
> This patch series is a first step toward such cleanup for the sched_ext
> code. There is more work to do, but these changes are intentionally small
> to minimize potential disruption to the ongoing development, laying some
> groundwork for a cleaner and more maintainable code.
> 
> Andrea Righi (4):
>       sched_ext: idle: Remove unnecessary ifdef in scx_bpf_cpu_node()
>       sched_ext: idle: Make local functions static in ext_idle.c
>       sched_ext: Make scx_rq_bypassing() inline
>       sched_ext: Make scx_locked_rq() shared

Applied to sched_ext/for-6.17.

Thanks.

-- 
tejun
