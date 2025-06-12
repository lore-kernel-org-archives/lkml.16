Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7621FF2C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717441; cv=none; b=n5Gh8F1wghgMN/arJPbnKHDoOyXjbdjn4SbyTLR7ShiOpzzqYWwwFaqGdxJg6YjN/zFC0Y+aHicRT1jXJn1JgtPpfgLUXhHW2FSp7V3B5bUE2tRMrPe+BpomoZ8BhMDnvf31HSsILKx7EnJmIk80SXZZU1PP0L3v21gGcN/aqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717441; c=relaxed/simple;
	bh=Levvf+q7+tI4Lv5LZIJ9wD3rKxpeAC8M1hMgG2bsUaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMvr8kUmkgu9GuE4sbTL79/pedGvQIxFw6p5GWBUVJddXj0D4EDEYVQI43xJvDtNHDIhyGvDZI870LgyFYhMQf+99s8QRQ/Xaa3jC88RORTxUcMDUi4iTt/EIjkSkNcG0IllITdd3zKgDot0i5NfOwQhOGwlW/f1Ut3v4XzIg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB3AB4386A;
	Thu, 12 Jun 2025 08:37:15 +0000 (UTC)
Message-ID: <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
Date: Thu, 12 Jun 2025 10:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Guodong Xu <guodong@riscstar.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihs
 ehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepghhuohguohhnghesrhhishgtshhtrghrrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

Hi Yixun,

On 6/11/25 16:56, Yixun Lan wrote:
> Changes to defconfig should be always updated via 'make
> savedefconfig', run this command to make it aligned again.
>
> This will ease the effort of reviewing changes of defconfig
> in the future.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Update PDMA config bring in unnecessary changes[1], let's fix
> it by run savedefconfig first.


It would be easier if this patch was part of the PDMA series since the 
last patch will depend on it: @Guodong can you integrate this patch to 
your next revision of your patchset?

Thanks,

Alex


>
> This patch is based on top of tag 6.16-rc1.
>
> Link: https://lore.kernel.org/all/20250611134859-GYA125008@gentoo/ [1]
> ---
>   arch/riscv/configs/defconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index fe8bd8afb4183ce871020fb2992a21a13bccbc87..37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -134,6 +134,7 @@ CONFIG_MACB=y
>   CONFIG_E1000E=y
>   CONFIG_R8169=y
>   CONFIG_STMMAC_ETH=m
> +CONFIG_DWMAC_THEAD=m
>   CONFIG_MICREL_PHY=y
>   CONFIG_MICROSEMI_PHY=y
>   CONFIG_MOTORCOMM_PHY=y
> @@ -151,7 +152,6 @@ CONFIG_HW_RANDOM_JH7110=m
>   CONFIG_I2C=y
>   CONFIG_I2C_CHARDEV=m
>   CONFIG_I2C_DESIGNWARE_CORE=y
> -CONFIG_I2C_DESIGNWARE_PLATFORM=y
>   CONFIG_I2C_MV64XXX=m
>   CONFIG_SPI=y
>   CONFIG_SPI_CADENCE_QUADSPI=m
> @@ -159,11 +159,11 @@ CONFIG_SPI_PL022=m
>   CONFIG_SPI_SIFIVE=y
>   CONFIG_SPI_SUN6I=y
>   # CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_PINCTRL_TH1520=y
>   CONFIG_PINCTRL_SOPHGO_CV1800B=y
>   CONFIG_PINCTRL_SOPHGO_CV1812H=y
>   CONFIG_PINCTRL_SOPHGO_SG2000=y
>   CONFIG_PINCTRL_SOPHGO_SG2002=y
> -CONFIG_PINCTRL_TH1520=y
>   CONFIG_GPIO_DWAPB=y
>   CONFIG_GPIO_SIFIVE=y
>   CONFIG_GPIO_SPACEMIT_K1=y
> @@ -240,7 +240,6 @@ CONFIG_RTC_DRV_SUN6I=y
>   CONFIG_DMADEVICES=y
>   CONFIG_DMA_SUN6I=m
>   CONFIG_DW_AXI_DMAC=y
> -CONFIG_DWMAC_THEAD=m
>   CONFIG_VIRTIO_PCI=y
>   CONFIG_VIRTIO_BALLOON=y
>   CONFIG_VIRTIO_INPUT=y
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-01-riscv-defconfig-7f90f73d283d
>
> Best regards,
