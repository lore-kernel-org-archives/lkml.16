Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590231EE7A7;
	Tue, 11 Feb 2025 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260075; cv=none; b=a9YVnjbnLzbjkVvHbws65q4jftzjiSSSf6AwIhkpJj6wXub9tOqJFBNtcm8Cfb8HeMZjRO+tS8FZAcAFDf1iSTRdLZ7iT27DRg0Rg4nx9MLPwrulcD79XnTlxS/48QK1O+CgUzb5h3eVEcNcEFDuGoUFaJZSTMqV8ikDQll77IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260075; c=relaxed/simple;
	bh=/lOfEXoHSRWWUu6+9XbL3umNJ/qo8MjCSUqOVlhorkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sTBWm3dW+M8+I8xPWiQyOqY7hOsD9mhyNZ+/NiCadVm8nh7Z5LsYFtgkaq+tLSCxhLX+9v5nlfYNBhwLve3uH4puSLFqr31qjhyWUP7ndO5Aw4R7T+jDfPCXLUBRSMZhGo3ca4Yd5X/Uj4IHfhOmXOshTPItRUZfqbg9Ebi+ygM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aggTEq4C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aggTEq4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9942FC4CEDD;
	Tue, 11 Feb 2025 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739260073;
	bh=/lOfEXoHSRWWUu6+9XbL3umNJ/qo8MjCSUqOVlhorkE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aggTEq4C9VuXFAfvWM9K7BuJuN+4penmdTWT6pUHOttH+yVEglButCGmm2CozofoJ
	 fdUivUX/Z+rmmV4wPiGX9Imcr1Z/BVw4qjXr+QP9ASb0V7G6aBKAtoSVGl+tXD5Gkx
	 1fHgvztsFwa3RGFr3190/sQ5YRgo3rclvaewBGXI5+8HR/p2iKnmgapUSC40Em7q3D
	 BtEQHCOJNcrath8HWynPmEzY5kVVqwNwezUY2qfb836IKwlnCo9HrtGzW9ZiBj7Eef
	 EDUtKmfWSLbap5h71kfln25xA5EAUSRR+kTHtpo9eu69EfXzTYNRTRmUX+VRxPzyBW
	 buhpr5Uscohwg==
Message-ID: <c699c7f8-4f2d-4908-b52e-cd3e46b7b4e4@kernel.org>
Date: Tue, 11 Feb 2025 08:47:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
 <a199849a-ca36-439d-8246-7addd9a78833@kernel.org>
 <20250211-cuddly-system-33432b3ced5f@thorsis.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250211-cuddly-system-33432b3ced5f@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2025 08:16, Alexander Dahl wrote:
> Hello everyone,
> 
> Am Mon, Feb 10, 2025 at 06:05:31PM +0100 schrieb Krzysztof Kozlowski:
>> On 10/02/2025 17:44, Alexander Dahl wrote:
>>> Before adding even more new indexes creating more holes in the
>>> clk at91 drivers pmc_data->chws arrays, split this up.
>>>
>>> This is a partial split up only for SoCs affected by upcoming changes
>>> and by that PMC_MAIN + x hack, others could follow by the same scheme.
>>>
>>> Binding splitup was proposed for several reasons:
>>>
>>> 1) keep the driver code simple, readable, and efficient
>>> 2) avoid accidental array index duplication
>>> 3) avoid memory waste by creating more and more unused array members.
>>>
>>> Old values are kept to not break dts, and to maintain dt ABI.
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>     v2:
>>>     - new patch, not present in v1
>>>
>>>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
>>>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
>>>  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
>>>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
>>>  4 files changed, 100 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> new file mode 100644
>>> index 0000000000000..e01e867e8c4da
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> @@ -0,0 +1,19 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>> +/*
>>> + * The constants defined in this header are being used in dts and in
>>> + * at91 sam9x60 clock driver.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
>>> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
>>> +
>>> +#include <dt-bindings/clock/at91.h>
>>> +
>>> +/* old from before bindings splitup */
>>> +#define SAM9X60_PMC_MCK		PMC_MCK		/* 1 */
>>> +#define SAM9X60_PMC_UTMI	PMC_UTMI	/* 2 */
>>> +#define SAM9X60_PMC_MAIN	PMC_MAIN	/* 3 */
>>> +
>>> +#define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
>>
>> IIUC, you want to have bindings per SoC, so why not adding proper
>> constants here instead of including entire old binding header? The
>> binding header should be entirely abandoned later.
> 
> Which binding header should be abandoned entirely?

The one you claim to split. I assume it is the same  one included here.

> 
> The bindings per SoC idea was proposed in series v1 feedback.  I'm
> neither a binding nor a clock expeert.  As far as I understood it's
> important to keep the exact same values as before to not change any

Yes, I did not propose to change any IDs.

> ABI.  The non SoC specific values are still used on older SoCs of the
> at91 family, so this is why I used the old constants for now.
> 
> These PMC indexes are not the only definitions in
> dt-bindings/clock/at91.h however, there are more which are not SoC
> specific.
> 
> I'd like some thoughts from the Microchip maintainers here,
> what's their idea on how to proceed with the at91 clock stuff?
> 
> This works for me, but the current state is more or less still an idea
> as base for discussion.  Please don't make it overly complicated, this
> is not the primary focus of my work.

You made this binding more complicated than it should be - instead of
simple list of clocks you include some other file and split between old
and new.

Best regards,
Krzysztof
