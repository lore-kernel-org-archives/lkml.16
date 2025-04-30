Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7E720D51A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998644; cv=none; b=WtmI+UR6JOVhx2B11QSRO5Ckjku6Lbt/17dhstQ4aWmASZ58hby/FQUvZzR4ztbm+ypAz5mRWmbOe1mRABVLdnGk1oNHpsbrOXn2sg7MuVyjTCIc0MTC9QS3EbY4WN7NJUEDiixvouHrnnKP/1GkgcP6v1ztzLyW4qkKAWS1VyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998644; c=relaxed/simple;
	bh=ow+UrtJMq+mFM4H8CkPfnjMRvkSHOUqTBDVHPIWMwn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DNmUgloeOUbCz0IB8rgclke8iGJF9T9gk6y/lvY8/PnmYA0JbZx0REbijEWUnxsL69VIavEbaYfw2oXbE053WPKtevWMQIgxx5DEQ1mTtvZb6Z6ZRnpgzX1gKUs4E+eSTASyoTIB8eWFG5mUDJo3niHezoQfQDOu5+3+2o9uGTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mCH4ibZx; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mCH4ibZx"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53U7asTv3301796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 02:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745998614;
	bh=2bL+38tFsbV1m5JmQRtKkmONUu/gQUIlM2ZViEyOqs8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mCH4ibZxwgBfGpBM9wctCNMseoJrmnwF9mzit8EIcg9k2V8SaF2sc8XMc9QEiK27R
	 J6uZCZqAlTH7/0sFpHWXqGJh396hGDL4jsw6kXLriKX+DisKf8OvM1ImNu8fQm4fZB
	 Dcq5nUL+nSdrdaFJk5QQcEJtwPE9tDkIFZarRs80=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53U7as1O015647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Apr 2025 02:36:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Apr 2025 02:36:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Apr 2025 02:36:54 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53U7aogn086842;
	Wed, 30 Apr 2025 02:36:51 -0500
Message-ID: <31529961-09b9-4855-b30a-45991508ad95@ti.com>
Date: Wed, 30 Apr 2025 13:06:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi,

On 02/04/25 17:12, Tomi Valkeinen wrote:
> Hi,
> 
Thanks for the review.

> On 26/03/2025 17:23, Devarsh Thakkar wrote:
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

I see same characterized value for calibration wait time for each TI SoC
but as discussed offline, I will use read-modify-write to preserve the
reset value which was characterized for the corresponding platform so
that if any other platform is using a different characterized reset
value for calibration wait time, it would handle that case as well.

Regards
Devarsh
