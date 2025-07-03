Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF58225D6;
	Thu,  3 Jul 2025 05:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522036; cv=none; b=snSrDTTjGcXdbtuyrk+uDmsg+wrJHhAdA/3jTNsC4D34rva36FEnQbLfRQKe+6Tx6Gxs74gY65DCIceu65Y428csIpXqAceIP9h9NpLwj4vqPJ/dzq0jT0xpR0E98NeA+AeKgnAl8Qw7ztljdGS0wz0oCz2gyHHK/jnVhCGty/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522036; c=relaxed/simple;
	bh=JRDcZ9bRO+lHO3icT46bv6evpxDFRKpuh7yFWxswzo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jfpg4s6PG4K+b3MeRZ8gHQqEH5i5AQy3D8SEUVE14MP7TGDKABb/JNhqGOFraJRV3c+RxUL8MSOSszzDz82fP/kg5RHZqTlWCDWYtEErhBehTY9vnC/oxH7DskW1THeMOWAFg4FpCaBBa2ew4hOLwi3+FVKKaoU5XRHWadWCwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d5qDa5Lj; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d5qDa5Lj"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5635ri5V4135125;
	Thu, 3 Jul 2025 00:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751522024;
	bh=U0FlFz13Fap2ZXZ5bXh4T/2GXpZAIekESvgOflaRxpM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d5qDa5Lj6OqB8B+/TPWvHuY2o29oi2qcD5+Q+54f3hVbAHIzhWS0nW617BK+ceXqK
	 9JIN++iZafssJv/CGRXRlMZ8WQMkj5VJSjqx/k3WXQaWJ4VbQ+PQgtTV6OVp+MR6AA
	 fus8XLA+/dyBo/NEkPOGVzI4hR6wpRDHuUi13VWQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5635riaU078210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 00:53:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 00:53:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 00:53:43 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5635rbEP579551;
	Thu, 3 Jul 2025 00:53:38 -0500
Message-ID: <dfc9feec-e385-451a-bdf0-0a02bb4b66a6@ti.com>
Date: Thu, 3 Jul 2025 11:23:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: ti: Add bootph property to nodes at
 source for am62a
To: Bryan Brattlof <bb@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-2-p-bhagat@ti.com>
 <20250701160828.lmmfgfrmfcqiwpzz@bryanbrattlof.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250701160828.lmmfgfrmfcqiwpzz@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bryan,


On 01/07/25 21:38, Bryan Brattlof wrote:
> On June 27, 2025 thus sayeth Paresh Bhagat:
>> Add bootph property directly into the original definitions of relevant
>> nodes (e.g., power domains, USB controllers, and other peripherals)
>> within their respective DTSI files (ex. main, mcu, and wakeup) for
>> am62a.
>>
>> By defining bootph in the nodes source definitions instead of appending
>> it later in final DTS files, this change ensures that the property is
>> inherently present wherever the nodes are reused across derived device
>> trees.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 14 ++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    |  1 +
>>   arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  2 ++
>>   3 files changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
>> index 63e097ddf988..770f1258b0aa 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
>>   
> ...
>
>>   	main_pmx0: pinctrl@f4000 {
>> @@ -262,6 +271,7 @@ main_pmx0: pinctrl@f4000 {
>>   		#pinctrl-cells = <1>;
>>   		pinctrl-single,register-width = <32>;
>>   		pinctrl-single,function-mask = <0xffffffff>;
>> +		bootph-all;
>>   	};
> I don't think the boot phase flags for the pinmux nodes need to be here.
> The child nodes for the MMC, UART and Ethernet pins should take care of
> this.
>
> ...
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>> b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>> index ee961ced7208..df4aa131097f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>> @@ -12,6 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
>>   		#pinctrl-cells = <1>;
>>   		pinctrl-single,register-width = <32>;
>>   		pinctrl-single,function-mask = <0xffffffff>;
>> +		bootph-all;
>>   	};
> Same here. If we need any pins from the MCU domain during bootup those
> nodes can take care of adding the boot phase flag.
>
> ~Bryan


Will fix this thanks.
