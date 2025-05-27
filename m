Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61F4257440;
	Tue, 27 May 2025 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344498; cv=none; b=qGfg6ol3aDmsat4k1zhh+6as1lRQ0SNfV5cCfm2ywkxM43237sSy9AyCBAmizseIAgwe6N3KlEyBoyONKnl+jNTHWxptnnRNBC337KrxVPXS48fJhFxL+i26NAp7RIDWQgA6JteouXkav7QnDnkmjKa2GpntQHstbBHqlGJUPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344498; c=relaxed/simple;
	bh=ASrlNAyoliDAV7PmutncO6k6uYN8Dql4RbNrU7BpEaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcJp5EHlc8GnOtLWnOcE7Qn4pBV1nfqKX/LwIt0rcE+0d7GN2dfcKYs7AN5COU9nT2rrHT3qI8YwsT1euufbaiAOrT8rXHcOgZXTYLQbdGvwhveumMf4qQTCigae1FXGIqK0G/9ouWoOXBHuGrZ2iczpKj8UdQ1Dkmx8tP8YOQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fh1EpmDj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fh1EpmDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A7DC4CEE9;
	Tue, 27 May 2025 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748344498;
	bh=ASrlNAyoliDAV7PmutncO6k6uYN8Dql4RbNrU7BpEaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fh1EpmDjwfevwHr3yQDHnoiB6/w0B90iucBQE3nCTXpIT+1JGk7Cs/rs/KsbZocXO
	 3MahUEa9AbdOdNPjn8NGOEFohM5EWjtQYTptZ0W6qQ5865thlun6Ck79xr1qAbkdIb
	 0l1KFrYVB5asFVzhB7b5e2xvRnhjT9pnBaTHXMcvkVaZNi1P502ryjQuB+cjZBFsiA
	 ZrGM84BTKDuNfwExuAysExvcRHpHoSZpjxBZMFZ0f7doBPIIJQtRjChMVDog+ArVW0
	 s1PyPyfvSFlLG8VF+JrfSEDoDYkFQtm0GNt+kDkfEqC7WYEZopys+P9SeesksKDKWE
	 bi0lezxYpdYvA==
Message-ID: <0225b57c-1240-4382-a15a-6fa16abdec14@kernel.org>
Date: Tue, 27 May 2025 13:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
To: Johan Hovold <johan@kernel.org>
Cc: alejandroe1@geotab.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
 <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>
 <dd1540f7-f4f8-4cf4-a448-aa91b71dd42d@kernel.org>
 <aDWXi7qBnkt3nTNW@hovoldconsulting.com>
 <c36055f3-c10d-4f33-a4bf-b6aff8f04852@kernel.org>
 <aDWb4ZlBgr_oSaGH@hovoldconsulting.com>
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
In-Reply-To: <aDWb4ZlBgr_oSaGH@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 13:02, Johan Hovold wrote:
> On Tue, May 27, 2025 at 12:51:12PM +0200, Krzysztof Kozlowski wrote:
>> On 27/05/2025 12:44, Johan Hovold wrote:
>>> On Tue, May 27, 2025 at 10:35:14AM +0200, Krzysztof Kozlowski wrote:
>>>> On 23/05/2025 13:52, Krzysztof Kozlowski wrote:
>>>>> On 23/05/2025 13:19, Alejandro Enrique via B4 Relay wrote:
>>>>>> From: Alejandro Enrique <alejandroe1@geotab.com>
>>>>>>
>>>>>> Add compatible for u-blox NEO-9M GPS module.
>>>>>>
>>>>>> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
>>>>>> ---
>>>>>> This series just add the compatible string for u-blox NEO-9M module,
>>>>>> using neo-m8 as fallback. I have tested the driver with such a module
>>>>>> and it is working fine.
>>>>>> ---
>>>>>
>>>>> I assume there is a user somewhere?
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Un-reviewed. Please drop the patch. It turns out there is no user for
>>>> this binding. We don't take bindings for every possible device out there
>>>> - you need users of that binding.
>>>
>>> No, we don't require manufacturers to upstream their machine dts.
>>
>> No, we don't take bindings for whatever is there. In any case, drop my
>> review tag.
> 
> Perhaps not for whatever, but here we have an actual user that needs
> this binding do I'll take it.

Great, I understand above that I can send you bindings for multiple
devices I have (or had and still have interest in or my previous
employer has interest in), which are used in downstream products, and
you will take these bindings?

That would be cool, because I have bunch of GNSS devices related to my
pre-previous job, which I would really like to upstream.

Is my understanding correct?

Best regards,
Krzysztof
