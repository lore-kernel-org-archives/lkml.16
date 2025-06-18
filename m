Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213DA28153D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238643; cv=none; b=azL3THnsaHpgqINVT1mFlh0LL3ONX6RzE35/ubG5ncc6mO1rm8uvERSN09taZlHDu1clfrM/IFuN++Dm0SoZGlvk3bjTFVA3dvM4b077c3zKQmMM1loicDczp0bxT6AGnw3Qy2FQp2Prn7co8ZR+dlkg87LX0VE1vB1W29jP6E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238643; c=relaxed/simple;
	bh=aEgKfrPrrjMj6t/ipZa1xavX/WMJ6M7ayyrMUoR/xrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nag2uA+2DbtFeYDCAPM4sArhZAeEWmeHgCifX/ZTe7CeRtGWTn8RXxm6CXkK9hbfj5uwFXWDHHWqRlmxsMCgqfsRHnLJoO5FYLAyAv5DedtD8GVZeFmG4o0EVRmvjx0Iiy+JU3lYD4D6D+vpFKA3y/Qs9ZTrvmTW0LA5IHwLGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=N07rdsTS; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N07rdsTS"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55I9MEfN198307;
	Wed, 18 Jun 2025 04:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750238534;
	bh=1LSfhMfagWSAA2dImG8G5AnPQY89RbViRu826F453ak=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N07rdsTSUsg6iBtvzWLHjvurhXqdQbAQHghXSB/YUKrJni01F6UGOuwEy9k1eiUtn
	 /iz3+62tz8jTcX9UP+/3DhLz2e6SF+/Vi6Z3jl+7GeI6knAbmnFQcG8+fdnV1sUJXb
	 KXzBqgYDnLZbjfGnP4txOeoOOEAh37FpB+gzA+ZY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55I9MDfD2619355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 04:22:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 04:22:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 04:22:13 -0500
Received: from [172.24.227.143] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.143])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55I9M90f3235850;
	Wed, 18 Jun 2025 04:22:10 -0500
Message-ID: <d0854272-fe5e-4977-8526-03a980b348f3@ti.com>
Date: Wed, 18 Jun 2025 14:52:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
To: <jyri.sarha@iki.fi>, <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>
References: <20250618075804.139844-1-j-choudhary@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250618075804.139844-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 18/06/25 13:28, Jayesh Choudhary wrote:
> TIDSS hardware by itself does not have variable max_pclk for each VP.
> Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
> devices uses "ultra-light" version where each VP supports a max of
> 300MHz whereas J7* devices uses TIDSS where all VP can support a
> max pclk of 600MHz.
> The limitation that has been modeled till now comes from the clock
> (PLL can only be programmed to a particular max value). Due to this
> we end up using different compatible for each SoC when the clocking
> architecture changes for VPs, even when the hardware is essentially
> the same.
> max_pclk cannot be entirely removed since the display controller
> should tell if a particular mode clock can be supported or not in crtc's
> "mode_valid()" call. So remove "max_pclk_khz" from the static display
> feat and add it to "tidss_device" structure which would be modified in
> runtime. In mode_valid() call, check if a best frequency match for mode
> clock can be found or not using "clk_round_rate()". Based on that,
> propagate "max_pclk" and check max_clk again only if the requested mode
> clock is greater than saved value. (As the preferred display mode is
> usually the max resolution, driver ends up checking the maximum clock
> the first time itself which is used in subsequent checks)
> Since TIDSS display controller provides clock tolerance of 5%, we use
> this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
> before it is called.
> 
> This will make the existing compatibles reusable.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> 
> Test log on TI's J784S4 SoC with a couple of downstream patches
> to integrate DSI support on one of the video ports:
> <https://gist.github.com/Jayesh2000/ad4ab87028740efa60e5eb83fb892097>
> 

Hello All,

Just noticed that the downstream patches that I used for DSI for testing
were applied before this patch in my tree due to which this patch does
not apply cleanly on the linux-next tree.

Apologies for that. I am rolling v2 ASAP.

Jayesh

>  From the logs, we can see that for CLK ID 218 (DSS), we do not have to
> call sci_clk_determine_rate() multiple times. So there is very little
> overhead of this call even with multiple mode_valid() called during
> display run.
>  From weston-simple-egl application, I have seen that there is no frame
> drop or performance impact.
> 
> Once this patch gets in, I will send patches for AM62P and J722S DSS
> support.
> 
>   drivers/gpu/drm/tidss/tidss_dispc.c | 76 ++++++++++++-----------------
>   drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>   drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
>   3 files changed, 34 insertions(+), 45 deletions(-)
> 

[...]
