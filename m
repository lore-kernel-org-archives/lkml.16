Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6C17BCE;
	Tue, 29 Apr 2025 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937053; cv=none; b=HWR6uMLLNjQMt/UFaRJMLRG6dQiqJlaWVV8oHw2Ka6SV6k7cCkVH+78rbrGZT7BCsCIxu0h51ov0FDaTAMKHz1kM6X3CjDHpUcJbz5hUynwwohgyeb+TvIi3g9r2V1mTs+tdAFH4GNyCR7fRaWc6NUPaLPBWqlE3qMfe85aeSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937053; c=relaxed/simple;
	bh=niuFHlGy2Mq9d1XJwxCoT73mXw4vEIJadyOtE6yD3Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txMtgBDO2OdAHOoOhiz+fozQMBOOyfaZWdqpuc+cQxbGyrSCymN6quOQrClglHxhynSlOw8qzD+obR/QOJ8CfIG3DAPgu/DiHA9Hc4s+nkcogGDhzkVuut+ewH+UetSopAYP96WjCLBflU4qhEFKAObKuSxbSsZiBMvqyDGGp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOw6L32g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOw6L32g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47B8C4CEE3;
	Tue, 29 Apr 2025 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937052;
	bh=niuFHlGy2Mq9d1XJwxCoT73mXw4vEIJadyOtE6yD3Yw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UOw6L32gJyl1G/eTXOE496uhRufHCQI6ope7tgmeNuabvY8FAcVLtdj627pt1kRP6
	 j9s1TnsaHTo29Q+H+sUs8m+LhJUoR3taqKYGIEAQSl9i8FXRX+4eNtBGjaQBfLqiut
	 +P/71e3cuW1g/bXrdsrRAAj7yVctS09ZaVEHxvrSyJw/Xk8jGANlZvhXjg+jKnikvg
	 5XfQJWjiH2C0ATUJU46b7CF02/Ru2iROHgHilt0++oSdHxZ7ohYcwaqzlLBf9MjOdK
	 eaULNxPa6PM4HLxbVL6QUHx+LboGBxLFsb4smj2HEQR0oJ0cRe0+yILuQHBTOZQZfS
	 0Rdt9upcHGW/A==
Message-ID: <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
Date: Tue, 29 Apr 2025 16:30:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
To: Lucas Stach <l.stach@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
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
In-Reply-To: <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 11:39, Lucas Stach wrote:
> Hi Krzysztof,
> 
> Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
>> Not tested on hardware.
>>
>> Ethernet interface, like other exposed interfaces, aliases depend on
>> actual board configuration, e.g. its labeling, thus aliases should be
>> defined per each board or each SoM.
>>
>> Some boards (e.g. Gateworks) follow this convention but many do not.
>>
>> This is continuation of my comments from:
>> https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org
>>
> The i.MX boards have traditionally listed aliases for many hardware
> peripherals with the same numbering that's used in the SoC reference

... which is not correct. Aliases should represent how boards are really
labeled, not how reference manual labels them.

> manual. Boards always have the option to override those aliases if they
> have a good reason to do so, e.g. labeling on the physical device.
> 
> Other users besides Linux rely on fixed numbering provided by the
> aliases. Both barebox and U-Boot number their ethernet interfaces
> according to the alias.

And?

> 
> While you seem to add back aliases for in-tree boards, this breaks the
> majority of boards that include the kernel DTSI from an out-of-tree
> board. I can understand that we can't always accommodate these users,

This is not ABI, so every out of tree user is on their own.

> but I simply don't see the strong benefit of this patch to justify
> creating churn and possible regressions with those OOT users.

They should mainline their code.

It is not only a "churn", but way to stop people from repeating the same
mistake. Every time you bring new soc, people will copy old code thus
this will never change.

> 
> Having those aliases in the DTSI has been common practice on the i.MX
> platform since 2012, long before there was any strong consensus on how

Many previous practices were poor practices and decent SoC platforms
fixed and changed it.

We made big cleanups - since ~2 years Samsung is warning free. Since
similar time all Qcom boards use phandle/label override. All of them
were significant effort and quite a shuffling of code. Such effort is
necessary if you want to code to be maintainable and in best shape for
future development.

Unless you claim NXP SoCs are a legacy platform and we should not do
such cleanups.

> those aliases should be used. Breaking existing users for the sake of
> aligning the i.MX platform with more idiomatic DT usage does not seem
> to be a worthwhile trade-off to me.

No existing users are broken. Everyone who decided to stay out of tree
is on their own, but this was their choice. We are not talking here
about ABI.



Best regards,
Krzysztof
