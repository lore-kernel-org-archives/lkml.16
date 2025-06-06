Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7120330;
	Fri,  6 Jun 2025 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215441; cv=none; b=RmLQ+HYmWJZgbhqsw1u95ON7pF9EPpcEccnxHpoQO8usk0JcN1fwwUi7pD6UPVujh6q9/Z9ePvNyq8tmG6Pap0Vk0FQwKaNr8YJBbKjXXughGLlF3vPwG4VeGKEnWxkIyVfP9w/jIi40/MWRHkS2egI6vv6EiRC2CvP92ilnboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215441; c=relaxed/simple;
	bh=SVug/aqo8cSEHImdiHsS6qvrHQEZSQXQzALJ1QQBjc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBL4mr+C00GV8Uv1ozjoN2sUnpk+PITLQrYT86g/d2HCqqKBmqEz1M0P4MhlpvaHZ+rUYjp5oSwaCkL8Plv7pggBQYzBaMinEYb01f7Ex2Fxbd4wTOjgtIF+nnT6hGuuG5TZ1nEcI49RMOyT8dK+w2QAQTvebhWLr2dqLAJ56tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtWe8aeq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtWe8aeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70574C4CEEB;
	Fri,  6 Jun 2025 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749215440;
	bh=SVug/aqo8cSEHImdiHsS6qvrHQEZSQXQzALJ1QQBjc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtWe8aeqA1NV6B9qkEA63h4NPUHc/zV0YEvSo3zEq/Dr4Lp5CMm3wtVao65ykvhbI
	 KCRr2PgypwdAv4ZovXTuAlvcr6yQQEPWmgo3gTEQjxxYNy7nKx+oAypzQmRW1g32PL
	 KKcQ5umixD5eRohYLr02361sDOhuF9zxNdpciY4F8dFkdSVG10DU1kJRIME9ZXs9Zq
	 k4UvkdIyRf8qZHPsXef8iSIzBcihT8Hs1ohUjEAQ5cJeRkyDhXpGWCeC6TTBDxL0L2
	 1FkfYxYDT7xYqvGvqC+33wuTf8ZfXXrqM00CH7fcj4UlNXPJRMDYViJahJhLc3EGwc
	 cMcLUgrmYxK/A==
Message-ID: <8ac3c2da-2824-44fe-942c-fceb8b6f5332@kernel.org>
Date: Fri, 6 Jun 2025 15:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: eeprom: Add ST M24LR support
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
 <20250606120631.3140054-2-abd.masalkhi@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250606120631.3140054-2-abd.masalkhi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2025 14:06, Abd-Alrhman Masalkhi wrote:
> Add support for STMicroelectronics M24LR RFID/NFC EEPROM chips.
> These devices use two I2C addresses: the primary address provides
> access to control and system parameter registers, while the
> secondary address is used for EEPROM access.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
> Changes in v3:
>  - Dropped reference to the i2c-mux binding.
>  - Added reference to the nvmem binding to reflect EEPROM usage.
>  - Updated 'reg' property to represent the device using two I2C addresses.
>  - Fixed DT schema errors and yamllint warnings.
>  - Removed the unused 'pagesize' property.
> ---
>  .../devicetree/bindings/misc/st,m24lr.yaml    | 54 +++++++++++++++++++


How did you implement this feedback:

"That's not a misc device, but eeprom. Place it in appropriate directory."
?

There is no such device as a misc device.

>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/st,m24lr.yaml b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
> new file mode 100644
> index 000000000000..775d218381b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/st,m24lr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics M24LR NFC/RFID EEPROM
> +
> +maintainers:
> +  - Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> +
> +description:
> +  STMicroelectronics M24LR series are dual-interface (RF + I2C)
> +  EEPROM chips. These devices support I2C-based access to both
> +  memory and a system area that controls authentication and configuration.
> +  They expose two I2C addresses, one for the system parameter sector and
> +  one for the EEPROM.
> +
> +allOf:
> +  - $ref: /schemas/nvmem/nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,m24lr04e-r
> +      - st,m24lr16e-r
> +      - st,m24lr64e-r
> +
> +  reg:
> +    description:
> +      Two I2C address, the primary for control registers, the secondary
> +      for EEPROM access.
> +    minItems: 2
> +    maxItems: 2

Replace this all with items and description:
items:
  - description: foo
  - description: bar


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
> +      eeprom@57 {
> +        compatible = "st,m24lr04e-r";
> +        reg = <0x57>, /* primary-device */
> +              <0x53>; /* secondary-device */

Where is the rest of at24 properties? Not relevant? Not correct? I had
impression this is fully at24 compatible.


Best regards,
Krzysztof
