Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B562A24888E;
	Wed,  9 Apr 2025 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186714; cv=none; b=RbxaPwUfxU3Yt9Rm4ZayL7R2QBHv/Z95XhT/8oXGPN2OWhxA6QecO9qVqbMfq+QDzolFXAojYB1Q5kRYPbhWSroezorPQuHkqZF+YTqEv9AVx8+ko1O/kDKVfKIBeoKIdhTPXPIr5GvzRNPSkKAY9HNHh0hMk+LUstTg3xidSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186714; c=relaxed/simple;
	bh=bDLklmSuD1z4loHKQkbi7DxMd1QQgqBE6trMGJKNdyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAB8niHPe5LcxGSRCVMoN3EvVTNNMGSt9CbCr+Lce2VHfArdXYsLaFJcEoaGJKpgIgtf516X3EPRccUsjgLN+sBl79LK1aOBCq8x6tf/5H2Ns2vCLKG+zw9G8xLerYYubefkQ7B2qWJkCO6jF+yND+JXoZJakEl9QVBHB+nGZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1135140cf;
	Wed, 9 Apr 2025 16:18:22 +0800 (GMT+08:00)
Message-ID: <2986e9bd-0e01-4361-86ed-e4d92406c911@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:18:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] phy: spacemit: support K1 USB2.0 PHY controller
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
 <20250407-b4-k1-usb3-v3-2-v1-4-bf0bcc41c9ba@whut.edu.cn>
 <abac53a6-cba7-4962-9f34-ab2eac9e6e3d@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <abac53a6-cba7-4962-9f34-ab2eac9e6e3d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH05CVkMfH0tOGB5IGUIeSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619a0fb7503a1kunm1135140cf
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6GQw6ITIBPD1JGVYxAS09
	DCgKFD5VSlVKTE9PSkNNTEtCTklPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUlLTkI3Bg++

On 4/7/25 9:25 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
>> +	{ .compatible = "spacemit,k1-usb2-phy", },
>> +	{ /* sentinal */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
>> +
>> +static struct platform_driver spacemit_usb2_phy_driver = {
>> +	.probe	= spacemit_usb2phy_probe,
>> +	.driver = {
>> +		.name   = "spacemit-usb2-phy",
>> +		.owner  = THIS_MODULE,
>
> Take recent drivers and use them as base. There is no such 'owner' since
> 10 years.

Will follow. Thank you for pointing that out.

>
>
> Best regards,
> Krzysztof
>
>

