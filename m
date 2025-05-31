Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B40F6ADD;
	Sat, 31 May 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698645; cv=none; b=B9vZnolBaPLJAjqydx3wOknMBM7ELYCobjgCce7rJQEvmZSM3bOtYG3FeLhNtU5dGY37VW5L262OOt+Xroz7/88Ww3eiC63WHqwpMfntY+zdz9E2c6bhAR5CaBGWeeXrNZcIX1CTxQYNslImGLjUlRg9EgPertyA6jymYUmnxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698645; c=relaxed/simple;
	bh=jS+4UXLX5Uc7d7YlVW9psi30HLFQRfavURIV9nY/8KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GaJaOYCsOafSBqZN3h/2bR/kwEiFkk66bfTffv0D95hwVFkTvzpw0MjrvozqQsUpu35sW1NS5xMdJBok52HqkjrP32BOxL0eilRHCXvRfnrvMq34ZqNC4Kh5qeOnB1FjFUl27khYbzpriY7VJK+b9sGCMN35+0MacVur3+WFXwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rerwrqdn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rerwrqdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122A0C4CEE3;
	Sat, 31 May 2025 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748698645;
	bh=jS+4UXLX5Uc7d7YlVW9psi30HLFQRfavURIV9nY/8KQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rerwrqdnw5JB787JyR6KzHSYypA9WknH4QSmvnTCVwKLM73NOW0Hl6oSb37JWpEe4
	 ZxiveukIsTA2i/eBM1kXGfFsUsIm4aro9hTklyLQwAh3Irj8rTrE2VFl3vlPvreSkx
	 XnqYExxagd3QI/wtf8aYkGT6RtNaItqNulMYodb8X7mHk1qQLNoqJTHAaizM63S7+U
	 Nl3TMDEVdnyHJsBVEujG4QdJxoM5ZrPYqsiSiuS4/EyEFpBKg830VDq7CvFAFnt1fi
	 v46s4PszSW7XPKeVe4yR9TpBnlDwWuPzlMOBKrIDtiHy3lxaAo7BQkY+nmFi4MY1E6
	 uE+JSiXV6ewxw==
Message-ID: <852ef4fd-6c26-4f79-a1d4-b3e37926ed7a@kernel.org>
Date: Sat, 31 May 2025 15:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: misc: Add binding for ST M24LR control
 interface
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
References: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
 <20250531081159.2007319-2-abd.masalkhi@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250531081159.2007319-2-abd.masalkhi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2025 10:11, Abd-Alrhman Masalkhi wrote:
> Add a Device Tree binding for the STMicroelectronics M24LR series
> RFID/NFC EEPROM chips (e.g., M24LR04E-R), which support a separate
> I2C interface for control and configuration.
> 
> This binding documents the control interface that is managed by
> a dedicated driver exposing sysfs attributes. The EEPROM memory
> interface is handled by the standard 'at24' driver and is
> represented as a child node in the Device Tree.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  .../devicetree/bindings/misc/st,m24lr.yaml    | 70 +++++++++++++++++++

That's not a misc device, but eeprom. Place it in appropriate directory.

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/st,m24lr.yaml b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
> new file mode 100644
> index 000000000000..5a8f5aef13ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/st,m24lr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics M24LR Series NFC/RFID EEPROM Control Interface
> +
> +maintainers:
> +  - name: Abd-Alrhman Masalkhi
> +    email: abd.masalkhi@gmail.com
> +
> +description: |
> +  This binding describes the control interface for STMicroelectronics

Describe the hardware, not the binding.

> +  M24LR series RFID/NFC EEPROM chips (e.g., M24LR04E-R, M24LR16E-R).
> +  This driver provides sysfs access to device-specific control registers
> +  (authentication, UID, etc.) over the I2C interface. It act as a

Describe hardware, not drivers.

> +  I2C gate for the EEPROM. Therefore, The EEPROM is represented as a
> +  child node under a port and is accessed through a separate driver
> +  (the standard 'at24' driver). This implementation is possible because

again, describe hardware not driver

> +  the M24LR chips uses two I2C addresses: one for accessing the
> +  system parameter sector and another for the EEPROM.

This suggests you have two I2C addresses for one device, not two devices
with parent child relationship.

> +
> +allOf:
> +  - $ref: "i2c-mux.yaml#"

Drop quotes. So this is I2C mux or EEPROM?

> +
> +properties:
> +  compatible:
> +    enum:
> +    - st,m24lr04e-r
> +    - st,m24lr16e-r
> +    - st,m24lr64e-r
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.

Drop description, redundant.


This device is not compatible with AT24?

> +
> +  pagesize:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Maximum number of bytes that can be written in a single I2C
> +      transaction. the default is 1.

enum:
default:

and drop redundant free form text.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

unevaluatedProperties instead

> +
> +examples:
> +  - |
> +    i2c {
> +      m24lr@57 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "st,m24lr04e-r";
> +        reg = <0x57>;
> +
> +        i2c-gate {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          m24lr_eeprom@53 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            compatible = "atmel,24c04";
> +            reg = <0x53>;
> +            address-width = <16>;
> +            pagesize = <4>;
> +          };
> +        };
> +      };
> +    };
> +...
> \ No newline at end of file


Best regards,
Krzysztof
