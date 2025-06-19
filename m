Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC0242D69;
	Thu, 19 Jun 2025 05:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312009; cv=none; b=jblGZ+Yu33//X+7DE07U9OdwvduLPTQAitT7RGhkmp2K9HIXn4Vp5a1+iZRRUfEhoo7MmWLXHXl5diviADI1kDowbw0RsVOCm4R99i71MNN1JfKhkg8o6F8cnEgfTOQnLn9dw7AZvr/OvToEA38lE+qB88QMKJwOza5nldZhuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312009; c=relaxed/simple;
	bh=4S9XGg4nCpCNQhlQ1zGgYNASrs4TqBa8i2Q9xURUCkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UStmWQht1mwNyVp8L+6Paz3mivIrvd7tW/VpNlblGLXAC9ZTtZSNy2QV4kiUasedSI3Y2Ax91LCjkqErR/MNJtLAbHr+GHgwVI04GNZQToMXD2g/mV390LaL3d3Mk0IGAOL8OBImZi4eUniSWk94JcSvhF1VHP5C1UeHMXjfL1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.139] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAAHt9UrpFNods+JBw--.6421S2;
	Thu, 19 Jun 2025 13:46:20 +0800 (CST)
Message-ID: <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
Date: Thu, 19 Jun 2025 13:46:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250613210150.1468845-3-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowAAHt9UrpFNods+JBw--.6421S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF48Aw17uw17Ar1rAry5urg_yoW8Wry3pF
	Z8Zr93uF1UZFWF9w4DWrsruFyrGan7uFWjqFy3JwsIqFyq934jkr4DtFW7ZrWDJrWkGr42
	gw4F9r9rWF4UJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jkNVkUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 6/14/25 05:01, Alex Elder wrote:
> <snip>
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6fb3768e3d71c..c59ae6cc2dd8d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>  	  Say M here if you want to include support for the Qualcomm RPM as a
>  	  module. This will build a module called "qcom_rpm".
>  
> +config MFD_SPACEMIT_PMIC
> +	tristate "SpacemiT PMIC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on I2C && OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	default ARCH_SPACEMIT
> +	help
> +	  This option enables support for SpacemiT I2C based PMICs.  At
> +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
> +

Module name?

+	  To compile this driver as a module, choose M here: the
+	  module will be called spacemit-pmic.

>  config MFD_SPMI_PMIC
>  	tristate "Qualcomm SPMI PMICs"
>  	depends on ARCH_QCOM || COMPILE_TEST
>
> <snip>
>
> +static struct i2c_driver spacemit_pmic_i2c_driver = {
> +	.driver = {
> +		.name = "spacemit-pmic",
> +		.of_match_table = spacemit_pmic_match,
> +	},
> +	.probe    = spacemit_pmic_probe,
> +};
> +
> +static int __init spacemit_pmic_init(void)
> +{
> +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
> +}
> +
> +static void __exit spacemit_pmic_exit(void)
> +{
> +	i2c_del_driver(&spacemit_pmic_i2c_driver);
> +}
> +
> +module_init(spacemit_pmic_init);
> +module_exit(spacemit_pmic_exit);
> +

module_i2c_driver

Regards,
Vivian "dramforever" Wang

> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");

