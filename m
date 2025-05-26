Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D142223706;
	Mon, 26 May 2025 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276014; cv=none; b=kPL3m/ZPwUpzAH4+zda5gXuBhiznfSvo48+X9u18CNWW/09NTkbGqnqlCAtl4d9WednQukdR3w3VL2dqq0ijb3UmInmoeShtM4eqXuBsIPXT5WxcSIY0QJ5jTus/cUHipJN0PexAs3aguzkvvTvYrk64LXc85oH0T8Oy7BRTq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276014; c=relaxed/simple;
	bh=Mxu3zih8rVxIa8U4gXvsG/YABdlmId8tC9PX3ZTiJbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0L99PKqqxKruW5EkTiZz94L1rQz4SEW1BcOwqCV35Rfl7z298CFwrQmilr7qEuTxqwFzmS+l1mwC+HoKvwyP6L/ToG69Mqc2MrxfFO/Svc/34uZFhs6ZC7olqFrTX/RwmQ9VJ+aiCiW0VTONleyCF5j5hzQav4f5Lo1IxxyMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [113.57.237.88])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16718ef7d;
	Tue, 27 May 2025 00:13:22 +0800 (GMT+08:00)
Message-ID: <0a90fb41-6e24-464f-bf2b-cdd76bfb7f08@whut.edu.cn>
Date: Tue, 27 May 2025 00:13:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v4 3/4] phy: spacemit: support K1 USB2.0 PHY controller
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
 <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRhKVhodHU5CSB0ZSk9MH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVTkxVSUhMVUNDWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a970d5ebe4303a1kunmdb12c2341c809
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6Dyo6FzE6Pgw6GDQ4SywU
	PRIwC0pVSlVKTE9DSUxNS0tMTk9OVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlK
	SkhVTkxVSUhMVUNDWVdZCAFZQUlCTk83Bg++

On 5/26/25 11:51 PM, neil.armstrong@linaro.org wrote:
> Hi,
>
> On 26/05/2025 16:31, Ze Huang wrote:
>> The SpacemiT K1 SoC includes three USB ports:
>>
>> - One USB2.0 OTG port
>> - One USB2.0 host-only port
>> - One USB3.0 port with an integrated USB2.0 DRD interface
>>
>> Each of these ports is connected to a USB2.0 PHY responsible for USB2
>> transmission.
>>
>> This commit adds support for the SpacemiT K1 USB2.0 PHY, which is
>> compliant with the USB 2.0 specification and supports both 8-bit 60MHz
>> and 16-bit 30MHz parallel interfaces.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   drivers/phy/Kconfig                |   1 +
>>   drivers/phy/Makefile               |   1 +
>>   drivers/phy/spacemit/Kconfig       |  13 ++++
>>   drivers/phy/spacemit/Makefile      |   2 +
>>   drivers/phy/spacemit/phy-k1-usb2.c | 131 
>> +++++++++++++++++++++++++++++++++++++
>>   5 files changed, 148 insertions(+)
>>
...
>> +
>> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
>> +    { .compatible = "spacemit,k1-usb2-phy", },
>> +    { /* sentinal */ }
>
> => sentinel

Thanks!

>
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
>> +
>> +static struct platform_driver spacemit_usb2_phy_driver = {
>> +    .probe    = spacemit_usb2phy_probe,
>> +    .driver = {
>> +        .name   = "spacemit-usb2-phy",
>> +        .of_match_table = spacemit_usb2phy_dt_match,
>> +    },
>> +};
>> +module_platform_driver(spacemit_usb2_phy_driver);
>> +
>> +MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
>> +MODULE_LICENSE("GPL");
>>
>
> It looks fine, but why didn't also convert thid driver to regmap ?

Will do

>
> Thanks,
> Neil
>
>
>

