Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1D417F7;
	Wed,  5 Feb 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738773378; cv=none; b=Ofdfm+wdmhm9JLD5zY2HX07T0atB/5xiVtfOUiudw8whw3mPy0NprnghnjhL3JaMYwNJnLHHnJ2AdT5rv39yzue8t07Z55cKqRoHMy+yT3TVk+zkJAYZxRMxvCNR2ZB0BQpCPbTIODW0q+kChWHJGYHbWHv338uYnDP9b6I/c+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738773378; c=relaxed/simple;
	bh=m+KkLZ0WFhRYUT9MhV67pCyH7ljAwfFdntl25wh0e0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=buSbIMyogufz6CnO68sSfdWkmbNN3rOHETog4bOrqqu3VySymuGRDAAnyEI88W9MdxTa7gaZnMB2XbaqGP0WG/ThY8YvoAmipcPOQmdAbz/xgJLLaplEg61H1KeV+PlPhR8Soqchb7rwf1t8q10+97b7RsnIxI81pFheAm3R41A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3Gs96YS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3Gs96YS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65FCC4CED1;
	Wed,  5 Feb 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738773377;
	bh=m+KkLZ0WFhRYUT9MhV67pCyH7ljAwfFdntl25wh0e0M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=D3Gs96YSibgb+/uNEyvDoWQzX9FcoQD3b1wzc4Pby8dk1Xug3hwF4p19kpR3Nf9Xl
	 Ua8qe73aTPsm3LBbbQKrcM0YrIlE7gu0t02APoQ2nxvb1yMqdh12j3ahuWgG1UcCZd
	 54JJzQVTDGxs831DLGZwFfEaZMG+BWdf8FluzKglxCnqHoBRw5bAdHCGUeZtHgezio
	 n4SqmBP21Kc21P1NMdIZh/563K5tGyUJvvoCDeoVivlb3k+cu0KGMLBvuS8PFz/oiz
	 LrVfNYOPw1BH4tN4Ur+UmeFRIHX1yPPfpYrPZiGy5rGQpmhUM2j22PBdn+PkxWoBMe
	 VlG7hsSI77ERA==
Message-ID: <bd1ad035-685e-4684-98e8-e32b98d870f7@kernel.org>
Date: Wed, 5 Feb 2025 17:36:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "nirav.rabara@altera.com" <nirav.rabara@altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250205101318.1778757-1-niravkumar.l.rabara@intel.com>
 <0f77480d-e93c-44e2-ae9b-615b2368a011@kernel.org>
 <BL3PR11MB6532426A08A1C84AA971E6C3A2F72@BL3PR11MB6532.namprd11.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
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
In-Reply-To: <BL3PR11MB6532426A08A1C84AA971E6C3A2F72@BL3PR11MB6532.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 14:43, Rabara, Niravkumar L wrote:
> Hi Krysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Wednesday, 5 February, 2025 7:31 PM
>> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>; Dinh Nguyen
>> <dinguyen@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>> nirav.rabara@altera.com; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
>>
>> On 05/02/2025 11:13, niravkumar.l.rabara@intel.com wrote:
>>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
>>> b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
>>> new file mode 100644
>>> index 000000000000..ccc9be2cd7c6
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
>>> @@ -0,0 +1,89 @@
>>> +// SPDX-License-Identifier:     GPL-2.0
>>> +/*
>>> + * Copyright (C) 2025, Altera Corporation  */ #include
>>> +"socfpga_agilex5.dtsi"
>>> +
>>> +/ {
>>> +	model = "SoCFPGA Agilex5 SoCDK";
>>> +	compatible = "intel,socfpga-agilex5-socdk", "intel,socfpga-agilex5";
>>
>>
>> You cannot use other boards compatibles. Different device, different
>> compatible.
>>
> 
> Same Agilex5 development kit board supports a separate NAND
> daughter card.
> Default daughter card with SDMMC on Agilex5 devkit required to
> replaced with this NAND daughter card to use NAND flash with
> Agilex5 devkit. 


So different boards?

> 
> Maybe I should replace the "NAND board" to "NAND daughter board" 
> for the patch title. 
> 
> Is this reasonable?


Yeah, would be better, but I was not commenting about that. Define what
is the hardware here and use proper compatibles.

Best regards,
Krzysztof
