Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD651B4F1F;
	Mon, 30 Jun 2025 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285591; cv=none; b=DOL5x/p+68Uh1AxCVItFdkpp4YSHH/opt7pGhDiNnkjeyU3FWKWTc6Al/ppj/aUlLd13Xjd17zQsnRUzbW2v6vtsNDHsSmr9ZB5wvXGb82DBnscrg8j2WFSZUEdSjoCGaznf0/zpFtGAUT+77QBSBn8fheMWHFwvGdXHIguAapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285591; c=relaxed/simple;
	bh=dPNdODdNEzaTCF8QQBs85oD/JRYhHKIx4HEh+y0OiC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJJGoJwpITcO2QxqwKif+rGs4XDaitCho+dkiD4Gl78iOgvHPzEgqHBvLimAJ2+1YaDQwEvwOIjZdO9Hu7jhJwUSn4Vr+QeGuPwnVRFg7oAebOMMaoWFhkzU1stLn+45S/HvzWNG+96SQnMQ+nzgmEKG7/CMy5fB59xyYA61gQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T8pQOws9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T8pQOws9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751285586;
	bh=dPNdODdNEzaTCF8QQBs85oD/JRYhHKIx4HEh+y0OiC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T8pQOws9qgLp3JO8Lj4TMVSBUeGxfqhlsflNHZb/ENe4HxvBO6Hf9yshKP86XcUQ2
	 Lu2lcccG6C4Z3xUZyMA2aMukP9eMI2Y91F1g1mnHPDBGWoCB6aGny2IeqHKcC84+dE
	 7vuwMC+77IZ86tpyUDyufcbJRy07r0s3APlvlX2wQrxdbw5ebbMonh3DgsESVXmCpT
	 uJyYxjVDQwdZ2dvdUsYwsB4TfiJqdZpGJDFCfMCgYF7rxNzgJaR3xIv3H1HR5Co7iC
	 f1QOTlUCkV+rQjYo76uTcTBoD468WXq9ctzABUf8Idq39zr+YilGRdqkhV5k/2TgqB
	 eK+CT0yU8YsAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C4DD17E0B0D;
	Mon, 30 Jun 2025 14:13:06 +0200 (CEST)
Message-ID: <cc453fc8-1254-438e-98c3-e81717bb605b@collabora.com>
Date: Mon, 30 Jun 2025 14:13:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: spmi: Add MediaTek MT8196 SPMI 2
 Arbiter/Controllers
To: Rob Herring <robh@kernel.org>
Cc: sboyd@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
 <20250623120047.108961-2-angelogioacchino.delregno@collabora.com>
 <20250627200735.GA4094329-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250627200735.GA4094329-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/06/25 22:07, Rob Herring ha scritto:
> On Mon, Jun 23, 2025 at 02:00:43PM +0200, AngeloGioacchino Del Regno wrote:
>> Document the MT8196 SPMI 2.0 Controller with a new schema.
>> This is a MIPI SPMI 2.0 compliant IP, composed of a main arbiter
>> and two SPMI master controllers with Request Capable Slave (RCS)
>> support.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 ++++++++++++++++++
>>   1 file changed, 138 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
>> new file mode 100644
>> index 000000000000..d7eb63e81a5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
>> @@ -0,0 +1,138 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spmi/mediatek,mt8196-spmi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT8196 SPMI 2.0 Controller
>> +
>> +maintainers:
>> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek MT8196 SoC features a SPMI version 2.0 compliant controller,
>> +  with internal wrapping arbitration logic to allow for multiple on-chip
>> +  devices to control up to two SPMI buses.
>> +  The main arbiter also acts as an interrupt controller, arbitering also
>> +  the interrupts coming from SPMI-connected devices into each of the nested
>> +  interrupt controllers from any of the present SPMI buses.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8196-spmi
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt6991-spmi
>> +          - const: mediatek,mt8196-spmi
>> +
>> +  ranges: true
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^spmi@[a-f0-9]+$":
>> +    type: object
>> +    $ref: /schemas/spmi/spmi.yaml
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        items:
>> +          - description: controller interface registers
>> +          - description: spmi master controller registers
>> +
>> +      reg-names:
>> +        items:
>> +          - const: pmif
>> +          - const: spmimst
>> +
>> +      clocks:
>> +        items:
>> +          - description: controller interface system clock
>> +          - description: controller interface timer clock
>> +          - description: spmi controller master clock
>> +
>> +      clock-names:
>> +        items:
>> +          - const: pmif_sys_ck
>> +          - const: pmif_tmr_ck
>> +          - const: spmimst_clk_mux
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +      interrupt-names:
>> +        const: rcs
>> +
>> +      interrupt-controller: true
>> +
>> +      "#interrupt-cells":
>> +        const: 3
>> +        description: |
>> +          cell 1: slave ID for the requested interrupt (0-15)
>> +          cell 2: the requested peripheral interrupt (0-7)
>> +          cell 3: interrupt flags indicating level-sense information,
>> +                  as defined in dt-bindings/interrupt-controller/irq.h
>> +    required:
>> +      - reg
>> +      - reg-names
>> +      - clocks
>> +      - clock-names
>> +      - interrupts
>> +      - interrupt-names
>> +      - interrupt-controller
>> +      - "#interrupt-cells"
>> +
>> +required:
>> +  - compatible
>> +  - ranges
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      spmi-arbiter@1c018000 {
>> +        compatible = "mediatek,mt8196-spmi";
>> +        ranges = <0 0 0x1c018000 0x4900>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        spmi@0 {
>> +          reg = <0 0x900>, <0x4800 0x100>;
>> +          reg-names = "pmif", "spmimst";
>> +          interrupts-extended = <&pio 292 IRQ_TYPE_LEVEL_HIGH>;
>> +          interrupt-names = "rcs";
>> +         interrupt-controller;
> 
> Indentation error.
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 

Oh sorry for that.

If there's no "complaint" on any other patch of this series, I wonder if this
could be fixed while applying?

Thanks a lot,
Angelo

>> +          #interrupt-cells = <3>;
>> +          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
>> +          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
>> +        };
>> +
>> +        spmi@2000 {
>> +          reg = <0x2000 0x900>, <0x4000 0x100>;
>> +          reg-names = "pmif", "spmimst";
>> +          interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>;
>> +          interrupt-names = "rcs";
>> +          interrupt-controller;
>> +          #interrupt-cells = <3>;
>> +          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
>> +          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
>> +        };
>> +      };
>> +    };
>> +...
>> -- 
>> 2.49.0
>>


