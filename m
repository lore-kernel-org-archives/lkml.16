Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B919F480;
	Tue, 24 Jun 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763054; cv=none; b=kV06ngbhV0KquqB+X4fRJwX5AhKH3rG/+KF+ATJuttvlwbUgtRZcJTwDF1Gwjv+AJyMOXxleiisrZ7gv529UPTGK1Asax7rmn+zQAyoon4OhyLPFnmrCHBPE2P6u7znnJlqaQ6gxlNdZPxnNxGPo9NxLexseQgUdEOK/7mW9vaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763054; c=relaxed/simple;
	bh=F+Ut0uhyqMWbQMweVF486zOFsPnCENVNVbpdP3ATUDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxK+N/pROvtx6aBrllK75L0Bj0AJKXdHWdK9daZrbSBGfiwgghkV8K7majR88I6kan5SV82AOMzsseY3KrAjxLKhgIBI10B+anjTVKh+ZpkSOWruUlbi7dkKEZVR6A9VMTuo40ov8G0wyUjVnFbmzJ5VmmOxcLPj5lQsFPbwI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqSv5D6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqSv5D6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCC4C4CEE3;
	Tue, 24 Jun 2025 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750763054;
	bh=F+Ut0uhyqMWbQMweVF486zOFsPnCENVNVbpdP3ATUDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZqSv5D6B0y7mg2AUQgSm69sMfGE/+ffsDWYi2wUe4Xn0nvLgdNvQP84vknLIJZIJf
	 fXKI1/WUNQ4IEETJT+qY/CN4rq+/pTMWfwkoC7/Hh2KREqWcxYwSxjg4qT2FE4tVv1
	 XSLdfkYuHxXhy/u3dtoqeUVcjx8Mdrf6lr29fk62QaRBC4KDymfgzbmNhtGpdF8UlR
	 zKKjJB4HNzT3c2pWM8RDNI2ubNqnpzJjuzNrliU3cmGLkojx2UvQY5Hj6iGDXGxBZ0
	 JP6Ob2fmhtW7aGg8pmn6Jzqp99Ro5q8qMBsNsOcBAd4EgGjpQ3VqxCibrZygz/Ve1O
	 8me8GOmI/JDGQ==
Message-ID: <420cc724-e6cf-42d9-b00b-558965bee085@kernel.org>
Date: Tue, 24 Jun 2025 13:04:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clock: eswin: Add eic7700 clock driver
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com
References: <20250624103212.287-1-dongxuyang@eswincomputing.com>
 <20250624103314.400-1-dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250624103314.400-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 12:33, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> This driver depends on the CCF framework implementation.
>   Based on this driver, other modules in the SoC can use the APIs
>   provided by CCF to perform clock-related operations.
>   The driver supports eic7700 series chips.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/clk/Kconfig             |    1 +
>  drivers/clk/Makefile            |    1 +
>  drivers/clk/eswin/Kconfig       |   10 +
>  drivers/clk/eswin/Makefile      |    8 +
>  drivers/clk/eswin/clk-eic7700.c | 3809 +++++++++++++++++++++++++++++++
>  drivers/clk/eswin/clk-eic7700.h |  194 ++



...


> +void eswin_clk_register_pll(struct eswin_pll_clock *clks, int nums,
> +			    struct eswin_clock_data *data, struct device *dev)
> +{
> +	void __iomem *base = data->base;
> +	struct eswin_clk_pll *p_clk = NULL;
> +	struct clk *clk = NULL;
> +	struct clk_init_data init;
> +	int i;
> +	static struct gpio_desc *cpu_voltage_gpio;
> +
> +	p_clk = devm_kzalloc(dev, sizeof(*p_clk) * nums, GFP_KERNEL);
> +
> +	if (!p_clk)
> +		return;
> +	/*
> +	 *In the D2D system, the boost operation is performed using the GPIO on Die0.

What is the Linux coding style of comment?

> +	 *However, the same GPIO pin cannot be acquired twice, so special handling is implemented:
> +	 *Once the GPIO is acquired,the other driver simply uses it directly
> +	 */
> +	cpu_voltage_gpio =
> +		IS_ERR_OR_NULL(cpu_voltage_gpio) ?
> +			devm_gpiod_get(dev, "cpu-voltage", GPIOD_OUT_HIGH) :
> +			cpu_voltage_gpio;
> +	if (IS_ERR_OR_NULL(cpu_voltage_gpio)) {
> +		dev_warn(dev, "failed to get cpu volatge gpio\n");
> +		cpu_voltage_gpio = NULL;
> +	} else {
> +		/*cpu default freq is 1400M, the volatge should be VOLTAGE_0_8V*/
> +		eswin_clk_set_cpu_volatge(cpu_voltage_gpio, VOLTAGE_0_8V);

Amount of typos and unreadable stuff like missing spaces in this driver
is just discouraging and making review unnecessary difficult. Fix the
typos, fix the style. Driver is also way too big for simple clock driver
and I am surprised to see so many redundancies.

Anyway, your binding said it is not 1400M but something else so this is
a mess.


Best regards,
Krzysztof
