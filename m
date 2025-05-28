Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739C1531E3;
	Wed, 28 May 2025 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413779; cv=none; b=im+FeMz2G0SMSXLnaHCn1C1YFpv9TRJ9HYmcQhE2WG7dLyLqfJSQtdscuYUVmZBrCIiRV0W7ZW46w9mp8M/deFYVth9KOTgvWdbbgsIvXxRsghMAVeMdDZEw5uFFHjyKxtKgpobXyXy2hw5OOh7NFflOH2drEHzuMeagfxQnd4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413779; c=relaxed/simple;
	bh=dzyFlOWPpi/yLNvkCZ6F2fmrDGMtcAHJnWsuGUdB9W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4H7pXscAZB69km4dCI1P/JWvyxIVbNXSChj3I4VzPAOo41xGXmrIldQODRcz9BNEWFAw10NCsl744f4zrXwBNMdrptlg0y6jdd7MnJGutctwHpX1JFCPpaDnoZhgG38fn9cjywRML0/enZ4jdHuCjqIKRCYThQv7JrGXW8kVR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRUW3bjb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRUW3bjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE27C4CEE7;
	Wed, 28 May 2025 06:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748413778;
	bh=dzyFlOWPpi/yLNvkCZ6F2fmrDGMtcAHJnWsuGUdB9W0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MRUW3bjbcZAt2FjPkzILIiprwpKI05ueTeFmphbDrKSQKn96AHy1kUVXuCpDuWg+c
	 6cLLqvUo6w/i+8P0W8nTnY1GSbR1RMfZprU80LjPQ9EyuDes12QWDZFEqvBOCXlhck
	 kBqXbUBrxzJ33c1+nO6oNRWAJz/iuK2sZX0kuQiaNNAbeWq2ngNZcj2eFvUtiCYbzk
	 1IF8Dsbvto4JJXznoxos6SyCIOnUixcBhR0DvgiPpQ4mZf4uH2vybh0hlGDqbigLeC
	 SRDRuhLovmsrp9vfKkHTtTd6uumGXlboP2TDXh1fwhht8fK3KkWFcrmVyjiA8Sv58+
	 OGsVPKf+BOxMw==
Message-ID: <5be237d3-5b8d-42ee-a492-d5d7b075fe81@kernel.org>
Date: Wed, 28 May 2025 08:29:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
 <20250522150426.3418225-2-nancy.lin@mediatek.com>
 <d21e1775-d5d4-4f58-865e-0cb33d14f371@kernel.org>
 <9ada04bb73e980f981d3b933552f0eda47d4fd26.camel@mediatek.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <9ada04bb73e980f981d3b933552f0eda47d4fd26.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2025 06:01, Nancy Lin (林欣螢) wrote:
>>
>> Virtual regulators do not sound real, so feels like you want some
>> sort
>> of power domains?
>>
> This regulator supplies power to the power domain. Before the power
> domain can be powered up, the MediaTek PM driver first enables the
> regulator that the power domain relies on, and then powers up the
> domain. While "virtual" might not be the best term, it accurately
> describes a regulator used to control the power switch.
> 
> Ultimately, the VCP (uP) handles the on/off control of the regulator.
> Therefore, we encapsulate it as a standard regulator in the kernel.
> 
> The internal control of the VMM regulator is as follows:
>    kernel                 HWCCF                          VCP (uP)
> |--------------|      |--------------|   irq    |---------------------|
> | VMM reglator | ---> | hardware     |  ----->  | get buck on/off irq |
> |              |      | voter        |          | and then turn on/off|
> |              |      |              |          | buck                |
> |--------------|      |--------------|          |---------------------|
> 
> When the regulator needs to be turned on or off, it uses the voter
> provided by hwccf to cast a vote for on/off. The VCP then receives the
> corresponding IRQ for the regulator and performs the buck on/off
> accordingly.

OK, thanks for explanation.

> 
...

> 
>>> +
>>> +  mediatek,hw-ccf:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Phandle to the hardware common clock framework
>>> syscon controller.
>>
>> No, you cannot express clocks with syscon.
>>
> HWCCF is MediaTek's internal naming; the functionality of the hardware
> IP is voter. We use the IP to vote for buck on/off, and the VCP will
> get the voting result to perform buck on/off. I will refine the
> naming/description to "voter."


OK, that was a bit confusing, but now I have more questions:

Why isn't this a child of the HWCCF? You do not have here any resources,
so this looks just to instantiate device for Linux.

Looking at your diagram earlier (maybe include it in binding description
if this stays as is at the end) I would imagine phandle only to hwccf.
But you have two phandles - HWCCF and VCP.

So maybe this is part of VCP device, not HWCCF? I don't know. I am
afraid the moment I will suggest you something someone from Collabora
will be pointing out that my advice us wrong and I don't know this
hardware. Yeah, I don't know it. You should know it.

> 
>>> +
>>> +  mediatek,vcp:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Phandle to the Video Co-Processor (VCP) node.
>>
>> For what purpose?
>>
> This is used to ensure that the VCP uP is ready to receive the hwccf
> IRQ and handle the corresponding buck on/off operations.
> 
>>> +
>>> +patternProperties:
>>> +  "^(vdisp|vdec-vcore)$":
>>
>> Redundant nodes, useless. Drop these completely.
>>
> OK.
Best regards,
Krzysztof
