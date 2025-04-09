Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9125A62C;
	Wed,  9 Apr 2025 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185970; cv=none; b=sIocIY8DQvZMMR2i1mCMyZXjjQ0NoJ9E6pSGgxGXpo6ujyOvFfG0FA7IUGvPrR0U122xrB83eGhkuITVqgQhaeJJzHD4qo3hMiLzaoGKFyw9AygSE0D2hMbNgfPcebS+yVATS0o+tFkuMu6x9crAJcaVpUj0IN4JbdFKG63LqfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185970; c=relaxed/simple;
	bh=5CLhYwrGQBFdjmdfYoqMhKT/O+70IniYcETRDq5LDlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgZMQlHguc2NsQkjh4jh0FSAQuHFTgBQaDEQEh80z+HWAeb7NtbmDitZHj9jdG3CybZWOOPJf4dLOe/Pjy8/ByTuLodzQ4espu8p54t4KB11JjlpRtmQR2Dv6/YU+U/NrcJBOj6HV+ZYmbVRQO84Pci8HU9xj1qGtpOD63CC2NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1133fca57;
	Wed, 9 Apr 2025 16:05:57 +0800 (GMT+08:00)
Message-ID: <4937e5ce-8bb9-4bcf-b463-f7d1a1eb2b4f@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:05:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
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
 <20250407-b4-k1-usb3-v3-2-v1-2-bf0bcc41c9ba@whut.edu.cn>
 <74bb9d27-fd6f-4332-9965-e967c3a31c63@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <74bb9d27-fd6f-4332-9965-e967c3a31c63@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUJOVh9LHR4dGRhITExOTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619959d2903a1kunm1133fca57
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6UTo*ODJWLD0JCj8jLTAL
	MSIKCyJVSlVKTE9PSkNOQk1PTk1PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhIQk43Bg++

On 4/7/25 9:20 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.
>>
>> PCIe portA and USB3 controller share this phy, only one of them can work
>> at any given application scenario.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   .../bindings/phy/spacemit,k1-combphy.yaml          | 53 ++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..450157b65410b27129603ea1f3523776a1b0a75e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Spacemit K1 PCIe/USB3 PHY
>> +
>> +maintainers:
>> +  - Ze Huang <huangze@whut.edu.cn>
>> +
>> +description:
>> +  Combo PHY on SpacemiT K1 SoC.PCIe port A and USB3 controller share this
>> +  phy, only one of PCIe port A and USB3 port can work at any given application
>> +  scenario.
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-combphy
>> +
>> +  reg:
>> +    maxItems: 2
> List and describe the items instead

OK, they are phy control and usb/pcie selection

>
>> +
>> +  reg-names:
>> +    items:
>> +      - const: phy_ctrl
> drop phy_
>
>> +      - const: phy_sel
> ditto

Will do

>
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
> What is the cell argument?

It's usb/pcie selection, will add description

>
> Also no supplies?

vbus supply was included in dwc3 glue node

>
>
> Best regards,
> Krzysztof
>
>

