Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C326AA86;
	Fri,  9 May 2025 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777202; cv=none; b=bpeSeYGns+5ArtR6baUsgq9Cw/jn+3/wKNFYd3ShI8JPlcr9CZFn+puprS9cacQrC2i+aaF9KcDWw8S4a0iPrWla8q4VXRCNcnWEtIQOgtoplb4u1Df8foVRC0OtFj+dtx7EZ6oP+Mc2uBLZsClMTRLoOWJlRZ6fyBI0kgAYm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777202; c=relaxed/simple;
	bh=eHt4+eEPvMkGzqJQnDk1lTJ/DkvEU6CdbjhHw1QWgwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q+Jb+ydoBf8prcg6BSUrm27wZDNhB7ecGsArGbSJSj8tzXyIcrHOSK4L0cqgzH3QFgMfR/DpacbuHbdVSTlCoUEGxLliPD7ZpokcJ+8syQgcUlBE9FL7otkm67DGdFwITaJLddYwVjpAVkiaysoXUFAWhT2r27yar+2J+1ynkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MLsGQ5ia; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MLsGQ5ia"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5497r4nC1330695;
	Fri, 9 May 2025 02:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746777184;
	bh=TrUuMcvxwXyUkqZfmhAnOqQul9Vlq8pLt9fjPNT0vis=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MLsGQ5iaXyqIB1630VUiH591oE8oDx8+U1oVTsh43I3Lw1RCZ/B84zDirsUKri/ia
	 +5WBIgJJaUKCBbVG0M5pqdSAWxdPgNknhnma+FZilwpOIgUbK0ml5Y6bmqQidUwbtR
	 4syfLR8xvRrOAkLwd4c/evyWiogGBrz48zmeUBLs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5497r4Q02742395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 9 May 2025 02:53:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 02:53:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 02:53:03 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5497qxAC089330;
	Fri, 9 May 2025 02:53:00 -0500
Message-ID: <e8f073f5-3a38-4a3c-b395-84d927100d82@ti.com>
Date: Fri, 9 May 2025 13:22:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI
 OV5640
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-5-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250508155134.2026300-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 5/8/2025 9:21 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
>
> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> for quad TEVI OV5640 modules on J722S EVM.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> [..]
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> new file mode 100644
> index 000000000000..55e767a020d9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
> + *
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/

Please check year.

With  that

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	clk_ov5640_fixed: clock-24000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_exp>;

^^ with change in name of regulator (patch 1/4), you need to change here 
too

Thanks

Udit

> [..]
