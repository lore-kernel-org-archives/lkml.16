Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3826FD80;
	Mon, 28 Apr 2025 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850750; cv=none; b=MsBVfKxufQv744ZW/DDjvcyUhOP86lEz9ROGbDt0cYCTtjLV8e6yjJ2scIyv9El2mD/EG2VsgdOfhTxj/8tJogq6Y5WNlHm/TOVJIwHcDya/h+izI5ZOMeUfJ75hubie+0wiCAVdF3GO/QzzfNPhHuj+t5QrgZFj1ZqSiiVYqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850750; c=relaxed/simple;
	bh=a+ifTSZm+cWaHoFZFQ71U9ui3HBILvzDujK+XPKqusU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=joair5O6zkIq7H25ddWPkangdxBwCg60XuFxCDLY8qUuHK9JmerUdyoPMa7ZtxLZ/hoV3Jx/fLM+OTdU635ozfwsBUme5+94A7KwrONI17PrZjrkw/fJh4BROMjd6vhetAL4I+P0Sgo98jAxUwr3seuvySvTG050PKCEejcFmTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xFkUJxoG; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xFkUJxoG"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEWLTE2797771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745850741;
	bh=h/2bBsmNgshpx+fVZzGiZUVbGDRvaT0rx5juzitARMQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xFkUJxoGm9XO51g5jRFTmGUvg7QMqNi7cTL5RW+D7tVOCXzjgGfMzVwTTtglBxE5l
	 R+N3JdSmWftEGudzB6IbyTiEAzl9euBfwRXJtLfY0H509qoxAgwLT8+8vaWwdti9Y7
	 Jp+2lN+Z9aAgskninJLu7DhFFlzepM1nZXp6hWV4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEWL8H130550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:32:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:32:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:32:21 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SEWDF0103895;
	Mon, 28 Apr 2025 09:32:13 -0500
Message-ID: <22475489-3142-44dc-8020-e9fd8cf8709e@ti.com>
Date: Mon, 28 Apr 2025 20:02:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] AM64 and J7X DT: Enable PCIe 64-bit Address Space
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/22/2025 5:30 PM, Siddharth Vadapalli wrote:
> Hello,
>
> The Cadence PCIe Controllers in TI's K3 SoCs namely:
> AM64, J7200, J721E, J721S2 (AM68), J722S, J742S2 and J784S4 (AM69)
> support two address regions:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
>
> Currently, the 128 MB region in the 32-bit address space is enabled in
> the device-tree. This might be suitable for most of the use-cases, but
> for those use-cases requiring larger address regions than 128 MB it is
> necessary to switch to the 64-bit address space with the 4 GB address
> region. This series implements the corresponding device-tree changes to
> support the 4 GB address region as the default configuration. Existing
> use-cases should continue to work without any regression.
>
> Series is based on linux-next tagged next-20250417.


For series

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
> Link to v1 series:
> https://lore.kernel.org/r/20250417120407.2646929-1-s-vadapalli@ti.com/
>
> Changes since v1 series:
> - Fixed the 'ranges' in k3-j721e.dtsi which is the third patch of the
>    series to set the size as 4 GB instead of the incorrect value of 128 MB.
> - Based on Udit's feedback and offline discussion as described at:
>    https://lore.kernel.org/r/7f6ea98c-df6d-4c94-8f42-76cc8306b6c4@ti.com/
>    the address region of 4 GB is split as:
>    0. 4 KB ECAM
>    1. 1 MB IO
>    2. (4 GB - 1 MB - 4 KB) 32-bit Non-Prefetchable MEM
>    instead of the previous split of:
>    0. 4 KB ECAM
>    1. 1 MB IO
>    2. 128 MB 32-bit Non-Prefetchable MEM
>    3. (4 GB - 129 MB - 4 KB) 64-bit Prefetchable MEM
>
> Series has been tested on AM642-EVM, J7200-EVM, J721E-EVM, J721S2-EVM,
> J722S-EVM and J784S4-EVM using an NVMe SSD connected to the PCIe
> Connector on the EVMs.
>
> Test Logs:
> 1. AM642-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/5d1814ee2e0857dac0ac08a6cf8759da
> 2. J7200-EVM PCIe1
> https://gist.github.com/Siddharth-Vadapalli-at-TI/9927faab7615b9c1c101854a213f30f5
> 3. J721E-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/e6545e31f45077fe59c896f8875bf1b9
> 4. J721E-EVM PCIe1
> https://gist.github.com/Siddharth-Vadapalli-at-TI/5c0b64f339f89139797d8346c40b1ee9
> 5. J721S2-EVM PCIe1
> https://gist.github.com/Siddharth-Vadapalli-at-TI/67b03c441d53ef0d27837e615371efbd
> 6. J722S-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/7625f47b57d45aada4c125ac4f60ebd6
> 7. J784S4-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/edf2af424fc7d5905832d536a1171a1a
>
> Regards,
> Siddharth.
>
> Siddharth Vadapalli (7):
>    arm64: dts: ti: k3-am64-main: switch to 64-bit address space for PCIe0
>    arm64: dts: ti: k3-j7200-main: switch to 64-bit address space for
>      PCIe1
>    arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
>    arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for
>      PCIe0 and PCIe1
>    arm64: dts: ti: k3-j721s2-main: switch to 64-bit address space for
>      PCIe1
>    arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for
>      PCIe0
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address
>      space for PCIe0 and PCIe1
>
>   arch/arm64/boot/dts/ti/k3-am64-main.dtsi             |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi            |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi            | 12 ++++++------
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi                 |  2 ++
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi           |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi            |  6 +++---
>   .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 ++++++------
>   7 files changed, 26 insertions(+), 24 deletions(-)
>
