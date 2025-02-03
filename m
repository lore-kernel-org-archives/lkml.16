Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5B2940F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572863; cv=none; b=JD9p5ajav0CI8TLiyYVsEh/m/Hxu5QXcC1ofH+FwsXCSV9Fy7imByafe8TvpDqiQef6vZ/aiIKwOEi8cqz/d6dXYfvvw9jMOQ1w5K7tU1wI49udAC5tPp035DgSHdJqHd2/3pjpiLfHR7T5d1eyu9u/kEk2p+dAXUyGEhLFeF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572863; c=relaxed/simple;
	bh=FQXErMb9+9uu4t1x3Yp13v6LB0lbyeSIdFUt1gLmk+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=urhyDV3lZQfltAiHOt0/kBcjF19QyF39yT94Z6YMYzX5e9edfcN/5lMSj6AnUZLgyH7JE2PSNoXeDg2CWyb7dgTy9i+Q2SfFzasQmbrKKasaEm4tksNoKsu3OPT2UQa+oB1648CtB593JBqgaYoxmH9zHQIzhPu9Ljo3v8Lt4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JVUM071F; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JVUM071F"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5138rtem2987207
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 02:53:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738572835;
	bh=h/uGUGzt7+mJ3CwBhXgxnoxyshAQovDxkoGYmZUziAU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JVUM071FNqkzh0wXZklCFaMxYYwr15bZpDwthXGdcpTEvp9sh7lNFouh1sii6iOwY
	 15P3BKVgKUn/7oPa89xdtrf4l/v9AQElIaLIMtkaahZ4/IJ84Pj+aEWhhBYb+lrqtu
	 /aFovwqal0PiVfVuX191fZJn9fOio5XNNIdi1484=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5138rtPt014226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 02:53:55 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 02:53:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 02:53:54 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5138roF7064092;
	Mon, 3 Feb 2025 02:53:50 -0600
Message-ID: <63585990-b670-2a8f-a450-6ade850d53a4@ti.com>
Date: Mon, 3 Feb 2025 14:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] phy: cadence: cdns-dphy: Fix PLL lock and common ready
 poll timeout
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <mripard@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <vigneshr@ti.com>,
        <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>, <r-donadkar@ti.com>,
        <j-choudhary@ti.com>, <h-shenoy@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>
References: <20241230125319.941372-1-devarsht@ti.com>
 <2cb9ff06-ca8d-4c15-a0bc-e30e065e720b@ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <2cb9ff06-ca8d-4c15-a0bc-e30e065e720b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi,

Thanks for the review.
On 06/01/25 14:25, Tomi Valkeinen wrote:

<snip>
>>                   const struct cdns_dphy_cfg *cfg);
>> +    void (*wait_for_pll_lock)(struct cdns_dphy *dphy);
>> +    void (*wait_for_cmn_ready)(struct cdns_dphy *dphy);
> 
> I think both of these should return an error code.
>

Yes I thought about this but did not see much benefit. Similar to other
cdns_dphy_ops, there is no error recovery/handling in case of timeout for
above two wait* functions. The implementer function can just print a dev_err
with timeout message as being done already. Also this maintains homogeneity
with existing cdns_dphy_ops such as set_pll_cfg which used void function as
return value.

>>       unsigned long (*get_wakeup_time_ns)(struct cdns_dphy *dphy);
>>   };
>>   @@ -191,6 +193,18 @@ static unsigned long
>> cdns_dphy_get_wakeup_time_ns(struct cdns_dphy *dphy)
>>       return dphy->ops->get_wakeup_time_ns(dphy);
>>   }
>>   +static void cdns_dphy_wait_for_pll_lock(struct cdns_dphy *dphy)
>> +{
>> +    if (dphy->ops->wait_for_pll_lock)
>> +        dphy->ops->wait_for_pll_lock(dphy);
>> +}
>> +
>> +static void cdns_dphy_wait_for_cmn_ready(struct cdns_dphy *dphy)
>> +{
>> +    if (dphy->ops->wait_for_cmn_ready)
>> +        dphy->ops->wait_for_cmn_ready(dphy);
>> +}
>> +
>>   static unsigned long cdns_dphy_ref_get_wakeup_time_ns(struct cdns_dphy *dphy)
>>   {
>>       /* Default wakeup time is 800 ns (in a simulated environment). */
>> @@ -212,7 +226,7 @@ static void cdns_dphy_ref_set_pll_cfg(struct cdns_dphy
>> *dphy,
>>       writel(DPHY_CMN_FBDIV_FROM_REG |
>>              DPHY_CMN_FBDIV_VAL(fbdiv_low, fbdiv_high),
>>              dphy->regs + DPHY_CMN_FBDIV);
>> -    writel(DPHY_CMN_PWM_HIGH(6) | DPHY_CMN_PWM_LOW(0x101) |
>> +    writel(readl(dphy->regs + DPHY_CMN_PWM) | DPHY_CMN_PWM_HIGH(6) |
>> DPHY_CMN_PWM_LOW(0x101) |
> 
> This, and the rest in the patch, is probably not a good idea. You just "or"
> the bit fields, without clearing the fields in the register. If the register
> default values contain ones (or maybe e.g. bootloader has set the register
> already), this might result in wrong value written.
> 
> Maybe add a helper to update bit fields, similar to regmap_update_bits(). Or
> read the current reg value to a local, modify there, and write back.
> 

Yes, but if we want to be totally agnostic to current state of register
assuming bootloader or some other entity has already updated some bits, then
it means that the reset values for some or all of the register bits may have
also been over-written. In that case read-modify-write be it with
regmap_update_bits or any other mechanism may not help either.

To handle this, I am thinking to use macros for default reset bits and use it
always to program concerned registers.

Regards
Devarsh
