Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A6233722
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637347; cv=none; b=m3LmN/yla1s0ZmiSosvoCYvmPZgs8OUGBOfkNSkBla7ZD2NQNkRiEK3nzLdbxTPIlZYOL/75ANmyqHOtKJXn5PaA/ESYIRSDJNmUOOdo8EYQAUeM3uVWN0vdbjOVDibBm8CzIIxMLzjnT31VRUQZhrRiZguEHkFz3hGGkdK+tss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637347; c=relaxed/simple;
	bh=IwhfXaqy1ijWKbIOEpYGK/Xi4vMWwmmWaFIPRLfT+OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYzUVjvoY6du5P+oLsVtLlkLfo+AWhvEM8WmbaobXXDl+9RYRUwceHjRVQ8WhMBowaEPoVJyOId9n8tQoFIN2cKpYsNUkjrDjuuDml5bCwcGt8V1awNa2qbQ8bavCSGZ1lVL7AxBY7HAE/zF22PS4j9dXzS9j7mIS36znQidWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3IAS+WD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3IAS+WD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563E1C4CEF2;
	Wed, 11 Jun 2025 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749637347;
	bh=IwhfXaqy1ijWKbIOEpYGK/Xi4vMWwmmWaFIPRLfT+OQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f3IAS+WD2nUooKJ5jl9/RTCHVYN6W6YAHImf2dkaivfQbbRqMrESUWfKZGOuEUSOv
	 2Kagd/gi3CL8JRwvbH9lYQhBaoLfK0Xbq002BLK+5tCpX08mg9hNyLJrzzznv1DXGs
	 kJxqflkGnb/V8cZCXWdnR1RpDbjngV6FKkxRTuM8WrE78E3OO+HcryH22NIrXmfGxT
	 xsCPJniweLsLDa8XEEIKDeQyrQ7MuGhrqhMfzEJR9v2RhjCbmv3WQOZBTA3hkMlpif
	 oeTukIemdCy00Pi6wpsnCSUOK1z9JuZh7iIRHlz27OvmRheb7IvtGR4wNn5EhYUSDP
	 vMyLh92uz/4Ng==
Message-ID: <d0831ff9-c26f-40bc-892c-b391eb48ea25@kernel.org>
Date: Wed, 11 Jun 2025 12:22:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable more OMAP related configs
To: Beleswar Padhi <b-padhi@ti.com>, linux@armlinux.org.uk, arnd@arndb.de
Cc: afd@ti.com, u-kumar1@ti.com, praneeth@ti.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250611074925.1155547-1-b-padhi@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250611074925.1155547-1-b-padhi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 09:49, Beleswar Padhi wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> This allows us to use various peripherals in the TI OMAP family devices

Which ones for example? Explain which upstream boards use which devices
needing these.

> using the multi-v7 config, instead of only with the OMAP specific

multi_v7

> defconfigs.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index c79495e113c8..10ad7026bb4d 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -166,6 +166,7 @@ CONFIG_BT_MRVL_SDIO=m
>  CONFIG_BT_QCOMSMD=m
>  CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
> +CONFIG_IWLWIFI=m
>  CONFIG_RFKILL=y
>  CONFIG_RFKILL_INPUT=y
>  CONFIG_RFKILL_GPIO=y
> @@ -788,6 +789,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>  CONFIG_SOUND=m
>  CONFIG_SND=m
> +CONFIG_SND_SOC_OMAP_HDMI=m
>  CONFIG_SND_HDA_TEGRA=m
>  CONFIG_SND_HDA_INPUT_BEEP=y
>  CONFIG_SND_HDA_PATCH_LOADER=y
> @@ -1095,6 +1097,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_EXYNOS_IOMMU=y
>  CONFIG_QCOM_IOMMU=y
>  CONFIG_REMOTEPROC=y
> +CONFIG_WKUP_M3_RPROC=m
>  CONFIG_OMAP_REMOTEPROC=m
>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>  CONFIG_KEYSTONE_REMOTEPROC=m
> @@ -1102,6 +1105,7 @@ CONFIG_QCOM_Q6V5_MSS=m
>  CONFIG_QCOM_SYSMON=m
>  CONFIG_QCOM_WCNSS_PIL=m
>  CONFIG_ST_REMOTEPROC=m
> +CONFIG_OMAP_REMOTEPROC=m
>  CONFIG_RPMSG_CHAR=m
>  CONFIG_RPMSG_CTRL=m
>  CONFIG_RPMSG_QCOM_SMD=y
> @@ -1127,6 +1131,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>  CONFIG_ARCH_TEGRA_114_SOC=y
>  CONFIG_ARCH_TEGRA_124_SOC=y
>  CONFIG_SOC_TI=y
> +CONFIG_AMX3_PM=m
> +CONFIG_WKUP_M3_IPC=m
>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>  CONFIG_RASPBERRYPI_POWER=y
> @@ -1138,11 +1144,13 @@ CONFIG_TI_SCI_PM_DOMAINS=y
>  CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
>  CONFIG_ARM_TEGRA_DEVFREQ=m
>  CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
> +CONFIG_EXTCON_PALMAS=m
>  CONFIG_EXTCON_MAX14577=m
>  CONFIG_EXTCON_MAX77693=m
>  CONFIG_EXTCON_MAX8997=m
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_TI_AEMIF=y
> +CONFIG_TI_EMIF_SRAM=m
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_EXYNOS5422_DMC=m
>  CONFIG_IIO=y
> @@ -1287,6 +1295,7 @@ CONFIG_CRYPTO_AES_ARM=m
>  CONFIG_CRYPTO_AES_ARM_BS=m
>  CONFIG_CRYPTO_AES_ARM_CE=m
>  CONFIG_CRYPTO_CHACHA20_NEON=m
> +CONFIG_CRYPTO_XCBC=m

Why this is needed?

>  CONFIG_CRYPTO_DEV_SUN4I_SS=m
>  CONFIG_CRYPTO_DEV_FSL_CAAM=m
>  CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
> @@ -1300,6 +1309,10 @@ CONFIG_CRYPTO_DEV_QCOM_RNG=m
>  CONFIG_CRYPTO_DEV_ROCKCHIP=m
>  CONFIG_CRYPTO_DEV_STM32_HASH=m
>  CONFIG_CRYPTO_DEV_STM32_CRYP=m
> +CONFIG_CRYPTO_DEV_OMAP=m
> +CONFIG_CRYPTO_DEV_OMAP_SHAM=m
> +CONFIG_CRYPTO_DEV_OMAP_AES=m
> +CONFIG_CRYPTO_DEV_OMAP_DES=m
>  CONFIG_CMA_SIZE_MBYTES=64
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_KERNEL=y
> @@ -1307,3 +1320,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_INFO_REDUCED=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
> +CONFIG_CAN_C_CAN=m
> +CONFIG_CAN_C_CAN_PLATFORM=m

Does not look like placed according to Kconfig.

Best regards,
Krzysztof
