Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA333987
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218262; cv=none; b=tGTsXOC7W/y2vyfLXo6V32sM603VP1/kdRQeYhW1WmAPB9Xs7QaXdP1OZQOdysjNf4qJEvuVvhweGNc7VnVJzbX3cQqkqIU5rmgbC+ne6FByVtj3OaM/84guILqKhiU4uvx1fgDLfLsF2FoH0Q/5wNRehgqNY/4QNm7xe/HvFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218262; c=relaxed/simple;
	bh=k44Vb4Nuo6hFbLWaRtRipQzDZeOQtk6e+RbNzAFNmyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OLXhB34O0+GZXm3gJf1vB8ffiyz6oZsLKqdfDuE19gJrlEt4ZJiCZDDYVsc9+ik9EcPIjRQh1BvgOssnO7TSZqVrCYJpzpC6BSt3J/kx1/zC4KRHO97uJtkJ9/vwFSDMYaSNeRcKgc90V/ZQxp2L5m+DbD8SzYWCw+CaT3PKOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TVoktNGz; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TVoktNGz"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6O2WW1481981
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jan 2025 00:24:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738218242;
	bh=bA51Zuh3QHyfv5qHUZZLHXnEb+OC900pTf+oGAOd+Mg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TVoktNGzZKMDt7b+3DZmQ/cFYnjgOLEevPdChJO5B2+Y7oUqi1rgp91AQqchHOOXp
	 NFcT1Vua0EYUbwDr4RSpn6rsDc5xgRZKme63gBPOi5qpyIXZkuSRe/nktE9uiQOUNT
	 VlFJQmDtlItii5UWTr95p2ByFH48FgX/jSMWnqI4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6O2m6088002;
	Thu, 30 Jan 2025 00:24:02 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 00:24:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 00:24:02 -0600
Received: from [172.24.227.241] (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6Nx2W036439;
	Thu, 30 Jan 2025 00:24:00 -0600
Message-ID: <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
Date: Thu, 30 Jan 2025 11:53:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <krzk@kernel.org>, <vigneshr@ti.com>, <p-mantena@ti.com>,
        <s-k6@ti.com>
References: <20250116035145.370734-1-s-k6@ti.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <20250116035145.370734-1-s-k6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi, all,

On 16/01/25 09:21, Santhosh Kumar K wrote:
> Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
> 
> 1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
>     J722S EVM, J742S2 EVM
> 2. W25N01JW on AM62Lx EVM
> 
> by enabling the MTD_SPI_NAND config as a module.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---

Gentle ping.

Regards,
Santhosh.

> 
> Changes in v2:
>   - Fix commit message
>   - Rebase on next
>   - Link to v1: https://lore.kernel.org/linux-arm-kernel/20250102120043.1404843-1-s-k6@ti.com/
>   
> Repo: https://github.com/santhosh21/linux/tree/uL_next
> Test results: https://gist.github.com/santhosh21/71ab6646dccc238a0b3c47c0382f219a
> 
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e729948b7d69..35f312a39e38 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -283,6 +283,7 @@ CONFIG_MTD_NAND_BRCMNAND=m
>   CONFIG_MTD_NAND_FSL_IFC=y
>   CONFIG_MTD_NAND_QCOM=y
>   CONFIG_MTD_SPI_NOR=y
> +CONFIG_MTD_SPI_NAND=m
>   CONFIG_MTD_UBI=m
>   CONFIG_MTD_HYPERBUS=m
>   CONFIG_HBMC_AM654=m
