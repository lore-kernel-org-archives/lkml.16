Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B783594E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569637; cv=none; b=Zp9gDCG81nOr0K4z4TG2ewmjMKWn432Y7dqIIS9fX1/O1v+0CcOXC7BIIeuEE5CV6T5k7Pwmd6ql3TzsUsOAQlbLn4WaWvwGpP0Agnzy09+GCumEH9becy57MTzw0F/+H6IoCpSbJNnsbWgqz5Gp8c5Z6mQABoZS2h3fY+fd/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569637; c=relaxed/simple;
	bh=gmagQvY/7iQcrSXu9U1CLTNG7h2yMjauLlFudyx3/5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EnqqVbZyIpJEO5G+b76Ega3M+a16kZBpe9dsLDRGRd4Fti2GOYpU8n1ZbZ6Hxw9lnA/hxcgPLg852T0yz4PUVVsuu6pS5y0jRCQDvIneyJZgv6N+xNNgsJKjTGnaKJKAAYwlphQBgw9EfnQDdzC4sm/OK0mtWAsHONXyru/cj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=m6gCXrGV; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m6gCXrGV"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513809302100923
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 02:00:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738569609;
	bh=QxFRnlijln6LpLDQ0tPnbH9A5kSxy0xKSlPFs9+Z2yU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=m6gCXrGV3vhW0T3SXmHSp5m/bAu0AsK4arsWivGAm8voQlocmezpFb7Vk+n1zFmZ4
	 rJ8usU2MqNV1eA9yXlnoxxncQuVcnoOYy70GWieTsnEhedRhEnnwTxpLf/EQ4ymThc
	 Wp3cpj5hBsAymitxxP4IRczTIO/AONwlw8BaCxt4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513808Vb032355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 02:00:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 02:00:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 02:00:08 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5137xxTM107055;
	Mon, 3 Feb 2025 02:00:00 -0600
Message-ID: <c49f1741-d03a-08f2-ddb1-3b0462a67790@ti.com>
Date: Mon, 3 Feb 2025 13:29:59 +0530
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
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <mripard@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <sakari.ailus@linux.intel.com>, <vigneshr@ti.com>,
        <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>, <r-donadkar@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <j-choudhary@ti.com>,
        <h-shenoy@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>
References: <20241230125319.941372-1-devarsht@ti.com>
 <gvqa3g7cv2di3je2q3xiojkzrfedlh2ugqrtnh5vagbtvo5w3a@a42vb32ds74s>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <gvqa3g7cv2di3je2q3xiojkzrfedlh2ugqrtnh5vagbtvo5w3a@a42vb32ds74s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,

On 30/12/24 19:12, Jai Luthra wrote:
> Hi Devarsh,
> 
> Thanks for the patch, must have been a fun debug :)
> 

Thanks for the review. Oh yeah indeed :).

<snip>
>> 1) PLL lockup and O_CMN_READY assertion can only happen after common state
>>    machine gets enabled, but driver was polling them before the common
>>    state machine was enabled. To fix this, add new function callbacks for
>>    polling on PLL lock and O_CMN_READY assertion and call them only after
>>    common state machine gets enabled.
>>
>> 2) The cadence DPHY IP registers (as described in J721E TRM [2]) has
>>    default reset values for register fields in some of the registers
>>    which were getting reset to 0 as driver was not preserving them and
>>    overwriting those bits to 0 while updating the registers thus impacting
>>    the overall PLL lockup time. For e.g. DPHY_TX_CMN0_CMN_DIG_TBIT2 has
>>    bits 1-8 used for PLL wait time calibrations with default value as 0x14h
>>    and DPHY_TX_CMN0_CMN_DIG_TBIT10 has bits 27-20 used for PWM Byteclock
>>    divider which is default set to 0x8. To avoid resetting these register
>>    bit-fields, perform read-modify-write while updating above registers.
> 
> IMHO these are separate changes, and thus should be separate patches, 
> even if they are both done to reduce the time spent in the wait loop.
> 
> Ideally first patch to fix (2) across the driver, checking if there are 
> any other registers with default values that are being overwritten.
> 
> And the second patch to fix (1)

Yes that sounds like a good idea indeed. Will fix this in V2 and re-spin.

Regards
Devarsh
