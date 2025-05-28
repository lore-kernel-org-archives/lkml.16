Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582D1F8728
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419165; cv=none; b=PLcwO7qv7KOlTrtjKhG06btiNuOCsWUdd8UMxOEa4Wjt98CpTIEuPvgdxQ4C9rnyq3DOhACGkJ71zoCH9Ko9mB4v30Rjjb4Gf0hW3I+rgelPasyy3lFE+ldolU5CcM4nqxOSMEcl9ySyUiGuJuhFKQSLQHk80mWDw/1wy3vtbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419165; c=relaxed/simple;
	bh=lTpKD/0DenivGi6z0137m81o+V5ysUx2nV8K0HXyN9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3rANg0wEutBSXkoPzZFT39L9t1SAjcBSmgE/BwaGCgiJy7RGNpHfWIhHiFDFjMDkPAhNJHYoQJH3TFKIEuh0WtfdvZ6q6LhWJsbkP8SIjZcdyfUlYz1StDl9pZhpH8aY3f/fE8ZJBaPica5oTPboQCVlmcs67nChsPpT0GehS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=NTABLokc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="NTABLokc"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d3261631so1889965ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1748419162; x=1749023962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4S1CZW2QhVODXn5wyDF2trheqRunplrz19cyZTEBaFI=;
        b=NTABLokcS6bGT9ndtFEYuJl0txh0ugGOYIhMraS0kZ/yi6YQUG+H7LCW2An3TxwZ62
         Zagryqbby+XSoPd2/7l4WcIawQiCv5VJJ94dEwZMSih6yHbPg+VDEpkjVQJqZ0Emsz2Q
         EsuhboNkyYKWGWUyZJwBX9dFwyuW6taBOGcTeO+H65P5a2+LHSQpscQOmbsJlpBw3W7W
         aN8oMG3IW2F5th+IqUAjKXJ4wXR/82hC5cDwmPeY/GB2pZQTAZQvOzC+u4LE9AFeZln8
         5EPK/YvtFEfPOEvbuTFy6swM87WtEc0kYbPNJ3C+j6oEzcija35KnFLbezE8haHCBwYm
         vixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419162; x=1749023962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4S1CZW2QhVODXn5wyDF2trheqRunplrz19cyZTEBaFI=;
        b=En8mK0YgNgAxEwJ0jLiUw8kDxuBqdvYLjwS/uBAMziN32Uvw0iDFxkrk+6+W3iXHkP
         nLLnsO64nWVVl0Jp3wiWX8G55UtFbOCHZq3V+4JQhbb3SZwNjj2MQoLJOhcn1s5Qzcun
         5a7c7wUjNwPwkIPsqvNBEpatdlbIWf+mXrrC4Q3mC2EvCbeQQUuO7oszEcCcxH12BnUJ
         aQeIjPp+nrZKBpoyro46Xm07cu5BzFswwo21GifAczj965CIXsPwhZd00E2froUbbElJ
         Qq1D4WC/ACICdNS5PZVxc8C7O5HprCTZ7IgXpjgnwbU2uV/TaQGsz+QtCxocjHUllxbY
         Cs8w==
X-Forwarded-Encrypted: i=1; AJvYcCUOzAmybdKAHzizj0rMlRWuJ1hf8fSUnF9kDETHcdbjUWxacBMPmp6oEx7kD1xL+hMjIvAhp3IjEj0T09w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcgpzB2SUwKFP7D63klEgRcMlCFExid2Dea0RgQYQ3PC09dW2
	o/Nlmwhq6wxtAdrfMiBTRLD6u8RuQXSy/Ho+voJ0Veye8pdFhPi9e5tcTqRtQOfmlw==
X-Gm-Gg: ASbGnctVqxNmRLt3QledmO3JjQom4ZjbBCqO4LCIbmcK2GAeWfjzXgEvmpYwYCX0yl0
	nhvdO8R5A24rH0a1p0pw9S05QBt0Urfa7aO15djrkaOB7jBDQxYhrx8Xvuq+cBsKswa4VXq/FYI
	sBDKhbYvaZHryBCBITf/+ty3T//XfpQOjp/o9eW8e9o7Mw4s9r23UR/U7j8LzW3aDGgQoE5Paer
	Z0CyoOB+jr/grOi5O1U/yzvR8qBHSayA/KheGmTYBQTrjzLD5mjgRSkN8Zf95OM/7Gjx3ToJuON
	1agVojERANZej1NuYEpDU8Fj8oxxPJ1ua4nrn/XccnKhthfKoH2J3c5t6/k1fsXscx0K+Q6uS4I
	Tzs+KHZQiLrAYWfDInadotfY7jjPa
