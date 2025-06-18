Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB11B1E3769;
	Wed, 18 Jun 2025 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227699; cv=none; b=SyPhmhl8WbDL9qPbKqvtEnM+RWlsUeFu1VncIDFi8SdNVjtRJ6soiZgNt8puNDifHrk1qMQQhcJugTXBOD51IatASHUNRFSM4XXftAM6omKft7HBO5+vsWUorDmuZ/hHlX2L0Mnj8Z2SeM2FP4VxndITx3mamJegLzPg/0FunCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227699; c=relaxed/simple;
	bh=evww31BVMvnjI08mEOR/S1s5oLWOAOIFCw8pCnqB3PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOHxXg+jVB2TfpYc2YfA7bbAn3A0kJ0RQR//uJJxJD3N7rVOUc3XSy7zU+//FnqZMlGxsfC31Z7KzZlVs0rd5qajxRbud/bYmKAmnb792gc6JG9T1tQvI68Ok1miVNHGbVpnyODFC+SJXpMMhjXDa0jkwHXt6nCWCFBC3M2skMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwv+/rrJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwv+/rrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78356C4CEE7;
	Wed, 18 Jun 2025 06:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750227696;
	bh=evww31BVMvnjI08mEOR/S1s5oLWOAOIFCw8pCnqB3PM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwv+/rrJVkWuJiwGtBdp3PC22kQfxnzDTIWoNNg4/xze/bKjGKv/pZ7xE021GYqm7
	 TzDbDzxgrX2YfhoGF0JTv2jQvJ5+NUO4RFXiF4hhololvmo0tvBM2SwSlyhDEifGdA
	 hgHR2bpCraUL5Rg+WSKiPdU5VgzI0jaulkMguYe/LOzPmqD6RvfvJePp1x5arGPNNy
	 +4OzbDlpE3zJ1rNCNlIH1z6ucaf9C80W4f1x1SPFZ5+fMOpa6RVIn7rkLyXCcEzdct
	 8+DQ6HQiVlKGyMca/3cMd4FW0DyL0phnkbmEjCm9IHFnp0QhZswSaBE85+4FYhg+t8
	 BGWwg+XcSnL5A==
Message-ID: <a9baf6b0-b668-4d10-b9de-b63eb3fd8f23@kernel.org>
Date: Wed, 18 Jun 2025 08:21:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
 <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
 <20250617-small-vivacious-labrador-7f0eb0@kuoka>
 <b079fc14-8692-4521-bd81-fe2fca713f2f@cherry.de>
 <704d75df-a484-4da3-9bcb-85b480e2ecf0@kernel.org>
 <d262b45a-c0ed-4eff-86c6-e8bcfc005ddb@cherry.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d262b45a-c0ed-4eff-86c6-e8bcfc005ddb@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2025 12:45, Quentin Schulz wrote:
> On 6/17/25 12:21 PM, Krzysztof Kozlowski wrote:
>> On 17/06/2025 11:38, Quentin Schulz wrote:
>>> Hi Krzysztof,
>>>
>>> On 6/17/25 10:08 AM, Krzysztof Kozlowski wrote:
>>>> On Thu, Jun 05, 2025 at 05:41:06PM GMT, Quentin Schulz wrote:
>>>>> +  rockchip,reset-mode:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    enum: [0, 1, 2]
>>>>> +    description:
>>>>> +      Mode to use when a reset of the PMIC is triggered.
>>>>> +
>>>>> +      The reset can be triggered either programmatically, via one of
>>>>> +      the PWRCTRL pins (provided additional configuration) or
>>>>> +      asserting RESETB pin low.
>>>>> +
>>>>> +      The following modes are supported (see also
>>>>> +      include/dt-bindings/mfd/rockchip,rk8xx.h)
>>>>> +
>>>>> +      - 0 (RK806_RESTART) restart PMU,
>>>>> +      - 1 (RK806_RESET) reset all power off reset registers and force
>>>>> +        state to switch to ACTIVE mode,
>>>>> +      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
>>>>> +        RESETB pin down for 5ms,
>>>>> +
>>>>> +      For example, some hardware may require a full restart
>>>>> +      (RK806_RESTART mode) in order to function properly as regulators
>>>>> +      are shortly interrupted in this mode.
>>>>> +
>>>>
>>>> This is fine, although now points to missing restart-handler schema and
>>>> maybe this should be once made common property. But that's just
>>>> digression, nothing needed here.
>>>>
>>>>>      vcc1-supply:
>>>>>        description:
>>>>>          The input supply for dcdc-reg1.
>>>>> diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
>>>>> @@ -0,0 +1,17 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>>>> +/*
>>>>> + * Device Tree defines for Rockchip RK8xx PMICs
>>>>> + *
>>>>> + * Copyright 2025 Cherry Embedded Solutions GmbH
>>>>> + *
>>>>> + * Author: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> + */
>>>>> +
>>>>> +#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>>>>> +#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>>>>> +
>>>>> +#define RK806_RESTART		0
>>>>> +#define RK806_RESET		1
>>>>> +#define RK806_RESET_NOTIFY	2
>>>>
>>>> I do not see how this is a binding. Where do you use this in the driver
>>>> (to be a binding because otherwise you just add unused ABI)?
>>>>
>>>
>>> Explained in the commit log of the driver patch:
>>>
>>> """
>>> This adds the appropriate logic in the driver to parse the new
>>> rockchip,reset-mode DT property to pass this information. It just
>>> happens that the values in the binding match the values to write in the
>>> bitfield so no mapping is necessary.
>>> """
>>>
>>> I can add useless mapping in the driver if it's preferred. I had the
>>
>> No, I comment and raise questions when you add ABI which is neither ABI
>> or should not be ABI.
>>
> 
> Not sure what would make something part of the ABI or not. I would 
> assume the value in the DT property to be ABI anyway so this is just 
> another name for the same value no? Trying to understand this from your 
> perspective.

Drop the header, it's not an ABI. You just use register values. This is
not a Linux ABI. The values are coming from the hardware.

> 
>>> impression that simply using a hardcoded value in the DT binding and
>>> then writing it to the register was not desired, so the constant is now
>>> here to make this less obscure from DT perspective though I'm still
>>> writing the value directly in the register. If hardcoded values are ok
>>> in the binding, then I can remove that header file.
>>
>> If you want something user readable, make it an enum string or keep the
>> header within DTS.
>>
> 
> Just to be sure I understood correctly, moving that file to e.g. 
> arch/arm64/boot/dts/rockchip/rk806.h (or rk8xx.h or whatever) with the 

Yes

> file content unchanged from this v2 would be fine with you? Would I be 
> able to point at this file from the DT binding (I assume not)?

No, because it is not a binding.

Best regards,
Krzysztof
