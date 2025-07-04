Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675CA28A726;
	Fri,  4 Jul 2025 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618795; cv=none; b=WaoG9FfK2nsu3/MNg/4j+nj2d/T6c6k4EZHUpjVnqe7WSmuPZHOjbrjdMh1bw+zD+iGufepl28msDAqaAHOsHNB1G0soGZB6SWEr4X+3U4+lxJH0qKS1Tk9IhzqaxoDgAad9Bn/FNL3CQUCDDWj0SzD6XrUHugMg78q+gB2Bvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618795; c=relaxed/simple;
	bh=kv/PeDCma7DCvRH0d52zdnodi9MDnPnb219FgiA2Fh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ijotk0TKUwnBlRgvbWy+boRncl+nwz/misH97m8IyomLIP7YTYc4P2RJiKZdrKHAiJjeeJRtPXm+9Ab/u3iMv003DXKCaHBg6xpHw/Z1NnDXrRh01F3QzgnEGDuIxPoe9gUQZqGx3EN1KXhIigwGzUcBdxDpujuyIxusdRg6EbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wPNG8kyH; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wPNG8kyH"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5648kL834136291;
	Fri, 4 Jul 2025 03:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751618781;
	bh=UM6Vn3fL7J3xAJBIYyUzeIBiXiYvGrMBNB36K+Hll8k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wPNG8kyHauGIWBSfpBfVvQGPrBldXCRwZvu/mVbzUwtQH9qzYvZjtsmdzJBC8opZs
	 45VZi0uAPhGF4wpHxjzPMtGzGhc4yQrHIjMLiiQgOONsD0G+/UWnIkGUPX6SMfelfx
	 121mwkJL1rZ7ML2HiHdhPST6NG5hDMK7TEb7RroY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5648kLvG2656895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 03:46:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 03:46:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 03:46:21 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5648kGSJ2686036;
	Fri, 4 Jul 2025 03:46:16 -0500
Message-ID: <6f151fc8-ff95-4e1a-b92f-4e908f62e979@ti.com>
Date: Fri, 4 Jul 2025 14:16:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
 <485dc90b-dc9b-4b1a-ad18-9a9ef117637c@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <485dc90b-dc9b-4b1a-ad18-9a9ef117637c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 04/07/25 09:40, Vignesh Raghavendra wrote:
> Hi
>
> [...]
>
> On 27/06/25 17:27, Paresh Bhagat wrote:
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> new file mode 100644
>> index 000000000000..70aeb40872a9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
>> + *
>> + * TRM: https://www.ti.com/lit/pdf/sprujd4
>> + *
>> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "k3-am62a7.dtsi"
>> +
>> +/ {
>> +	model = "Texas Instruments K3 AM62D SoC";
>> +	compatible = "ti,am62d2";
>> +};
>> +
>> +&vpu {
>> +	status = "disabled";
>> +};
>> +
>> +&e5010 {
>> +	status = "disabled";
>> +};
>
> Norm seems to be to use /delete-node/ here instead. Please respin
> accordingly.


Yep makes sense to delete the node itself. Will update this.
>
