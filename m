Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4C726C3BF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062458; cv=none; b=IhGVLswC73713HXc0F8TrPy2M+cHtNwKdDwvVFJDgSfPE8+Zdwv1wnVwwzsSqPj2HedlT/JCuXD+UTSmFWi7ITDQM/Ts749Ardw5+ol/h1Vh1FPQrx3ixVcZW2jpK0ur5NTZGXHejRFocaeYAht/x7glUhrQiqYE36/i7GLN6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062458; c=relaxed/simple;
	bh=Gi0PXTIT4cUit+lVlw4RmGfNXjLtAFBAHuiIpbgKRl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Khf4ul0Hqs/DWYKSiydn/NRTi9kzuhgBdlM3SWuwAQH0wOzjeptigvJzPMOOzQC/w+DsYb6/KoTDEoKIaOLSU+Il+5dx1ndBZAmYg+mcXD6E2tHuLGb+1UXhp8m8qLouOfkLmNkPSV91ejtJIAvw987HMnWTt0GaXJ53HbLpaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=fail smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I15S/F8U; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I15S/F8U"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55G8RGIZ3770403;
	Mon, 16 Jun 2025 03:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750062436;
	bh=d1hOW9dceKTqmRm+uiJj5sI96rGsu8GOnh4oj9JKeD8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I15S/F8Uzmew56XFF9Vd30J7ff+Un/z/Kl7xE/c8B0mbeE7aVwTxIRPAydktUjnqs
	 AQ5AmeAGhzYf7OBClBd4O4meaFAZDyNN4B3SMJrnQ4IubWtnRj+nqFlEs++3MJcUqK
	 fzZ/9/FPuRJUbKmZ51nZnzR67UkO9VLS/J9dnOjk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55G8RG2J1681408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 03:27:16 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 03:27:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 03:27:16 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55G8RDfR3938375;
	Mon, 16 Jun 2025 03:27:13 -0500
Message-ID: <3c2b9fb5-5ad5-4db7-81ee-9defbdf7b4f3@ti.com>
Date: Mon, 16 Jun 2025 13:57:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable more OMAP related configs
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux@armlinux.org.uk>,
        <arnd@arndb.de>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250611074925.1155547-1-b-padhi@ti.com>
 <d0831ff9-c26f-40bc-892c-b391eb48ea25@kernel.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <d0831ff9-c26f-40bc-892c-b391eb48ea25@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 11/06/25 15:52, Krzysztof Kozlowski wrote:
