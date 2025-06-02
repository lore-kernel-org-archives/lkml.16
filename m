Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7181B0421
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853227; cv=none; b=T8z8Hobs14rxJmrBr5noSkTO1XByfeMDXDUSyKH/5//W0BWjoYDFz4aQyZNa4yBXivx1ZT1DhQx1hv3+jSDb+lDD6tNQ/7wPWzRxH+bEU/7l2EH6KRzbtb8aankcA8K7H4UPimH8rgBiaoGe6Pl3b6H5//Tr8cZszLDV2vYO3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853227; c=relaxed/simple;
	bh=z3Sw3Ehm9RUiBg82KQY5E7O6QAuFNe317WuYpjBslMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ep89XK0Mt4mfspEGicOsheInub7WAQPvE14bj7lnAJXNL8astLMLnIZ9lJOnRhQ1EwZmeaIIlRQ839ygsb3qZyiynkDMcBFC7wkpC759XtBO3D0/ACYNU9Q5+D+8LPAun1+/grlF+1tO7jFmgylAkEoYuQk8HQ2HNQgjwZC4MQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Lr9kmC1B; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Lr9kmC1B"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5524w7w7001961;
	Mon, 2 Jun 2025 10:33:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iQnTD3sMOZ/Yz+cQ2+3tny2YWO4ikiRwRh+iaTvsl/I=; b=Lr9kmC1BNlhNb1/Y
	YnuRk7zmnmE65/CpO//gHEh9jy+8wQcYYtVsJD3O7OIPWRV9Oc1XYb2wkNd1Un+1
	WuWOChvj7ULfWPBCnk+oqSVi4Vfg/TiXeY4bsNN/sYLBWjOwO+X+sDZsVhPJcOjx
	NoDhU8va+k7rNdJ3YZ297H8oQ7+V2oLyzGGvXNSzaFNQhou700OSWi5hkrgGSGO5
	1UdHae3Pyoi8nckhw+/pEa46IHwQbDmAasSo7GK8chWsqjfmVDYS85jtNLjgQB4m
	f7QwnUczeem3HNAD6lS/AhK5wa0ckJFsr/FabtHDJGsNT4Mj0pQIdLfPS6DpSEJR
	1hjHDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46ys41x0w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 10:33:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68E7840051;
	Mon,  2 Jun 2025 10:32:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9263AF26ED;
	Mon,  2 Jun 2025 10:32:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 10:32:23 +0200
Message-ID: <bfb42df1-6697-4da7-8efb-a891d0487766@foss.st.com>
Date: Mon, 2 Jun 2025 10:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: defconfig: Enable STM32 Octo Memory Manager
 and OcstoSPI driver
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250512-upstream_omm_ospi_defconfig-v10-1-4d9996911bd3@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512-upstream_omm_ospi_defconfig-v10-1-4d9996911bd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_03,2025-05-30_01,2025-03-28_01



On 5/12/25 08:40, Patrice Chotard wrote:
> Enable STM32 OctoSPI driver.
> Enable STM32 Octo Memory Manager (OMM) driver which is needed
> for OSPI usage on STM32MP257F-EV1 board.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v10:
>   - rebase on top of next-20250509.
>   - Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com
> 
> Changes in v9:
>   - split patchset by susbsystem, current one include only defconfig related
>     patch.
>   - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d0768584647c3b0e062b2667bc43fd7839f84c3a..03ccb3cc907114f24650d7f7ee10b20be33aa7d0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -581,6 +581,7 @@ CONFIG_SPI_QUP=y
>  CONFIG_SPI_QCOM_GENI=m
>  CONFIG_SPI_S3C64XX=y
>  CONFIG_SPI_SH_MSIOF=m
> +CONFIG_SPI_STM32_OSPI=m
>  CONFIG_SPI_SUN6I=y
>  CONFIG_SPI_TEGRA210_QUAD=m
>  CONFIG_SPI_TEGRA114=m
> @@ -1506,6 +1507,7 @@ CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_EXTCON_USBC_CROS_EC=y
>  CONFIG_FSL_IFC=y
>  CONFIG_RENESAS_RPCIF=m
> +CONFIG_STM32_OMM=m
>  CONFIG_IIO=y
>  CONFIG_EXYNOS_ADC=y
>  CONFIG_IMX8QXP_ADC=m
> 
> ---
> base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
> change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
> 
> Best regards,

Hi Catalin, Will

Kind reminder to review this patch.

Thanks
Patrice
