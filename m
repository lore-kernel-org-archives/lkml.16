Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11C1C5489;
	Thu, 22 May 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909734; cv=none; b=HiAyUogZfKtDcDx8Ux1f6xKK9T+i8BLDBF2MGi7sOg5W4OzV0IzLGBWrbhtUgdIRp+CAxFYo/C6WFkezgzcvyAT5YM+SfYL1PPsut8vJwHvJ1GRPQ7gnlm33gfJ83qSHDfMga8vlGj1U83nREqY6a5uGh/QjaGfLKQSYpnipYwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909734; c=relaxed/simple;
	bh=9jVtKxXoBJOY7pWTvpiYNuBT+Pk7aL+PIuFLxvWJtc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ik7Pi9dSy9KNF3DrYT4KK345co4mXmXruFwSRPyFvPnmDmUc7qidtOgTkYkom2l3Mq6CTxpuZHj28rajLoDJNnS/C2LDKxH19FMbGypV8QzDfZUj1lUh9Fn2xsVkgho7YQMhL1NVn5CUH3MR3KG4upCZpl68ENV4FPlTHQxLGNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HfYfHj+r; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HfYfHj+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747909729;
	bh=9jVtKxXoBJOY7pWTvpiYNuBT+Pk7aL+PIuFLxvWJtc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HfYfHj+rsWIXKxpqT4je/UEsOvYRPo13jWdd5Sjwfm+dG4eLKWk0wnhGD/eSa/tMr
	 wlBmWjOz042E8xJN8arlYBZGtO3GL32NQGJ488TUslBIaqlZ2rAfUeZQcF8QCmrgSU
	 6o/7BmZs1ACtKMDcX5IfImFp8iejqnVWfAn237gXh1vEdinUzRcOABfuJg0WTTqBCf
	 BFHep2mA9QopzlUJegzumtP4t7G7kxkOnMgQibkuUzJgJBUuX4Xhfa9yBykf2HNrWx
	 RI35L7AE/ITLe6fdIh+nFyI/h7uAMkFSw6H1lKe9HTtV5NO5I2FbWpC82nWW1hfvfl
	 xy79r4bcy7kWA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BC5E17E0FD9;
	Thu, 22 May 2025 12:28:49 +0200 (CEST)
Message-ID: <a41e6b0c-5482-4947-8051-78fe677f5098@collabora.com>
Date: Thu, 22 May 2025 12:28:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
To: =?UTF-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250521091626.4283-1-friday.yang@mediatek.com>
 <9c594eaa-9ddc-4340-ac0d-d911073764ac@collabora.com>
 <ee9f04f90721963feeeb98e83a8d4fb38ee6617c.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ee9f04f90721963feeeb98e83a8d4fb38ee6617c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 22/05/25 04:42, Friday Yang (杨阳) ha scritto:
> On Wed, 2025-05-21 at 11:26 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 21/05/25 11:16, Friday Yang ha scritto:
>>> Add initial ostd setting for mt8186. All the settings come from DE.
>>> These settings help adjust Multimedia HW's bandwidth limits to
>>> achieve
>>> a balanced bandwidth requirement. Without this, the VENC HW works
>>> abnormal while stress testing.
>>>
>>> Fixes: 86a010bfc739 ("memory: mtk-smi: mt8186: Add smi support")
>>> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
>>
>> I agree about this commit and you can get my
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
>> ...but I still have a question.
>>
>> This driver is getting lots of those big OSTD arrays, and I can
>> foresee this
>> getting bigger and bigger with every new SoC getting supported in
>> there.
>>
>> I'd like to understand how we can improve that, hence, can you please
>> describe
>> how the OSTD values are calculated and how are they limiting the
>> bandwidth?
>>
>> I'm thinking that we can do something such that we get this runtime
>> calculated
>> instead of just holding fixed values, so that we may eventually
>> replace all those
>> big arrays with just a few values (foreseeing 3-4 values) and
>> performing a big
>> cleanup (which may bring further improvements in the future).
>>
>> Cheers,
>> Angelo
>>
> 
> Thank you for your comments.
> OSTD indicates the number of commands that the SMI LARB has received
> from masters but has not yet responded to from DRAM. The SMI LARB has a
> set of registers for each port to set the OSTD value. For example, if
> OSTD is set to 3, then the hardware allows 3 commands in the FIFO for
> that LARB port.
> 

> For each SoC, the ESL DE simulates application scenarios and provides
> an initial OSTD setting to the software. This is just the initial
> configuration.
 >

Thanks for this valuable information.

I wonder if you could please send a commit to add this information as a
comment into this driver, and/or in mediatek,smi-larb.yaml so that it will
not get lost :-)

> We have MMQoS software that dynamically adjusts the
> bandwidth and sets the OSTD-related registers of SMI. In the MT8196,
> MMQoS will send upstream. However, in some projects, the MMQoS module
> is not enabled, so we need to provide this initial OSTD setting to
> achieve a balanced bandwidth requirement. Since we do not have a
> formula to calculate OSTD, it is difficult for SMI to calculate OSTD at
> runtime.
> 

