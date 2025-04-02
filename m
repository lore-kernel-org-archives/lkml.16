Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1C2356D7;
	Wed,  2 Apr 2025 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585863; cv=none; b=uylIN8ygoPpK0BbmNbaGA1kuIJaQUg+chP/r0bDNBCKYxBeZOA2GTziwOyxR2w+oX9CwWqIECgfGpud72r2xW7VRYQScmBfpbzug6swfpyIS2y6GpEM1s7yhsq78oIqVoixQtaCvovwzHymBg0MWyxn3eknBEskOJtEzKCn+yKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585863; c=relaxed/simple;
	bh=C3XotoUexJAu0axISvav3t2Bl12OZSkmJVdzrk20j4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duVads5zPe3IWtuZsqWs22kfRyIajF1vnIITjEHsCuC6gna2/vk6yvyPZczCqBnuO30EcRgVz9sKo55tkTNd9BZkAelSmgIOwFCbkmtBUUFVII7UhEHdl9w4u9lkURa+OHfp154o26v83+a/vv2r4MydpGBfG5vC7nG2/VSzXPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f9Bo4ohS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f9Bo4ohS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743585859;
	bh=C3XotoUexJAu0axISvav3t2Bl12OZSkmJVdzrk20j4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f9Bo4ohS74A0fke56j5NVf6RcpCx5zkYMAxEJF5Dnfou5QXznemiAIk6JbS4moAyD
	 mEZCgWFbe9JUN8phOpckNscZ0Y0zXq2aBPm1+uOrQ8ZoHhx+DBiubzcV50DkdT9EBD
	 KHcJDHdiKOl42PYvNiJc11RTmRRWeSj+SR8qU9UJU17NoJdxjTpixnsn7DBp7ERUrm
	 pBJmZacGxqKfH26R/U0Gckw6zCnpXOleu+eRvhTyNgNYJyFXCU9a3y7e2OWj9rohOM
	 4zaq9uhtzPX3ez5ma4WRMOv8kmrnkuQ0LlOyGBIiQCkQIMZH9309cd06pkCJWJTkQO
	 IXii4fbJyBeIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E5BC17E0809;
	Wed,  2 Apr 2025 11:24:19 +0200 (CEST)
Message-ID: <30ff6b8c-befc-4233-8e61-c131b1f037ff@collabora.com>
Date: Wed, 2 Apr 2025 11:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
To: =?UTF-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-2-crystal.guo@mediatek.com>
 <fb154077-e650-480e-a4d7-0a141b563dfc@collabora.com>
 <4bad42c867a838da413154fa0a779547d642642c.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4bad42c867a838da413154fa0a779547d642642c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 02/04/25 05:51, Crystal Guo (郭晶) ha scritto:
> On Wed, 2025-03-26 at 11:18 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 26/03/25 07:30, Crystal Guo ha scritto:
>>> A MediaTek DRAM controller interface to provide the current DDR
>>> data rate.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>    .../memory-controllers/mediatek,dramc.yaml    | 44
>>> +++++++++++++++++++
>>>    1 file changed, 44 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>> b/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>> new file mode 100644
>>> index 000000000000..8bdacfc36cb5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>
>> The filename should be "mediatek,mt8196-dramc.yaml"
>>
> 
> For other MediaTek SOCs, the method of calculating current ddr data
> rate is similar to that of MT8196. After changing "mediatek,dramc.yaml"
> to "mediatek,mt8196-dramc.yaml", would future Mediatek SOCs need to add
> a separate yaml file again? or could they reuse mediatek,mt8196-
> dramc.yaml? Thank you for your guidance.
> 

Other MediaTek SoC will be able to reuse mediatek,mt8196-dramc.yaml if the
hardware is similar.

Cheers,
Angelo

> Best regards,
> Crystal
> 
>>
>>> @@ -0,0 +1,44 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (c) 2025 MediaTek Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml*__;Iw!!CTRNKA9wMg0ARbw!gH5hMTJ34ZcYfNMfLUNL-dH9SMyQGr06kJ4jij1anezByF7IBOSbkYNdqysgHoz-rSRNwM9r6RaaTC1MO2882ojif26oaBzg$
>>> +$schema:
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!gH5hMTJ34ZcYfNMfLUNL-dH9SMyQGr06kJ4jij1anezByF7IBOSbkYNdqysgHoz-rSRNwM9r6RaaTC1MO2882ojifw8f6sUH$
>>> +
>>> +title: MediaTek DRAM Controller (DRAMC)
>>> +
>>> +maintainers:
>>> +  - Crystal Guo <crystal.guo@mediatek.com>
>>> +
>>> +description:
>>> +  A MediaTek DRAM controller interface to provide the current data
>>> rate of DRAM.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt8196-dramc
>>
>> P.S.: bindings maintainers: this driver is expected to get more
>> compatibles soon.
>>
>> Cheers,
>> Angelo
>>
>>
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: anaphy registers
>>> +      - description: ddrphy registers
>>> +
>>> +additionalProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        memory-controller@10236000 {
>>> +            compatible = "mediatek,mt8196-dramc";
>>> +            reg = <0 0x10236000 0 0x2000>,
>>> +                  <0 0x10238000 0 0x2000>;
>>> +        };
>>> +    };
>>
>>
