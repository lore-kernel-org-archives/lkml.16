Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A375A1537C6;
	Fri, 28 Mar 2025 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743164527; cv=none; b=qbFN0BHSxA/Cy6eXXuRXrVUpXY4rht5UW1bvgzeJYbYjQCVAYP3Yyx+2FL+pfjw7vr7Mwt7RgEpZIaQPGlrTBNAf3PAxCkqpJ95cJYIsT+w9ajmC9EZ/WvWOeScRSQXMlpAc2VYV67sam79XJTSpMLCWsGSCMg4VNuCXY3+83tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743164527; c=relaxed/simple;
	bh=pmhdXCc9ppKE21BTXPTPut1h94F66CU0TnLRVbgPQDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tkc9zMHuEzSKhu2g8rLdOuMAldWFJgZlwV4Y7ccUk3BjdiqmJ2IVWqoekE1xycajN+V8BlwynZGGL9nQqDBxg5F3ootMIJ8oBKkqshMdgcx45MkWzxL9HeE0TRHDrn/8/FNBjKrhwDp7gu2k4TDdVW8+QSjQfILUFVknyZwVNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPThmLCK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPThmLCK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so271488166b.0;
        Fri, 28 Mar 2025 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743164524; x=1743769324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oc49DJIwJicv0xAMtGUpshz9Iya5BjyoHaAoKmn9GSM=;
        b=bPThmLCK4k6w9gBSfwvEYo3QCgoqdIVccKoeLiEJIsomeyYTaK+f6QgZ2vNKKCcRN1
         JYgexZlLQn3zGfAgKKieaVVqk6RpNusPzMyAC6+TiQR5MOE83AnwQMU1i17wu2h1czji
         qSHaJlLt7fyKj75LHHROIcbWBF4GQgespQVnMCCeo9UxYUKZ/QbcZQZW5FLmGEllppd8
         thJsrOIdjQAc/els02/9V9PPXi+KVxx+CMbV6vb3LijPnRmRQ+4FOIEgQej4qW/i3cmV
         J3zauOtki4gUGtffNmLeV/h6JZDsGxEnOVWXZvmLFa26r3C9ZTXhRdl8tN9H0gUQA07U
         EvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743164524; x=1743769324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc49DJIwJicv0xAMtGUpshz9Iya5BjyoHaAoKmn9GSM=;
        b=DMmWR3VO7KHwipueB97YXTGlGYc35Pi9CPiS3yCUPm9f7fQAzE7SUwr/TRDmkGML0j
         0XQjw3XBo3K4NVw/7G6igAu1z12nlKMSyTp8p2nI/Hg/4wTm/1i0HfJiSE2ZHCPujE57
         jOOw3W/Bflly2mkzPmYnRzowMYD82DkaaMI//IMA+wPrhqxVDsE0fiB9sbm5fq/EIqFG
         Pc9EMV5l86dbJ26tFu89MtZmLqaP9iiYUJXuo8seb1gJaWNbmjElKgsqMskqBlHhYhG7
         M1CJCXFIhkq709p94EDlpO1clM2LL/LBy5m0P8FfMc7pvhLBWTx6nGOED4j2tQ6Kg2W4
         tiTg==
X-Forwarded-Encrypted: i=1; AJvYcCWwXBHUQyGA3zzvXu3r/aCqwBAVtYDxppcbhWpmdQD5d/NXioYR+NDGux0GnVlSZDr6qA9wtaIVVO4pzQkg@vger.kernel.org, AJvYcCX0EbOQWk1/60jd2crasJ7EIG3ZRvLm5/RQ+fVT48j/2wHZ7mObnv52xiPKthpwppY2P9ZNmqiUcDdR@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYaNd2gmCX0CYh0qT3vV5v1fXSeKt7w88jA6dKaVIc/O/OYVe
	UlCfqKRMCwgTyWR4wHAlYSQ9OU6JGUo/qQLPM5EXIkx/UldXgPQN
