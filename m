Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF517281517
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331824; cv=none; b=fFnScBI4h/nofu9ri2lvZcUUYLbjyfIWzdUUjk/Lvzg7YYIIuT6QzdvhpzcZkwNovlJyfg+kiR0hN1Ae+jO3mmQsl9HxXPoCi+MeTnY8h8IX8LE2Xez7dG4TjrDfKwsJ9f/FaQmi5LcJjGFAAG1NLDU51bHldgxnYE/QftnvNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331824; c=relaxed/simple;
	bh=ooDsQXFWqad5t5so/svstwpDcOe7ADhJfj0lmr3/Ngg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LNn9BMCdKfU0XjFr+FA09eq+TbErUyIDWPw/54BD0OA2rwTn7U6Wk1UBMgjiPoM3sNw710f5UpLmmdd/lspWWicLGK6HApaK+A6BiuRK6OeDZffqqh8CCDeg4tlBzU2MxUJ5tANDVEawlpYB+V338oO0LSVEK++kAkNXRIUX4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WKbocqX2; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WKbocqX2"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MENRxV1230927
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331807;
	bh=T+KF6QErdbY2aGPv8cN6+b4qKLV/yGuzbUNxXqDuDzo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WKbocqX2ZNL+tQd5wEGF/zAANTA9bOepLYZvKBUIuA7z6kT45tol0AXFXKl76ge85
	 B0R9p02Auohxbg2vH6yLoljQ7IqPVTyGyAJvbduJEJ5WLIyqe+Nh4UmS6S/haIKGho
	 1bfnQEl90lv098tvP/H3wnYS2bl4ams6rmAw6nE0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MENRAF000308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:23:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:23:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:23:26 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MENQjG000925;
	Tue, 22 Apr 2025 09:23:26 -0500
Message-ID: <86938add-1ccc-4be3-af3f-cff911c96d42@ti.com>
Date: Tue, 22 Apr 2025 09:23:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
To: Nishanth Menon <nm@ti.com>
CC: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
 <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
 <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
 <20250422142207.2tu7gmhnjercmoa2@basil>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250422142207.2tu7gmhnjercmoa2@basil>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 4/22/25 9:22 AM, Nishanth Menon wrote:
> On 09:15-20250422, Judith Mendez wrote:
>> Hi Arnd,
>>
>> On 4/22/25 1:37 AM, Arnd Bergmann wrote:
>>> On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
>>>> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
>>>> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
>>>> default on am64x SK board.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The patch seems fine to me, but you should address it at the
>>> TI K3 maintainers, so they know they should apply it and forward
>>> it to the SoC tree. You have Nishanth and Vignesh in Cc already,
>>> so I assume they will pick it up from here, just put them in
>>> 'To' instead next time and move Catalin and Will to 'Cc' or
>>> leave them off entirely.
>>>
>>
>> Will re-spin and fix the to and cc lists, thanks for reviewing!
> 
> There is no need to respin, it is already in my queue. Will pick it up
> as part of usual process. The above information that Arnd provided is
> for future reference.
> 
Sounds good, thanks for the help.

~ Judith
