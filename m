Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF026FA5C;
	Fri,  9 May 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774376; cv=none; b=mCS3+CdGx5rWHEl639wVVK3XhlvpyK5bSe63w9fiLJ2y+Q8fYI5kAVAQWO7atkvSt/rNoUEL2WPoph+sUZ83r2UdXu3KbV/DJx+Kf2/P0TtpybmfHTl5k15S4mcf6tfaVb4S9rV8TmtBAZ6qi6mJkThA4XTb/xX8Jb0O0pcw+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774376; c=relaxed/simple;
	bh=ttmv5irzEpM/ynDKw1BjJl4iEmL2XL36+Ltiqs40NgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnRg6wCFQYthkiqiRZNuU2bsKLQLEowurS8PmwKmqiqgQb4woBODKFU6nqjBPP/UtcIYvIX7oQvGgvHu/TbSmyM4o0S4rZrU/uAV/SzNvi24pI7mpbnTr8cl/5wA+K9+U2JNEusmYR9vlVl08Lj9C8130Pnck+wgQjMnuRLpD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWrqIGtA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWrqIGtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D2CC4CEE4;
	Fri,  9 May 2025 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746774376;
	bh=ttmv5irzEpM/ynDKw1BjJl4iEmL2XL36+Ltiqs40NgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KWrqIGtAvO+ToVnYjbCjHXwsEKPVzjIXUOGPZjSX+isoT9rJwk8zzb9xkGaoSx9Bk
	 NlT1dMtCOwLZGMId09yd2cc9F6DFmyVy5lWNIEsJk0MQu85R70+PnpziYH7r2VIoCd
	 ehsNorlDth4la1Ne0hekH0TKn9ee2sB2pGILxj0kGReqRg2izzVuXr+CrRKWEzH51s
	 zwYCDVojZ7z0uZqqEN690mn/kDjgesi8E3yCpkrBMMJOVEVHCtqLWbnEsYTzw1pCWp
	 U4oVMy+YQ9XUZfyWCPDTIaXqexdCbD4SgYCxhAQV8J78JcLf90v5FhMmiLssUbYg4S
	 HEK5R68WKdLjA==
Message-ID: <84c85750-18b2-46c4-b0cc-7bb663d03783@kernel.org>
Date: Fri, 9 May 2025 09:06:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] hwmon: pmbus: mpq8785: Add support for MPM3695
 family
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>, Fabio Estevam <festevam@gmail.com>,
 Michal Simek <michal.simek@amd.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Zijlstra <peterz@infradead.org>, Shen Lichuan <shenlichuan@vivo.com>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-4-paweldembicki@gmail.com>
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
In-Reply-To: <20250509065237.2392692-4-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 08:51, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM3695 family.
> It contains four devices with suffixes: -10, -20, -25 and -100.
> The device is PMBus compliant and shares characteristics with the
> MPM82504.
> 
> MPM3695-25 has different VOLTAGE_SCALE_LOOP register size [11:0]
> and it needs to be separated because it will be configured in the next
> commit.

This should be *this* commit. Add proper support for a device in one
commit. Not half-broken commit, being fixed later.

> 
> Tested with device tree based matching (MPM3695-10).
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> 
> ---
> v2:
>   - Added whole MPM3695 family
> ---
>  Documentation/hwmon/mpq8785.rst | 13 +++++++++----
>  drivers/hwmon/pmbus/mpq8785.c   |  8 +++++++-
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
> index be228ee58ce2..7093e4db4f55 100644
> --- a/Documentation/hwmon/mpq8785.rst
> +++ b/Documentation/hwmon/mpq8785.rst
> @@ -7,6 +7,7 @@ Supported chips:
>  
>    * MPS MPQ8785
>    * MPS MPM82504
> +  * MPS MPM3695 family
>  
>      Prefix: 'mpq8785'
>  
> @@ -29,6 +30,14 @@ The device can also operate in parallel with the MPM3695-100 and additional
>  MPM82504 devices to provide a higher output current. The MPM82504 operates
>  at high efficiency across a wide load range.
>  
> +The MPM3695 family is a scalable, ultra-thin, fully integrated power module with
> +a PMBus interface. It offers a complete power solution that achieves up to
> +10A (-10 variant), 20A (-25 variant), 25A (-20 variant), 100A (-100 variant)
> +of output current with excellent load and line regulation across a wide input
> +voltage range. It operates at high efficiency over a wide load range, and can
> +be parallled to deliver higher current. Variants -10,-20 and -100 have different
> +voltage scale configuration register range (10 bits) than -25 version (11 bits).
> +
>  The PMBus interface provides converter configurations and key parameters
>  monitoring.
>  
> @@ -42,10 +51,6 @@ Fully integrated protection features include over-current protection (OCP),
>  over-voltage protection (OVP), under-voltage protection (UVP), and
>  over-temperature protection (OTP).
>  
> -All supported modules require a minimal number of readily available, standard
> -external components. The MPQ8785 is available in a TLGA (5mmx6mm) package
> -and the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package.
> -
>  Device compliant with:
>  
>  - PMBus rev 1.3 interface.
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 9a4a211b2aeb..34245d0d2125 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -10,7 +10,7 @@
>  
>  #define PMBUS_READ_TEMPERATURE_1_SIGN	BIT(9)
>  
> -enum chips { mpq8785, mpm82504 };
> +enum chips { mpq8785, mpm82504, mpm3695, mpm3695_25 };
>  
>  static int mpq8785_identify(struct i2c_client *client,
>  			    struct pmbus_driver_info *info)
> @@ -79,6 +79,8 @@ static struct pmbus_driver_info mpq8785_info = {
>  static const struct i2c_device_id mpq8785_id[] = {
>  	{ "mpq8785", mpq8785 },
>  	{ "mpm82504", mpm82504 },
> +	{ "mpm3695", mpm3695 },
> +	{ "mpm3695-25", mpm3695_25 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(i2c, mpq8785_id);
> @@ -86,6 +88,8 @@ MODULE_DEVICE_TABLE(i2c, mpq8785_id);
>  static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
>  	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
>  	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
> +	{ .compatible = "mps,mpm3695", .data = (void *)mpm3695 },
> +	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> @@ -110,6 +114,8 @@ static int mpq8785_probe(struct i2c_client *client)
>  		info->identify = mpq8785_identify;
>  		break;
>  	case mpm82504:
> +	case mpm3695:
> +	case mpm3695_25:

So are these fully compatible? Looks like, so why aren't you expressing
it in the binding and here? No need for these redundant ID table entries.

>  		info->format[PSC_VOLTAGE_OUT] = direct;
>  		info->m[PSC_VOLTAGE_OUT] = 8;
>  		info->b[PSC_VOLTAGE_OUT] = 0;


Best regards,
Krzysztof
