Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A62222CC;
	Tue, 24 Jun 2025 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756302; cv=none; b=qY+LfH34ScSF7wKFmoGPjaizX4rqzHpz09/phTSb7PGNOpE/TXp5aeWuEeAoua+swXyg1BWtqWKw9GgJikMyZlIK81WXkSd/Woeic/qiDN1X9P1PnIj9WAn5pbJmiW2yMk9bL8FSfdcfkKvJi8+Le8lXsgNSqeU/cumnj4SqLNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756302; c=relaxed/simple;
	bh=CQjN1aub+G9/6qEb/p3iZsIlFW9S9261hVfK+MBVg+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ICcER5ui/EtNbOc2+nT6msuMvi2CN/fC0Qd9lgkQvNToL9AqfchNI/KVqm33dITM2RKZgtgHzyhVasjex0M24rP5Mp6yyEPXWw2RDadNF6UcuE6EbLl6Ur310Shve9ggebKqfdfY6N4oodhWWt7dHkNETnjOkq6/QcPegrYZTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=igmHt30s; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="igmHt30s"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O9BY3S1512476;
	Tue, 24 Jun 2025 04:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750756294;
	bh=HjzFE4fmyDlXVsPYzogdifl8Zzt69qws0co4hN/MNgM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=igmHt30sOLkziNmUmT6sM0zt8tmlv6S351SuqYBNh6XZIs/5aewpKI0DjtOrTuoea
	 GjosJGDB3ggtYFUfdJCpNyc+BdHxYaqc3bh7e9jnY4q85njgocoX7kE44RDwcyepOq
	 17XGQ8I7aMAaTZxwVi5a5uNHY+bcQnCyFU6O3nBw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O9BY884077631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 04:11:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 04:11:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 04:11:34 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O9BTNd1246614;
	Tue, 24 Jun 2025 04:11:30 -0500
Message-ID: <15530643-04a1-4c3d-9879-56d668a59667@ti.com>
Date: Tue, 24 Jun 2025 14:41:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 6/6] arm64: dts: ti: Add eMMC support for AM62D
To: Bryan Brattlof <bb@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-7-p-bhagat@ti.com>
 <20250623142859.fankjmvhdo2bxjgd@bryanbrattlof.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250623142859.fankjmvhdo2bxjgd@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bryan,


On 23/06/25 19:58, Bryan Brattlof wrote:
> On June 23, 2025 thus sayeth Paresh Bhagat:
>> Add the necessary device tree node for eMMC controller along with the
>> required pinmux configuration.
>>
> Could this be squashed in 4/6?


Yep will do


>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 27 ++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> index c98e4c98c956..5ceecdd68b3f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> @@ -20,6 +20,7 @@ aliases {
>>   		serial0 = &wkup_uart0;
>>   		serial1 = &mcu_uart0;
>>   		serial2 = &main_uart0;
>> +		mmc0 = &sdhci0;
>>   		mmc1 = &sdhci1;
>>   		rtc0 = &wkup_rtc0;
>>   		ethernet0 = &cpsw_port1;
>> @@ -226,6 +227,22 @@ AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
>>   		>;
>>   	};
>>   
>> +	main_mmc0_pins_default: main-mmc0-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
>> +			AM62DX_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB7) MMC0_CLK */
>> +			AM62DX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
>> +			AM62DX_IOPAD(0x0210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
>> +			AM62DX_IOPAD(0x020c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */
>> +			AM62DX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (AA7) MMC0_DAT3 */
>> +			AM62DX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (Y8) MMC0_DAT4 */
>> +			AM62DX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
>> +			AM62DX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
>> +			AM62DX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>>   	main_mmc1_pins_default: main-mmc1-default-pins {
>>   		pinctrl-single,pins = <
>>   			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
>> @@ -397,6 +414,16 @@ &main_i2c2 {
>>   	clock-frequency = <400000>;
>>   };
>>   
>> +&sdhci0 {
>> +	/* eMMC */
>> +	bootph-all;
>> +	status = "okay";
>> +	non-removable;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&main_mmc0_pins_default>;
>> +	disable-wp;
>> +};
> Make sure we follow the ordering of these properties:
>
>      https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node


Will fix this. Thanks


>
>> +
>>   &sdhci1 {
>>   	/* SD/MMC */
>>   	status = "okay";
>> -- 
>> 2.34.1
>>
