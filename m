Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C602DCC01;
	Sun,  1 Jun 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792568; cv=none; b=snHgIkSjMoSjV7w79Dn9AT0jVnG523JsbN0dFCf8VSZ8HkIg+lHKguQdqYHYS6dY9Ufg8L2XfyEd8xxfvadxNFzW0HPrWKmwwkoAXgEvxyVeqDYjtioqx6i1DWaquD6iRsTZFPLkUMf1IIasI9Fr5/M25SVcddsez0C8qVLwp4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792568; c=relaxed/simple;
	bh=NyzbhwD6gDnNChnaAlCQzvKWRByDWtrfLcm615+QxPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3uiL2gxPUVdeCVOsJVdISOzBXxJZNH8/NQ7x7b0bxeO6LpiNqeThgriRlxvNtPYFj7XiJQVgQYqrX79YUN6Bjrz0ptzlakh7RWeE0Buwt5xcgPE6tm1XksOdZ7icuHIfkDTd5OeHyXeXCmO+11P0TUTF6kWSwUS2Yz7IcepA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7SACl/+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7SACl/+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF4BC4CEE7;
	Sun,  1 Jun 2025 15:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748792567;
	bh=NyzbhwD6gDnNChnaAlCQzvKWRByDWtrfLcm615+QxPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p7SACl/+Q7aKsQGdUJ0rxIXofHNBx/1fEiVH8w17OLr4DQRaZzEI2raFHSeA32vFn
	 QTwbuTFG8l3J2ldun+F0aJkDPcEMFX7P7FCxsxNNQTBbDWA8Bj46anwFsKOtNyfBX5
	 8a9HZo97mSh8QwNZ1pLOSCroP1eivLbG0rfDaBOUrYOIhzOdpALdLNZevepFTOtyRr
	 vwNgem3JEr+zsFgpgcCRmTSkJV90XQewY/XMPcwm8y5hnsde28j8jSg+1BY5l9q864
	 aGihJj0+U9y73CH+5NlmCI8+lb/irwOp2VV2ftvbWuACba/gpxIkpGreCtxyhCMAT0
	 qq98oM0a906dg==
Message-ID: <be95cc2d-f548-4c71-a57b-8107009b8776@kernel.org>
Date: Sun, 1 Jun 2025 17:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: eeprom: Add ST M24LR control
 interface
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
References: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
 <20250601153022.2027919-2-abd.masalkhi@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250601153022.2027919-2-abd.masalkhi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/06/2025 17:30, Abd-Alrhman Masalkhi wrote:
> Add support for the control interface of STMicroelectronics M24LR
> RFID/NFC EEPROM chips.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  .../devicetree/bindings/eeprom/st,m24lr.yaml  | 72 +++++++++++++++++++

Do not send next version while the discussion is still happening.

>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml

I still do not understand what is this device exactly. You said this is
not EEPROM, so my advice of putting this in eeprom seems not correct.

> 
> diff --git a/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml b/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
> new file mode 100644
> index 000000000000..6d72325865d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/eeprom/st,m24lr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics M24LR Series NFC/RFID EEPROM Control Interface
> +
> +maintainers:
> +  - Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  STMicroelectronics M24LR series are dual-interface (RF + I2C)
> +  EEPROM chips. These devices support I2C-based access to both
> +  memory and a system area that controls authentication and configuration.
> +  They expose two I2C addresses: one for EEPROM memory and one for the
> +  system control area (e.g., UID, password management).

e.g., -> e.g.

> +
> +allOf:
> +  - $ref: ../i2c/i2c-mux.yaml#

Full path, so /schemas/i2c/i2c-mux.... but this is not an i2c mux, at
least not in your description, so something feels incomplete or incorrect.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,m24lr04e-r
> +      - st,m24lr16e-r
> +      - st,m24lr64e-r

What does "r" stand for?

> +
> +  reg:
> +    maxItems: 1
> +
> +  pagesize:
> +    enum: [1, 4, 8, 16, 32, 64, 128, 256]
> +    default: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >

Do not need '>' unless you need to preserve formatting.

> +      Maximum number of bytes that can be written in one I2C transaction.
> +      the default is 1.

Don't repeat constraints in free form text. I already asked for this.


> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      i2cmux@57 {

Nothing in commit msg or binding description explained why this is
i2c-mux.  i2c-mux is not an eeprom. Exposing two I2C addresses also does
not mean it is mux - we already have such devices and they were never
called mux.

> +        compatible = "st,m24lr04e-r";
> +        reg = <0x57>;

Where is the second address? It is supposed to be here.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        i2c@0 {
> +          reg = <0x0>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          eeprom@53 {
> +            compatible = "atmel,24c04";


And even if there was a mux here, then where is the second device?

> +            reg = <0x53>;
> +            address-width = <16>;
> +            pagesize = <4>;
> +          };
> +        };
> +      };
> +    };
> +...


Best regards,
Krzysztof