> On 11/06/2025 09:49, Beleswar Padhi wrote:
>> From: Sinthu Raja <sinthu.raja@ti.com>
>>
>> This allows us to use various peripherals in the TI OMAP family devices
> Which ones for example? Explain which upstream boards use which devices
> needing these.
>
>> using the multi-v7 config, instead of only with the OMAP specific
> multi_v7
>
>> defconfigs.
>>
>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>  arch/arm/configs/multi_v7_defconfig | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index c79495e113c8..10ad7026bb4d 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -166,6 +166,7 @@ CONFIG_BT_MRVL_SDIO=m
>>  CONFIG_BT_QCOMSMD=m
>>  CONFIG_CFG80211=m
>>  CONFIG_MAC80211=m
>> +CONFIG_IWLWIFI=m
>>  CONFIG_RFKILL=y
>>  CONFIG_RFKILL_INPUT=y
>>  CONFIG_RFKILL_GPIO=y
>> @@ -788,6 +789,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
>>  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>>  CONFIG_SOUND=m
>>  CONFIG_SND=m
>> +CONFIG_SND_SOC_OMAP_HDMI=m
>>  CONFIG_SND_HDA_TEGRA=m
>>  CONFIG_SND_HDA_INPUT_BEEP=y
>>  CONFIG_SND_HDA_PATCH_LOADER=y
>> @@ -1095,6 +1097,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>>  CONFIG_EXYNOS_IOMMU=y
>>  CONFIG_QCOM_IOMMU=y
>>  CONFIG_REMOTEPROC=y
>> +CONFIG_WKUP_M3_RPROC=m
>>  CONFIG_OMAP_REMOTEPROC=m
>>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>>  CONFIG_KEYSTONE_REMOTEPROC=m
>> @@ -1102,6 +1105,7 @@ CONFIG_QCOM_Q6V5_MSS=m
>>  CONFIG_QCOM_SYSMON=m
>>  CONFIG_QCOM_WCNSS_PIL=m
>>  CONFIG_ST_REMOTEPROC=m
>> +CONFIG_OMAP_REMOTEPROC=m
>>  CONFIG_RPMSG_CHAR=m
>>  CONFIG_RPMSG_CTRL=m
>>  CONFIG_RPMSG_QCOM_SMD=y
>> @@ -1127,6 +1131,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>>  CONFIG_ARCH_TEGRA_114_SOC=y
>>  CONFIG_ARCH_TEGRA_124_SOC=y
>>  CONFIG_SOC_TI=y
>> +CONFIG_AMX3_PM=m
>> +CONFIG_WKUP_M3_IPC=m
>>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>>  CONFIG_RASPBERRYPI_POWER=y
>> @@ -1138,11 +1144,13 @@ CONFIG_TI_SCI_PM_DOMAINS=y
>>  CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
>>  CONFIG_ARM_TEGRA_DEVFREQ=m
>>  CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
>> +CONFIG_EXTCON_PALMAS=m
>>  CONFIG_EXTCON_MAX14577=m
>>  CONFIG_EXTCON_MAX77693=m
>>  CONFIG_EXTCON_MAX8997=m
>>  CONFIG_EXTCON_USB_GPIO=y
>>  CONFIG_TI_AEMIF=y
>> +CONFIG_TI_EMIF_SRAM=m
>>  CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_EXYNOS5422_DMC=m
>>  CONFIG_IIO=y
>> @@ -1287,6 +1295,7 @@ CONFIG_CRYPTO_AES_ARM=m
>>  CONFIG_CRYPTO_AES_ARM_BS=m
>>  CONFIG_CRYPTO_AES_ARM_CE=m
>>  CONFIG_CRYPTO_CHACHA20_NEON=m
>> +CONFIG_CRYPTO_XCBC=m
> Why this is needed?
>
>>  CONFIG_CRYPTO_DEV_SUN4I_SS=m
>>  CONFIG_CRYPTO_DEV_FSL_CAAM=m
>>  CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
>> @@ -1300,6 +1309,10 @@ CONFIG_CRYPTO_DEV_QCOM_RNG=m
>>  CONFIG_CRYPTO_DEV_ROCKCHIP=m
>>  CONFIG_CRYPTO_DEV_STM32_HASH=m
>>  CONFIG_CRYPTO_DEV_STM32_CRYP=m
>> +CONFIG_CRYPTO_DEV_OMAP=m
>> +CONFIG_CRYPTO_DEV_OMAP_SHAM=m
>> +CONFIG_CRYPTO_DEV_OMAP_AES=m
>> +CONFIG_CRYPTO_DEV_OMAP_DES=m
>>  CONFIG_CMA_SIZE_MBYTES=64
>>  CONFIG_PRINTK_TIME=y
>>  CONFIG_DEBUG_KERNEL=y
>> @@ -1307,3 +1320,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>>  CONFIG_DEBUG_INFO_REDUCED=y
>>  CONFIG_MAGIC_SYSRQ=y
>>  CONFIG_DEBUG_FS=y
>> +CONFIG_CAN_C_CAN=m
>> +CONFIG_CAN_C_CAN_PLATFORM=m
> Does not look like placed according to Kconfig.


Thank you for the review.. Using savedefconfig eliminated some redundant configs.

I have addresses all comments in v2:

https://lore.kernel.org/all/20250616082038.3241346-1-b-padhi@ti.com/

