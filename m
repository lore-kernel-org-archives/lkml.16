Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03FF2206B8;
	Fri,  9 May 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788360; cv=none; b=ZCQS++ikx2zf7EctdQAFtGJnnRq7MmP7mtvWPYyaU7DZImjmAIBFhVaJFPQRWouKFAcoeWWzaA8a3mm6BsdgU0rc5i1iANrd/coginontBB1bLNt94arkoj9LerSsx+ng9aS5h1ZtdVFzt+7bSmzERJBzbDgAIa124dQgFfdb2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788360; c=relaxed/simple;
	bh=Ez6Hrx0r3WYTWyfFZ1Ou+QNDaLNIrzfgCW2wuUh7Cmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXhHegulUQPqmhZUYaZqiP1civUVJde/r1SITgvbiApyFAzv5iC1Tt1rmAC9DfoUkMhu7fpVNL/09jUlrtCBNl6zgn+iGjklC369P+MsqrH5rDQShT0UMB+k0Sm0f9i2iUZ24hw2mjwk6hU1o8vz4lYm7qeoQ2/ZpFLRorvTrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DEB31595;
	Fri,  9 May 2025 03:59:07 -0700 (PDT)
Received: from [10.1.35.18] (e122027.cambridge.arm.com [10.1.35.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9FC3F58B;
	Fri,  9 May 2025 03:59:15 -0700 (PDT)
Message-ID: <32dd077c-52db-4bef-8d76-12b7aaff2408@arm.com>
Date: Fri, 9 May 2025 11:59:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm/panfrost: Commonize Mediatek power domain
 array definitions
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
 <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 11:12, Louis-Alexis Eyraud wrote:
> In the panfrost driver, the platform data of several Mediatek SoC
> declares and uses several different power domains arrays according to
> GPU core number present in the SoC:
> - mediatek_mt8186_pm_domains (2 cores)
> - mediatek_mt8183_pm_domains (3 cores)
> - mediatek_mt8192_pm_domains (5 cores)
> 
> As they all are fixed arrays, starting with the same entries and the
> platform data also has a power domains array length field
> (num_pm_domains), they can be replaced by a single array, containing
> all entries, if the num_pm_domains field of the platform data is also
> set to the matching core number.
> 
> So, create a generic power domain array (mediatek_pm_domains) and use
> it in the mt8183(b), mt8186, mt8188 and mt8192 platform data instead.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7b899a9b2120c608e61dab9ca831ab8e907e8139..21b28bef84015793d9dba6b1e585891dc0dfcb6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -789,6 +789,8 @@ static const struct panfrost_compatible amlogic_data = {
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> +static const char * const mediatek_pm_domains[] = { "core0", "core1", "core2",
> +						    "core3", "core4" };
>  /*
>   * The old data with two power supplies for MT8183 is here only to
>   * keep retro-compatibility with older devicetrees, as DVFS will
> @@ -798,48 +800,43 @@ static const struct panfrost_compatible amlogic_data = {
>   * coupled regulators instead.
>   */
>  static const char * const legacy_supplies[] = { "mali", "sram", NULL };
> -static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
>  	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
>  	.supply_names = legacy_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  };
>  
>  static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> -static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
>  static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> -	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.num_pm_domains = 2,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> -/* MT8188 uses the same power domains and power supplies as MT8183 */
>  static const struct panfrost_compatible mediatek_mt8188_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> -static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
> -							   "core3", "core4" };
>  static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
> -	.pm_domain_names = mediatek_mt8192_pm_domains,
> +	.num_pm_domains = 5,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
> 

