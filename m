Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2E19CC0E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317903; cv=none; b=HgUVNBihPBHk3Xod9CCw6R4qlXnEDHe/C2ou1Ip7JF/O22LNgBWErgtaJyD6vGXt9AhmRo4NsNvMRApZi0qHYb5uiSjHcvG4tMz4TsD3IBdhoY9zwCGwTe20E6ggyJLrPbj/bdCfKP6QUi7lsoVfkk/8HguhvL5Gsg1O4hA0Uss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317903; c=relaxed/simple;
	bh=i8tlY/LbfI0ZDQSrDItL+NiokGBk6h8Vq0LsxV2KBrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDgIsZJLumKRdQHQBvaDKs4YiRnocTozHTkxp+lEk92hkBb+C41C2NW+QjAq+7Q+u8KRrwlQTfLEaKL8yIvhYM4Ljbm2dS4FVUg7KZHQlZmMkBwSgfo96SQBQ73x4dKvyd5v+ozbUhPwgl0wExcaIoo/Sd+PCmjXxgcAspVdgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z7pwWEil; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z7pwWEil"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c172f1de1so754283a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747317900; x=1747922700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9K77ZU3+im9NvK6fucyyQ4XpbTRkWMjyw12HrfwTZqs=;
        b=Z7pwWEiltQ7ovS77kfVNfs+mxU8th+aD84I2nMsFmNNtyX7Apij1J3/lT+X0Lry8ng
         GkW3fq9HbaQAfJ4YnUL2puCafh88xDUAv0hEV1ALrx2Ql3mBXmGNwyFD6g9Ksajv+/4z
         iKF1bHFe8BZzz7J70RpoOtQ55+jLc25bQdZDdPjC4lKLY4sbp1Sh8svOleLndqY2kPrs
         /uKsJqwBNo0ZWkp9HVbC1q3OmFfDlVhSJmMK9831958aiQdc24q4kVzdGmI10xPysXrS
         3gdwo+W8UJE+0e3Zlw0qXi1++zNiiRB1BL2Otq1UaYZfjSSOCsjZbCU9b8JsEB3KzYvl
         Of5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747317900; x=1747922700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9K77ZU3+im9NvK6fucyyQ4XpbTRkWMjyw12HrfwTZqs=;
        b=fa5kvF1/mmvZ6lPh6g6V4v1RF3DU5FA2OOXJysb2BDmMUVUcvroJGHSy+E5a55YRB8
         c4JmoayB7j+eqoBiPC0b0ee6ErwS6Q0PnQC+lz2JASNuN+BTl9THWvYQGtNg7qtGcFgH
         IEY1jbS90bIPV1QlgmMzinh4P4csc0ZqNJwz6IqSI5ML7T809Rm6pzlCCKyjVk4XJZcc
         uLZEUXXSvOlO3GMjXzVGzqSZp/16AFW11749sTHqpatYn8MwhMC5D/dvZWKt6Gl6yW/T
         hhdZ0CaK4WTctISvtuND/B69Qo757FpqfEkLY7xa/eGi+/Scq+TJ1GIpZM65icJIG30F
         l8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUUh5dIKVMWjtX4VLIMLFw02RE9e9204DNorZKSeRULZMiPtGR3UBnkxv+RBn0oP0zqpH5BzMf4oasEwTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6wcOpmqGG8bqZYpatqg5I0ZtfAk+dQUvulsr/fjgqAozcico
	Ib343uAnO1TgWyxDUXwjqs21tQosSqC+u5X63sRToGe/NiPIAp9dV1oiv68Ti6M=
X-Gm-Gg: ASbGncvBBE5MUB9w/C7hAqz2TgIZuzqZtSGFax76HKBdCuMi2/qO44m5eCflgCChkKQ
	+bP4TTJzw5nYEELBAcYzPwHG/UoWGdtGAeS9UOXOPbF9rixu18XAjFchYWru076EhaImehQun9z
	KGFWhQeC1vWwi9t0Ngnueqiq08Faev2k2tmSUdj/7zfK4KeAeS2trV+hT752oc2v9zTKaBYkZx6
	STM/JeERkYaInPJfjC+6NvqD0ThZTLODdLEsVmSnxw37lhgFNfH2tg3rD6L6EOlppDjX0pAXpJ1
	dIj/81D6z4/D+Wg+zWsHlmRRQVDNSqkReqUabYqxZh+V571+i3bc1XFJKVj8M8D7KrtORoNL/PB
	bRBCfugC+EKVwSFlPJraFoXeE1NWX
X-Google-Smtp-Source: AGHT+IE5zLtoEtrW+oFDBQ1zy1uWy5TOgC1cPAyin7uJmHiCiE/9u6LzX2kphTwBuNw2dfLO3Zn//g==
X-Received: by 2002:a05:6830:4109:b0:731:cac7:3634 with SMTP id 46e09a7af769-734e13d0966mr4171455a34.3.1747317899864;
        Thu, 15 May 2025 07:04:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:bb18:367a:73d3:5230? ([2600:8803:e7e4:1d00:bb18:367a:73d3:5230])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264d78fbsm2733023a34.32.2025.05.15.07.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:04:59 -0700 (PDT)
Message-ID: <81b2a499-1927-4fb3-b581-a533c64507a6@baylibre.com>
Date: Thu, 15 May 2025 09:04:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings:iio:gyroscope:invensense,itg3200: add binding
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nuno.sa@analog.com, andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250515002817.81863-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250515002817.81863-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/25 7:21 PM, Rodrigo Gobbi wrote:
> There is no txt file for it, add yaml for invensense,itg3200 gyroscope.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Added @Jonathan as the maintainer here due a suggestion in a
> different thread for a different binding file.
> Created this yaml using the driver probe and comparing with other gyro bindings.
> Tks and regards.
> ---
>  .../iio/gyroscope/invensense,itg3200.yaml     | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml b/Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml
> new file mode 100644
> index 000000000000..0656dbb58cf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/gyroscope/invensense,itg3200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Invensense ITG-3200 Gyroscope
> +
> +maintainers:
> +  - Jonathan Cameron <jic23@kernel.org>
> +
> +description: |
> +  Triple-axis, digital output gyroscope with a three 16-bit analog-to-digital
> +  converters (ADCs) for digitizing the gyro outputs, a user-selectable internal
> +  low-pass filter bandwidth, and a Fast-Mode I2C . Datasheet can be found here:
> +  https://invensense.tdk.com/wp-content/uploads/2015/02/ITG-3200-Register-Map.pdf

This is only the register map, not a proper datasheet, so isn't useful
for the devicetree bindings.

> +
> +properties:
> +  compatible:
> +    const: invensense,itg3200
> +
> +  reg:
> +    maxItems: 1
> +

Missing vdd-supply and vlogic-supply properties. These should be
required.

Missing clocks property for optional external clock.

We always try to make the DT bindings as complete as possible
even if the driver doesn't use all of it.

> +  interrupts:
> +    minItems: 1
> +
> +  mount-matrix:
> +    description: an optional 3x3 mounting rotation matrix.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        itg3200@68 {

           gyro@68

Generic names are preferred.

> +            compatible = "invensense,itg3200";
> +            reg = <0x68>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&itg3200_pins>;

Probably don't need pinctrl stuff in the example.

> +            interrupt-parent = <&gpio2>;
> +            interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +        };
> +    };

