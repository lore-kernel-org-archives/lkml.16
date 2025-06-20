Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E6289E1F;
	Fri, 20 Jun 2025 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421249; cv=none; b=L6g9nA/LwN1Im01PoMwINYOcFY2FxZ2YPQFjDc3SX4Bt3J1guGL2rFGKdh/XvoK5VbPONui3Qs5QVHlEnFZ12/O7Gx97WFgQcBJ5lVzCFk1Jk1esmf4HHOrn3Gldd1rj4NaFWJPe1i6q0VGcM1llUoSsMpAMj4vxoLYjnKUjZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421249; c=relaxed/simple;
	bh=I3sZjEFvcTCYLdlufKW87LIGuVUGoPbgZ1U3ea4YMG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oL5v3hvpCpehz+GtE6bwe3nh2LFkVQEOJMWyC4KmCpxoefVrcbvYB27+YtAjGATSTjRa1/p1nrI6MuHpXzbbCjFA9dHiowqLHJRCtXil/tFDu2hZhx+wVcwN2aqQeLmjr9hOHLRHzsXEna79oQciSACFZUYOJ6s906v6741JK44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnPJv1/J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnPJv1/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750421247; x=1781957247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3sZjEFvcTCYLdlufKW87LIGuVUGoPbgZ1U3ea4YMG8=;
  b=dnPJv1/JDzn2JHG4Y0R1vZ7GkUjg8bP2+Ac2bNP9d61OuCJM+386gxoV
   15aaMB8xntxmOZjmkx4gaUES1lUNSj4QjJqPuD0KpZHS1D6eoKBltX71C
   sxgFtvdB7mvEgOZiWuYieKQCNNf7YI1Wl/JCrY8xDhwAZaoz/Krko+X1l
   ZS2XZiqv+XxhKDD6pNVdzU+q2w+QrdspP6S9Np235zmYCQ8kRgNo4SjHz
   9XWg6qqthrki2CDKHiDtukr3tPnL/LA9aKdfR80FcLxGIN+mOkXYzi8fA
   QFYcV69xoz3GGy9DvlroBXYOd//iypDYZcIVYKzML7fjKkXCwwXsKevSb
   Q==;
X-CSE-ConnectionGUID: Fuh3aMq6TeiaPt1vjJ2clQ==
X-CSE-MsgGUID: I7lJflNJQAGhjpYpU93v5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52649718"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52649718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 05:07:27 -0700
X-CSE-ConnectionGUID: fguDYWZWQByvLefjZ2/mIw==
X-CSE-MsgGUID: XNhXfj9eTlGgZBeEmQbmHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156709436"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 05:07:26 -0700
Date: Fri, 20 Jun 2025 15:07:21 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: renesas: rzv2h: use devm_kmemdup_array()
Message-ID: <aFVO-QtE3D3dU7y8@black.fi.intel.com>
References: <20250610072809.1808464-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610072809.1808464-1-raag.jadav@intel.com>

On Tue, Jun 10, 2025 at 12:58:09PM +0530, Raag Jadav wrote:
> Convert to use devm_kmemdup_array() which is more robust.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Bump. Anything I can do to move this forward?

Raag

>  drivers/clk/renesas/rzv2h-cpg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
> index bcc496e8cbcd..57ba8755025c 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -1004,8 +1004,8 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
>  	/* Adjust for CPG_BUS_m_MSTOP starting from m = 1 */
>  	priv->mstop_count -= 16;
>  
> -	priv->resets = devm_kmemdup(dev, info->resets, sizeof(*info->resets) *
> -				    info->num_resets, GFP_KERNEL);
> +	priv->resets = devm_kmemdup_array(dev, info->resets, info->num_resets,
> +					  sizeof(*info->resets), GFP_KERNEL);
>  	if (!priv->resets)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 
