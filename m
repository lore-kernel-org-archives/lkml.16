Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825452459EA;
	Wed, 28 May 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419600; cv=none; b=leAZFwzOEE8OtRGJi/Hr1Q+dGs+Z3FW2xdrTYoQjjkIYm9e9y37t38x/8i/pSYn4NEqydcFv+1Np52NbhCAsnSR4DUKMHeMGwmz13+wBwCf5WmK+qPvJTfEeO8kPn4EsgulxDHhpncW0OmPGry+DF2fP8ZBMASWiqcW3LlPszwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419600; c=relaxed/simple;
	bh=SW97+/6o0Bda4FjXubNbdRzpoyh+i+v91gUy6eOTLnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zc53j/kawKnTqE5C6fNhEMWdYnnQtl2sC2Sl4jaPd3QDVb81rWxggr2c3mSfqEl5/WVTuVftQsZSHte9h2zE9lLCJihaHgicQu+6EdvvIWdlyV12g8/+UJb+HjWO9xtrLXtgDiz1moGXitQ6RsadbaaDqy6DNbgCEMlqefkdgos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnXdCUZ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnXdCUZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBC9C4CEEF;
	Wed, 28 May 2025 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419600;
	bh=SW97+/6o0Bda4FjXubNbdRzpoyh+i+v91gUy6eOTLnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MnXdCUZ4xGgmcADcuH8m4JaGdkcG7IZRZVNxJV6pOk2wBRf6P7LFmWZg8ikKdSok5
	 c/F6aAGMEBlRBrDRt/0v57upw4kP0EuWXE3UrGyatLFJvYRMzBLHPmvkdmB5d/oLKr
	 slMAAbBnaKTMUsEm9zidYETJLxMPMUI4n/LVANKTGj/1E3nz3lcaimGUT1lc1WIdiW
	 4wVWMcfPU3OM16wZ8rC56c78a9qnN65CRqByN+++s3UEbs4rM9K34I1zAD79FqWiEb
	 /BnkFFncv1s8JN4vK6Sr8HmTzANGCdWgoCSkrr8XsiSSNdfc46VhNvD6TwAMmvIMJ2
	 NzdPz5jnu8OOQ==
Message-ID: <412231e0-5fcf-4708-aeab-cc3aa38c817e@kernel.org>
Date: Wed, 28 May 2025 10:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
To: Ayush Singh <ayush@beagleboard.org>,
 Herve Codina <herve.codina@bootlin.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, devicetree-compiler@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
 <20250430125154.195498-2-herve.codina@bootlin.com>
 <0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
 <6c61a101-6ec7-4350-bfa7-5b7d32177818@beagleboard.org>
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
In-Reply-To: <6c61a101-6ec7-4350-bfa7-5b7d32177818@beagleboard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2025 09:59, Ayush Singh wrote:
> On 5/28/25 00:01, Krzysztof Kozlowski wrote:
> 
>> On 30/04/2025 14:51, Herve Codina wrote:
>>> An export-symbols node allows to export symbols for symbols resolution
>>> performed when applying a device tree overlay.
>>>
>>> When a device tree overlay is applied on a node having an export-symbols
>>> node, symbols listed in the export-symbols node are used to resolve
>>> undefined symbols referenced from the overlay.
>>
>> I have impression that this is being discussed in three places
>> simultaneously - here, DT spec and DT schema. I don't know how to solve
>> the multiplication, but I will keep answering here, because that's my part.
>>
>>> This allows:
>>>    - Referencing symbols from an device tree overlay without the need to
>>>      know the full base board. Only the connector definition is needed.
>>>
>>>    - Using the exact same overlay on several connectors available on a given
>>>      board.
>>>
>>> For instance, the following description is supported with the
>>> export-symbols node:
>>>   - Base device tree board A:
>>>      ...
>>>      foo_connector: connector1 {
>>>          export-symbols {
>>>             connector = <&foo_connector>;
>>>          };
>>>      };
>>>
>>>      bar_connector: connector2 {
>>>          export-symbols {
>>>             connector = <&bar_connector>;
>>>          };
>>>      };
>>>      ...
>> And what would this mean? Which symbol is exported - foo or bar?
>>
>>>   - Base device tree board B:
>>>      ...
>>>      front_connector: addon-connector {
>>>          export-symbols {
>>>             connector = <&front_connector>;
>>>          };
>>>      };
>> <from my other reply in private>
>> Another problem is that the board DTS should not care about overlays. It
>> feels like breaking encapsulation and I cannot imagine now adding 1000
>> export-symbols, because every i2c, spi, mikrobus or PCI slot could have
>> an overlay applied.
>>
>> You could argue that only few nodes will be exported like this, so only
>> real mikrobus connectors. Then I will argue: look at aliases. People
>> alias everything everywhere, not following the guidelines.
>>
>> If we assume that such overlays are designed for specific boards, thus
>> there will be only one or two exported symbols not 1000, then what is
>> the benefit of export symbols comparing to referencing by full path?
>> </end from my other reply>
> 
> Can you explain how referencing by full path will work in connector + 
> addon board setups?
> 
> The full path will be dependent on the connector, which means the same 
> addon  board overlay cannot work for different connectors.

That was the assumption.

> 
> 
>>
>> And with above assumption - such overlays designed per board - plus my
>> first point about duplicated exports:
>> connector = <&foo_connector>;
>> connector = <&bar_connector>;
>>
>> why not exporting the symbol with the same name? E.g.:
>>
>>       foo_connector: connector1 {
>>           export-symbols {
>>              whatever-property-style = <&foo_connector>;
>>           };
>>       };
>>
>> and overlay:
>>
>>       node {
>>           ...
>>           connector = <&foo_connector>;
>>           ...
>>       };
> 
> 
> Isn't this overlay tied to `foo_connector`, i.e. it cannot be used with 
> `bar_connector`?

I don't know what the example tried to say. I asked the question, so
don't ask question to my question. We both apparently do not know. What
is the meaning of that example I questioned? To which connector this is
an overlay? Which symbol is exported for that example?

Best regards,
Krzysztof
