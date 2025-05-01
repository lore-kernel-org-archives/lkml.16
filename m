Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B71EA7C6;
	Thu,  1 May 2025 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746111701; cv=none; b=jCRpDBitf6v4UrHRdoO5yxgLNRxrbLFzWz53IvkXJNdstTz0TPZlVhQmh8z3bUlVzyw6S6Ly+iHYX4aJ7h/U0nGeLtE5F1a5MYNtHsaoYZMSzq4LA53bguCG3uR2Z0hvCQkx4WFmfFIu59HwoBCP7o3RBsqqH9u/QmeCjpzg2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746111701; c=relaxed/simple;
	bh=FcT5OJIncV+3YTLlIknloH4b7NqZ8CJNvPmY7U77tYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oxpIh4PvY4sPtqvH8jPMIlzWvY93RyqyNXt1ybFpfYhyd7Ti4Gme/YJBBLnR44tbDYc60GJB6GKzwZEbhkyxlrcP/IR1oye5eD1wuVszcMfqnErP4K2lzDR8YSRmIdoWVONFtqx8FvmAFgRh2K//TAP0jMbZzAqVuaNzEL2dRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=DvAUoabe; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="DvAUoabe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746111699; x=1777647699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FcT5OJIncV+3YTLlIknloH4b7NqZ8CJNvPmY7U77tYk=;
  b=DvAUoabeN4yNkLlpapaBMNBqdB2kfSenKuxuTTDaG18v7OD7yH+9XbeG
   FdhMTXlUZ88BeYdkTT7ZOu69vyWI+SCKisSGi3sHEI4gD124DHJqhmgZ+
   Y5FLwM9YGljdkmF6kAv7On1l98NnO9mQG16WTltJiMD7CRoOJ6GSjW0Ue
   tTenGmBXL99xXbiGfjJhtgn/PjpY+d2WvcaglIc0mcdgP+J5EYnD6IltT
   N/KxeiTQuQ0W6NurFPHldl6yYN2pkiZ8UlkrXKqwf5pZRc7kJk0ihSGya
   D5JRNB3x2OV2LuEbiZMd0zag/e7IISe3+QLyO+Nt6YDjdkzjKDitjPnQJ
   g==;
X-CSE-ConnectionGUID: rf2P6i5OR06cfakkSU8wBw==
X-CSE-MsgGUID: GycyurudQMeXlU/ye7iK7Q==
X-IronPort-AV: E=Sophos;i="6.15,254,1739862000"; 
   d="scan'208";a="208620796"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 May 2025 08:01:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 1 May 2025 08:01:28 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 1 May 2025 08:01:27 -0700
Message-ID: <e85fe2a4-ea86-4525-9b7a-1d1cabf743f5@microchip.com>
Date: Thu, 1 May 2025 08:01:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <mturquette@baylibre.com>
CC: <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
 <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
 <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 4/26/25 06:35, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 25.03.2025 17:55, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> The main_xtal clk_hw struct is not passed into parent_data.hw causing an
>> issue with main_osc parent.
> 
> Can you please describe the issue?
> 
>> Passing the main_xtal struct into the
>> parent_data struct will ensure the correct parent structure.
>>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  drivers/clk/at91/sama7d65.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
>> index a5d40df8b2f2..08306261c9c7 100644
>> --- a/drivers/clk/at91/sama7d65.c
>> +++ b/drivers/clk/at91/sama7d65.c
>> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>>
>>       parent_data.name = main_xtal_name;
>>       parent_data.fw_name = main_xtal_name;
>> +     parent_data.hw = main_xtal_hw;
> 
> I think, from time to time, you can still hit some random failure as the
> parent_data.index is still not initialized. I think the problem may be
> solved by doing something like:
> 
> -       static struct clk_parent_data parent_data;
> +       static struct clk_parent_data parent_data = {0};
> 
> Can you please check with this?
Yes I will check on this and test it.

Best,
Ryan
> 
> Thank you,
> Claudiu
> 
> 
>>       main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>>                                                &parent_data, bypass);
>>       if (IS_ERR(main_osc_hw))
> 

