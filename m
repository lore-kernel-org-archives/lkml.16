Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D582190486;
	Tue, 11 Feb 2025 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260916; cv=none; b=rt4arUAbWveZDUAx+8PlNzP8SsL5ez+X8FGJuQxJauNhZNzqPoanWm3se/U9hDph9w6hcU5T7JJBFSNM8R/NUC1yzMKas/PJthU2QIETizp0lpLF53hdTuloehT0Ykhatx9CwWW/KTIAMtk0/RHWY5s2yJpJVVug9PtsrotBGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260916; c=relaxed/simple;
	bh=9bEXdxYB2C9XASX0APAaNux1TnoL9FXfmnFhFF334pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zm5viP+WZmY1Au4cKArpg03HU/sVyT9ASvUVepzeEVzzLHrw0jhGgizePAJxGtlB8IRq0TvSQCuGup/SX8iU685aKb1eMHMwUpA6AVtBbP2npndKYQlFkJKnkbIwFVtNRRR1BZmP6/WRWZpvVyF5Nsx+HErVzRNJeJY4GrzorBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIVrXrLJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIVrXrLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC1CC4CEDD;
	Tue, 11 Feb 2025 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739260915;
	bh=9bEXdxYB2C9XASX0APAaNux1TnoL9FXfmnFhFF334pQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=sIVrXrLJMyjKOfNIUsmIqRbfYw9FsIoNLdKxCBPf2TK/lRFnL1gldbGNzqFq3GH8t
	 r4zLsXkb2TPtTNIzYp8OIwupCNgduA5bXZNCmIUYeKBkZ9MEb2qBdPezXXsd7iILZV
	 1lsNQKQZdT0VjM/bvZzuEAT5fPyc0Q2T12x9aUBF8vfbVrWBeW9uO6D853mmSc/LPE
	 3w26EH0QUiI38AwcSUEctcecy7e9Bsz67E9A+f1W73vLo/19Tc97jXbNUbtopMQVX4
	 UHYuZz/WiWxyhSfgGpp7KUFiiuNvE6PjSdL4/Db35I4DeGUYToZI/OEZaMItrFExUg
	 PqH69oO5cH4gg==
Message-ID: <71910842-6310-4e1f-81a1-3b218e1ee69a@kernel.org>
Date: Tue, 11 Feb 2025 09:01:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-5-ada@thorsis.com>
 <89d51ac4-0690-42a7-b5fb-2887363e8a8b@kernel.org>
 <20250211-deprive-relocate-353ad26f46b7@thorsis.com>
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
In-Reply-To: <20250211-deprive-relocate-353ad26f46b7@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2025 08:26, Alexander Dahl wrote:
> Hello Krzysztof,
> 
> Am Mon, Feb 10, 2025 at 06:07:10PM +0100 schrieb Krzysztof Kozlowski:
>> On 10/02/2025 17:44, Alexander Dahl wrote:
>>> The main rc oscillator will be needed for the OTPC to work properly.
>>>
>>> The new index introduced here was not used on the four affected SoC
>>> clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>     v2:
>>>     - new patch, not present in v1
>>>
>>>  include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 3 +++
>>>  include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 3 +++
>>>  include/dt-bindings/clock/microchip,sama7d65-pmc.h | 3 +++
>>>  include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 3 +++
>>>  4 files changed, 12 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> index e01e867e8c4da..dcd3c74f75b54 100644
>>> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> @@ -16,4 +16,7 @@
>>>  
>>>  #define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
>>>  
>>> +/* new from after bindings splitup */
>>> +#define SAM9X60_PMC_MAIN_RC	6
>>
>> This is confusing me, because:
>> 1. You still have holes in IDs
> 
> Yes, I was told to maintain the old values for interface stability in
> series v1 feedback.
> 
>> 2. This should be placed in proper order by ID
> 
> Okay, no problem.
> 
>> 3. Why not using 4 - the next available empty ID?
> 
> The MAIN_RC clock is used on four out of thirteen (?) SoC variants
> which all used the same IDs before.  6 is the first ID which is free
> on all of sam9x60, sam9x7, sama7g5, and sama7d65.  The last two
> already use 4 for a different clock.

So driver for this device already uses something for 4?

> 
> The whole splitup is to avoid even more and/or bigger holes, but is it
> important where the existent holes are filled?
> 
> Technically if the next available empty ID should be used it would be
> 4 for sam9x60 and sam9x7, 2 for sama7d65, and 6 for sama7g5.  I
> thought it would be nice to use the same value instead to make
> somewhat compatible to the old approach.


Best regards,
Krzysztof
