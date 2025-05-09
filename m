Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623042957BA;
	Fri,  9 May 2025 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799938; cv=none; b=GU6pSYdqNd0jHxCPQbV/IsPVXAYOPdu9Wj4o23nA/of30zEYHxsz/FYUTHv5nEmlGwTQIn9OONDM223Mk5m+Oi7666R7yFnkUr3iupuuDbzaaPRMGFtd5Y+92hTF7d7Oq3EcawAsk7slYkYSV5Yf6eB2IKCEDPLeucaq7VVfp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799938; c=relaxed/simple;
	bh=RifdIHYgrPYypE5hz/Vh43kD0MeXbhXJUcAPqgNfYPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH6uc6DY1vFn/lMfB6qJoj3UxtfyemyiaEdwRP8Ahte/vkMxi6ojB1G0vV9Qpva+/J8ZtVLhweYKiuO7tkJL46vkuUf2s9R4+NMqcGdZKmVO4JbOg3EciWyjLO8qlA3IBQTw2KgDIX4ILOMBb+HnHwdm58VBifq1sRMXGhUyikI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQfjmaPM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQfjmaPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC66EC4CEE4;
	Fri,  9 May 2025 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746799937;
	bh=RifdIHYgrPYypE5hz/Vh43kD0MeXbhXJUcAPqgNfYPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQfjmaPMFpGQW37aYk0DOToMF7soOmRPt0Il0514LrTQ3YRddYF7Q2FKDCAhQXTpG
	 FGVTCQFfSyz7VTWwQLQH3vAsh4DYm7+XAd0m1i2i72CiRMo70h40AdzaMLdL0xBwrF
	 xheTevbJX0hx32okk0+ezgnTaKPR6lP3tWBbMmvzYVlSqKqeDis0y1OkV9+lffy1HV
	 fHzlFuGHxF9/cix992lX6B+DiCwf+kpwhsfyzRuLyaxVsJdy9j2s+3oQGNqnLwbNF2
	 Hgxr2Fj5THutJep623Hjq4UdUX9XeK7r8gEgPMdGqimF+juJjpu8qXdEDOp/Tp6v8b
	 B6an5erIAOpbw==
Date: Fri, 9 May 2025 15:12:12 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <20250509141212.GE2492385@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>

On Wed, 30 Apr 2025, Artur Weber wrote:

