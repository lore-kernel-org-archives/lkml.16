Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973573085A9;
	Thu, 19 Jun 2025 06:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313743; cv=none; b=eY3c9BYoIECq1gebm8RaNOzjgYVHw+tfRbAhm2oZUmR+Tq1FNPbxQsX2TqnJiC+qOg40tQ6QuNyelBjc+6gJEIqdfXptP1fJCOBg+s4zRd0EDM44mGPXVVdj6HNYzpeW4QIZUv5pDktCpJSwELB1QfgqwFGg1Oc+1/37oL9CkLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313743; c=relaxed/simple;
	bh=ByEiA4j+UXW4Q9BDuiOMKbZSr+Mx89lc9MWICsEynCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUW658adZs5ZLKR5G9Y+WgOufP8ptUdcJtwTsBojOdbTdA/Z376+36f2c4ugFfXS8fXowUYFpy0PpppPS214z4SRW8mlJqxw+yXeyDF1v2Xqx+v6K3WSZBrydg0JlWuSA12VdyrwA/UkMnUMdLYMlLZCh5gas6CxLqqYsMK2aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.139] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowACHONf6qlNoGg+LBw--.43032S2;
	Thu, 19 Jun 2025 14:15:23 +0800 (CST)
Message-ID: <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Date: Thu, 19 Jun 2025 14:15:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250613210150.1468845-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowACHONf6qlNoGg+LBw--.43032S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4xXF1xZFWktr1DKr18Grg_yoW8Ww1UpF
	s0vr9xCr1ktFWrur4xur9Fy3W5W3Z3XasrAry8Jw45W3yDCF1xZr4DtF43ZF1kZrn5Gr12
	934kuF4xWFnxWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUB1SrDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 6/14/25 05:01, Alex Elder wrote:
> <snip>
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 6d8988387da45..7bb7b8fad24f2 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1384,6 +1384,15 @@ config REGULATOR_SLG51000
>  	  The SLG51000 is seven compact and customizable low dropout
>  	  regulators.
>  
> +config REGULATOR_SPACEMIT_P1
> +	tristate "SpacemiT P1 regulators"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	default ARCH_SPACEMIT
> +	help
> +	  Enable support for regulators implemented by the SpacemiT P1
> +	  power controller.  The P1 implements 6 high-efficiency buck
> +	  converters and 12 programmable LDO regulators.
Needs module name in help text, as is the case with spacemit-pmic.
> +
>  config REGULATOR_STM32_BOOSTER
>  	tristate "STMicroelectronics STM32 BOOSTER"
>  	depends on ARCH_STM32 || COMPILE_TEST
>
> <snip>
>
> +static struct platform_driver p1_regulator_driver = {
> +	.probe = p1_regulator_probe,
> +	.driver = {
> +		.name = "spacemit-p1-regulator",
> +	},
> +};
> +
> +module_platform_driver(p1_regulator_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
> +MODULE_LICENSE("GPL");

If this driver is compiled as a module, it needs to be found by modalias
so the driver auto-loads after spacemit-pmic registers the regulator
device, so you need:

+MODULE_ALIAS("platform:spacemit-p1-regulator");

Also, consider extracting the name to a macro:

#define DRV_NAME "spacemit-p1-regulator"

Also, consider naming this consistently: "spacemit-p1", or
"spacemit-p1-regulator"?

Regards,
Vivian "dramforever" Wang

