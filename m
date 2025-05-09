Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE382206B8;
	Fri,  9 May 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788356; cv=none; b=FQwhA5cgcGE56QWVIE0PCtoEL10b8dXqfvtwAy0ZzRx5t0vfjWyJ9N4p0NltpY3eF7QIQhpAaWWxG8Mt1WLfk7MaNvTYhwgWrauFLpl2qLdx1JAzKOE2VLkcMCTKzU9iISqrX6tKNRKTu44RnWw9aFvjxPy8EA/vJd4qfGHuzAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788356; c=relaxed/simple;
	bh=bjmHADaGbExZpMCbe/putcyOzu4lvKOfHE+anJK9xLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uv4OMzHTlmBVHCXui4lAdLtdlYgcPX2MGWfWIuk8OKgubdAA5BRjIceJ3956fKK3h8VJ7bXhkcshgWdNlrQOLGAIemYwaFV9up1bAqwsEbeVUGh1Hr5hlXd1v8ZVd0kyFwFnHOjKuYkGL/xwQnzy/N+xawrkec7lDsWmOeqE2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 469351595;
	Fri,  9 May 2025 03:59:02 -0700 (PDT)
Received: from [10.1.35.18] (e122027.cambridge.arm.com [10.1.35.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB863F58B;
	Fri,  9 May 2025 03:59:09 -0700 (PDT)
Message-ID: <124b8718-1a8e-4cf2-99e2-604fe63ae132@arm.com>
Date: Fri, 9 May 2025 11:59:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] drm/panfrost: Drop duplicated Mediatek supplies
 arrays
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
 <20250509-mt8370-enable-gpu-v6-2-2833888cb1d3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250509-mt8370-enable-gpu-v6-2-2833888cb1d3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 11:12, Louis-Alexis Eyraud wrote:
> In the panfrost driver, the platform data of several Mediatek SoC
> declares and uses custom supplies array definitions
> (mediatek_mt8192_supplies, mediatek_mt8183_b_supplies), that are the
> same as default_supplies (used by default platform data).
> 
> So drop these duplicated definitions and use default_supplies instead.
> Also, rename mediatek_mt8183_supplies to a more generic name too
> (legacy_supplies).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Thanks for doing this.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index f1ec3b02f15a0029d20c7d81046ded59854e885c..7b899a9b2120c608e61dab9ca831ab8e907e8139 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -797,19 +797,18 @@ static const struct panfrost_compatible amlogic_data = {
>   * On new devicetrees please use the _b variant with a single and
>   * coupled regulators instead.
>   */
> -static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
> +static const char * const legacy_supplies[] = { "mali", "sram", NULL };
>  static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies) - 1,
> -	.supply_names = mediatek_mt8183_supplies,
> +	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
> +	.supply_names = legacy_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  };
>  
> -static const char * const mediatek_mt8183_b_supplies[] = { "mali", NULL };
>  static const struct panfrost_compatible mediatek_mt8183_b_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> -	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> @@ -817,8 +816,8 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  
>  static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
>  static const struct panfrost_compatible mediatek_mt8186_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> -	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
>  	.pm_domain_names = mediatek_mt8186_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> @@ -826,20 +825,19 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>  
>  /* MT8188 uses the same power domains and power supplies as MT8183 */
>  static const struct panfrost_compatible mediatek_mt8188_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> -	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> -static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
>  static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
>  							   "core3", "core4" };
>  static const struct panfrost_compatible mediatek_mt8192_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
> -	.supply_names = mediatek_mt8192_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
>  	.pm_domain_names = mediatek_mt8192_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> 

