Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51101A00FE;
	Mon, 21 Apr 2025 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233864; cv=none; b=OrvmlKpIaicTFLgjohi6k1noppD1vQYWr3vwYUl6MFu4kxVJP0XGEELBLcxzE0HHFNCzSR8x6CZIiE1aj6QRjZdX5DBwXTxSlVTU/WtYwggvuDh6vfaCGb6Y7DskdNtrBYmbOhlnQJq2NQe4It0297pbJPF5SM2zDx1yKUGSKp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233864; c=relaxed/simple;
	bh=XjfrOQ2tkIbJA3/xR24AKcQ454ojc6K+IU0XNG+okPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QGjVyAOaBAfE67gzqUfIsTOgKlY0z8vk4zbDCCdn/OvY5c1YAz4eHZFr4vNdPIio+E2lfQwSkB1fi+zWrg+YFXvJIXRtW96PDR8Gsw61yEUKufM0e1x6+LufO7q9mDUJF/W62LqgEPKL2Vp624xlW3vJRDisbL+h00RCfwJSnuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=heu0xSpk; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="heu0xSpk"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBAoZo904775
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745233850;
	bh=tuPWyJnLJOkoKStv0ngupFsN+aI9E4hZpqsmAX/lmT8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=heu0xSpkuG8Vwua+hGBSIxFBY2MjVTpMN+I/8e1CA9NhEFV01pE/y01l4kGa2V/CB
	 XZKpNbICrf9co5x3xECsrcmlgiunh6N8kztNfx3nYtkyAZecPl4//kq6IXnKFaed/T
	 vLsRCcqLiT6i+jh7E12rX0Ry2el0Er74j+VmGsDc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBAonq024891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 06:10:50 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 06:10:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 06:10:50 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LBAkPi080763;
	Mon, 21 Apr 2025 06:10:47 -0500
Message-ID: <cdeb1f80-a959-423d-9cba-dc1af760fe75@ti.com>
Date: Mon, 21 Apr 2025 16:40:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on
 DisplayPort-0
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-8-j-choudhary@ti.com>
 <4144abf5-82aa-49db-82d7-c1429c12292e@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <4144abf5-82aa-49db-82d7-c1429c12292e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Udit,

On 19/04/25 15:04, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Enable DSI support for AM68-SK platform.
>>
>> Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
>> on the board.
>>
>> Add the endpoint nodes to describe connection from:
>> DSS => DSI => SN65DSI86 bridge => DisplayPort-0
>>
>> Set status for all required nodes for DisplayPort-0 as 'okay'.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts 
>> b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> index 11522b36e0ce..df54de2d8236 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> @@ -124,6 +124,35 @@ transceiver4: can-phy3 {
>>           max-bitrate = <5000000>;
>>       };
>> +    edp0_refclk: clock-edp0-refclk {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <19200000>;
>> +    };
> 
> I assume on this board and through out series, display is DP not eDP.
> 
> do you see possibility to change wording from eDP to DP
> 

Yes, the display is DP.
But this is the refclk consumed by SN65DSI86 bridge (DSI-to-eDP bridge)
Hence the naming.

> 
>> +
>> +    dp0_pwr_3v3: fixedregulator-dp0-pwr {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "dp0-pwr";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
>> +        enable-active-high;
>> +        regulator-always-on;
>> +    };
>> +
>> [..]

Thanks,
Jayesh
