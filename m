Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C291DA5F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600627; cv=none; b=dxI1Ou0YL6vQBf0IEfuPyXIgSJSuhPpyL9F+bcdp9MzatAT/nRb92SfdjZS0+cJVabqMLHn+zjieSQhNk/H6F0Hd2vkVQfXKMoKPxBbGHSi8eduE58jKnFELIKTcQd9id+l3a1/aPGTKhOYfaVvSxlGffcrrQ7an4mySepL4cw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600627; c=relaxed/simple;
	bh=1MpLOq+qIa4fCXmuRmuDZ3h0bE+gW4GgdU6C2uWGlTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eyrZaO6kk6T81wckT2ZbCX/x3lUPujFPmFNwY4tDCvDwcTTq9XuFa1Za7qlLew/kqbeI6lcgjfU8ImmbdLCnea/Ca9MaV3N7onkAbB0+nEXKBIe9oJmk2IF8qD68SuowZY/+M5bI4cFHAswZQWT/w/aLDsT8ML7riO8hIBGDo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ULmtb7RZ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ULmtb7RZ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532DU4Qf3412145
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Apr 2025 08:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743600604;
	bh=Q6+HD7Ng+Z5XT/gJSd8nUlxStDa5mkVhPgGnNl3TOlc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ULmtb7RZ3AUji+DCJvCm67NBZfZrXV4C7xToHr4H5UoutKdsW1btkzgR+wqam9nNU
	 9ek7jMZ1Rh975TPTW7R6a/05Rs+OHJYaT1g9NAFv/CTu7Y41cR1vLwbLtvYOG4CFDt
	 J2rOFQdV203tNiR7fHtEciO9fb5j2sN05v7jW9/U=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532DU3WX090201;
	Wed, 2 Apr 2025 08:30:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 08:30:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 08:30:03 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532DTxC0056057;
	Wed, 2 Apr 2025 08:29:59 -0500
Message-ID: <e7cff4f9-da46-4352-8900-3eddae9345a7@ti.com>
Date: Wed, 2 Apr 2025 18:59:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: cadence: cdns-dphy: Fix PLL lock and
 O_CMN_READY polling
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <mripard@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>
References: <20250326152320.3835249-1-devarsht@ti.com>
 <20250326152320.3835249-2-devarsht@ti.com>
 <cddb8c30-c614-4fae-9cbd-f5776f930165@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <cddb8c30-c614-4fae-9cbd-f5776f930165@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi,

Thanks for the review.

On 02/04/25 17:25, Tomi Valkeinen wrote:
<snip>
>>   /*
>>    * This is the reference implementation of DPHY hooks. Specific 
>> integration of
>>    * this IP may have to re-implement some of them depending on how 
>> they decided
>> @@ -278,6 +309,8 @@ static const struct cdns_dphy_ops j721e_dphy_ops = {
>>       .get_wakeup_time_ns = cdns_dphy_j721e_get_wakeup_time_ns,
>>       .set_pll_cfg = cdns_dphy_j721e_set_pll_cfg,
>>       .set_psm_div = cdns_dphy_j721e_set_psm_div,
>> +    .wait_for_pll_lock = cdns_dphy_j721e_wait_for_pll_lock,
>> +    .wait_for_cmn_ready = cdns_dphy_j721e_wait_for_cmn_ready,
>>   };
>>   static int cdns_dphy_config_from_opts(struct phy *phy,
>> @@ -373,6 +406,14 @@ static int cdns_dphy_configure(struct phy *phy, 
>> union phy_configure_opts *opts)
>>             FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
>>       writel(reg, dphy->regs + DPHY_BAND_CFG);
>> +    ret = cdns_dphy_wait_for_pll_lock(dphy);
>> +    if (ret)
>> +        dev_err(&dphy->phy->dev, "Failed to lock PLL with err %d\n", 
>> ret);
>> +
>> +    ret = cdns_dphy_wait_for_cmn_ready(dphy);
>> +    if (ret)
>> +        dev_err(&dphy->phy->dev, "O_CMN_READY signal failed to assert 
>> with err %d\n", ret);
>> +
> 
> Shouldn't these return an error? Or what's the reason these are ok (and 
> if so, should the prints be dev_dbg?)
> 

Yes, I think it would be better if we can return error and fail if 
timeout happen. I will fix it in next revision.

Regards
Devarsh

>   Tomi
> 
>>       return 0;
>>   }
> 