X-Gm-Gg: ASbGncu5Jj0TmoES8O74b3mIJopvU6sHZkSb8A7GpAj6z9ZOK4Y0zNgTD4jeMbrn8SP
	Kvj4FhNaz0ocELI7Sz7RfvT6o/AGHd/JR0tVJi0zINxRcsdIAS98qPKu4shZ7ZxER8sbf0JefzQ
	uRpKEbJZLjTPW2HCQJv7PvPDFSGoTH1EfH+2fgNBvVZqhfs+REY4t2ku5Flq/0yz/1/qQJ+abTl
	+wuaD8XoXzCNqJ/BI5hcVF6qTENoVhVpHaNtDh6fPozpiavOjdl9hZ9hAxZNz85v9L8IuEAW7Ul
	iZarj5cISZYJOhOPX7q1xWJje1b+EfjFRtphmkuRCwrdZQm6/VMA9zm9ld+ylZlSwsS0
X-Google-Smtp-Source: AGHT+IGJV2RjrsEGH4G9E7FfOU9np25O3dZ+J8l0SIo7Gdk10tVsJ6ybpUSbflQFjN7lriWVMh6dCQ==
X-Received: by 2002:a17:907:7ea4:b0:ac3:2368:9a12 with SMTP id a640c23a62f3a-ac6faf024a2mr719727266b.27.1743164523493;
        Fri, 28 Mar 2025 05:22:03 -0700 (PDT)
Received: from [192.168.7.2] ([92.120.5.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b184sm159831966b.51.2025.03.28.05.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 05:22:03 -0700 (PDT)
Message-ID: <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
Date: Fri, 28 Mar 2025 14:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
 <20250325032303.GA1624882-robh@kernel.org>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250325032303.GA1624882-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 25.03.2025 05:23, Rob Herring wrote:
> On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for IMX AIPSTZ bridge.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>> new file mode 100644
>> index 000000000000..c0427dfcdaca
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
>> +
>> +description:
>> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
>> +  issuing transactions to IP Slave peripherals. Additionally, this module
>> +  offers access control configurations meant to restrict which peripherals
>> +  a master can access.
> Wrap at 80 chars.


fix in v4, thx


>
>> +
>> +maintainers:
>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8mp-aipstz
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: bus
>> +      - const: ac
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  "#access-controller-cells":
>> +    const: 0
> With 0 cells, how do you identify which device it is?


we don't atm. We're relying on the default configuration.


we don't have any APIs for AC configuration so I left the

cell number to 0 thinking that the cell number might depend

on the API.


if need be, I can set it to the value I was initially thinking of in v4.


>
>> +
>> +  ranges: true
>> +
>> +# borrowed from simple-bus.yaml, no additional requirements for children
>> +patternProperties:
>> +  "@(0|[1-9a-f][0-9a-f]*)$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      reg:
>> +        items:
>> +          minItems: 2
>> +          maxItems: 4
>> +        minItems: 1
>> +        maxItems: 1024
>> +      ranges:
>> +        oneOf:
>> +          - items:
>> +              minItems: 3
>> +              maxItems: 7
>> +            minItems: 1
>> +            maxItems: 1024
>> +          - $ref: /schemas/types.yaml#/definitions/flag
>> +    anyOf:
>> +      - required:
>> +          - reg
>> +      - required:
>> +          - ranges
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - "#access-controller-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8mp-clock.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus@30c00000 {
>> +        compatible = "fsl,imx8mp-aipstz";
>> +        reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
> It doesn't look like you have any registers in the 1st entry, but they 
> are child devices? Then you should use ranges and drop it here:
>
> ranges = <0x0 0x30c00000 0x400000>;


I guess this would mean switching from global addresses (current way) to

bus-relative addresses for the child devices. This wasn't my intent.


I wonder if we could just switch to V2 in which we just use the bridge's AC

configuration space and an empty 'ranges':


aips5: bus@30df0000 {

    compatible = "fsl,imx8mp-aipstz";

    reg = <0x30df0000 0x10000>;

    /* some more properties here */

    ranges;

};


or as Marco just suggested use


ranges = <0x30c00000 0x30c00000 0x400000>;


instead of an empty 'ranges' to restrict the bus size.


Personally, I'm fine with both approaches but what's your opinion on this?


>
>
>> +        reg-names = "bus", "ac";
>> +        power-domains = <&pgc_audio>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        #access-controller-cells = <0>;
>> +        ranges;
>> +
>> +        dma-controller@30e00000 {
>> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
>> +            reg = <0x30e00000 0x10000>;
>> +            #dma-cells = <3>;
>> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
>> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
>> +            clock-names = "ipg", "ahb";
>> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> No 'access-controllers' here?


no need for that unless the child wants to request a specific AC

configuration for itself.


>
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>
