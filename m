Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E658E229B1E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432148; cv=none; b=BSTZ771YLZFod/rvXDJih6njfiToIuQUmqUZv9XJPmM8g/u6RrEnxeV9Nhq/x3wyy046T/3V0FnlyMvip2z5NJa3iOpnKN39po441/ttJJHCy1RPQ7Pk7DEh/8QQFTvm6aBOPQFLAvBcMx7b235n4+/UvvPVHVI+vuN0Hy+Ta9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432148; c=relaxed/simple;
	bh=F/BiSxzEIobJKVtCYq2W/zLPyDXI+3mlkwA8JPc6Afo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=kMxV6VYa49DMUpwsEg3OWxAYtCcFPVyuK3EJQb+yUJ5figk2EkZ5Dfd1It87rI2Cc7QTaOBVWJBcKF5WNIwKsD/2e3MbTIqbJmxHSujW4g+ayL/LqS8IOMs5aHIX8ARtWzNCL8YWyWuIpx5a8PpdOOBIEZ/pT7DZAgNvVKlUWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PV08E54/; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PV08E54/"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55KF8gh8958970;
	Fri, 20 Jun 2025 10:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750432122;
	bh=L5yI6SdnJQ9HkMn9dVOfOYCgRSMMg1ztVuir82mh09M=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=PV08E54/RDU3WvY7bWAHEQp/udbpEESBWxe9OmjvhmZY12e4D+BoZA/+UFdBedDSE
	 JzJCFzoTgtjE4miWEVXQMh63KrjfzreujoFDZ81TDmTm1fjU5n2ODd0215jALQnOB4
	 nHPEqmKFjOFoFuTXJl4prl8euuhyiaIH3YBGAp/w=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55KF8gQn783061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 20 Jun 2025 10:08:42 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 20
 Jun 2025 10:08:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 20 Jun 2025 10:08:41 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55KF8bQX3142100;
	Fri, 20 Jun 2025 10:08:38 -0500
Message-ID: <e9096b46-3661-40c5-a67f-7f09f838093b@ti.com>
Date: Fri, 20 Jun 2025 20:38:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: cadence: cdns-dphy: Fix PLL lock and
 O_CMN_READY polling
From: Devarsh Thakkar <devarsht@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <mripard@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250502033451.2291330-1-devarsht@ti.com>
 <20250502033451.2291330-2-devarsht@ti.com>
 <b94facde-7591-41de-bc6f-b26cb46e100a@ideasonboard.com>
 <2237e887-eb0c-406d-a528-a135d62fbb0d@ti.com>
Content-Language: en-US
In-Reply-To: <2237e887-eb0c-406d-a528-a135d62fbb0d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello,

On 20/06/25 20:05, Devarsh Thakkar wrote:
> Hi Tomi,
> 
> Thanks for the review.
> 
> On 26/05/25 16:29, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 02/05/2025 06:34, Devarsh Thakkar wrote:
>>> PLL lockup and O_CMN_READY assertion can only happen after common state
>>> machine gets enabled (by programming DPHY_CMN_SSM register), but 
>>> driver was
>>> polling them before the common state machine was enabled. To fix this :
>>>
>>> - Add new function callbacks for polling on PLL lock and O_CMN_READY
>>>    assertion.
>>> - As state machine and clocks get enabled in power_on callback only, 
>>> move
>>>    the clock related programming part from configure callback to 
>>> power_on
>>>    callback and poll for the PLL lockup and O_CMN_READY assertion after
>>>    state machine gets enabled.
>>> - The configure callback only saves the PLL configuration received 
>>> from the
>>>    client driver which will be applied later on in power_on callback.
>>> - Add checks to ensure configure is called before power_on and state
>>>    machine is in disabled state before power_on callback is called.
>>> - Disable state machine in power_off so that client driver can
>>>    re-configure the PLL by following up a power_off, configure, power_on
>>>    sequence.
>>
>> Is the DPHY & PLL documented in the TRM somewhere?
>>
> 
> I had got this information from cadence support. But I think it is also 
> documented in J721E TRM [1]. DPHY Tx startup sequence is same as DPHY Tx 
> and there is a initialization diagram for the same in J721E TRM [1] 
> referenced at 12.7.2.4.1.2.1 Start-up Sequence Timing Diagram. It shows 
> O_CMN_READY polling at the end after common configuration pin setup and 
> Table 12-1533. Common Configuration-Related Setup mentions state machine 
> enable part under the common configuration setup which happens before 
> the polling. And the observations with this patch do sync with 
> understanding as we see PLL locking up faster without any timeout which 
> was the case before this patch.
> 
>> I just find the sequence a bit odd. For example, you wait for the PLL to
>> lock, and after that, you enable the PLL ref clock. Maybe I'm missing
>> something here, but... that should not work.
> 
> I think it's my bad, but it works somehow. But it makes sense to enable 
> the clock before we start polling for PLL lock, so will update it in 
> next revision.
> 

Sorry, had missed to add the reference :

[1]: https://www.ti.com/lit/zip/spruil1

Regards
Devarsh

>>
>>   Tomi
>>
> Regards
> Devarsh
