Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CE1A23BC;
	Fri,  7 Feb 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918138; cv=none; b=fIMVqMkvsYF877rDOg1WqwGvjkQjm2zXUJocHcaRlEYooEtLdVO3t5OQgKuZecnZGponS0TuPrOIRWMgWuCX1yRlrBqa24QGJLSRNUP+V9pfS5HEo9Q5M5F0VI6CbCTVtrKEOsVEqHJpvm0Dgyeebx77so7ktR6+KzVSmPSjZ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918138; c=relaxed/simple;
	bh=wrxfkqUZXjG/NYNWJi4TM/I1dqfnQ+7iCKBkou4/NnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHFN+60a2xchT+0YhRmnq9j4nLz4gcmHdLq6LJVYUIE9r7o0NqPPxdNKLChSkyagtUfPWyRMMdig98CrV+hWVFqVI+/azUFQ6feFMdxnctetBalN78OBbz9NqW7QHVn3MgCHSgveHWLw9rqji5mzGxLoYpGTZCQZBaDkjzVoNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxYBhcKw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxYBhcKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC4CED1;
	Fri,  7 Feb 2025 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738918138;
	bh=wrxfkqUZXjG/NYNWJi4TM/I1dqfnQ+7iCKBkou4/NnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxYBhcKwI21p86UL8L8YlttFcR/8JoHb60J23SjdHmiFej1XmR3pm/W/i9jLB4gCs
	 IRPIgXDoRM2bnXDGmb/J2hfcxKcO3F6s+9QR/wuHtXp0MltLcKnJqgbRKOa+HEul98
	 wPe4o3X7P0fsZluTgNBTot1zKlbBB2Bt5iFCd9QN+G/RmXbQdx/L0pA9WxWO4qU0YR
	 njMjp/yHVnTlW/pYmJW0zR2ct1ClZobOXPQY1tqpg6EfdQI/Udec814QLEIspHc6X3
	 vocC1hCpRwrEja5nsh0TwQh49lHOFEDXcpgXwUCXgAFdTXDtLpngA5mOKXKP8/+TaF
	 Ajdouxc3URaIw==
Date: Fri, 7 Feb 2025 08:48:52 +0000
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
Subject: Re: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
Message-ID: <20250207084852.GC7593@google.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>

On Fri, 31 Jan 2025, Artur Weber wrote:

> The BCM59056 supported by the bcm590xx driver is similar to the
> BCM59054 MFD. Add a compatible for it in the driver, in preparation
> for extending support of this chip in the bcm590xx regulator driver.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Fix compilation warning about device_type pointer cast type
> - Name the device types enum and use it as the type in the MFD struct
> ---
>  drivers/mfd/bcm590xx.c       | 6 +++++-
>  include/linux/mfd/bcm590xx.h | 7 +++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  	bcm590xx->dev = &i2c_pri->dev;
>  	bcm590xx->i2c_pri = i2c_pri;
>  
> +	bcm590xx->device_type = \
> +			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);

Why are you dividing pointers with each other?

>  	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
>  						 &bcm590xx_regmap_config_pri);
>  	if (IS_ERR(bcm590xx->regmap_pri)) {
> @@ -91,7 +94,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  }
>  
>  static const struct of_device_id bcm590xx_of_match[] = {
> -	{ .compatible = "brcm,bcm59056" },
> +	{ .compatible = "brcm,bcm59054", .data = (void *)BCM59054_TYPE },
> +	{ .compatible = "brcm,bcm59056", .data = (void *)BCM59056_TYPE },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> index 6b8791da6119b22514447bf1572238b71c8b0e97..b76fb57bf0dd17d51580e93db58ece4a4d6dc5e4 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -13,12 +13,19 @@
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
>  
> +/* device types */
> +enum bcm590xx_device_type {
> +	BCM59054_TYPE,
> +	BCM59056_TYPE,
> +};
> +
>  /* max register address */
>  #define BCM590XX_MAX_REGISTER_PRI	0xe7
>  #define BCM590XX_MAX_REGISTER_SEC	0xf0
>  
>  struct bcm590xx {
>  	struct device *dev;
> +	enum bcm590xx_device_type device_type;
>  	struct i2c_client *i2c_pri;
>  	struct i2c_client *i2c_sec;
>  	struct regmap *regmap_pri;
> 
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]
