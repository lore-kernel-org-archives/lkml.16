Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1625B29B231
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421818; cv=none; b=JozhAs5oXOiVRHfjYzmH0nl7VsX3rIw1C5+Ok8dvjGWyAQhlScMHh5PhvmMFNOj+DLKWck0xw4A7MJQbfeweHnFAo5UsUnoJ695BvAs3KPAWqW0gzByutqhBLpaZNusKa4TEfk5vFWIV7wnvkloa3+xoiXxRUpc6Pzf958Z8A+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421818; c=relaxed/simple;
	bh=XsdU11yHiO5T03ZGuaxMmJco+HmDrgq2hJ7R7DMxsrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jf1a8JJHId44gsWEdygc1Lf/2J+dl29KirqX+gMP9+WzXrzAE5WdKCkoVYcUmxB6ZdGrdn6DD6kxN2odv1nqBDDjoO9Q4CCmd4xRGlJ4Nch7RiqOD9eltJIPOGDUGmJiItGiPnrXjcL+6I/TVbdW5M6Vm3CKAPSfS1HGFVwvnO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Xuw0024R; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xuw0024R"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53NFN5Fn2338674
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 10:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745421785;
	bh=Ih2ce5Z0GGSSdmgbjeP4Hq/VrwWqi3AxBYu8iHAwmac=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xuw0024RJ6ZKugtUegTeW9kcQK0QAykUipGgY/++v3U9pXpM2NQ1xLHtOVYZWfvFE
	 bom6wAfrhl4O50IigZst5cn/RXpuhL0W3s1Dy5uHck5WCYAiIlly/fs/xzQDdYIEiT
	 tG5kdgtTRrgFrZ9XFLHVUZijSzTejhkOUEgD7H5U=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53NFN5mm045971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 10:23:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 10:23:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 10:23:04 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53NFN4xD062058;
	Wed, 23 Apr 2025 10:23:04 -0500
Message-ID: <ac10eeeb-ab9e-4eaf-bf7c-7810c7ba64a5@ti.com>
Date: Wed, 23 Apr 2025 10:23:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
To: Jayesh Choudhary <j-choudhary@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <nm@ti.com>, <linux-kernel@vger.kernel.org>
CC: <bjorn.andersson@oss.qualcomm.com>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <lumag@kernel.org>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20250416182930.32132-1-j-choudhary@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250416182930.32132-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jayesh,

On 4/16/25 1:29 PM, Jayesh Choudhary wrote:
> Enable configs for cdns-dsi and cdns-dphy drivers required for DSI
> display on the following TI platforms:
> J721E-EVM, J721E-BeagleBone-AI64, J721S2-EVM, AM68-SK, J722S-EVM,
> BeagleY-AI, AM62P5-SK, J784S4-EVM and J742S2-EVM
> 
> The dsi wrapper driver used by all the above mentioned platforms,
> cdns-dsi-j721e is enabled by default if cdns-dsi config is enabled.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

LGTM, thanks for adding AM62P5-SK to patch description.

Reviewed-by: Judith Mendez <jm@ti.com>

> ---
> 
> Changelog v1->v2:
> - Change commit message to add the platforms that needs cadence dsi
>    and dphy driver enabled.
> 
> Link to v1 patch:
> <https://lore.kernel.org/linux-arm-kernel/20250411095043.272488-1-j-choudhary@ti.com/>
> 
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5c85e5da152f..4c0eb2711bbe 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
>   CONFIG_DRM_ANALOGIX_ANX7625=m
>   CONFIG_DRM_I2C_ADV7511=m
>   CONFIG_DRM_I2C_ADV7511_AUDIO=y
> +CONFIG_DRM_CDNS_DSI=m
>   CONFIG_DRM_CDNS_MHDP8546=m
>   CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
>   CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
> @@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
>   CONFIG_PHY_NXP_PTN3222=m
>   CONFIG_PHY_SUN4I_USB=y
>   CONFIG_PHY_CADENCE_TORRENT=m
> +CONFIG_PHY_CADENCE_DPHY=m
>   CONFIG_PHY_CADENCE_DPHY_RX=m
>   CONFIG_PHY_CADENCE_SIERRA=m
>   CONFIG_PHY_CADENCE_SALVO=m

