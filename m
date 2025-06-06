Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7329B2857EE;
	Fri,  6 Jun 2025 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203026; cv=none; b=htnlUd0I2/zlqDVSpSQYhwQ1SP9fr4+Q0GlO6lqON/ZSrEvRZidGh+JtBqAMyRzG5EqbnKjd5bhba1pSGU7yvmPWTrxNavAh9YpTpatb0oZVaQpZEnJGOX8E1UCZbBqB6F87EmEnUQ5hl/I3/6wdNlOKfYzmJngu6e5VZEhVay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203026; c=relaxed/simple;
	bh=CGa6Fxkxq4yuPjwo3CTYeG71tpsCcLUb40D4q4WTZ+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQIhaA6vnYdHygBLOTD5V/6HOBDal6JolxmXe4Irvp9IY3n0J+dQNw2AaYzcZpVjUAfeMh8xSPV6oqsy8TgUzJe462Dil+5eILrMqw1i/iw0uEPmLBz+yoDRLTdOw9lVmN3NiNqwNBTR3kPLYp626TA/N3YVTizvHnBoO7EImEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF043153B;
	Fri,  6 Jun 2025 02:43:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D5C93F59E;
	Fri,  6 Jun 2025 02:43:42 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:43:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Fix children encountered before parents case
Message-ID: <aEK4QmtXO_GL5K_0@pluto>
References: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>

On Wed, Jun 04, 2025 at 01:00:30PM +0200, Sascha Hauer wrote:
> When it comes to clocks with parents the SCMI clk driver assumes that
> parents are always initialized before their children which might not
> always be the case.
> 

Hi,

> During initialization of the parent_data array we have:
> 
> 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> 
> hws[sclk->info->parents[i]] will not yet be initialized when children
> are encountered before their possible parents. Solve this by allocating
> all struct scmi_clk as an array first and populating all hws[] upfront.
> 

Yes indeed, good catch.
Thanks for this.

Just one minor nitpick down below.

> Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/clk-scmi.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 15510c2ff21c0335f5cb30677343bd4ef59c0738..f258ad7dda73e3c50c3ce567a8e22b3d2ec9836b 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -404,6 +404,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  	const struct scmi_handle *handle = sdev->handle;
>  	struct scmi_protocol_handle *ph;
>  	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
> +	struct scmi_clk *sclks;
>  
>  	if (!handle)
>  		return -ENODEV;
> @@ -430,18 +431,24 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  	transport_is_atomic = handle->is_transport_atomic(handle,
>  							  &atomic_threshold_us);
>  
> +	sclks = devm_kcalloc(dev, count, sizeof(*sclks), GFP_KERNEL);
> +	if (!sclks)
> +		return -ENOMEM;
> +
>  	for (idx = 0; idx < count; idx++) {
> -		struct scmi_clk *sclk;
> -		const struct clk_ops *scmi_ops;
> +		struct scmi_clk *sclk = &sclks[idx];

...do we really need this intermediate local variable in this initializarion loop ?
...doesnt feel like giving more readability (even though the compiler will probably
kill it anyway...)
  
> -		sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
> -		if (!sclk)
> -			return -ENOMEM;
> +		hws[idx] = &sclk->hw;

....cant we just

  	for (idx = 0; idx < count; idx++)
		hws[idx] = &sclks[idx].hw;


Other than this, LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
