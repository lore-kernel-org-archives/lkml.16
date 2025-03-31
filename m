Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC0E1DFDB9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417192; cv=none; b=tpn62Cf0gfTKu/hQMffh6z85HBfC9qhYKDGX9u6Lq1uADHWQ8LAHmDv4jY3if7PBh5/5TOgziJjm+ZRTJHk9OHfkK+PM7WeeAFOGvuJUN+qizvy1RJ3LNfEBwkszN9pV4uEWPYLFLqg6fIr3TDcYykqB/Kg4xfxWPdQ0HnMuFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417192; c=relaxed/simple;
	bh=TsgfG93FsSWagg0s6IUuPBqZfdjAGnYnzQSu/ztjL3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEEa1UurHflYGFexuvM6Qe94sbeGL/T6nCRju0G1ZxY2oOSfTa0gozOYoAcZeq8OCulqSNTqMNH5AfJQMH8i/PrWfBVXIQeRH4/IkCruVBLnvSjtm7rp8Ahf57OTjjQxKeNR/vQLu6KOSSmmJrKcoy3lHrkyTC9dsw/Om/Rl1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ADE01F37;
	Mon, 31 Mar 2025 03:33:09 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21C33F63F;
	Mon, 31 Mar 2025 03:33:02 -0700 (PDT)
Message-ID: <9ad57d16-5977-4542-8598-d23d41227e7a@arm.com>
Date: Mon, 31 Mar 2025 11:32:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panfrost: add h616 compatible string
To: Philippe Simons <simons.philippe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
 <20250312232319.25712-3-simons.philippe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250312232319.25712-3-simons.philippe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2025 23:23, Philippe Simons wrote:
> Tie the Allwinner compatible string to the two features bits that will
> toggle the clocks and the reset line whenever the power domain is changing
> state.

This looks fine, but we need the new compatible string to be documented
in the bindings:

Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml

I'm not sure what the situation is for the device tree for this
platform, but it would be good to get that all sorted before we merge
the compatible into panfrost.

Thanks,
Steve

> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f3935556ac7..f13743fe6bad 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
>  	.pm_domain_names = NULL,
>  };
>  
> +static const struct panfrost_compatible allwinner_h616_data = {
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
> +	.num_pm_domains = 1,
> +	.pm_features = BIT(GPU_PM_RT_CLK_DIS) | BIT(GPU_PM_RT_RST_ASRT),
> +};
> +
>  static const struct panfrost_compatible amlogic_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> @@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> +	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);

