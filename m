Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADCDEEAB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331348; cv=none; b=FrLZJEU1p0EEhiugM/BemXcMg1GHuj+GcR86LGrqrIeNQsG/ArEmWneq3vtMkz1fqw6NABhlPqdFkOpzftT6sTLwe4Tm4UDzodksk/i+04dYEWoN85o1wVggh7oUs+uHqTSEj/ZWqgK7AdgxF4xHH385/g3LYqUtIBU2+/hzQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331348; c=relaxed/simple;
	bh=zu/h7yjGnqnYWOhUUyWPs9vnIxfLpKpkZcZNYjSoVvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bg59aPP+WQ5+xZrfor/JB8kpFn9d65XvRYtf5gBz6WRDWA7Fv2xB/u98hIBZBcNBrT6c4DUdID5Ee3hCs2VxktxJ7esIoEVsyZP/yVXoxExge2RDMG92/ngbCWA3jBWMaeMtuZb7liuq4sKQUFk9/TRqYr9OGVzlFG41aPhwe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TvIJTVsq; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TvIJTVsq"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEFKDv1228983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331320;
	bh=j0SAnZAH2PKj7cb/0hXi/Kyprc2Be+WMsrPDKWn/x7A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TvIJTVsqkrkkNLj7//lyC8+vb40grO6v6HqLC5hvxhqBug8tqgS41uNe3Zdd+NE8l
	 OjZ9OvUwCtFRTlpeJJ4LB/VNpiolKl7tGWNqTxRNbfyD8gcH2TxIcF/8F35XIm7U0R
	 tqUiCVXi8yGLHETUbjFKPgF6+EJ812mB7GxOIfgI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEFJZu085202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:15:19 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:15:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:15:18 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEFIx0119691;
	Tue, 22 Apr 2025 09:15:18 -0500
Message-ID: <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
Date: Tue, 22 Apr 2025 09:15:18 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
 <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Arnd,

On 4/22/25 1:37 AM, Arnd Bergmann wrote:
> On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
>> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
>> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
>> default on am64x SK board.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> The patch seems fine to me, but you should address it at the
> TI K3 maintainers, so they know they should apply it and forward
> it to the SoC tree. You have Nishanth and Vignesh in Cc already,
> so I assume they will pick it up from here, just put them in
> 'To' instead next time and move Catalin and Will to 'Cc' or
> leave them off entirely.
> 

Will re-spin and fix the to and cc lists, thanks for reviewing!

~ Judith

>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 9e16b494ab0e2..1f7b97ff46a7e 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1415,6 +1415,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
>>   CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>>   CONFIG_CLK_RENESAS_VBATTB=m
>>   CONFIG_HWSPINLOCK=y
>> +CONFIG_HWSPINLOCK_OMAP=m
>>   CONFIG_HWSPINLOCK_QCOM=y
>>   CONFIG_TEGRA186_TIMER=y
>>   CONFIG_RENESAS_OSTM=y
>> @@ -1676,6 +1677,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
>>   CONFIG_INTERCONNECT_QCOM_SM8750=y
>>   CONFIG_INTERCONNECT_QCOM_X1E80100=y
>>   CONFIG_COUNTER=m
>> +CONFIG_TI_EQEP=m
>>   CONFIG_RZ_MTU3_CNT=m
>>   CONFIG_HTE=y
>>   CONFIG_HTE_TEGRA194=y
>> -- 
>> 2.49.0