> The BCM590xx PMUs have two I2C registers for reading the PMU ID
> and revision. The revision is useful for subdevice drivers, since
> different revisions may have slight differences in behavior (for
> example - BCM59054 has different regulator configurations for
> revision A0 and A1).
> 
> Check the PMU ID register and make sure it matches the DT compatible.
> Fetch the digital and analog revision from the PMUREV register
> so that it can be used in subdevice drivers.
> 
> Also add some known revision values to bcm590xx.h, for convenience
> when writing subdevice drivers.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v8:
> - Change PMU ID print from dev_info to dev_dbg
> - Unwrap some lines and let them go up to 100 chars
> - Drop comment above bcm590xx_parse_version (keep the comments inside
>   the function, they make it a bit more clear what's happening since
>   it's doing two separate things)
> 
> Changes in v7:
> - Return -ENODEV on PMU ID mismatch
> - Drop "Check your DT compatible" from ID mismatch error message
> 
> Changes in v6:
> - Adapt to PMUID being passed as device type value
> - Rename rev_dig and rev_ana to rev_digital and rev_analog
> - Rewrite commit message
> 
> Changes in v5:
> - Add REG_ prefix to register offset constant names
> 
> Changes in v4:
> - Added this commit
> ---
>  drivers/mfd/bcm590xx.c       | 55 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/bcm590xx.h | 14 +++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index 4620eed0066fbf1dd691a2e392e967747b4d125b..12d0db4237e79fcfcb2af4a0d93961b6239a3863 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -17,6 +17,15 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> +/* Under primary I2C address: */
> +#define BCM590XX_REG_PMUID		0x1e
> +
> +#define BCM590XX_REG_PMUREV		0x1f
> +#define BCM590XX_PMUREV_DIG_MASK	0xF
> +#define BCM590XX_PMUREV_DIG_SHIFT	0
> +#define BCM590XX_PMUREV_ANA_MASK	0xF0
> +#define BCM590XX_PMUREV_ANA_SHIFT	4
> +
>  static const struct mfd_cell bcm590xx_devs[] = {
>  	{
>  		.name = "bcm590xx-vregs",
> @@ -37,6 +46,48 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
>  	.cache_type	= REGCACHE_MAPLE,
>  };
>  
> +/* Map PMU ID value to model name string */
> +static const char * const bcm590xx_names[] = {
> +	[BCM590XX_PMUID_BCM59054] = "BCM59054",
> +	[BCM590XX_PMUID_BCM59056] = "BCM59056",
> +};
> +
> +static int bcm590xx_parse_version(struct bcm590xx *bcm590xx)
> +{
> +	unsigned int id, rev;
> +	int ret;
> +
> +	/* Get PMU ID and verify that it matches compatible */
> +	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUID, &id);
> +	if (ret) {
> +		dev_err(bcm590xx->dev, "failed to read PMU ID: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (id != bcm590xx->pmu_id) {
> +		dev_err(bcm590xx->dev, "Incorrect ID for %s: expected %x, got %x.\n",
> +			bcm590xx_names[bcm590xx->pmu_id], bcm590xx->pmu_id, id);
> +		return -ENODEV;
> +	}
> +
> +	/* Get PMU revision and store it in the info struct */
> +	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUREV, &rev);
> +	if (ret) {
> +		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n", ret);
> +		return ret;
> +	}
> +
> +	bcm590xx->rev_digital = (rev & BCM590XX_PMUREV_DIG_MASK) >> BCM590XX_PMUREV_DIG_SHIFT;
> +
> +	bcm590xx->rev_analog = (rev & BCM590XX_PMUREV_ANA_MASK) >> BCM590XX_PMUREV_ANA_SHIFT;
> +
> +	dev_dbg(bcm590xx->dev, "PMU ID 0x%x (%s), revision: digital %d, analog %d",
> +		 id, bcm590xx_names[id],
> +		 bcm590xx->rev_digital, bcm590xx->rev_analog);

Nit: This would fit on the line above.

> +
> +	return 0;
> +}
> +
>  static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  {
>  	struct bcm590xx *bcm590xx;
> @@ -78,6 +129,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  		goto err;
>  	}
>  
> +	ret = bcm590xx_parse_version(bcm590xx);
> +	if (ret)
> +		goto err;
> +
>  	ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
>  				   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
>  	if (ret < 0) {
> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -17,6 +17,16 @@
>  #define BCM590XX_PMUID_BCM59054		0x54
>  #define BCM590XX_PMUID_BCM59056		0x56
>  
> +/* Known chip revision IDs */
> +#define BCM59054_REV_DIGITAL_A1		1
> +#define BCM59054_REV_ANALOG_A1		2
> +
> +#define BCM59056_REV_DIGITAL_A0		1
> +#define BCM59056_REV_ANALOG_A0		1
> +
> +#define BCM59056_REV_DIGITAL_B0		2
> +#define BCM59056_REV_ANALOG_B0		2
> +
>  /* max register address */
>  #define BCM590XX_MAX_REGISTER_PRI	0xe7
>  #define BCM590XX_MAX_REGISTER_SEC	0xf0
> @@ -30,6 +40,10 @@ struct bcm590xx {
>  
>  	/* PMU ID value; also used as device type */
>  	u8 pmu_id;
> +
> +	/* Chip revision, read from PMUREV reg */
> +	u8 rev_digital;
> +	u8 rev_analog;
>  };
>  
>  #endif /*  __LINUX_MFD_BCM590XX_H */
> 
> -- 
> 2.49.0
> 

-- 
Lee Jones [李琼斯]