If the MMQoS is upstreamed and enabled, do we still need a "default" OSTD
configuration (for example, MT8196)?

> You are right, the SMI driver could become larger if we have to add
> this OSTD array. How about adding an OSTD setting in the device tree?
> For example, we could add a mediatek,smi-ostd array property for each
> SMI LARB and SMI common. This would be more feasible for us. Is this
> acceptable to you?

Unfortunately, this is not possible.

Devicetree is used to describe hardware, and this is configuration that does
not describe hardware, so this cannot go to the devicetree.

Though, if using MMQoS means that we don't need to add a default OSTD array,
this situation gets resolved as, from what I can see in the MT6991 downstream
kernel, the MMQoS module evaluates bandwidth numbers to calculate OSTD params.

That could be implemented as an interconnect driver: in that case, it would be
possible to leverage devicetree as we'd be specifying hardware interconnection
bandwidth "gears".

The DT would look more or less like:

disp_controller_opp_table: opp-table {
	compatible = "operating-points-v2";

	opp-0 {
		(frequencies and voltages if applicable, or none)

		opp-peak-kBps = <peak-bandwidth-value-in-kbps>;

		opp-avg-kBps = <average-bandwidth-in-kbps>; /* this is optional */
	};
	opp-1 .... etc
};

display-controller@1234 {
	compatible = "mediatek,xyz";

	interconnects = <&mmqos MASTER_SOMETHING &mmqos SLAVE_SOMETHING>;
	operating-points-v2 = <&disp_controller_opp_table>;
};

...so that then MMQoS can set the OSTD values to SMI :-)

Thanks again!
Angelo

> 
> Best regard
> Friday Yang
> 
>>> ---
>>>    drivers/memory/mtk-smi.c | 33 +++++++++++++++++++++++++++++++++
>>>    1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>>> index c086c22511f7..733e22f695ab 100644
>>> --- a/drivers/memory/mtk-smi.c
>>> +++ b/drivers/memory/mtk-smi.c
>>> @@ -320,6 +320,38 @@ static const u8
>>> mtk_smi_larb_mt6893_ostd[][SMI_LARB_PORT_NR_MAX] = {
>>>        [20] = {0x9, 0x9, 0x5, 0x5, 0x1, 0x1},
>>>    };
>>>
>>> +static const u8 mtk_smi_larb_mt8186_ostd[][SMI_LARB_PORT_NR_MAX] =
>>> {
>>> +     [0] = {0x2, 0x1, 0x8, 0x1,},
>>> +     [1] = {0x1, 0x3, 0x1, 0x1,},
>>> +     [2] = {0x6, 0x1, 0x4, 0x1,},
>>> +     [3] = {},
>>> +     [4] = {0xf, 0x1, 0x5, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
>>> +            0x1, 0x1, 0x1,},
>>> +     [5] = {},
>>> +     [6] = {},
>>> +     [7] = {0x1, 0x3, 0x1, 0x1, 0x1, 0x3, 0x2, 0xd, 0x7, 0x5, 0x3,
>>> +            0x1, 0x5,},
>>> +     [8] = {0x1, 0x2, 0x2,},
>>> +     [9] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7,
>>> 0x4,
>>> +            0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
>>> 0x1,
>>> +            0x1, 0x1, 0x1, 0x1, 0x1,},
>>> +     [10] = {},
>>> +     [11] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb,
>>> 0x7, 0x4,
>>> +             0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x8, 0x7, 0x7, 0x1,
>>> 0x6, 0x2,
>>> +             0xf, 0x8, 0x1, 0x1, 0x1,},
>>> +     [12] = {},
>>> +     [13] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x6, 0x6, 0x6, 0x1,
>>> 0x1, 0x1,},
>>> +     [14] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1,},
>>> +     [15] = {},
>>> +     [16] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4,
>>> 0x4,
>>> +             0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
>>> +     [17] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4,
>>> 0x4,
>>> +             0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
>>> +     [18] = {},
>>> +     [19] = {0x1, 0x1, 0x1, 0x1,},
>>> +     [20] = {0x2, 0x2, 0x2, 0x2, 0x1, 0x1,},
>>> +};
>>> +
>>>    static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX]
>>> = {
>>>        [0] = {0x02, 0x18, 0x22, 0x22, 0x01, 0x02, 0x0a,},
>>>        [1] = {0x12, 0x02, 0x14, 0x14, 0x01, 0x18, 0x0a,},
>>> @@ -491,6 +523,7 @@ static const struct mtk_smi_larb_gen
>>> mtk_smi_larb_mt8183 = {
>>>    static const struct mtk_smi_larb_gen mtk_smi_larb_mt8186 = {
>>>        .config_port                =
>>> mtk_smi_larb_config_port_gen2_general,
>>>        .flags_general              = MTK_SMI_FLAG_SLEEP_CTL,
>>> +     .ostd                       = mtk_smi_larb_mt8186_ostd,
>>>    };
>>>
>>>    static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
>>> --
>>> 2.46.0
>>>
>>
>>
