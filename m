Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2825A2D3;
	Wed,  9 Apr 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185689; cv=none; b=IO54+oPxecPYWfuqD2Yf9DM356QCIIGxpIbsjZRelAliKyehQYBvNzh5mcaA57l2iF+TnomswsexaWURUWcIzE81RAJuCik6gdmrve2WaOmfTGwzTR0/P7UYYbWh5i+hxHILEOR+lQdeNuhnOva09Eo4TyuFoBlaqb2RQbaxPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185689; c=relaxed/simple;
	bh=ievrKbhc+/kCMJgRKegGmufHgF677ZHOuyPhMkd2aeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Exu5BK44CRnsaUGs1SbbOxKoISYpRUy6jrUim3O0DAiEWnW+WjP13ZjIqmd1cvuwM+saD5+riMr1+qK7JGgyjaAEGvq7+mfb7i76oZOajadHMMF5jhcpZ2DQhUIo0D/3YvwtgrvytrHwf27iF8Y1MZ31RtfXfIV9MVg9HrgzALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1133fc98e;
	Wed, 9 Apr 2025 16:01:09 +0800 (GMT+08:00)
Message-ID: <2a862d73-2aaf-48ad-8e01-2138241d9bea@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:01:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: phy: spacemit: add K1 USB2 PHY
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
 <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
 <02157e96-9524-4590-9ca6-e4390176d74e@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <02157e96-9524-4590-9ca6-e4390176d74e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhkfVktMSkJIQxhPT0gYHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619913a0703a1kunm1133fc98e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06Thw5EDJCPD0DMD8PLlEU
	ViFPCVFVSlVKTE9PSkNOTUxMSUxJVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUpDQkI3Bg++

On 4/7/25 9:18 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-usb2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
> No supplies? No resets? Are you sure hardware does not use them?

No resets are used for the USB 2.0 PHY, but there is a VBUS supply, which
I included in the DWC3 glue nodes.

>
> Best regards,
> Krzysztof
>
>

