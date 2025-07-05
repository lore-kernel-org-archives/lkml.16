Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3141E4AE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751710075; cv=none; b=NwdGwYl5ctpnbbyxOBjn0Dd/42tfdBkZsX72Dl9vuxx+FywWKwyVNjaV04QLT+afICcFt1q9CJ+9VpMAPNXYt9LJlTzKo0l7LW0S9NRlh59M0BB4iBUkewKBMJIytKWkQmlkKYUUWkR+DYjzV3STOkTP+m9gKc2fWLRlKW+dN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751710075; c=relaxed/simple;
	bh=t4pZDQPqiB0ld/r3wNUn9dHEX9PQooqBSRo0vzH95es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXCXDRkzbPapaFY5Z+RD2xrL2MCFKgS8U3IftHDsx5olYrqN8AcIFkpBmlNAh9NUSbesG4eCsbSZu6WI0I/8+aGPb3Zh5Uq/QSJQ0jgOqyQrJX9ovzXMb+Omz522jFDeyIySCTtAX2qWwlEhcH+XkIO6MllZazWrDOGwXa+1UAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbEchHkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbEchHkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D0FC4CEE7;
	Sat,  5 Jul 2025 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751710074;
	bh=t4pZDQPqiB0ld/r3wNUn9dHEX9PQooqBSRo0vzH95es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbEchHkXsbxPA+vnQ3BT58xC1GyD5Aw+xyZvOpXlq500MBxjw4/jj6YP+vQ6AuXIS
	 sLmpuqZweLj9zm5zYEd/IzQIiSkAEKFo7bEMj1IyXWGeZbVZNrFC3bHi8IYIZIZdtB
	 Wk8qYpN3xAklBxs9hUT4ZunenEJlVxLpH+Cu3dMNUWN8SVq1ubvWlcqxKMspIWoWVL
	 f8GGJsR8jAE3muo8dXoImX/3iyBVEseP3hjz8AljOg9cJ24DR/2uCYrTayr8i05WAm
	 /rg3uafIv33ZjOSBX8mUb66vqbWsVFxDlZQ1Rq+OfUx49sUT8RT8uW4c1bBn7LD8VX
	 Xa0LF+MEhUlqA==
Date: Sat, 5 Jul 2025 17:51:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: tps6286x-regulator: Enable REGCACHE_MAPLE
Message-ID: <aGj1hAAg3nM4zV70@xhacker>
References: <20250629095107.804-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629095107.804-1-jszhang@kernel.org>

On Sun, Jun 29, 2025 at 05:51:07PM +0800, Jisheng Zhang wrote:
> Enable regmap cache to reduce i2c transactions and corresponding
> interrupts if regulator is accessed frequently.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/regulator/tps6286x-regulator.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/regulator/tps6286x-regulator.c b/drivers/regulator/tps6286x-regulator.c
> index 75f441f36de7..778f169b0acc 100644
> --- a/drivers/regulator/tps6286x-regulator.c
> +++ b/drivers/regulator/tps6286x-regulator.c
> @@ -19,13 +19,22 @@
>  #define TPS6286X_CONTROL_FPWM	BIT(4)
>  #define TPS6286X_CONTROL_SWEN	BIT(5)
>  
> +#define TPS6286X_STATUS		0x05
> +
>  #define TPS6286X_MIN_MV		400
>  #define TPS6286X_MAX_MV		1675
>  #define TPS6286X_STEP_MV	5
>  
> +static bool tps6287x_volatile_reg(struct device *dev, unsigned int reg)

Hi Mark,

I made a copy and paste error here: should be tps6286x_volatile_reg
I have seen v1 has been merged, so how to cope with this? Do I need
to send a v2?

Sorry for catching this a bit late.

Thanks
> +{
> +	return reg == TPS6286X_STATUS;
> +}
> +
>  static const struct regmap_config tps6286x_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> +	.cache_type = REGCACHE_MAPLE,
> +	.volatile_reg = tps6287x_volatile_reg,

ditto

>  };
>  
>  static int tps6286x_set_mode(struct regulator_dev *rdev, unsigned int mode)
> -- 
> 2.49.0
> 
