Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E81A83FB;
	Fri,  2 May 2025 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746220106; cv=none; b=kimPjiHR6mFsGMnLTpVVZwsiwT0p8RDfEy6c46og7rsZMG+qz+Km/vASk6c9uxqtODue7agCq3/pc/AGdD4CmE8uTPtrWRxHoTWVo6KwZxLCJo3hvhNL47RCkR+4DGvu3zkXKW9FSA5EQKA4aIsjYbDQ0vtTM8KBoiZd/1nkcq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746220106; c=relaxed/simple;
	bh=Jz5zvFhbCJPLZjfL7s8EDN4puyDzcZstpo4HUgodSs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ULGKtVRKHNBl1u4qeJOsSK1MBHzIkhKXgHsGUOs0/ed0GV1wm9os8sapy6N0j1BRfedfWWyQB1r3yN9NId6u05oBBswizGZ+ulDGAGgzSSZH6ZaTszSixB8E4PSI5Wtv2MxQf73SnkDtK+FKXC3+FDJ+73Znku4qbVuubF6swFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qkugMTPc; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qkugMTPc"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542L8GJm311365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 16:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746220096;
	bh=ZsJS6MtTCAzOwPvgUJIDWcyCZOavuuOCnZX5Dvq11gE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qkugMTPc5xkGaIDuyEeA+q+FEzKNMrdFg4p9+p2kdV1eomYGdGVe58YLecsIpIVrV
	 xeddskF3ZKFlwg9HRSOrOXZAztMURC1IPlVoZtxCcsfOsucQMg35wXfJlPTMhkRur5
	 4wuGYVjhoAR08tTMf0bwwPuPc4B+MNbaxd4octTg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542L8GQG104530
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 16:08:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 16:08:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 16:08:16 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542L8FHw034089;
	Fri, 2 May 2025 16:08:16 -0500
Message-ID: <66e2139c-ab45-40ee-93bf-557768614216@ti.com>
Date: Fri, 2 May 2025 16:08:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>
References: <20250430144343.972234-1-jm@ti.com>
 <20250502122423.weyvgng4s4zcjdxh@document>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250502122423.weyvgng4s4zcjdxh@document>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 5/2/25 7:24 AM, Nishanth Menon wrote:
> On 09:43-20250430, Judith Mendez wrote:
>> From: Kishon Vijay Abraham I <kishon@ti.com>
>>
>> Add the DT node for the PRUSS-M processor subsystem that is present
>> on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
>> instance and it has two Programmable Real-Time Units (PRU0 and PRU1).
>>
>> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
>> [ Judith: Fix pruss_iclk id for pruss_coreclk_mux ]
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changelog:
>> - drop internal tags
>> - rebase against ti-k3-dts-next
>> - fix header
>>
>> Link to v1:
>> https://lore.kernel.org/linux-devicetree/20250108222048.818835-1-jm@ti.com/
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 90 ++++++++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> index 7d355aa73ea2..ee53e663b5bd 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> @@ -1079,6 +1079,96 @@ dphy0: phy@30110000 {
>>   		status = "disabled";
>>   	};
>>   
>> +	pruss: pruss@30040000 {
>> +		compatible = "ti,am625-pruss";
>> +		reg = <0x00 0x30040000 0x00 0x80000>;
>> +		power-domains = <&k3_pds 81 TI_SCI_PD_EXCLUSIVE>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x00 0x30040000 0x80000>;
> 
> Should this not be default disabled? pruss needs pinmux to operate
> correctly, right?

No, PRU node does not need pinmux to work properly. ATM we are using
RPMSG echo test as the default experience and this does not require
any pinmux configuration since signals are internal to the SoC. Now
it is possible for an application to use a PRU GPO for ex and then they
would require pinmux but it is application specific.

~ Judith

> 
>> +
>> +		pruss_mem: memories@0 {
>> +			reg = <0x0 0x2000>,
>> +			      <0x2000 0x2000>,
>> +			      <0x10000 0x10000>;
>> +			reg-names = "dram0", "dram1", "shrdram2";
>> +		};
>> +
>> +		pruss_cfg: cfg@26000 {
>> +			compatible = "ti,pruss-cfg", "syscon";
>> +			reg = <0x26000 0x200>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0x0 0x26000 0x2000>;
>> +
>> +			clocks {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				pruss_coreclk_mux: coreclk-mux@3c {
>> +					reg = <0x3c>;
>> +					#clock-cells = <0>;
>> +					clocks = <&k3_clks 81 0>,  /* pruss_core_clk */
>> +						 <&k3_clks 81 14>; /* pruss_iclk */
>> +					assigned-clocks = <&pruss_coreclk_mux>;
>> +					assigned-clock-parents = <&k3_clks 81 14>;
>> +				};
>> +
>> +				pruss_iepclk_mux: iepclk-mux@30 {
>> +					reg = <0x30>;
>> +					#clock-cells = <0>;
>> +					clocks = <&k3_clks 81 3>,	/* pruss_iep_clk */
>> +						 <&pruss_coreclk_mux>;	/* pruss_coreclk_mux */
>> +					assigned-clocks = <&pruss_iepclk_mux>;
>> +					assigned-clock-parents = <&pruss_coreclk_mux>;
>> +				};
>> +			};
>> +		};
>> +
>> +		pruss_intc: interrupt-controller@20000 {
>> +			compatible = "ti,pruss-intc";
>> +			reg = <0x20000 0x2000>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "host_intr0", "host_intr1",
>> +					  "host_intr2", "host_intr3",
>> +					  "host_intr4", "host_intr5",
>> +					  "host_intr6", "host_intr7";
>> +		};
>> +
>> +		pru0: pru@34000 {
>> +			compatible = "ti,am625-pru";
>> +			reg = <0x34000 0x3000>,
>> +			      <0x22000 0x100>,
>> +			      <0x22400 0x100>;
>> +			reg-names = "iram", "control", "debug";
>> +			firmware-name = "am62x-pru0-fw";
>> +			interrupt-parent = <&pruss_intc>;
>> +			interrupts = <16 2 2>;
>> +			interrupt-names = "vring";
>> +		};
>> +
>> +		pru1: pru@38000 {
>> +			compatible = "ti,am625-pru";
>> +			reg = <0x38000 0x3000>,
>> +			      <0x24000 0x100>,
>> +			      <0x24400 0x100>;
>> +			reg-names = "iram", "control", "debug";
>> +			firmware-name = "am62x-pru1-fw";
>> +			interrupt-parent = <&pruss_intc>;
>> +			interrupts = <18 3 3>;
>> +			interrupt-names = "vring";
>> +		};
>> +	};
>> +
>>   	gpmc0: memory-controller@3b000000 {
>>   		compatible = "ti,am64-gpmc";
>>   		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
>> -- 
>> 2.49.0
>>
>>
> 

