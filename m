Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799E2980D3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432045; cv=none; b=QjkoYuS3fm8i1k+eYyYrIyJRXTsB9TK8goV+xZUX9buEh1hQSqUK+pd4f7HZ8pHuesN5SSND501fdEbncL7LYBm5d2hhrNUWYbloer2NPVfX5X1QCNbiJYGbybc++afuWzBYwXTS9SUnAH5H0i0TNlQ6bRveoO06fJqIz35PbFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432045; c=relaxed/simple;
	bh=WFzZ8/hAlrg7KOFutWt4QXV5blgpjPBkAIpDmUErhKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fYcmHK+svKUHHf901zV+fiTG06MOFkIsGyBATuv+mvkx8nsa9dMw+RgQhlg4/m7q+67T29OmPb6NG+iDhF2k7WKS6eBFftdhjG2Y+XdJb18f66C2EDZTNfdI8KGSsUQadpOfV1hwoDsoANLXhsJqy3W76PA2USbnNaGhxaYE8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yCfDjnxB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yCfDjnxB"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55KF75Ib692041;
	Fri, 20 Jun 2025 10:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750432025;
	bh=Sr+ph/pByqHoPvRkp+egq+sXgmbRpPQXF5FzTyrqF0U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yCfDjnxBEoR0o3YuAHucdWr3dd3utGjNT0ewvKkPJ2TC+X/3P9c0PWomepFyfmMR4
	 IgdM0saz9TcRuQGGsWsTZ4YmAWKdRFxP0QvM+FcAu89fc0c60CdrPjuDX7j8df1pUz
	 oUYJJmuSe2C5lJgtJBMUd5AdzLhPgrFzCMl4Vrn8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55KF75pZ1878626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 20 Jun 2025 10:07:05 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 20
 Jun 2025 10:07:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 20 Jun 2025 10:07:05 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55KF71PA3387048;
	Fri, 20 Jun 2025 10:07:01 -0500
Message-ID: <e19bb1d6-307c-4ed4-b353-5d2e0668f6fb@ti.com>
Date: Fri, 20 Jun 2025 20:37:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: cadence: cdns-dphy: Fix PLL lock and
 O_CMN_READY polling
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <mripard@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250502033451.2291330-1-devarsht@ti.com>
 <20250502033451.2291330-2-devarsht@ti.com>
 <218ba1a0-068d-4bb2-bba2-2739afa7f470@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <218ba1a0-068d-4bb2-bba2-2739afa7f470@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 18/06/25 15:31, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/05/2025 06:34, Devarsh Thakkar wrote:
>> PLL lockup and O_CMN_READY assertion can only happen after common state
>> machine gets enabled (by programming DPHY_CMN_SSM register), but driver was
>> polling them before the common state machine was enabled. To fix this :
>>
>> - Add new function callbacks for polling on PLL lock and O_CMN_READY
>>    assertion.
>> - As state machine and clocks get enabled in power_on callback only, move
>>    the clock related programming part from configure callback to power_on
>>    callback and poll for the PLL lockup and O_CMN_READY assertion after
>>    state machine gets enabled.
>> - The configure callback only saves the PLL configuration received from the
>>    client driver which will be applied later on in power_on callback.
>> - Add checks to ensure configure is called before power_on and state
>>    machine is in disabled state before power_on callback is called.
>> - Disable state machine in power_off so that client driver can
>>    re-configure the PLL by following up a power_off, configure, power_on
>>    sequence.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V3:
>> - Move out clock programming logic to power_on as PLL polling and enable
>>    can happen only after SSM enable
>> - Disable state machine on power off
>>
>> V2:
>> - Return error code on polling timeout
>> - Moved out calibration logic to separate patch
>>
>>   drivers/phy/cadence/cdns-dphy.c | 109 +++++++++++++++++++++++++-------
>>   1 file changed, 85 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
>> index ed87a3970f83..a94109a63788 100644
>> --- a/drivers/phy/cadence/cdns-dphy.c
>> +++ b/drivers/phy/cadence/cdns-dphy.c
>> @@ -79,6 +79,7 @@ struct cdns_dphy_cfg {
>>   	u8 pll_ipdiv;
>>   	u8 pll_opdiv;
>>   	u16 pll_fbdiv;
>> +	u64 hs_clk_rate;
> 
> This has a minor conflict with my cdns-dsi series, as I also add
> hs_clk_rate but as u32. Also, applying both serieses,
> cdns_dphy_config_from_opts() becomes odd as the hs_clk_rate will be
> assigned back and forth between opts and cfg. Can you check this?

Understood. I think after re-basing on top of your patch, I don't need 
to assign cfg->hs_clk_rate in cdns_dphy_config_from_opts since you 
already assigned it to realized clock value in 
cdns_dsi_get_dphy_pll_cfg. I can rebase on top of your series.


Regards
Devarsh
