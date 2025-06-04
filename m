Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36A0320F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062939; cv=none; b=T241S+W9AJi/ioz2Rx/9r3xuF5Nv61VCRysaHA2HIW6nvb9jwxp92JBfNf0BHAqzr45HU2Y9dLvtaahXFPLt0VJrhMV0Hzi2asRRLu2PFtJ/HV8GQ64dAR/mWbyd8tdzJHyNfpqP6r/oa33Kx2+jD4r2oAt+aI+KIUreL9RGE7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062939; c=relaxed/simple;
	bh=GUhaT+NknqwSiPUVR0NbeM3TqWpWbw/LMIuBuGjlJJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj7mdrnb9nIs+5g7c2EaRhLZOgoGpa/B8CN2nlJccNEilelGnjaIEL/JDfDr4guzU4Hjbe2Y53HZFy3DiDoFA9VMMJQo4LmKHmA0VcIrToJSPqffvD3F/1BdLWnNnECOlRSHhoE7Ud5X4rlKYVuyOf9IKib6+coYpnbMOMAsbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDI+bAlp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDI+bAlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6058BC4CEE4;
	Wed,  4 Jun 2025 18:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749062937;
	bh=GUhaT+NknqwSiPUVR0NbeM3TqWpWbw/LMIuBuGjlJJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDI+bAlp93ZUnkvtx2YaO74fTgQWyhNbrzexhYK/YrW5XGPZgC3DwZzIGAlBj7SXz
	 Tb0BsxxzpgsScYYw3EcY/ssmBE+bMtP8aqmm8rTvagFsFlSxgjZ54PzTBNxy2+LHKp
	 yv9bEfCV80jBLt1GEhsRGIDzEnBtJyHRB/yRNEW0R8v9u6/COAjcISBcNHquZJcl1D
	 E+Dw516mF0fxslFm322lMkETGbplOquMw+9nQQVbiownp1hyYDlE4vw3WmfCDA/hyJ
	 +uNhcLI+5z1Q8FvieUuVfHSuAlhPM4axlXY3D06zAjznSzEu7PfJofoVtUjDFpG9+h
	 zQ09CjexzvAUw==
Date: Wed, 4 Jun 2025 08:48:56 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] sched_ext: Make scx_locked_rq() shared
Message-ID: <aECVGF4_qVIEwXk2@slm.duckdns.org>
References: <20250604143547.708202-1-arighi@nvidia.com>
 <20250604143547.708202-5-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604143547.708202-5-arighi@nvidia.com>

On Wed, Jun 04, 2025 at 04:33:14PM +0200, Andrea Righi wrote:
> scx_locked_rq() is used both from ext.c and ext_idle.c, so make it
> public and declare its prototype in ext.h.
> 
> No functional changes.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  kernel/sched/ext.c | 2 +-
>  kernel/sched/ext.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 3e483138dff60..941603ec67e27 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -1265,7 +1265,7 @@ static inline void update_locked_rq(struct rq *rq)
>   * Return the rq currently locked from an scx callback, or NULL if no rq is
>   * locked.
>   */
> -static inline struct rq *scx_locked_rq(void)
> +struct rq *scx_locked_rq(void)
>  {
>  	return __this_cpu_read(locked_rq);

Can you rename locked_rq to scx_locked_rq_var (or something else), expose it
and then make scx_locked_rq() an inline function in ext.h. Alternatively, I
think it'd be fine to drop the wrapper and let each user do
__this_cpu_read(scx_locked_rq) too.

Thanks.

-- 
tejun
