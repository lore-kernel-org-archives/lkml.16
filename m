Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC67264A7C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585475; cv=none; b=H9n7bqJkPre46AFUrqICm5Q5LVEq81Yb57Qh7UTRV6GMTOk0ej8fiBq5RJNEQGCXqawuELP0UWNBsnP4InC/Wy485e7omcGNqWkPf5zJ2FhgNFfde66lsXdN8mWS19NUZ3rVkDaLqaB7ECouupU5VbDvRIPwmIifOag4JZeyXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585475; c=relaxed/simple;
	bh=s6e6ud95i060by5ZDgVZWMBtZhqk8xi9O9Hn2Hs928U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+SHT7EPiz1xPQoZ6R8BNupVHOvfAsvACFoZISu2k5iwTveQ00PDA7IiBBFtdb1fyhJRfyaSEuH0kUPIQrd5lzWemK8T5kzPtUIE5/12GQJCR8WTFB1CuyD+IfKzeFk/MlTGPdyQC/qbniGLm4Zasp3tFWC5BDLw2I1OUUVV0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=QLm5kTGP; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="QLm5kTGP"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ddeaad6036so13077885ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1749585472; x=1750190272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8arP5MQ8o2r6kwstCGi8yYOLU/0CwgGbynmW/R6CU1w=;
        b=QLm5kTGPBjEbHzGvNoPUbsiJ6yD6zFJ7n0bbFpMl7BuBi4et5EVWEM7uvmIptA80eV
         hSPkd9BCdMxW9QPVZKS2eBqXY/qC1t7BHb7cziNXipWBH1wQZbGJJYouCG3jaWN3KEPi
         vMYTMhb/VSvDbVlAVslNB5kgcmP4qHmP8TtsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585472; x=1750190272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8arP5MQ8o2r6kwstCGi8yYOLU/0CwgGbynmW/R6CU1w=;
        b=i5HE8OAGoZMMNktnEBscrKpwc+9Y3R1ymH1L12jYHDmGFc8jhlKTWpQptU8TGsxjgy
         /Z7lAafLLeyZNa1A855PTKfPVZMCnRSbfRzc5N96Izn/kTpJCn/856rELLHZIhKHcZWn
         NxTzzhq3k7Zijxv6k8UPgyK40oqLOhbTc01SYhwm0fpWAX5nE/pBddxfJEJyQKRYxDqY
         AGSZGxE8SMb41pEIqDzyUIQwLz9IO99H5eSTaF2h0hR9M1u9fboA/JfWLltC1+t7rDhU
         8+pViLVyTAVwFmWEqwdzABCdce7JjGtkaNmFbBq0X/7cRu7yWe0Eo3RGKKqe39FTPltJ
         c3aA==
X-Forwarded-Encrypted: i=1; AJvYcCVJCrdjRgQwd6YrugEQ+fF8iASvwEzm5hztjLg71tbCnnNwCT9wquCGmMu7trjEu/8wlu86mOSvayTbK/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCMqo7JRlQJemKLl0jDrVe068ypADeLbsrYK/uHx0c75KFHUM
	zZJlFG1XnwLdanyTq2q8yOXLlYIwmpw3FJI05wzwP65j9vc/zfNY25fyDsfyTUo9fg==
X-Gm-Gg: ASbGncuwdIUB0+m24mMWdmkzlORaZfj/cJfrhzmeA36yysAflo3CQIjkgTuoS2AtYUf
	fwOUd31YZC5zZvkFzHqMxbfvzI+zoMwzMdGJc+T0DWDYhkwlISwrYUT1SByibc0AbKC4Wc4uvP2
	MsnwdE4uOwJytERynLSXTHt0f/kop8rSuiDBIGa9M2HTM3YMbi/oMbslkIiQ8SmGBkXpj+L5uBo
	JB3dh0JI7+RoYqduCscNz4B0LfBBopX1u9nQGk3H/Qysiha+HGw4BLSLyAV6ppV+9e0vHhieV30
	nwQHkC+CEcVnshsSiNjvbs3j0hmnF6ZkRFqeUzDmia4jQVeIiUbfSx80bm9gf+dW64nx/UfgLJA
	SohgGyTz2P3hTY8hAApXP
X-Google-Smtp-Source: AGHT+IHA9PT4YsWq3Yi8UtnOBccsoGJ8i5Yqo7UNIrwpHrqWTEgWuM/Hzq+BjXEkalsT57ohB6FBsg==
X-Received: by 2002:a05:6e02:1528:b0:3dc:8109:d64b with SMTP id e9e14a558f8ab-3ddf4d54d2amr367215ab.5.1749585471672;
        Tue, 10 Jun 2025 12:57:51 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5012aaa2869sm52955173.69.2025.06.10.12.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:57:50 -0700 (PDT)
Message-ID: <5084a99a-9140-4c4f-9873-f5478f48a49d@ieee.org>
Date: Tue, 10 Jun 2025 14:57:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junzhong Pan <junzhong.pan@spacemit.com>
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
 <20250527-b4-k1-usb3-phy-v2-v5-2-2d366b0af999@whut.edu.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250527-b4-k1-usb3-phy-v2-v5-2-2d366b0af999@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 7:01 AM, Ze Huang wrote:
> Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.
> 
> PCIe portA and USB3 controller share this phy, only one of them can work
> at any given application scenario.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
> Signed-off-by: Junzhong Pan <junzhong.pan@spacemit.com>
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

This PHY has an interaction with PCIe port A.

In practice this PHY is only used for USB 3.0 (not PCIe).

However I am told that only the PHY used for port A is capable
of performing a resistor termination/tuning process (not ports
B and C).  As a result, the PCIe driver needs this process to
complete on the PHY for port A; it can then read the port A TX
and RX calibration values (4 bits each).  It uses these values
to configure the PHYs for ports B and C.

For this reason, this PHY code (and binding) should not be
merged until we are sure that the solution will also satisfy
these PCIe requirements.

					-Alex


> ---
>   .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..93f7a3bb06bba380def77f87f6db0184af26e9e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 PCIe/USB3 Combo PHY
> +
> +maintainers:
> +  - Ze Huang <huangze9015@gmail.com>
> +
> +description:
> +  Combo PHY on SpacemiT K1 SoC. PCIe port A and USB3 controller share this
> +  phy, only one of PCIe port A and USB3 port can work at any given application
> +  scenario.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-combphy
> +
> +  reg:
> +    items:
> +      - description: PHY control registers
> +      - description: PCIe/USB3 mode selection register
> +
> +  reg-names:
> +    items:
> +      - const: ctrl
> +      - const: sel
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      Indicates the PHY mode to select. The value determines whether the PHY
> +      operates in PCIe or USB3 mode.
> +
> +  spacemit,lfps-threshold:
> +    description:
> +      Controls the LFPS signal detection threshold, affects polling.LFPS
> +      handshake. Lower the threshold when core voltage rises.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 0xff
> +
> +  spacemit,rx-always-on:
> +    description:
> +      Affects RX.detect, enhance compatibility of some DFPs in device mode but
> +      increase power consumption.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@c0b10000 {
> +        compatible = "spacemit,k1-combphy";
> +        reg = <0xc0b10000 0x800>,
> +              <0xd4282910 0x400>;
> +        reg-names = "ctrl", "sel";
> +        resets = <&syscon_apmu 19>;
> +        #phy-cells = <1>;
> +    };
> 

