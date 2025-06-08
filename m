Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1EB5C603;
	Sun,  8 Jun 2025 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749367086; cv=none; b=c0YLBDGqWEypR2NRTYD1drxFqex1f9hYrwewHuSTVMbb3oKvgPNva8412C3ByJQDQS9r1JjuszwuWYPVdCOuvUBh+4/dLFCw+SECcYP6WTvKs0domjU2j1SlRqb16cI7iA75OYZaKcrY1k0IX+jMg7vTS68LUm1FxdK29iidboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749367086; c=relaxed/simple;
	bh=kW17oiL4BXGjOyWf4Vk0CqI29Uy/PtODd+NQRY5PPXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sFPzQBj9GJr/ylpInWpBMnCpcIE3H8eE2rO7YQxNVi0kItOxL1LkBUmV9yWSIWvbzNl44fZE5pmlj2hns+xyfLm8rSYjeZtZOIDLw8OJrQZxTdFFCCc0zMtCThsQTWbclG3eS8dVanzu1a+Qx/+ZCaxBDKa7z04ZQITbcjobD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iPfTy/Nk; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iPfTy/Nk"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5587Hie11734860;
	Sun, 8 Jun 2025 02:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749367064;
	bh=wZ5cl83cLGj3R08edsWekoKXBUx6VLHrojgsz62kMm4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iPfTy/NkX7N9/ieBuvPSlDwczGE92Vk1t1ojWjsPh0fFnnddqlG4PJ1scFHDzlDwB
	 chBCYjZ0MojgTCRBFAbpuRyXMDjt9hGQF63mTTmebCKlb/wuGxQPkm5HIFTY3ve2Ma
	 9lLKBNoTFC56WWSijHSac92zYkm+1wvG0uzxgW14=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5587HiZb3313839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 8 Jun 2025 02:17:44 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 8
 Jun 2025 02:17:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 8 Jun 2025 02:17:44 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5587He963701379;
	Sun, 8 Jun 2025 02:17:41 -0500
Message-ID: <51c56999-5f47-45fd-a4b2-4b79ecae0227@ti.com>
Date: Sun, 8 Jun 2025 12:47:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
References: <20250603042448.783956-1-u-kumar1@ti.com>
 <20250603160147.47orn74obh2lz3qm@rethink>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250603160147.47orn74obh2lz3qm@rethink>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Nishanth

On 6/3/2025 9:31 PM, Nishanth Menon wrote:
> On 09:54-20250603, Udit Kumar wrote:
>> From: Bhavya Kapoor <b-kapoor@ti.com>
>>
>> This commit adds the assigned-clocks and assigned-clock-parents
>> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
>> property is set to reference the clock identified by
>> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
>> correct clock source.
>>
>> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
>> as the parent clock. This configuration is critical for establishing
>> the proper clocking hierarchy, enabling the UART device to function
>> reliably across different baud rates.
> Please fix the commit message - not clear what specifically in the clock
> hierarchy does permit the multiple baud rates.

need your advise here .

unlike other UART of main domain.  wkup_uart currently has two parents 
clock (clock-1 is at 96Mhz and clock-0 is at 19.2 Mhz).

By default, current fw selects clock-1 as parent.

Let me know, if explicitly we need to set parent as clock-1.

If yes then i will roll out v2 with current message , if no then please 
drop this patch

Thanks

Udit

>
>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> You need to add your SoB.
>> ---
>> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
> [..]
