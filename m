Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F957C9F;
	Tue, 24 Jun 2025 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750074; cv=none; b=AEdlQo14RVTWaCg4MpV5c791MdYyaFvuE76CmQVHuLmUOp1RVyzJkDnVGI7y9602V9TTd1SutyLhW9138tlpcuvEJuAClVYQpN0jiYxYZeWxw05vLTmy4f+MjzxqDaE2J0qwRz7gQhynM7i9x08f/EAM+bgFn4Zan5AQyZC9U4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750074; c=relaxed/simple;
	bh=2VRlaahf+tQJQsFz0DN32NcUbTYYVROMUttudjfToi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uV7n2xDrHnqp9KOXz+wyvBNuNcZJQsBLuNjygqi6oAxqcnJjoAPO7Rlo24BJ5XkvYA6jQNoOUUcanEspQUjIHznJ9IeF6ocByFzXCxVCu5fZbPoPjTVqkk/wuYOryx6i6B5ba7nPftA2T+Ht0rZWY/U68hTwU8rek3jEoLv+yV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MARKBIXl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MARKBIXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750750065;
	bh=2VRlaahf+tQJQsFz0DN32NcUbTYYVROMUttudjfToi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MARKBIXlPxz2c3Aj7cq2Yj9Ci3qEsh1TvnReud096eqPVZ1zy9JEPDEDb5Rw7TZgY
	 nmVnhzQkDecSH1xqCEx+zfoLAGVG+bJ1KUjr8vS1pfECnXeGo6AmRcvWr6xas3T55Z
	 xdA+r2ds2AAhQ6gXDMZnpuoCgD9yhe0tg/CtBKmzqNxUETe7foLF/woYD6yZ/TPUmX
	 eeVNbV9UF2DnbuBAf2NBaUUWRJfN7F+bKOBLDr1VzJwgXHJ0/UsfN1EV4nb7yJBDpm
	 qFKULyxZjxxldJ/ddg5NzqsZ+zAR6H4ZPn1M5jS0hdKUTCY0gTUiFD6/Rg87X1NwLd
	 cHR1Y9d+vmjfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9811517E0EA4;
	Tue, 24 Jun 2025 09:27:44 +0200 (CEST)
Message-ID: <480c78cc-076f-44e2-bd90-1dcc91a235ee@collabora.com>
Date: Tue, 24 Jun 2025 09:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, devicetree@vger.kernel.org
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
 <175068852802.3230004.1923972457454728043.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <175068852802.3230004.1923972457454728043.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 23/06/25 16:22, Rob Herring (Arm) ha scritto:
> 
> On Mon, 23 Jun 2025 14:00:37 +0200, AngeloGioacchino Del Regno wrote:
>> Add a binding for the MediaTek MT6363/6373 (and similar) multi
>> function PMICs connected over SPMI.
>>
>> These PMICs are found on board designs using newer MediaTek SoCs,
>> such as the Dimensity 9400 Smartphone chip, or the Chromebook
>> MT8196 chip.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml:

Yeah, sorry about not adding the information at the very beginning (but I suspect
the bot would still complain), but anyway that's because this series depends on the
one that actually introduces the bindings for the regulators that are referenced in
here...

https://lore.kernel.org/all/20250623120016.108732-1-angelogioacchino.delregno@collabora.com


Cheers,
Angelo


> 	Error in referenced schema matching $id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml
> 	Tried these paths (check schema $id if path is wrong):
> 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> 	/usr/local/lib/python3.11/dist-packages/dtschema/schemas/regulator/mediatek,mt6363-regulator.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): regulators: 'oneOf' conditional failed, one must be fixed:
> 	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#"}
> 	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#"}
> 	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: /example-0/spmi/pmic@4/regulators: failed to match any schema with compatible: ['mediatek,mt6363-regulator']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
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


