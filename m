Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2A284B4E;
	Tue, 22 Apr 2025 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331239; cv=none; b=qzU0/F4b8QNi4sEfzktqWvmU2LqSRIN6EuNlec1P/RLOfzsw9QgvK7tv1+BczWlK3dJK6NZlCG2IxquSaZzWr1KYUTNMqlWtQwsbVOyMMreBIxIWR0xXTYYniVDYM9l19vLYTzIQBxNViORQgWMnkSGxIgiUgibMS/BCw71cad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331239; c=relaxed/simple;
	bh=EHmBc8d15D3weeUeLlzNmBrTFGvdaWWGosenJvKzCoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wu12ydPVi3Ab1sZQOew64uQYqiwWvpXZbzFgrfyqw0YfjokSw1qXBu9YACj3719kqdRY7IBzutLW5G5Ci6THgy9mYf22MQCDYsHtVErQynBGvUHN0ZBA9NbtKZWKvLo4s/DOeroXudAmIQDTvJyR0Xnpzjq7cwn2jURMYQiHKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VDYv4upM; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VDYv4upM"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEDl0q1235359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331227;
	bh=3rpxuqVYs16DDgSDLQ6yHr2HIDalRpwpz+2n7O3fnI8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VDYv4upMO674o/eoamlkWPy8my8boATpeMY4/7ZlplMgLNS5uiGzunowDwWU7wjh5
	 Lckuso00gm8haJdpZNB2wMed2ICjnFimbPuJJeQO5KIJY3lZyrwnLKvs3HKdcJfWZo
	 eNJDkd+GpHwzleBbkdAZ6+RvOZQtWbr/vkNHtLD4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEDldC086402
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:13:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:13:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:13:46 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEDgoD114512;
	Tue, 22 Apr 2025 09:13:43 -0500
Message-ID: <87b9ab38-48e8-4e51-8485-16e944ee0d57@ti.com>
Date: Tue, 22 Apr 2025 19:43:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-j784s4-j742s2-evm-common:
 enable ACSPCIE0 output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <parth105105@gmail.com>,
        <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
 <20250422123218.3788223-3-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422123218.3788223-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Thanks for fixing at board level

On 4/22/2025 6:02 PM, Siddharth Vadapalli wrote:
> The PCIe reference clock required by the PCIe Endpoints connected to the
> PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
> and J742S2-EVM is driven by the ACSPCIE0 module. Add the device-tree
> support for enabling the same.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> The previous versions of this series were a single patch. Based on the
> feedback received on previous versions, the SoC and Board support has
> been split in order to allow reuse for other Boards based on the same
> SoC.
>
> v2 patch:
> https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
> Changes since v2 patch:
> - The SoC and board changes have been split across:
>    k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
>    respectively.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> index 2664f74a9c7a..fa656b7b13a1 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> @@ -5,6 +5,9 @@
>    * EVM Board Schematics(j784s4): https://www.ti.com/lit/zip/sprr458
>    * EVM Board Schematics(j742s2): https://www.ti.com/lit/zip/SPAC001
>    */
> +
> +#include <dt-bindings/phy/phy-cadence.h>
> +
>   / {
>   	chosen {
>   		stdout-path = "serial2:115200n8";
> @@ -1407,10 +1410,13 @@ &main_mcan4 {
>   
>   &pcie1_rc {
>   	status = "okay";
> +	clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
> +	clock-names = "fck", "pcie_refclk";
>   	num-lanes = <2>;
>   	reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
>   	phys = <&serdes0_pcie1_link>;
>   	phy-names = "pcie-phy";
> +	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   };
>   
>   &serdes1 {
