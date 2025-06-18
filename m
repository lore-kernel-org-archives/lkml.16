Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FD38635D;
	Wed, 18 Jun 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234250; cv=none; b=QTJo24i+JAmpdSc1JvqqFsfKk/JwceHcZMn/xjjlxmBRVuoWJU6p64yO3dzwtaBaeMaVzkJo6EdqBx7LIuR37L11IA4tSlwVDseDkEMToGtPm7sH/9JBS0yayfLlUTRLH6iwVViO4cpnyUPPNtUJQg91sakgRJc/8DLCI7WFf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234250; c=relaxed/simple;
	bh=U3t1blzXw4sX6mismk2hqJWRI6VHrorVvBaxSbHqpD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O4w/3ZBuulfjsN7HlnyeSim1d9DkfxA8DS4DQl0lgL9Y54OlYuUqrqbTSkToNettUaOIiKM5oJy0nKk5jcMaef5BdhEw7sJupAiB2Pgv2QeTASQT/Fa+quRM7CvQq3O+aMg/52G9IjLKcBDTnUPMN9s2nemiBcTbNI3HwPCOVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nS+lvrQN; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nS+lvrQN"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55I8APoF246255;
	Wed, 18 Jun 2025 03:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750234225;
	bh=EkBJLXLtYiwNEWiqUOgCSgr+Gg10spFbCfTn2yX+wXY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nS+lvrQN4jYr+FrzqSrbjVoGCjmF0iyB03C51dVp9ToWiekFX8DMi/JQdIfLwS4jk
	 zfu4H52rEw3izfkoQn8+efyVhGiQ6abijD5/2wxQ4LjZpwzx8S9bgTz75eyXIDZ7w2
	 jR4Tmak8pvzjWgQbPG/YY4ASBdDOsgwsRZoyr9kg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55I8AP7k3738895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 03:10:25 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 03:10:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 03:10:25 -0500
Received: from [172.24.227.143] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.143])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55I8AM5u3139529;
	Wed, 18 Jun 2025 03:10:23 -0500
Message-ID: <92372da1-0417-48c3-a36d-ca20c946f07b@ti.com>
Date: Wed, 18 Jun 2025 13:40:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Add clk_determine_rate function call
To: Brian Masney <bmasney@redhat.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux@armlinux.org.uk>,
        <linux-clk@vger.kernel.org>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        Maxime
 Ripard <mripard@kernel.org>
References: <20250616103527.509999-1-j-choudhary@ti.com> <aFHKGvHlXP-cdC7d@x1>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <aFHKGvHlXP-cdC7d@x1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Brian,

On 18/06/25 01:33, Brian Masney wrote:
> On Mon, Jun 16, 2025 at 04:05:27PM +0530, Jayesh Choudhary wrote:
>> Add a function to determine if a particular rate can be set for a clock
>> with its argument being the clock and the desired rate so that it could
>> be exposed to other peripherals.
>> For example, the display controllers typically has to perform multiple
>> checks for supported display resolutions including those related to
>> clock rates. The controller has to check this way before it actually
>> enables the clock and has to do it multiple times (typically for each
>> mode), and therefore using the clk_set_rate when its not needed, does
>> not make sense.
>>
>> The driver does have "__clk_determine_rate()" but this cannot be used
>> by other subsystems because of the function arguments used.
>> "clk_hw" is not accessible to other peripherals due to clk and clk_core
>> structure definition in driver instead of include file, so we cannot use
>> already exisiting "__clk_determine_rate()" in other drivers.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> 
> Do you have a link to how this will be used within the DRM subsystem? If
> not, could you post a new series to include the user of this new API so
> that we can see specifically how it will be used.
> 
> Thanks,
> 
> Brian
> 

Based on the conversation in [1], this patch is no longer required.
This can be handled with preexisting functions.

[1]: 
https://lore.kernel.org/all/f2e54128-f7c1-4193-a511-13775559e261@ti.com/

Thanks and Warm Regards,
Jayesh
