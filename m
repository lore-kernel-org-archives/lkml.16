Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BCF1C6FFD;
	Wed,  9 Apr 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214281; cv=none; b=UtHu5D8qctHn5kG1+vh/0+vyV3GC2DClsPxVjV5uBK1MW7j02JsP47In0Yfk2PuGZpGPYWv/bNwzAaMXmC3ZMcPnuoWau1icOOqM5zD75+x2rnM+JwbMibtZVXjY0Oh3xWTJpKvlZAFp8d0ng5edT643kKaAfKF5CkU05pU51J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214281; c=relaxed/simple;
	bh=LHDRTqB/4aFtHHTphM5iyORZ3GnZAyBxGXVbnQv0x7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LYx8qBGotABFGpM8mt/XDTp7EB4FSABItiiovmRZjYte6UdsUlu2CYSa4cG/EO8CH/QwpObjZ3VrvfDI2c1GH3y90Tge8uapYvp27WH0pkh6bJZeWNrbMl3Zrwi2EqPZ/sdRrZa460xmZn9z5wRjExrmbqoo5/vRDCBxlhj701E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hSurYbEE; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hSurYbEE"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539D8iiA003194;
	Wed, 9 Apr 2025 17:57:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ciBgB/a2M9sVi4sdzHlbrYxfyvZ/g7Jwnk3UWviHnV8=; b=hSurYbEEBJuu1CAq
	stGgu8szSgpCQ2UKDGHSmM8CBXilyyF91vAlwc9PWSkxz+i/QNvNa61zMWSw5aIZ
	w9516O7NcptcMcNiLdRt/D8/qt6aGTDY1qxFBswF9XC737zJho7f8EkTMcyEj5bD
	K/tPBqHHpsG8PMc5cyLUbVCwft7pK499XNFuXUf2+StAyuCZrDTtA89kxBjBldw7
	sRzFUBxd1F2PzPj6cg+FT4Bj3Yj0u6f7IHIRcXE2A4mLpTx92Myygsh2+JOJPgjb
	FnKc1ZQYinD4oibRZ8f+iXPZqUl85QOnEa3K4+lw9zijhxUaFUEAC/GNS/QkThRs
	9jUOFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5gbyth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 17:57:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD0FB40045;
	Wed,  9 Apr 2025 17:56:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 378189BAC1C;
	Wed,  9 Apr 2025 17:54:35 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 17:54:34 +0200
Message-ID: <9c9172b8-508c-4855-9299-aab72ac2fae6@foss.st.com>
Date: Wed, 9 Apr 2025 17:54:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] Add STM32MP25 SPI NOR support
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <christophe.kerello@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250408-opal-pillbug-of-acumen-0fbb68@shite>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01



On 4/8/25 08:38, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> Patrice Chotard (7):
>>       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>>       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>>       memory: Add STM32 Octo Memory Manager driver
>>       arm64: dts: st: Add OMM node on stm32mp251
>>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
>>       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
>>
>>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
>>  MAINTAINERS                                        |   6 +
>>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
>>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
>>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
>>  arch/arm64/configs/defconfig                       |   2 +
>>  drivers/memory/Kconfig                             |  17 +
>>  drivers/memory/Makefile                            |   1 +
>>  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
>>  9 files changed, 863 insertions(+)
>> ---
>> base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
> 
> That's unknown commit.
> 
> b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
> Using cached copy of the lookup
> ---
> Analyzing 81 messages in the thread
> Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> ERROR: Could not write fake-am tree
> ---
> Could not create fake-am range for lower series v7
> 
> I tried on latest next, on some March next, on latest mainline. It seems
> you use some weird base here, so anyway I won't be able to apply it.

It was based on next-20250317 plus the 2 ospi patches already merged 
by Mark Brown, that's why.

> 
> Please split the patchset per subsystem and send something based on
> maintainer tree (so for me my for-next branch), mainline (which is the
> same as for-next currently) or linux-next.... which would be the same as
> my for-next branch currently.

ok

Thanks
Patrice

> 
> Best regards,
> Krzysztof
> 
