Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E40F23957D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600947; cv=none; b=D8R/AsuWTFBZs0bv77B++/uZAex2+i3EjApR3hi26yx9TZ3m9ycLhsJarFYKSJXw6H+O1DKRos7LEM3GyTataSEfphFOk/BtCOOciPu2osRxvSilbyTRyXRtxYhwkL5pJ894vUbpiFdaRZRoI/aQ4QZplye1UdhY6co2hiVKOZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600947; c=relaxed/simple;
	bh=Qys6J8PDiLhasTTX/Rv8L+IBTqtGpF6FBQOXsR9xULc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uNmP9QkA1V2qNMeC+frL4NmMQsMV5S6OvzVROzwWBDwRcl3HhPgc2hbbnGmbFPSIYd41FVsdPBBCvVR4OL3jGeiEssjqqr4WQqXIBx+sLfBxQpdxUP4t8zki6A5j93pXfonRoNjkOZqhg99ngeIzymspmocDaEVa1z4LNGbeREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W1P3ZIDm; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W1P3ZIDm"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532DZP2l3250588
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 08:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743600925;
	bh=ISpC0S/bifWyOLFGjqR1WFw8r/9cAgNMXnYHnloxEbA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W1P3ZIDmxQ37wf5L2VnsoRmvAZFk9FPK/urf7QxBA99vv6FyXdxBWVLcHsLU7JCLI
	 uEX3RQh7Fh0wkgdqrDkuFF6ntNHJUhIGrV6dAwac26FjY66GwCSwkhtsMu0oXCvYyN
	 au9+DUEx/J1nWoSvv9MnSiiWpLux59BLVFOmP9S4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532DZP5f029496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 08:35:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 08:35:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 08:35:25 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532DZLh4043983;
	Wed, 2 Apr 2025 08:35:22 -0500
Message-ID: <223da324-4de7-4e62-b001-ea89c4768a13@ti.com>
Date: Wed, 2 Apr 2025 19:05:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: cadence: cdns-dphy: Update calibration wait
 time for startup state machine
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <mripard@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250326152320.3835249-1-devarsht@ti.com>
 <20250326152320.3835249-3-devarsht@ti.com>
 <5465d2dd-d81a-4e33-b76f-cbbd3386c725@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <5465d2dd-d81a-4e33-b76f-cbbd3386c725@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi,

Thanks for the review.

On 02/04/25 17:12, Tomi Valkeinen wrote:
> Hi,
> 
> On 26/03/2025 17:23, Devarsh Thakkar wrote:
>> Use system characterized reset value specified in TRM [1] to program
>> calibration wait time which defines number of cycles to wait for after
>> startup state machine is in bandgap enable state.
>>
>> This fixes PLL lock timeout error faced while using RPi DSI Panel on TI's
>> AM62L and J721E SoC [2].
>>
>> [1] AM62P TRM (Section ):
>> https://www.ti.com/lit/pdf/spruj83
>>
>> [2]:
>> Link: https://gist.github.com/devarsht/89e4830e886774fcd50aa6e29cce3a79
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V2: Introduced this as as separate patch
>>
>>   drivers/phy/cadence/cdns-dphy.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/phy/cadence/cdns-dphy.c 
>> b/drivers/phy/cadence/cdns-dphy.c
>> index c4de9e4d3e93..11fbffe5aafd 100644
>> --- a/drivers/phy/cadence/cdns-dphy.c
>> +++ b/drivers/phy/cadence/cdns-dphy.c
>> @@ -30,6 +30,7 @@
>>   #define DPHY_CMN_SSM            DPHY_PMA_CMN(0x20)
>>   #define DPHY_CMN_SSM_EN            BIT(0)
>> +#define DPHY_CMN_SSM_CAL_WAIT_TIME    GENMASK(8, 1)
>>   #define DPHY_CMN_TX_MODE_EN        BIT(9)
>>   #define DPHY_CMN_PWM            DPHY_PMA_CMN(0x40)
>> @@ -405,6 +406,8 @@ static int cdns_dphy_configure(struct phy *phy, 
>> union phy_configure_opts *opts)
>>       reg = FIELD_PREP(DPHY_BAND_CFG_LEFT_BAND, band_ctrl) |
>>             FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
>>       writel(reg, dphy->regs + DPHY_BAND_CFG);
>> +    writel(FIELD_PREP(DPHY_CMN_SSM_CAL_WAIT_TIME, 0x14) | 
>> DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
>> +           dphy->regs + DPHY_CMN_SSM);
> 
> This sounds like a TI specific characterized value, but the function 
> here is a generic one. Also, is the value same for all TI SoCs? Or is it 
> per-soc?
> 

No this is not TI specific value. As mentioned in commit message, 0x14 
is the cadence characterized default value for calibration wait time 
which they put in as reset value in the IP (if you reset the IP you will 
see calibration wait time as 0x14) to be used by software for optimal 
initialization.

Regards
Devarsh
