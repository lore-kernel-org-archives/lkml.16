Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D94D42A89;
	Wed,  7 May 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626828; cv=none; b=VzwjXSzTMvz35fCX66auBLL8tL2QvUAL/MX1tJf2juW47On4Uxv5F7muUOn7EzxkRPdC+96kOcJk3HxWVym/89Gl8tyR/i/XgeCXo5FCqo1mxh2HmfpU66AIgFTQI9FPJ5OOfwz/vKAFkg9IyyX7WlUVWRyGf9VEn0W1fIyCKhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626828; c=relaxed/simple;
	bh=R34/WzJt6Id9+UAWg+Utgvwzw83hFftNgkfUAfxsEqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErZ7qtL3sKKdPMSyLfySOk5ulXA5DNKrB8SmRHdLN1gMH+M+Iy9219BuWJmfTV5ZQTAECZQ8vZ0cWV+QV8DhD65U4GbxPtpfCEfkQIRH4X46NPnF2FclMFntBozS9/FjEF7mUvdbWqgiHH5mEqLyr/jjcdJ69ID1dDUNMUSm6KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6F09339;
	Wed,  7 May 2025 07:06:54 -0700 (PDT)
Received: from [10.57.20.214] (unknown [10.57.20.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB1AF3F5A1;
	Wed,  7 May 2025 07:07:00 -0700 (PDT)
Message-ID: <2b85071a-e3e7-4cfc-a471-e81e463b7c37@arm.com>
Date: Wed, 7 May 2025 15:06:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
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
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
 <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2025 13:17, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an integrated ARM
> Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data for
> its support in the panfrost driver.
> It uses the same data as MT8186 for the power management features to
> describe power supplies, pm_domains and enablement (one regulator, two
> power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the GPU
> configuration quirks bitfield to enable AARCH64 4K page table format
> mode.
> As MT8186 and MT8370 SoC have different GPU architecture (Mali G52 2EE
> MC2 for MT8186), making them not compatible, and this mode is only
> enabled for Mediatek SoC that are Mali G57 based (compatible with
> mediatek,mali-mt8188 or mediatek,mali-8192), having specific platform
> data allows to set this flag for MT8370 without modifying MT8186
> configuration and behaviour.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

With one minor comment fixed below:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index f1ec3b02f15a0029d20c7d81046ded59854e885c..8e0a1ae6940c73b7b60233950ae3abdfa843cc8e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -846,6 +846,16 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> +/* MT8370 uses the same power domains and power supplies as MT8186 */

This comment is not correct - you've got the power domains of MT8186, 
but the supplies of MT8183. The comment doesn't actually add much so you 
could just drop it.

If you're feeling adventurous then one option here is to actually clean 
up the mediatek entries a little. Instead of referring to particular 
part numbers we could have:

static const char * const mediatek_2_pm_domains[] = { "core0", "core1" };
static const char * const mediatek_3_pm_domains[] = { "core0", "core1", "core2" };
static const char * const mediatek_5_pm_domains[] = { "core0", "core1", "core2",
                                                      "core3", "core4" };

Or even just have the mediatek_5_domains[] array (dropping the '5' in
the name) and not use ARRAY_SIZE().

Equally the supplies arrays could be renamed. We have the one with 
"sram" for legacy and everything else uses {"mali", NULL} but we have 
two definitions for it (mt8183_b and mt8192).

Thanks,
Steve

> +static const struct panfrost_compatible mediatek_mt8370_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> +	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
> +};
> +
>  static const struct of_device_id dt_match[] = {
>  	/* Set first to probe before the generic compatibles */
>  	{ .compatible = "amlogic,meson-gxm-mali",
> @@ -868,6 +878,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> +	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
>  	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
>  	{}
>  };
> 

