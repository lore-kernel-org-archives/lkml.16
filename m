Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480CB221F1C;
	Wed, 11 Jun 2025 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749671517; cv=none; b=uz/SZrRUpkh2zVJh967zCmInm739kDY0MTyciAqbOvHUn3n6LrpM/CWZJXmpyIY9j6lJe5O8JZCtz9Owjo7xgAjbxDOWMUM5w+ZeB73OKOHgtRO85XBIYbB14x1t0TAd60tBuTJcYDQMLZzU9r6hpvNRiLswW8Tk2dpTPY1imUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749671517; c=relaxed/simple;
	bh=0JxLNWRlX6k+uwatmqej4dYDRJCNBxE+haXmVURsNd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E9zUgDeZPqPfAQWm8EejMXHxN7EqtbTyevmMMNoRrxhZl/B9k5nybudcRi++ooQpr7P/Zt+RsdVmSpt0HrHwZlfKc9h89Icn29+Z1+CBx+zSt22+D7kToww8T7Sc0UOwwuXE7EP8NYZPUxbFAcDU1q/TEpZWfx4aEs3qXhrTJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zrmGE8V/; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zrmGE8V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671513; x=1781207513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0JxLNWRlX6k+uwatmqej4dYDRJCNBxE+haXmVURsNd0=;
  b=zrmGE8V/viznWBjRaVCW7EXc4JXs6uPztzNTiM213L7V12dHP888hvxa
   2jFxJ764o0NwXoUr1/OxRNXssP2zg4PW9EEV7nl7o2W+gYAnNDH8DPzcS
   ANctnnwJFB0aMelamjpAO+g5yFTakIllfvA+Q+DJeCj29dIHf3slcBXbd
   jsHQ/NSd/XhLFkWZLd3nDUTFgp9WEbLmYqpB1UJLtU7v903ZUcySNbjMg
   e2qd5jdgeIMnrLTbz6gb2dabloxg8omxJPorRSW4t7ZhauDzJqjd/6Mbo
   AowfRSc2LnFcPZnlGB72s/Hz0x3AjhQFXbmALHbZXNc5K2V4v2U63Mt/Z
   w==;
X-CSE-ConnectionGUID: PFE2adCJQrWAEgiYnjIERA==
X-CSE-MsgGUID: 5eHzcbFMTH+pyjY0H6lqDQ==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:51:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:51:21 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 11 Jun 2025 12:51:21 -0700
Message-ID: <5373558c-d075-4a35-a941-623e385cdc22@microchip.com>
Date: Wed, 11 Jun 2025 12:51:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: microchip: sama7d65: Add clock name
 property
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
 <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
 <dc0c2777-ed5b-4729-8ae3-6563d8996e2e@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <dc0c2777-ed5b-4729-8ae3-6563d8996e2e@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 6/7/25 04:57, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 23.05.2025 23:24, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> Add clock-output-names to the xtal nodes, so the driver can correctly
>> register the main and slow xtal.
>>
>> This fixes the issue of the SoC clock driver not being able to find
>> the main xtal and slow xtal correctly causing a bad clock tree.
>>
>> Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
> 
> Can you please prepare a similar fix for sam9x7. It is also affected by
> this, right?
The driver looks for the xtal differently in the sam9x75 than in the
SAMA7 clock drivers, so it is not immediately affected. But I will add a
sam9x7 in the v2 of the patch since in the future it will be needed.

Thank you,
Ryan
> 
> Thank you,
> Claudiu
> 
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> index b6710ccd4c36..7b1dd28a2cfa 100644
>> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> @@ -38,11 +38,13 @@ cpu0: cpu@0 {
>>       clocks {
>>               main_xtal: clock-mainxtal {
>>                       compatible = "fixed-clock";
>> +                     clock-output-names = "main_xtal";
>>                       #clock-cells = <0>;
>>               };
>>
>>               slow_xtal: clock-slowxtal {
>>                       compatible = "fixed-clock";
>> +                     clock-output-names = "slow_xtal";
>>                       #clock-cells = <0>;
>>               };
>>       };
> 

