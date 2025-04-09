Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806018FC75;
	Wed,  9 Apr 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186584; cv=none; b=CfhIVwxrbPRx7qq9OcDMwL5vosCbB09hBpe+nRSVGAtS3MdY6Kf6rIns8+QR0RsOf29m1io/noOE1TAdETxB7POprToyhdWxSCWGyKTBAax6XybiyxjKsoTQKItmkCLOlH3NxAdE9zvLlYpxxYUK9UeoubfZQKt0ipewJVz7T40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186584; c=relaxed/simple;
	bh=bzn4rvPapWVzGVsPv9sumQom9/oymg/MDlsre6Pgff4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mI5FPOOW5SS6Xpz8WYyS+KZpfUuENEjk37WULecZQdqTv/6+q/FGeUiyYN6WPNBGA2h1WvvjTa8BBX40Wn+42oDsprUZKMUZnPAg/+m2YlQWVAwEnrRALObou9HC/nTwZzEnYbRqdzccvpbayiCDPuwoX1rAmvtVn1DdKKG6QFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11351408e;
	Wed, 9 Apr 2025 16:16:11 +0800 (GMT+08:00)
Message-ID: <9f7d1ea4-d9cb-48d2-9af1-4db38fadd55e@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:16:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: usb: add SpacemiT K1 DWC3 glue
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
 <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
 <ac9fd6b3-2184-4d75-83e5-6caee4f3758d@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <ac9fd6b3-2184-4d75-83e5-6caee4f3758d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk0dVh1KThlCSBlITElJH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a96199efb6303a1kunm11351408e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjY6CSo6IjJIDj0cN1ZNAR06
	FgEwC01VSlVKTE9PSkNNTkxDTEJKVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU9PT043Bg++

On 4/7/25 9:22 PM, Krzysztof Kozlowski wrote:
> On 07/04/2025 14:38, Ze Huang wrote:
>> Add support for SpacemiT DWC3 glue driver, which manages interrupt,
>> reset and clock resource.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 78 ++++++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> Combining 3 subsystems into one patchset is a poor idea.

Acknowledged, will split into two sets in next version
1. usb2 phy and combo phy
2. dwc3 glue driver and dts

>
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..40ce3fd1330d5f371ec69155c237e10a65a9d8f4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller Glue
>> +
>> +maintainers:
>> +  - Ze Huang <huangze@whut.edu.cn>
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-dwc3
>> +
>> +  ranges:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interconnects:
> Missing maxItems

Will fix

>
>> +    description:
>> +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
>> +      The 'interconnects' property explicitly describes this path, ensuring
>> +      correct address translation.
>> +
>> +  interconnect-names:
>> +    const: dma-mem
>> +
>> +  # optional
> Drop, Don't repeat constraints in free form text.

Will do

>
>> +  vbus-supply:
>> +    description: A phandle to the regulator supplying the VBUS voltage.
>> +
>> +patternProperties:
>> +  '^usb@':
>> +    $ref: snps,dwc3.yaml#
> No, rather fold child into the parent.

I’m not entirely sure I understand your suggestion. Could you please provide
an example? Thanks!

>
>> +
>> +additionalProperties: false
> This goes after required:, always.

OK

>
>> +
>> +required:
>> +  - compatible
>> +  - ranges
>> +  - clocks
>> +  - resets
>> +  - interrupts
>> +  - interconnects
>> +  - interconnect-names
>> +
>> +examples:
>> +  - |
>> +    usb@c0a00000 {
>> +        compatible = "spacemit,k1-dwc3";
>> +        clocks = <&syscon_apmu 16>;
>> +        interrupts = <149>;
>> +        interconnects = <&dram_range0>;
>> +        interconnect-names = "dma-mem";
>> +        ranges = <0x0 0xc0a00000 0x10000>;
>> +        resets = <&syscon_apmu 8>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        status = "disabled";
> Nope, drop.

Will drop 'status'

>
>
>
> Best regards,
> Krzysztof
>
>

