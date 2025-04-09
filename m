Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E21525D52D;
	Wed,  9 Apr 2025 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187442; cv=none; b=LJEGIOgfFY+SRzKZ3bkP7bd7vEtj5p1c2ny0e2v9w2sXSF7tfw501g592rpjK0Kd5gRyNWqPvF0r0rt1enf47NRC1dB5s/GFV4dV6nc2aPmlpdYho/DjIP2jDOx180xlmdFZhGYcRurJq7G7FXZA8uWDJc7gnnaplg/ijK9dF6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187442; c=relaxed/simple;
	bh=7RJbB0wwplKFvV8WjY6nmxdD97+VB6jb4eBmvgMPSLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upJeanmo8D5s9Pb/7OXkkN3b2hkoP8aJYvKeH/qZIUhSeBl4MY38S1yICltCKrDOXiwVeQ2KerkxQ2BbZI4EKr56ZkQagUyod9csZE4j9Wd2MHsUHwb+8xNqJQ8F9UHOdGFQ8YAl7xNuecXfJtMkP/4ISGRbbY20l6MsAU1ZFLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 113514274;
	Wed, 9 Apr 2025 16:30:29 +0800 (GMT+08:00)
Message-ID: <756177ef-f2a7-4a8a-afa4-a68d68e5c733@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:30:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: usb: add SpacemiT K1 DWC3 glue
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
 <174403387085.2155711.16403180293126338183.robh@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <174403387085.2155711.16403180293126338183.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHh1OVk9MHksZTUlPGUIYSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUpKVUpLS1VLWQ
	Y+
X-HM-Tid: 0a9619ac159503a1kunm113514274
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6CSo*CjJOQz1NN1FJAUkf
	ExgwCklVSlVKTE9PSkNMT0hMSUlJVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhMSE83Bg++

On 4/7/25 9:51 PM, Rob Herring (Arm) wrote:
> On Mon, 07 Apr 2025 20:38:48 +0800, Ze Huang wrote:
>> Add support for SpacemiT DWC3 glue driver, which manages interrupt,
>> reset and clock resource.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 78 ++++++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@c0a00000 (spacemit,k1-dwc3): '#address-cells', '#size-cells' do not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@c0a00000 (spacemit,k1-dwc3): usb@0:reg: [[0, 0], [0, 65536]] is too long
> 	from schema $id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@0 (snps,dwc3): reg: [[0, 0], [0, 65536]] is too long
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

Thanks for the report!
I’ll add '#address-cells' and '#size-cells' under properties to resolve 
the error.
because if I drop them from the example, I get warnings like:

Warning (avoid_default_addr_size): /example-0/usb@c0a00000/usb@0: 
Relying on default #address-cells value

>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
>
>

