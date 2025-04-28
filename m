Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319322AD04;
	Mon, 28 Apr 2025 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850859; cv=none; b=be0cqrd48eYwmb4GDX6wQDwnfttRU1Q/XM/g1pubbF/yeYVUf2qCnENTqtLxytzvFE0ite4qSQwvek64htMyz+8iCaXbQ7E4Rm/RmgoNSTC7FcEau/DRD0h+Opi/GalAVpiV+q6OgqYT/s+LB3MfJmd0UVRhkOQi5rBncCS+kLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850859; c=relaxed/simple;
	bh=YcDNryWhc6VcXftfwMsLAhE+X5MJo0OLW2P1BHqcGlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=umfeedR7UQxXZK4/++JFmGExcfEBMzvoN0iIR4IiEMUck4tjh6yGcILupV8JmH9RmwGgavWqmqrR6TycBpirBABQO2qGBHYOSaK9Fd4FOIsqDmimzwENd8D60YIoKRmSrwgm727khGkqot4qg14OaOv9s7pFinazEtFaxjOVwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sJPJraCH; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sJPJraCH"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEY5lE3573445
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745850845;
	bh=M9fpsf78Paf5UKQYjLwaXjw5Gbg+DBdSCuZWocGOz1c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sJPJraCHbeaVGqjYkUiiMPpzHnnFG8SQopfpgOzkvwzdyi+athULzc9Z85/Xdmh0p
	 Jw2rdrcfbsEiuyqqr0RQE36tlz2kOb7cXH/sVCMaESkPP1kYNjHnWGaHl+cmNm/y3J
	 ijojrKrDNmId3wSTVy1gdlaNXLJRNkRFRfFhqwsM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEY5uL003914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:34:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:34:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:34:03 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SEXxMp108147;
	Mon, 28 Apr 2025 09:33:59 -0500
Message-ID: <5619384e-28d4-48b9-99cc-dbf2e2375090@ti.com>
Date: Mon, 28 Apr 2025 20:03:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: add
 ACSPCIE0 node
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <parth105105@gmail.com>,
        <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
 <20250422123218.3788223-2-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422123218.3788223-2-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/22/2025 6:02 PM, Siddharth Vadapalli wrote:
> The ACSPCIE0 module on TI's J784S4 SoC is capable of driving the
> reference clock required by the PCIe Endpoint device. It is an
> alternative to on-board and external reference clock generators.
> Add the device-tree node for the same.
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
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 1944616ab357..f03b2b6d5d03 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -126,6 +126,11 @@ audio_refclk1: clock@82e4 {
>   			assigned-clock-parents = <&k3_clks 157 63>;
>   			#clock-cells = <0>;
>   		};
> +
> +		acspcie0_proxy_ctrl: clock-controller@1a090 {
> +			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
> +			reg = <0x1a090 0x4>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> +		};
>   	};
>   
>   	main_ehrpwm0: pwm@3000000 {
