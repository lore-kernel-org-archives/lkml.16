Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943711B808;
	Fri, 16 May 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401963; cv=none; b=ZqOPWtscfz/QAbO31tCvoN95S458V5Z6Yf9LSqlEEoHpgHgunQ7bt4/AH7J76H8OimZPnFK8yeDDAmWsD39LVHyui7osMIxGpg+gHa/Dr6SR3dgRAMMkRG5X8RO0Xj5JzBmdOFC3foYrhunpKBR377IitFgg0cSfl3H8g/X/1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401963; c=relaxed/simple;
	bh=nQjE6Jrz6civm7hI/KIbRAh1jWVqVEKXTY2SoGHgjwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=As6uSklauIuG9zxFDPwa5/2dtM4IwQ13jRUgGwjJwUS5yFtS/aICUEQwlrkmpZO4uNckhi0tU/iHL96fIm8dPx1F2w/5AQoEOgZG73LprEmbzbm4HQaEpDWAeJX0BaZoGhU0g5Mk6mM0pkwWgpbSfMmIe0L6WFnvmSAbhWdm7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKkkJtjr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKkkJtjr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C3CC4CEE4;
	Fri, 16 May 2025 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747401963;
	bh=nQjE6Jrz6civm7hI/KIbRAh1jWVqVEKXTY2SoGHgjwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DKkkJtjruqUo8MNo4SqVVqfMunKCjkcOBB90zoGmRoMSj87RA+Ccv7FbwakEJqvQn
	 33zrju6gHjzV+x8YJvRVFfHSJKyzbCvFW/YE4D5bMOPG4rxz5iWkUqFQwGXlI7JRij
	 0gGz9rJQbxDEM/4HUIgKw4aicl2pAfRPkvf0i3XYRElPY0vHMHfBQyZ4Kaf/wpLcRU
	 LOD9PwGdxmF+qbfmXMVclq2xIZKvX8Ky5hkZH1o6aaAqzRUvTpVmVqt0GRDs5qgD0H
	 HEAzkL3/1K5X2YvxJNUF5Y2VslfJwGUqv+8v6NR3vaw97V6Wg0UZsOfQ0xG9zD5xJU
	 K9TcsnbcfDJmQ==
Message-ID: <f6fbc6f6-aaba-4303-9c2f-fc985a2a3c83@kernel.org>
Date: Fri, 16 May 2025 15:25:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] reset: eswin: Add eic7700 reset driver
To: dongxuyang@eswincomputing.com, p.zabel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com
References: <20250514002945.415-1-dongxuyang@eswincomputing.com>
 <20250514003209.531-1-dongxuyang@eswincomputing.com>
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
In-Reply-To: <20250514003209.531-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/05/2025 02:32, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add support for reset controller in eic7700 series chips.
> Provide functionality for asserting and deasserting resets
> on the chip.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/reset/Kconfig         |   9 ++
>  drivers/reset/Makefile        |   1 +
>  drivers/reset/reset-eic7700.c | 249 ++++++++++++++++++++++++++++++++++
>  3 files changed, 259 insertions(+)
>  create mode 100644 drivers/reset/reset-eic7700.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e68..d6eef5358e13 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -350,6 +350,15 @@ config RESET_ZYNQMP
>  	help
>  	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
>  
> +config RESET_EIC7700

E is not after Z. Don't add your entries to the end. This applies to all
your patches.

> +	bool "Reset controller driver for Eswin SoCs"
> +	default ARCH_ESWIN
> +	help
> +	  This enables the reset controller driver for Eswin SoCs. This driver is
> +	  specific to Eswin SoCs and should only be enabled if using such hardware.
> +	  The driver supports eic7700 series chips and provides functionality for
> +	  asserting and deasserting resets on the chip.
> +
>  source "drivers/reset/amlogic/Kconfig"
>  source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9..2210c4e55834 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -44,3 +44,4 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
> +obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o

E is not after Z.


> +static int eswin_reset_probe(struct platform_device *pdev)
> +{
> +	struct eswin_reset_data *data;
> +	struct device *parent;
> +
> +	parent = pdev->dev.parent;
> +	if (!parent) {
> +		dev_err(&pdev->dev, "no parent\n");

Not possible. Fix your DTS otherwise.

> +		return -ENODEV;
> +	}
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = syscon_node_to_regmap(parent->of_node);
> +	if (IS_ERR(data->regmap)) {
> +		dev_err(&pdev->dev, "failed to get parent regmap\n");
> +		return PTR_ERR(data->regmap);

Syntax is always: return dev_err_probe. You already got such comment.
All your patches repeat the same issues.

> +	}
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.ops = &eswin_reset_ops;
> +	data->rcdev.of_node = pdev->dev.of_node;
> +	data->rcdev.of_reset_n_cells = 2;
> +	data->rcdev.of_xlate = eswin_reset_of_xlate;
> +	data->rcdev.dev = &pdev->dev;
> +	data->dev = &pdev->dev;
> +	idr_init(&data->idr);
> +
> +	/*clear boot flag so u84 and scpu could be reseted by software*/
> +	regmap_set_bits(data->regmap, SYSCRG_CLEAR_BOOT_INFO_OFFSET,
> +			CLEAR_BOOT_FLAG_BIT);
> +	msleep(50);
> +	platform_set_drvdata(pdev, data);

Drop, no need to do it twice.


> +
> +	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +}
> +
> +static void eswin_reset_remove(struct platform_device *pdev)
> +{
> +	struct eswin_reset_data *data = platform_get_drvdata(pdev);
> +
> +	idr_destroy(&data->idr);
> +}
> +
> +static struct platform_driver eswin_reset_driver = {
> +	.probe	= eswin_reset_probe,
> +	.remove = eswin_reset_remove,
> +	.driver = {
> +		.name		= "eswin-reset",
> +		.of_match_table	= eswin_reset_dt_ids,
> +	},
> +};
> +
> +static int __init eswin_reset_init(void)
> +{
> +	return platform_driver_register(&eswin_reset_driver);
> +}
> +arch_initcall(eswin_reset_init);


Best regards,
Krzysztof
