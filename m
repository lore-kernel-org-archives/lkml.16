Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2B22B8C3;
	Fri, 25 Apr 2025 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562491; cv=none; b=UgfUBl633viwYq6xumX3s+ngD2Dinl6IxcoCbPxMUjS8eGapQV3OgpMDMta5g2F69L4rTHFbtGivwwSfMWbuoTGLZCdM2tCrwlCGBv0q6lWsprVpu+PhgNS7J5EN3e8h2jgaEdbyZSHcjqN2RXkK1jheToQ1tzPMuDypeIo3eJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562491; c=relaxed/simple;
	bh=sWRY0eQe+18OqRtXDGq2jdVq+juVtMJaC2QdBwkmn6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvOQWgfbz/sa3wer/0VPJJjoRN+fd0duODPsqCZQyx87nEbEH5Mt48xevH+/0DcAJUSGdMs2kZwR04tymPpDgpiqu5zbHMXqoWZ3Ojo7vvfEbVzlam4q9OM8JpihFt22HiZMdoulQzY463GgwAd77498fBzGwTRo6Nf8M2pPXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq8LIAlr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq8LIAlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7A0C4CEE4;
	Fri, 25 Apr 2025 06:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745562491;
	bh=sWRY0eQe+18OqRtXDGq2jdVq+juVtMJaC2QdBwkmn6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eq8LIAlrG+5LPy5mNRGrmLJAnPdKrizGCZYWS9cpp16jb/yqKx7Ci9j5oVORdW6/D
	 Q07ClE6Qj5rFvqGm/7Qj/a9RRAwbtbW3rQD0MnhVvLA14xVmbL8LnVjnQvMB4QrjeO
	 CfUploE8g13uL9Hyj9k+wAYPApnVoH/Mu1ahaqVcLnYzPHCyd2qBn9KIU/sH5cKa+Y
	 WKeju8Wo6PITL623i0Qql6Rv9Mw6O5xC4E1aln16MMcOiBYhNg8KWxgy7mndRDNWlA
	 X0k+gV9RZXjVkwTOarG5ag4qvi1ERDuF6iPfmWBW0p/BnKXx6AmSLThmZDpw8zZ/tG
	 6OkGlp/zvmcsQ==
Message-ID: <8b8ff49e-c72e-4cb4-a412-a6b9f15d2ec6@kernel.org>
Date: Fri, 25 Apr 2025 08:28:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: Add support for bcm74110
To: Justin Chen <justin.chen@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250404222058.396134-1-justin.chen@broadcom.com>
 <20250404222058.396134-2-justin.chen@broadcom.com>
 <b32aa644-6984-476b-abc0-a5416f551bba@kernel.org>
 <9088acd0-4650-4b10-88f9-6b6c0b1f9978@broadcom.com>
 <8abcf2bf-77cb-4380-bdc4-95c3796a96f0@kernel.org>
 <e0e7952b-a308-4fb7-8af6-d4802e7a5080@broadcom.com>
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
In-Reply-To: <e0e7952b-a308-4fb7-8af6-d4802e7a5080@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2025 20:44, Justin Chen wrote:
> 
> 
> On 4/7/25 11:05 PM, Krzysztof Kozlowski wrote:
>> On 07/04/2025 22:57, Justin Chen wrote:
>>
>>
>>> from v2 of my patch was copied from said generated DTS.
>>>
>>> Apologies as I navigate through the different yaml keywords here. The HW
>>> isn't changing, I am just struggling with representing the HW using the
>>> different keywords. And the different implications of using said keywords.
>>>
>>> Here is what I have for v4.
>>>        items:
>>>          - description: RX doorbell and watermark interrupts
>>>          - description: TX doorbell and watermark interrupts
>>> +    description:
>>> +      RX interrupts are required to notify the host of pending messages. TX
>>> +      interrupts are optional. The TX doorbell interrupt is not used by the
>>> +      host, but watermark interrupts may be used to notify a host
>>> waiting on
>>> +      a full out queue.
>> What does it mean optional? Board decides on SoC connections? Given SoC
>> is fixed isn't it?
>>
> 
> Maybe I misunderstand optional here. We have optional from the SoC 
> perspective and optional from a driver perspective. I was thinking if we 
> have a HW feature that the software may choose to use, it is considered 
> optional. If that is not the correct understanding, I can make 

Both meanings are considered. Optional for driver means hardware has it
but also has default values and driver implementations can work without
it on these defaults, e.g. some property configuring registers like
min/max regulator voltages.
Optional for hardware means it can really be "not connected" on some
hardwares/boards, e.g. some pins are grounded. The "interrupts" do not
really fit into the first category, so they could be optional only if
your hardware really allows this interrupt to be missing (or such
hardware exists).

> adjustments. I will remove minItems, which from understanding, means 
> both IRQs are required.

Best regards,
Krzysztof
