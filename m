Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BD21D3E4;
	Thu, 19 Jun 2025 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329589; cv=none; b=j2VjOcRHJDnedgtN0htyj5zDJr9o7PjCce/lrN9usSGg85bGZ3rZB5L4o6dvddT1MSoFvrLEVbTuzCDmvRej8WH/Scy9IcdoWCL84TNqXA0Tw2YbBZylicifb6urMPOv8S3+W0+E9R//ln1mCZB0vrFQl5pVlyohF5cVqg97dQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329589; c=relaxed/simple;
	bh=DMAtv+adek9drvhyTukAZ0+GBN9EpBhmKsZ/5dLozBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BSVROdRlNsms4ZI3ZVjRXlpesVVEKXt4/KdKg/YgAptDmBl+XGFxs5p6uuxFz1sgUrmSvaXqbPkBT0mraXwDeUwP6Ot8zG/cb6JpmGcFqKqfqvrDGKlVk4I9hz0XW6eB+LnJc3rxIbOxsQ5sOg+XqlOL7Tt7SLN1sS40giiokds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=faya4tNl; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="faya4tNl"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55JAdSQd588824;
	Thu, 19 Jun 2025 05:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750329568;
	bh=tlRjm8eym2T9Hx/fyDaiY5Go0jYo5ZoRNES0P1c6pcM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=faya4tNlxHcgR0iN7NSGved1dittEmBomwKRYY1tsZ1dX7O2cqrTRP2yaLYKF4rv/
	 8Vi0asnBam87XcKjMUq/lMIfgzQRY2vSH5gxDEAsK5Nk7btALkowj7KSXRgVuknjjs
	 leX7ONT0oDAqw0KEZJ2CQvdFXnqSnD/rqrdezWm0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55JAdRbU3819668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 05:39:28 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 05:39:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 05:39:27 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55JAdN4r1220846;
	Thu, 19 Jun 2025 05:39:24 -0500
Message-ID: <b446e04f-0c4a-4cce-8330-0b7bc1e330dc@ti.com>
Date: Thu, 19 Jun 2025 16:09:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining
 SERDES instances
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <srk@ti.com>,
        Hrushikesh Salunke <h-salunke@ti.com>
References: <20250609115921.2380611-1-h-salunke@ti.com>
 <ec2c7fab-6f4d-4163-90a9-16dddec80adb@ti.com>
 <afb54fe8-a271-4074-8249-669219954c4c@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <afb54fe8-a271-4074-8249-669219954c4c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 19/06/25 11:35, Siddharth Vadapalli wrote:
> On Wed, Jun 11, 2025 at 06:23:24PM +0530, Siddharth Vadapalli wrote:
>> On Mon, Jun 09, 2025 at 05:29:21PM +0530, Hrushikesh Salunke wrote:
>>> In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
>>> "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
>>> property. But "idle-states" is defined only for the lanes of first two
>>> SERDES instances. For completeness, set the "idle-states" of lanes of
>>> remaining SERDES instances to a default value of "unused".
>>>
>>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>>
>> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> I failed to notice that this change will introduce a regression on
> AM69-SK for CPSW AND Display which rely on the SERDES Lane Mapping for
> SERDES2 and SERDES4 being at their reset value of "zero". This patch
> should be fixed by updating it to the following:
> 
> 	<J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
> 	<J784S4_SERDES2_LANE2_QSGMII_LANE1>, <J784S4_SERDES2_LANE3_QSGMII_LANE2>,
> 	<J784S4_SERDES4_LANE0_EDP_LANE0>, <J784S4_SERDES4_LANE1_EDP_LANE1>,
> 	<J784S4_SERDES4_LANE2_EDP_LANE2>, <J784S4_SERDES4_LANE3_EDP_LANE3>;
> 
> 

Thanks for noticing this Siddharth. I will correct this and post the v2
for this patch.

Regards,
Hrushikesh
