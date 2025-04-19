Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD813C3F2;
	Sat, 19 Apr 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745072924; cv=none; b=NdujKvqkTIObOpzZihzYzIvpm89S2iV50CDd5eH3ZPMKna1AYsc+qFu1T6NbajZrIwoNSp5RxyVSjYYF5GFJbHdwXOX8mta4LddWJsMyd2AZq+Hqvpr+07unnBauhvwLGWICCa7SGtSgYS2biaeOL47YblaSFqQzGJt14JFyA7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745072924; c=relaxed/simple;
	bh=uzvmIdzNKMJvRDHxUKWWpbzGyBYgL/QazvZXZg5y6JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iH0MJ+1Dz8MAa1scHamRhVw47Tsp/FopvvX3wgFCGh+VzUftnx1eoTXVnBept4W+ldvvEqkWWOnpYrzrpiSm8RitJAGvicX9TTXAcg6Y8dFeCMdKfyhl/Qv8bffXHMwXSVP6QFQBtDNjdl/MmaRbfGaUdapM4WO3sYIdFjwiBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vDHHg3dr; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vDHHg3dr"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JESXnD512670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745072913;
	bh=bnT6SpimH/suvUjF2ZXLGhM0wMOvau/mRpChBQiDxrQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vDHHg3drJ3ss897hg7P1UhiTvhAogx3/cclr3BePV84xckZIrWXh7z8Z0PMgy4j/+
	 YKS3G4eTfZ4k+Z3f3z5zpXDPhjiVs014BUotYgtp+WUGJSLbAKkrY3vHzu9hw1QP0N
	 TdQKGhrZsSF0VzllDILxmX3cEwRLvRs8oqX668sg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JESXYO023232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:28:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:28:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:28:33 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JESTrG107279;
	Sat, 19 Apr 2025 09:28:30 -0500
Message-ID: <a34e8c08-0259-417a-8312-9f6efbdccead@ti.com>
Date: Sat, 19 Apr 2025 19:58:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to
 enable USB0 Type-A
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250409100853.4179934-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250409100853.4179934-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/9/2025 3:38 PM, Siddharth Vadapalli wrote:
> The USB0 instance of the USB controller on both the J742S2 EVM and the
> J784S4 EVM supports a single USB interface at a time among the following:
> 1. USB3.1 Gen1 Type C interface
> 2. Two USB2.0 Type A interfaces via an on-board USB Hub.
>
> By default, the USB3.1 Gen1 Type C interface is supported on both of the
> EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
> mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
> is only associated with the Host Mode of operation.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on linux-next tagged next-20250409.
>
> v2 of this patch is at:
> https://lore.kernel.org/r/20250226124245.9856-4-s-vadapalli@ti.com/
> Changes since v2:
> - Rebased patch on next-20250409 and dropped other patches which were
>    present in the v2 series.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/Makefile               |  7 +++++
>   .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> [..]index 03d4cecfc001..c7f23fbce660 100644
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&exp2 {
> +	p12-hog {
> +		/* P12 - USB2.0_MUX_SEL */
> +		gpio-hog;
> +		gpios = <12 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "USB2.0_MUX_SEL";
> +	};
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +};

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


