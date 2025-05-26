Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59750258A;
	Mon, 26 May 2025 04:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748235200; cv=none; b=tEVRnqCjSQcSwrEsB6l+YXeDTklCvVZZAtRooMRCIHh3uXgE5Mto329aGz66zWkpK6tKYXuG7jPWAafrM+JJeZM58dLL/Hs54cPiSeNU4tB/7QtT5rlmX8BlrHFb11F4Dv1z0/2jzmgkZ9AuewkPUhynlKqWF55POje5w+8IZw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748235200; c=relaxed/simple;
	bh=zCPwO9I7YUx7bwOI98YWqW1MpDXUaLKfCoxxSMQKZAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjK9cMu281onqehoOtL6ZeRQ1NWpZ7P4kyEPhkYr9kTyMQ3+Wk9966xQdKP1L5ikeJCZU4/zaJlYT+YMEvHO94cwVXo9VLLa64ezI0D1GpYnwC/jmnmHPJkYuMSc/XPdzX/9pvOF3zdhAAMojyDbumkB1gjADkS+v0dYZakPsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6e0y2an; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6e0y2an"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB94C4CEE7;
	Mon, 26 May 2025 04:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748235198;
	bh=zCPwO9I7YUx7bwOI98YWqW1MpDXUaLKfCoxxSMQKZAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X6e0y2anCZAsDGYggzY2Cuw9VJficZa8yxj3FB0+d/dPWTZQhT85WC2Ch+xeOufpI
	 eb9Tsy+Lb/JGyMSax8BAxijBwajHmn4siDMzSccx4OA8ZIl1vQVJgY20LXatWG55mr
	 dQZkZEB1zBY233UFASOdd3sQLaCLYL1p7MPWzF3/zNf/Cu4DNQQhzu2fxM3wm5y81l
	 wY/s35GnaYznc0X/vqtIdRHF1cz3BJa/1rXMBXCHezVJPRGm+rm9epuz/C37qOyyOp
	 8z000cJcMto1T/E7wPHOouPhHHygOP3lBGzdMozaBao6KaqZLeYxpncyaVT8QYFcGM
	 27/1bQpJU54CQ==
Message-ID: <e7efac3d-8dbf-4370-8f36-ffa9351593c0@kernel.org>
Date: Mon, 26 May 2025 06:53:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: clk: fixed-mmio-clock: Add optional
 ready reg
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jank@cadence.com
Cc: edgar.iglesias@amd.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
 <20250525190806.1204531-2-edgar.iglesias@gmail.com>
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
In-Reply-To: <20250525190806.1204531-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/05/2025 21:08, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add an optional ready register and properties describing bitfields
> that signal when the clock is ready. This can for example be useful
> to describe PLL lock bits.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  .../bindings/clock/fixed-mmio-clock.yaml      | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> index e22fc272d023..90033ba389e8 100644
> --- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> @@ -10,6 +10,11 @@ description:
>    This binding describes a fixed-rate clock for which the frequency can
>    be read from a single 32-bit memory mapped I/O register.
>  
> +  An optional ready register can be specified in a second reg entry.
> +  The ready register will be polled until it signals ready prior to reading
> +  the fixed rate. This is useful for example to optionally wait for a PLL
> +  to lock.
> +
>    It was designed for test systems, like FPGA, not for complete,
>    finished SoCs.
>  
> @@ -21,7 +26,10 @@ properties:
>      const: fixed-mmio-clock
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Fixed rate register
> +      - description: Optional clock ready register
>  

I am not convinced we actually want this. If you have more complicated
clocks which need more than one register, then maybe this is too complex
for generic device and you should just make this part of clock controller.

Also I wonder how a clock, which is not controllable, cannot be gated,
can be ready or not. Issue is easily visible in your driver:
1. Probe the driver
2. Clock is not ready - you wait...
3. and wait and entire probe is waiting and busy-looping
4. Probed.
5. Unbind device
6. Rebind and again we check if clock is ready? Why? Nothing changed in
the hardware, clock was not disabled.

Although above is maybe better question for driver design, but it still
makes me wonder whether you are just putting driver complexity into DT.

>    "#clock-cells":
>      const: 0
> @@ -29,6 +37,25 @@ properties:
>    clock-output-names:
>      maxItems: 1
>  
> +  ready-timeout:
> +    description:
> +      Optional timeout in micro-seconds when polling for clock readiness.
> +      0 means no timeout.

Use a proper unit suffix.
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

> +    $ref: /schemas/types.yaml#/definitions/uint32

Drop

> +    default: 0
> +
> +  ready-mask:
> +    description:
> +      Optional mask to apply when reading the ready register.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0xffffffff
> +
> +  ready-value:
> +    description:
> +      When a ready register is specified in reg, poll the ready reg until
> +      ready-reg & ready-mask == ready-value.
> +    $ref: /schemas/types.yaml#/definitions/uint32


> +
>  required:
>    - compatible
>    - reg
> @@ -44,4 +71,13 @@ examples:
>        reg = <0xfd020004 0x4>;
>        clock-output-names = "sysclk";
>      };
> +  - |
> +    pclk: pclk@fd040000 {

clock@

And drop unused label

> +      compatible = "fixed-mmio-clock";
> +      #clock-cells = <0>;
> +      reg = <0xfd040000 0x4 0xfd040004 0x4>;
> +      ready-mask = <1>;
> +      ready-value = <1>;
> +      clock-output-names = "pclk";
> +    };
>  ...


Best regards,
Krzysztof