X-Google-Smtp-Source: AGHT+IFinm210KsgPpT052kUqMgd0kmoXBGoJfUCmTLu114QHHNEhBfzO75J/jBa41z7KGIIueND9g==
X-Received: by 2002:a17:902:e845:b0:234:bfcb:5c21 with SMTP id d9443c01a7336-234bfcb5d41mr40674185ad.19.1748419161996;
        Wed, 28 May 2025 00:59:21 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:4f57:7796:ebc0:39c1:2cae? ([2401:4900:8898:4f57:7796:ebc0:39c1:2cae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35ac4e2sm6265415ad.177.2025.05.28.00.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:59:21 -0700 (PDT)
Message-ID: <6c61a101-6ec7-4350-bfa7-5b7d32177818@beagleboard.org>
Date: Wed, 28 May 2025 13:29:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, devicetree-compiler@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
 <20250430125154.195498-2-herve.codina@bootlin.com>
 <0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/28/25 00:01, Krzysztof Kozlowski wrote:

> On 30/04/2025 14:51, Herve Codina wrote:
>> An export-symbols node allows to export symbols for symbols resolution
>> performed when applying a device tree overlay.
>>
>> When a device tree overlay is applied on a node having an export-symbols
>> node, symbols listed in the export-symbols node are used to resolve
>> undefined symbols referenced from the overlay.
>
> I have impression that this is being discussed in three places
> simultaneously - here, DT spec and DT schema. I don't know how to solve
> the multiplication, but I will keep answering here, because that's my part.
>
>> This allows:
>>    - Referencing symbols from an device tree overlay without the need to
>>      know the full base board. Only the connector definition is needed.
>>
>>    - Using the exact same overlay on several connectors available on a given
>>      board.
>>
>> For instance, the following description is supported with the
>> export-symbols node:
>>   - Base device tree board A:
>>      ...
>>      foo_connector: connector1 {
>>          export-symbols {
>>             connector = <&foo_connector>;
>>          };
>>      };
>>
>>      bar_connector: connector2 {
>>          export-symbols {
>>             connector = <&bar_connector>;
>>          };
>>      };
>>      ...
> And what would this mean? Which symbol is exported - foo or bar?
>
>>   - Base device tree board B:
>>      ...
>>      front_connector: addon-connector {
>>          export-symbols {
>>             connector = <&front_connector>;
>>          };
>>      };
> <from my other reply in private>
> Another problem is that the board DTS should not care about overlays. It
> feels like breaking encapsulation and I cannot imagine now adding 1000
> export-symbols, because every i2c, spi, mikrobus or PCI slot could have
> an overlay applied.
>
> You could argue that only few nodes will be exported like this, so only
> real mikrobus connectors. Then I will argue: look at aliases. People
> alias everything everywhere, not following the guidelines.
>
> If we assume that such overlays are designed for specific boards, thus
> there will be only one or two exported symbols not 1000, then what is
> the benefit of export symbols comparing to referencing by full path?
> </end from my other reply>

Can you explain how referencing by full path will work in connector + 
addon board setups?

The full path will be dependent on the connector, which means the same 
addon  board overlay cannot work for different connectors.


>
> And with above assumption - such overlays designed per board - plus my
> first point about duplicated exports:
> connector = <&foo_connector>;
> connector = <&bar_connector>;
>
> why not exporting the symbol with the same name? E.g.:
>
>       foo_connector: connector1 {
>           export-symbols {
>              whatever-property-style = <&foo_connector>;
>           };
>       };
>
> and overlay:
>
>       node {
>           ...
>           connector = <&foo_connector>;
>           ...
>       };


Isn't this overlay tied to `foo_connector`, i.e. it cannot be used with 
`bar_connector`?


>
> Or even annotation?
>
>       foo_connector: connector1 __exported_symbol__ {
>           ....
>       };
>
>
>       node {
>           ...
>           connector = <&foo_connector>;
>           ...
>       };
>
> ? This also answers my further question about DTS style (see at the bottom)
>
>>      ...
>>
>>   - Overlay describing an addon board the can be connected on connectors:
>>      ...
>>      node {
>>          ...
>>          connector = <&connector>;
>>          ...
>>      };
>>      ...
>>
>> Thanks to the export-symbols node, the overlay can be applied on
>> connector1 or connector2 available on board A but also on
>> addon-connector available on board B.
>>
>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>> Tested-by: Ayush Singh <ayush@beagleboard.org>
> I would argue you cannot test a binding, because testing here is part of
> a process, but what do I know...

Ahh, I added tested by for the whole patch series to check that the 
phandle resolution is working. But yes, I have not tested the bindings.


>
>
>> ---
>>   .../devicetree/bindings/export-symbols.yaml   | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/export-symbols.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/export-symbols.yaml b/Documentation/devicetree/bindings/export-symbols.yaml
>> new file mode 100644
>> index 000000000000..0e404eff8937
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/export-symbols.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/export-symbols.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Export symbols
>> +
>> +maintainers:
>> +  - Herve Codina <herve.codina@bootlin.com>
>> +
>> +description: |
>> +  An export-symbols node allows to export symbols for symbols resolution
>> +  performed when applying a device tree overlay.
>> +
>> +  When a device tree overlay is applied on a node having an export-symbols
>> +  node, symbols listed in the export-symbols node are used to resolve undefined
>> +  symbols referenced from the overlay.
>> +
>> +properties:
>> +  $nodename:
>> +    const: export-symbols
>> +
>> +patternProperties:
>> +  "^[a-zA-Z_]?[a-zA-Z0-9_]*$":
> This messes up with coding style which I would prefer keep intact.
> Basically these properties will be using label style.
>
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A symbol exported in the form <symbol_name>=<phandle>.
>> +
>> +additionalProperties: false
>> +
> Best regards,
> Krzysztof


Maybe the dt-schema discussion will give a better description of why I 
need export-symbols or something similar [0].

I have also been trying to move the discussion regarding global vs local 
scope overlay application for connectors here [1].


[0]: 
https://lore.kernel.org/devicetree-spec/20250411-export-symbols-v3-1-f59368d97063@beagleboard.org/T/#u

[1]: 
https://lore.kernel.org/linux-devicetree/9c326bb7-e09a-4c21-944f-006b3fad1870@beagleboard.org/


Best Regards,

Ayush Sigh

