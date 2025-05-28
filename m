Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557DA82899;
	Wed, 28 May 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423104; cv=none; b=QezL66qjnmGcRctllyqorDrAlZQUdb5hJJvHldrLB9X4fdCw9Xl2sLbS2aB9TtfpTIo3BhUvdZBpHGDYnp+YW0Nu44felbSNwJEW7Lby9Z03nw/vNy6sM7AG2idSZPrOHFHv4wugMCjRRDC36eVjH59pu8Jux5SMlJ4cMgW6mJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423104; c=relaxed/simple;
	bh=H4qTJAgQkqzg2T/n9OCdD55Dx5Fmz+dp8Gq6HHYqBdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuWVVtskWOJC4jf83TU+7mjO/NzgAj72AsMWaVpevWtwY2OiG9kCUh4lyfgA+q48KyNNPOKMpZ17u7x5ZQkHxT1bqFH3vow2SN2xmuvqAm6ov0j/b2m/ewoGIHkeVsObzziHQscjC7yqIYCl8dMAxCFZ1GB53+qksBdPEktDiKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiD4KHw8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiD4KHw8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D61C4CEE7;
	Wed, 28 May 2025 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748423103;
	bh=H4qTJAgQkqzg2T/n9OCdD55Dx5Fmz+dp8Gq6HHYqBdw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DiD4KHw81TFLxKlaoZsfc1sUc+5gMM9knpiopZZgKe+EkbqIduFetCdU4G9fuqEI8
	 ULOxJPzaQwnwA585GMMYFtxKCyjahGyZHur2K7sHLGAihfANjrVnLVs2qcBlrd7YZ7
	 SXF61CSIL8yVEDArxy9/dQK+o1FK6PXdf+ZubomCehpA99w8duaq/i5qXD668Ei0Il
	 V9UvbbkJwwpd1P/YeGZRRLwtFaSdR0phlmz2YwtPLjo+pUpPfayq/Zl9pCI9Wqhxn+
	 aIQRlJEaaI9DqM9PfsFxiFE+C6O+Skkm3jssmABW0mD5zA5aPcwrQRAl0BXQy1sKH6
	 /xh1dnaN6AJkw==
Message-ID: <4134d72c-94f1-4b52-a372-34a305b3ea19@kernel.org>
Date: Wed, 28 May 2025 11:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] dt-bindings: arm: add Black Sesame Technologies
 (bst) SoC
To: Albert Yang <yangzh0906@thundersoft.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528085444.481163-1-yangzh0906@thundersoft.com>
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
In-Reply-To: <20250528085444.481163-1-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 10:54, Albert Yang wrote:
> Add device tree bindings for Black Sesame Technologies Arm SoC,
> it consists several SoC models like C1200, etc.
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  .../devicetree/bindings/arm/bst.yaml          | 34 +++++++++++++++++++

... so now I see patch 2/9 disconnected from the rest.

Just use b4 for submitting and you will avoid several easy mistakes.


>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/bst.yaml b/Documentation/devicetree/bindings/arm/bst.yaml
> new file mode 100644
> index 000000000000..e21a37130cef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bst.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/bst.yaml#

Missing vendor prefix.... unless 1/9 was there and will come sometime in
the future. :/

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BST platforms
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Black Sesame Technologies (BST) is a semiconductor company that produces
> +  automotive-grade system-on-chips (SoCs) for intelligent driving, focusing
> +  on computer vision and AI capabilities. The BST C1200 family includes SoCs
> +  for ADAS (Advanced Driver Assistance Systems) and autonomous driving applications.
> +
> +maintainers:
> +  - Ge Gordon <gordon.ge@bst.ai>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: BST C1200 family platforms
> +        items:
> +          - const: bst,c1200

Drop this entry. You cannot have SoC aloone.



Best regards,
Krzysztof
