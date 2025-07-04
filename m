Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A153328AE4;
	Fri,  4 Jul 2025 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621499; cv=none; b=HzRGgFMlslCsxAUXKHDz9MoWfvHftG4Cf2Q1RKjbHI2Aunlmyr/9RTEHfWy4u+TqGJeYPzck0v70jElDOtNujxyP7Uz2uY5rOUjjGnXMd9HnzhWa9I7NXyoLYDPATUyD1gZ6Yxw/z+3CpVELNtrH9Nf46z7AnGTv3+lz/5Ku3lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621499; c=relaxed/simple;
	bh=5juURlGCTioQfBlxBx8nAvDevdh0WwbUqDVMTwh8WG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ktqSrGEwKZP+aXQIxOI6OfEDU/VrUmjTvvs5KsmFaMZcF4ZChZrvjuRvp+do7E3eOO89eKSHp6rlvRAu6X5OGqEjXIdZDMxUDKAeJ1XwJAthG7/fHsdU05kv1q4peneb4f1V1aTzDztVIbi7l+QAC6ZG5feaIjRBvlJLvmaHjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gWUdzPm1; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gWUdzPm1"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zun2015076;
	Fri, 4 Jul 2025 11:31:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	M9BwNdO0n+eHL0EUvWD6TuFBUIy3YHt8PoUYOzrUspw=; b=gWUdzPm1DMpm70oQ
	fRrkubsgs3v5Gb9JpVToX2KBdsuIS/RenqmRaDuYoqMHFleZZVulGExY/A8H5Ide
	PxUNFj5eIwlsNJmcwj94812gBYnsVL3IYkYRs3YGtMhbI75ipQApdhvimHpJsaik
	6HxZAVTRLtZMdAjD3kJEuYwdYt+zJ/apxGTd4fgLzv+K9eH0TEBz2cyt0craIir2
	OCTb2Tn1X+8Ip8SnHQshqTVevaC3on+povzaJ2GCIrOhxub1VKo69fykFy/OGe86
	6VJrE0Y2h03C862lJ3t6agAHH7NlBiBQfwLDzjmV10plO9myKiPv4+TL+6/OSvi3
	8UW/Tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6m7fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:31:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 73C1A4004A;
	Fri,  4 Jul 2025 11:29:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A28CAA07D2;
	Fri,  4 Jul 2025 11:29:02 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:29:01 +0200
Message-ID: <dfbc604f-e43f-44a4-ac2c-d5fcdcbb1297@foss.st.com>
Date: Fri, 4 Jul 2025 11:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce STM32MP157F-DK2 board
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        Etienne Carriere
	<etienne.carriere@foss.st.com>,
        Pascal Paillet <p.paillet@foss.st.com>,
        Conor
 Dooley <conor.dooley@microchip.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01

Hi Amélie

On 6/3/25 11:02, Amelie Delaunay wrote:
> The main hardware difference with STM32MP157C-DK2 board is the SoC: 'F'
> variant embeds a STM32MP157F SoC, which has the same level of features
> than a STM32MP157C SoC but A7 clock frequency can reach 800Mhz (instead
> of fixed 650Mhz for 'C' variant).
> stm32mp157f-dk2 device tree reuses the existing sketeton for STM32MP15
> DKx boards, but it is SCMI-based with I2C4 & PMIC managed by OP-TEE,
> like other STM32 MPU boards (STM32MP135F-DK, STM32MP257F-DK/EV1, ...).
> Himanshu's bindings patch [1] has been rerolled to introduce
> st,stm32mp157f-dk2 compatible.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20250524100319.22521-3-himanshu.bhavani@siliconsignals.io/ [1]
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> 
> Changes in v2:
> - Drop empty stm32mp15xa.dtsi and stm32mp15xd.dtsi files.
> - Fulfill SCMI regulator defines and add Pascal's SoB
> - Add patch [4/7] to use SCMI regulator defines
> - Add patch [5/7] for OP-TEE async notif
> - Link to v1: https://lore.kernel.org/r/20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com
> 
> ---
> Alexandre Torgue (1):
>        ARM: dts: stm32: fullfill diversity with OPP for STM32M15xF SOCs
> 
> Amelie Delaunay (3):
>        ARM: dts: stm32: use 'typec' generic name for stusb1600 on stm32mp15xx-dkx
>        ARM: dts: stm32: use internal regulators bindings for MP15 scmi variants
>        ARM: dts: stm32: add stm32mp157f-dk2 board support
> 
> Etienne Carriere (2):
>        dt-bindings: regulator: Add STM32MP15 SCMI regulator identifiers
>        ARM: dts: stm32: optee async notif interrupt for MP15 scmi variants
> 
> Himanshu Bhavani (1):
>        dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
>   arch/arm/boot/dts/st/Makefile                      |   3 +-
>   arch/arm/boot/dts/st/stm32mp15-scmi.dtsi           |  10 +-
>   arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     | 196 +++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp157f-dk2.dts           | 179 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp15xf.dtsi              |  17 ++
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   2 +-
>   .../dt-bindings/regulator/st,stm32mp15-regulator.h |  40 +++++
>   8 files changed, 443 insertions(+), 5 deletions(-)
> ---
> base-commit: dc392342b7bb14b12f2de96201937cb02be7802f
> change-id: 20250527-stm32mp157f-dk2-2a484a01973a
> 
> Best regards,

Series applied on stm32-next.

Cheers.

Alex
