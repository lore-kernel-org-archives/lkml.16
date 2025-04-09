Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F271D54FA;
	Wed,  9 Apr 2025 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191835; cv=none; b=vCIzcnC8HQiOarnzvV7lK0Z1bMe7AntsEpXto3VzG29M256oZ4pdymXMm+Ed8hS5Z3bpmWJEs32rbbGm+TCf58tWJuTVDIpm1XxCCO3cbSBA05k0iO5O4JvWK9v4YivRx6raRDO8UmI/cYlBtjeIWeVwDZnkxOtSufKhKCyKdo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191835; c=relaxed/simple;
	bh=84ymEGm4zvSJ3WXK2INgidAW+cBpZ4oXWDbgkmXwmIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8+5donf6fxhnAD3NMGCeJRxYpeS6kYsSz+ax+SEO3z5/LO4j3jAYSXgtPetnu9sLgytP43UHRnuCUWWc/fqOh4dZArwnG4OUQFlzjyBQc9/bE5jtSkJsjh1zpvy+YKqqx2AkeE/F76WltITBAzd91QntFaczNECRHqE+xIv9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 113920671;
	Wed, 9 Apr 2025 17:43:41 +0800 (GMT+08:00)
Message-ID: <a71f45fc-d266-447d-8fb0-1ff0897f5bff@whut.edu.cn>
Date: Wed, 9 Apr 2025 17:43:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
 <74770bec-eeda-4823-b494-bea177fe26b0@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <74770bec-eeda-4823-b494-bea177fe26b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx4ZVh8YSBlCHUhKHR1NQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619ef181403a1kunm113920671
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6HCo5TjJCDjwXERcME0kh
	NVFPCShVSlVKTE9PSkJKQ0lDTUpPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhOS0o3Bg++

On 4/7/25 9:28 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
>> only USB mode is supported; PCIe support is not included in this change.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   drivers/phy/spacemit/Kconfig          |   8 ++
>>   drivers/phy/spacemit/Makefile         |   1 +
>>   drivers/phy/spacemit/phy-k1-combphy.c | 229 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 238 insertions(+)
>>
>> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
>> index f0c2a33f53cc810e71c6140ae957aa68a2b6ff0c..12749aba756329cf64fb9199055ba484fe05f3ab 100644
>> --- a/drivers/phy/spacemit/Kconfig
>> +++ b/drivers/phy/spacemit/Kconfig
>> @@ -10,3 +10,11 @@ config PHY_SPACEMIT_K1_USB2
>>   	help
>>   	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
>>   	  enabling and clock setup and will be used by K1 udc/ehci/otg driver.
>> +
>> +config PHY_SPACEMIT_K1_COMBPHY
>> +	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
>> +	depends on OF
>> +	select GENERIC_PHY
>> +	default ARCH_SPACEMIT && USB_DWC3_SPACEMIT
>> +	help
>> +	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
> Missing depends on ARCH_SPACEMIT || COMPILE_TEST

Will fix, thanks!

>
> ...
>
>
>> +	priv->phy = devm_phy_create(dev, NULL, &spacemit_combphy_ops);
>> +	if (IS_ERR(priv->phy))
>> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
>> +				     "failed to create combphy\n");
>> +
>> +	dev_set_drvdata(dev, priv);
>> +	phy_set_drvdata(priv->phy, priv);
> Both make no sense. Look what this function does.

It does seem redundant at first glance, but pdev->dev is the parent of 
phy->dev.
pdev->dev->driver_data will be used in spacemit_combphy_xlate()
phy->dev->driver_data  will be used in phy_ops functions

I've checked some other drivers that did the same:
     - phy-zynqmp.c at lines 990 and 1026
     - phy-rockchip-samsung-hdptx.c at lines 1989 and 2000

>
> Best regards,
> Krzysztof
>
>
