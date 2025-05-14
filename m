Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562781F4639;
	Wed, 14 May 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224039; cv=none; b=IZkNJubLpsAD3GTpcbk6lhp3JAraFunMv74u6tW+aE/GUU4g4RntgUXYZp3snxqltQulhNRAxM/aiP1EG5smxaaGJJAPOvOnn06JhXt2akPuTaE5lnDrhsaRjoXG6LaXmIvRfQrQI9U3iJTXCspYLxYunI7MQyUYOwlsnbxsBRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224039; c=relaxed/simple;
	bh=BRdK1AqEALeuZ0gpOwCRAmQEE/PckQb5XKypwfnHhs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2PTXmePvyg3Yupci1o3nTK+aJW9Qq+u6qvv657jTTmcNXzw7zyTDdGZTRLIxUIbg3Db+5dTy/TSNtVZFIZ6JA9jJCbsB8I7TnPd7NLGPl5xDJZZy2m5JDunQskL45mbNhsBuKlz2GqbmFTXyJ86KNpEDlYrg+opiHppdIoxQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 150636c0b;
	Wed, 14 May 2025 20:00:28 +0800 (GMT+08:00)
Message-ID: <95e8f8fd-d7ea-4d78-a794-72f73a3e19f3@whut.edu.cn>
Date: Wed, 14 May 2025 20:00:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
 <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>
 <aCRaAEJSphC7uWY0@vaman>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <aCRaAEJSphC7uWY0@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0tJVkhDGUIaSEIaSh0ZGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVPT1lXWRYaDxIVHRRZQVlPS0hVSktISUxCS1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96ceaae7d903a1kunm150636c0b
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6Thw5CTEzPj4YTikiSTAq
	LywKCS1VSlVKTE9MSUlPS0hITUNDVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVPT1lXWQgBWUFIQ01JNwY+

On 5/14/25 4:53 PM, Vinod Koul wrote:
> On 18-04-25, 21:19, Ze Huang wrote:
>> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
>> only USB mode is supported; PCIe support is not included in this change.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
...
>> +#define COMBPHY_USB_LFPS_REG		0x58
>> +#define  COMBPHY_USB_LFPS_MASK		0x700
>> +#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
> Same comment as other patch

>> +
>> +#define COMBPHY_MODE_SEL	BIT(3)
>> +#define COMBPHY_WAIT_TIMEOUT	1000
>> +
>> +struct spacemit_combphy_priv {
>> +	struct device *dev;
>> +	struct phy *phy;
>> +	struct reset_control *phy_rst;
>> +	void __iomem *phy_ctrl;
>> +	void __iomem *phy_sel;
>> +	bool rx_always_on;
>> +	u8 lfps_threshold;
>> +	u8 type;
>> +};
>> +
>> +static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
>> +{
>> +	u32 tmp;
>> +
>> +	tmp = readl(reg + offset);
>> +	tmp = (tmp & ~(mask)) | val;
>> +	writel(tmp, reg + offset);
>> +}
>> +
>> +static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
>> +				       u32 offset, u32 mask, u32 val)
>> +{
>> +	u32 reg_val;
>> +	int ret = 0;
> Superfluous init, drop it pls

OK

>
>> +
>> +	ret = read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
>> +				1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
>> +				priv->phy_ctrl + offset);
>> +
>> +	return ret;
> why use local variable?

Will drop it.

>
>> +}
>> +
>> +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
>> +{
>> +	int ret = 0;
>> +
>> +	switch (priv->type) {
>> +	case PHY_TYPE_USB3:
>> +		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
>> +		break;
>> +	default:
>> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
...
>> +static const struct of_device_id spacemit_combphy_of_match[] = {
>> +	{ .compatible = "spacemit,k1-combphy", },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
>> +
>> +static struct platform_driver spacemit_combphy_driver = {
>> +	.probe	= spacemit_combphy_probe,
>> +	.driver = {
>> +		.name = "spacemit-k1-combphy",
>> +		.of_match_table = spacemit_combphy_of_match,
>> +	},
>> +};
>> +module_platform_driver(spacemit_combphy_driver);
>> +
>> +MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
>> +MODULE_LICENSE("GPL");
> Could this be single driver with different init register sequences?

Yes, on K1 SoC, the USB3 and PCIe Port A share the same COMBO PHY hardware.

PHY can be initialized for PCIe as well via a different init sequence.
In the future, we can extend the driver to support both modes based on 
the DT property.

