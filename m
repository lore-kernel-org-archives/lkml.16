Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A31CCB4B;
	Wed,  7 May 2025 04:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593766; cv=none; b=BBV/Q5invojCQd0vUZgAlgiutdTHeNert1AXsv/hHUBM99+jadD92zf/vd+bzpajB6enL+PHq1R36wjjCV6DcV7+9X9CnIfCeU3qmMOHlnAlGupkceLdLoy/6hzLcWYJDnTzvVf6K31kLJ57YGCFCC7ubhCHfcyQCdOacEg6rPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593766; c=relaxed/simple;
	bh=QCuW5NH1T2M/o6Jr1yHAeqbYOFeEHiPe4yZYKvfSHGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFiuP6GKOrDvcb03ulsMpyXZH8QqREv1ZYIdYQNeKXwLtDZfZjo9cRNBUQMPGCa4Y13TVhDMAPVDI6mF/G+iBe1bl1pEM5hiwvjGd5j8j7tianYUE/5tNPGXrLPvXQRhnRD6Q4kiVaMjYdi2nMgZ8WbTd47TeflPGSiwiqr0B5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCJxrTDP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCJxrTDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E8C4CEE7;
	Wed,  7 May 2025 04:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746593766;
	bh=QCuW5NH1T2M/o6Jr1yHAeqbYOFeEHiPe4yZYKvfSHGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCJxrTDPUnAJFhAuHRhHtcLnLUT+xJ3eomn5H/uqToMWGhKchJzKROEVT+zjcHBFI
	 B8yOEYaRDvlInEiUibdo9Ax6X5/WBHVa+QDj/i23rDX6IiS4oZTVHALkRAylJm5PdR
	 Ho39ZHI+xQ5v/mpJ5l+8x27rz3gAh5ZFPDNksxRjbZoN7UcdWI3syxNT/qiTTQVFsH
	 Y380oBubxEkJ1GLOGAGzgF1CbMayWy8k/NtdyG2XSrhBHYat56syjg1dcixz621IDs
	 cAeSF9sei2jM9slPn6jOrTSchaXSjhRAFRznq0QlOKhGk/0t3FuTpPl/aytWBtTvJw
	 +Ggo+Ahk/4Q7g==
Message-ID: <128b0ef7-cf0f-41d6-855a-cb3ea70eca18@kernel.org>
Date: Wed, 7 May 2025 06:56:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-2-ioana.ciornei@nxp.com>
 <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
 <wna3loahthqbn5hnw2pbt3yznmzzv3zppi7f2nblvq3t22jdc2@7cse4r4p6q5z>
 <959b56f0-ff63-485b-86eb-96ae32bdeb88@kernel.org>
 <miuxxgv73fmsl5plcoso73dk6bnuwgmlydzupnb7fcz6ub72ra@dro4cqbn67jt>
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
In-Reply-To: <miuxxgv73fmsl5plcoso73dk6bnuwgmlydzupnb7fcz6ub72ra@dro4cqbn67jt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 16:16, Ioana Ciornei wrote:
> On Tue, May 06, 2025 at 04:05:46PM +0200, Krzysztof Kozlowski wrote:
>> On 06/05/2025 15:57, Ioana Ciornei wrote:
>>> On Fri, May 02, 2025 at 09:01:59AM +0200, Krzysztof Kozlowski wrote:
>>>> On Wed, Apr 30, 2025 at 06:36:29PM GMT, Ioana Ciornei wrote:
>>>>> This adds device tree bindings for the board management controller -
>>>>> QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
>>>>> LX2160AQDS, LS1028AQDS etc.
>>>>>
>>>>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>>>>> ---
>>>>>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
>>>>>  1 file changed, 65 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..562878050916
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
>>>>
>>>> Filename matching compatible.
>>>
>>> How to choose one if there are multiple compatible strings?
>>
>> The fallback or the oldest or the lowest number or whichever you prefer
>> as a base.
>>
>>>
>>>>
>>>>> @@ -0,0 +1,65 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml
>>>>> +
>>>>> +title: NXP's QIXIS CPLD board management controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
>>>>> +
>>>>> +description: |
>>>>> +  The board management controller found on some Layerscape boards contains
>>>>> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
>>>>> +  etc.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - fsl,lx2160a-qds-qixis-i2c
>>>>> +      - fsl,lx2162a-qds-qixis-i2c
>>>>> +      - fsl,ls1028a-qds-qixis-i2c
>>>>
>>>> Keep alphabetical order.
>>>>
>>>> What is actual device name? I2C? Is this an I2C controller or device?
>>
>> I assume you will then drop the redundant part.
> 
> Ok, I will drop the i2c part. Are you ok with the below compatible
> strings?
> 
> 	- fsl,lx2160a-qds-qixis-cpld
> 	- fsl,lx2162a-qds-qixis-cpld
> 	- fsl,ls1028a-qds-qixis-cpld


Not really, because you keep ignoring comments. What is the device name?
Can qixis be anything else than i2c or cpld? Use that name for the
compatible.


Best regards,
Krzysztof
