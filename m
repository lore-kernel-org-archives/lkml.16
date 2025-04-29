Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D432741C6;
	Tue, 29 Apr 2025 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911730; cv=none; b=JI3ry6jgXg3r92mvkZNM+DOzJuGqxOpL6OMDHY5sI90vhyeYLiGtDVu7msofkHR0Jy8q7aTyxp6CZ39xqw6F5px63TYucpm9r/FGJnzijXz+GyemXVet+Boox7UToALm9jBRETPR3BJIu7Zyd2QuhZBYcrXCfNk/fQWYaoCXZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911730; c=relaxed/simple;
	bh=+vH7I+42geCyCAD8XJgr+tpdYRDIkeIYXAHrLYMdwlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nf8srQA5EbTfw8gnuwmtqPypvO9XvuS/QqefhDjjyQBnL4vncbmhn6jBA5H7KFyj7QhoMZtkt/ZdGN5kT3+K8hDE6RhnFcX0nqPIy8wGEmkjcAU/BtHxDCjUajmsSe9kDO8hJyqYI30CgsIkpmoFe4EjaeEDwZxAsZbk69MaaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=y2zF76gp; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y2zF76gp"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7ShD33027792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745911723;
	bh=Xji29AeQrTuafVznn9jEAm/SluSXzCm1zJ/2Vyy1tQc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y2zF76gpa+SIgv1ror2rHkxg2ODljwtgFqzAZCtzqmexgGqqQdoaD7WqfW+FSE4vg
	 0FPsUOHM7P6UG9PhGEeUQXHh+y+ErhLeDE1bVk1AzHKbJgAi8njWe33iDrz+wD4H+P
	 4K9pNAoPlDgS4oJ3jxeNAMKMgisvHgtCElJCoQ6I=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7ShN6051172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 02:28:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 02:28:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 02:28:42 -0500
Received: from [172.24.227.220] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T7ScOc110802;
	Tue, 29 Apr 2025 02:28:39 -0500
Message-ID: <ce025a6f-abf3-44aa-b011-848deea4c309@ti.com>
Date: Tue, 29 Apr 2025 12:58:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add
 bootph-all property to enable Ethernet boot
To: Nishanth Menon <nm@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250425051055.2393301-1-c-vankar@ti.com>
 <20250425051055.2393301-2-c-vankar@ti.com>
 <20250425212427.vvyocc4mmne5g3vq@vividly>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <20250425212427.vvyocc4mmne5g3vq@vividly>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Nishanth,

On 26/04/25 02:54, Nishanth Menon wrote:
> On 10:40-20250425, Chintan Vankar wrote:
>> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
>> stage. Add bootph-all property to required nodes to enable Ethernet boot
>> on AM68-SK and J721S2-EVM.
>>
>> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>
>> Link to v2:
>> https://lore.kernel.org/r/20250302153502.181832-2-c-vankar@ti.com/
>>
>> Changes from v2 to v3:
>> - Removed "bootph-all" property from "mcu_cpsw" node as suggested by
>>    Vignesh since child node already has that.
>>
>>   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 3 +++
>>   arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 3 +++
> 
> Why does every board that uses j721s2 need to have bootph-all for
> cpsw? Is network boot mandatory boot mode for all boards? That does
> not sound right. Just do them in the board file please.
> 

I have posted next version with your changes at here:
https://lore.kernel.org/r/20250429072644.2400295-1-c-vankar@ti.com/

Regards,
Chintan.

>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> index 5fa70a874d7b..c402d5e288b0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> @@ -344,6 +344,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>>   			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>>   			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mdio_pins_default: mcu-mdio-default-pins {
>> @@ -351,6 +352,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>>   			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>>   			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
>> @@ -626,6 +628,7 @@ &mcu_cpsw {
>>   &davinci_mdio {
>>   	phy0: ethernet-phy@0 {
>>   		reg = <0>;
>> +		bootph-all;
>>   		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>>   		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>>   		ti,min-output-impedance;
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> index bc31266126d0..218290b1840a 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> @@ -154,12 +154,14 @@ mcu_conf: bus@40f00000 {
>>   		cpsw_mac_syscon: ethernet-mac-syscon@200 {
>>   			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>>   			reg = <0x200 0x8>;
>> +			bootph-all;
>>   		};
>>   
>>   		phy_gmii_sel: phy@4040 {
>>   			compatible = "ti,am654-phy-gmii-sel";
>>   			reg = <0x4040 0x4>;
>>   			#phy-cells = <1>;
>> +			bootph-all;
>>   		};
>>   
>>   	};
>> @@ -562,6 +564,7 @@ cpsw_port1: port@1 {
>>   				label = "port1";
>>   				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
>>   				phys = <&phy_gmii_sel 1>;
>> +				bootph-all;
>>   			};
>>   		};
>>   
>> -- 
>> 2.34.1
>>
>>
> 
