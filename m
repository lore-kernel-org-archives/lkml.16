Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC6B660
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218540; cv=none; b=UzjlfP/7IYE2PSxT5SMGO8XfnK7crH91z2AsGcBg1lvxlZzfnNEZiswl5MMFcTSVsySUjty4avsMPycFeSu69UDM9NKzOZlv+ZwOxlFTFlqO9dawxGTA1HDu2uJNFO3Z6tOOwTdaPbYOcAeuwOQBTln9Q6Z6bh781Ibz2k8itOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218540; c=relaxed/simple;
	bh=XcLGtJuQLjmu19ceVrWTBUJgIKLh/knfwyJV2pa6tT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XAkN6yXWx2f6Rcy6GLlP0Jwq1XiB91BHb55j7RVrbEengxU2yIgmIzwE4x7IOh8QGy4/05dbRaBrAXP/lKHekxpSY4Y3vVaoIAuvM1Bi+WsF+WP6DJC3t+VrDRrjmVYgcO4yQx8EGvosVsacj7mt4N7i2CjwQgDmtCWHhColTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wt4qMB2D; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wt4qMB2D"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6SalO2255798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 00:28:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738218517;
	bh=stDkNPxvaXA5kM3k4ZKVJiRRENNzrABmzrqDFpS97qo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wt4qMB2DK3lk/uYgquHoNk0STrFtJ935abs1QEcLx5+BC0VmaGxqCg1te0I/PRM2V
	 jVrF+7YuqiDzl1ac9HwsZ0pHwjevGy4gS532nCShgP7ba6rJF7WgW7WH4RrC7vEo6s
	 8H6X/di+5HkuOIlIO3FBLyMF7lXLGKVqMcQRb15w=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6SaqN029475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jan 2025 00:28:36 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 00:28:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 00:28:36 -0600
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6SXpD062557;
	Thu, 30 Jan 2025 00:28:34 -0600
Message-ID: <178aecf4-b640-4dbd-841b-a8c43e74ece0@ti.com>
Date: Thu, 30 Jan 2025 11:58:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
To: Santhosh Kumar K <s-k6@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <krzk@kernel.org>, <p-mantena@ti.com>
References: <20250116035145.370734-1-s-k6@ti.com>
 <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 30/01/25 11:53, Santhosh Kumar K wrote:
> Hi, all,
> 
> On 16/01/25 09:21, Santhosh Kumar K wrote:
>> Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
>>
>> 1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
>>     J722S EVM, J742S2 EVM
>> 2. W25N01JW on AM62Lx EVM
>>
>> by enabling the MTD_SPI_NAND config as a module.
>>
>> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
>> ---
> 
> Gentle ping.
> 

This would need to wait till 6.14-rc1 comes out.

-- 
Regards
Vignesh
https://ti.com/opensource

