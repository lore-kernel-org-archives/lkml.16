Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F52135B8;
	Thu, 17 Apr 2025 05:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868391; cv=none; b=CsNEmBlf3U2Zn8UKdCZzxq1bNY8Tpi5IrqTLLSAXluO0YQH+2FFRrXCwCYCKx49/e7GcgOy3QkevlTNTBBCqAvGnv33W8fdm45UGUDp/y4sYiypOGbmiXiky+xV2Cu6kb9ykFHdgh1emcTdL+qSg86GzHvntZxxNAhpc2zknY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868391; c=relaxed/simple;
	bh=O+7UduCp8OWrVDAANuMZTwB/Aldeg/z+ZeOeNAciQ+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vA6gvljWY7X/gVahwqhv7kzalik29rlN4HRpVM2LXLoEaybmJDAUoWBDn4joLJOVmFYFtxCPDej2I/6A5+EviculiPVlQn3z0sdWaAjbrVeYYDggPpCXOHFvY8/UJscJZAJELC1X/TI7vIK13toaL/p2YdBA+iD3AtiH6LGZsHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCl6riEp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCl6riEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13208C4CEE4;
	Thu, 17 Apr 2025 05:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744868391;
	bh=O+7UduCp8OWrVDAANuMZTwB/Aldeg/z+ZeOeNAciQ+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RCl6riEpixKGXyqSZL1ftlEjmnCLrlYV1FBSZKJAVmkJmdx+PRaHyn0eDO/ZjikuQ
	 RJpJDoAraOoLBmfQ7JQsrP5U9aUss6PfMktt5X3dSdYJ1Cp5qheMGcd/NsVk9wjTpL
	 +asjBcncP4M5zhefatZO+mM0XFcMNxx1ubpH3tpDRlTA+jHbSJuIdq0zDv0RFwPJ8P
	 s0mFV5+UNDivWe883qlQE+aoLmVGPEE+LJ2UlCyiD1LKZvWqNhrMz5Ab68jGh6o5uU
	 vrAQDPgU3LZsTuIgWKSecxNLmwqZFXq1yC1iFGtkVCLLkSxGPVBY658jQznxwf4QWt
	 Ll8w+58O91JfQ==
Message-ID: <f189ec8e-88fc-491f-8552-e1e5d0b7cde7@kernel.org>
Date: Thu, 17 Apr 2025 07:39:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <20250409-calculating-hungry-mosquito-f8cfeb@shite>
 <20250411182608.cpxr357humjq6ln7@bryanbrattlof.com>
 <859a4fc2-45f5-4d72-9727-7979e4c15bd5@kernel.org>
 <20250416144202.4bmm566iqaz6adzo@bryanbrattlof.com>
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
In-Reply-To: <20250416144202.4bmm566iqaz6adzo@bryanbrattlof.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2025 16:42, Bryan Brattlof wrote:
> On April 12, 2025 thus sayeth Krzysztof Kozlowski:
>> On 11/04/2025 20:26, Bryan Brattlof wrote:
>>>>> +
>>>>> +		usb0_phy_ctrl: syscon@45000 {
>>>>> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
>>>>> +			reg = <0x45000 0x4>;
>>>>> +			bootph-all;
>>>>> +		};
>>>>> +
>>>>> +		usb1_phy_ctrl: syscon@45004 {
>>>>> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
>>>>> +			reg = <0x45004 0x4>;
>>>>
>>>> No, you do not get syscon per register. The entire point of syscon is to
>>>> collect ALL registers. Your device is the syscon, not a register.
>>>>
>>>
>>> My understanding from [0] was that we would need to break this up into 
>>> smaller syscon nodes because the alternative would be to mark the entire 
>>> region as a syscon and every other node using it would need to use it's 
>>> base + offset which was kinda undesirable especially for the small 
>>> number of drivers that need data from this region.
>>>
>>>     a-device {
>>>         clocks = <&epwm_tbclk 0>;
>>
>>
>> Hm? That's how you use the syscon, so how it can be undesirable?
>>
>> Anyway, one register is not a device, so no device node per register.
>>
>> In the link you provided I was repeating the same, so you got same
>> review in multiple places.
>>
> 
> Interesting. The way I read that thread was the opposite and it's why we 
> did this for the 62, 62A, and 62P devices. I mainly say it's unfortunate 

Really? What was unclear here:

https://lore.kernel.org/lkml/20250124-able-beagle-of-prowess-f5eb7a@krzk-bin/

Un-acked, I missed the point that you really speak in commit msg about
register and you really treat one register is a device. I assumed you
only need that register from this device, but no. That obviously is not
what this device is. Device is not a single register among 10000 others.
IOW, You do not have 10000 devices there.

NAK

> because if we have a block of miscellaneous registers there's no clear 
> guidance on how big or small that range can or should be and we still 
> need to encode the offset to that exact register.
> 
> By labeling each register we at least have the opportunity to describe 
> each register and if they are even used.
Repeated many times: no device nodes per clock (also TI invention), no
device nodes per register. This is not an opportunity. This is just not
desired.

Best regards,
Krzysztof
