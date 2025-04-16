Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986FF18DB35;
	Wed, 16 Apr 2025 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762736; cv=none; b=k2NhykHz647MkBP6eiij+TboY6FuCObtkl0EyJTajtzrqinxJeMv7WlPwssRCRjG5BCq+O6J+24KAPqQg+ZWHPiCFl1mH867jBda2hLK+VSJQk59BXoQeIv9ukcpFShiPLw3T3F4q5/D8IZNYFrnzmDmsNntgMD8tIylZ/l6s3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762736; c=relaxed/simple;
	bh=5ML4W/RjpK8iw4ZCVAw31Bse8xFTwleELOCMZse8BYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQYvBBcux3GZxlY9IMGVN5BHCw5AMd5zoMa+KZpWPSdo/5loEfY+siG5xnr7wxOwMdb704rhIGe9n7mSvETM+z/2c+NYCX7bIE15CXvbBEfZcfZgdb8Pot2Ut3DMn9fip6qbFZn5rh5Xvo61L6lFrOvnLSlLFhGN38fGYYMxicI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJCkDffy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJCkDffy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33e5013aso1298865ad.0;
        Tue, 15 Apr 2025 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744762734; x=1745367534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=;
        b=nJCkDffyhF2L1Px9212pUzFgmwqW1iUk2zT3RJv/OHD87NJ62mkJxsESbCqfoyl5Bz
         qEMj8bHpfgJRhFRVPaLusnJCIV5OKrTgwFMJ3CdAPxBWUUvxYQq6Py22vTo93JT0Jpyc
         Y8DGg87k/qQom0vC0un08ZvlR370jXGdwE3Onhql6+vUgWY9Y+GSaJA2KxRkSUja82WN
         GYKzGAjqomr0MAMoJ8OSInG8uHvJ7RZT4/LrpR/sDpfzeo5/qjuEuzlnsIO4uj+fnkjl
         rXa/5MDnAmoHlxtzrmWYeahjfVvVtVwaTWsOXwnzHcqCMK26ViqZSS+RQRjfM3ozNt+X
         C9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762734; x=1745367534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=;
        b=EShrBpJA0BN4wCO044H5AzbLhnogFkxgFPwKlvp0YK9QtxfW7voSN9oQvsUtloAmt0
         6viISu9MDPs3gFHQZCjGmhKoNu82pMkBH2V5kUWUTArb1GHQTopkGGrHfWEEz+Fzl2XJ
         847zl9hnyVqMB6HslAUFF9WCffqPajxYg+grvRZbE6Y5SlJJ8pS0weu72ZGD5SWldJKR
         vQ4qeNWraBeQ/9K+hQwCrN3o3oWNqJsg6x0FHGdwBZ/96EV78AkweRoQYEDkglRfIoNt
         FyETPsdsTeTj3ZtC8JmdsgLxo0LkRtpo3byxiQzYCGrhG89oYP+78Y9yuBgrcYhqUzUD
         WYDw==
X-Forwarded-Encrypted: i=1; AJvYcCVwez/eTH6TLARTozVrQRQZ9Gqd7ONCazwwFIRMhxAO0/KP0W/vKSEixy6XYfCWvcLciQM0bdX+C1a3@vger.kernel.org, AJvYcCXjJxLJvHOCJVY801RHe+V3w8Ezmk3kzSWbl00dD7ovZaCEifid+kdCie+dFZP0jxqV3FRHPLNoJZmFvyd3@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDEvVfN7hcHLajcK2mB90HbiRWdEh8qeQ2dOy3CifcHjN16x2
	mFT4xlCbKW+PvFgFBjo1CAFXjMz/I+9L7Ho/1oT73fLi4ZrkM85p
X-Gm-Gg: ASbGncu7T0mNMUxCUKd91Hvw3HGy5xW1ln9WBus6vd18+dqS0IOvY23emNeGBr8mrhm
	jM/z1B3ie+lgzpiAvYX3rUbOWzzXFHWOX523gLvAEI+OLwDV2QmlwW6gHhycrt7LrPP4khwte1z
	OpCi35T9rpngTVw9qhua6pYfC2z73QFpQUb3pfOsjj2xUPDr7cuWzT+vIoDA/A+k2AzOIxB0wmq
	2OYwdmc/fLFV3zNguxhvtpICLRLurxiYW6LkDasmBmf/+r5G30xYcRaZWS8c4NBvt8QHvE09Je+
	mcScnck8XrUNKNM76cuYtMcbv0kGRyjeV16HnYjgHNCq0dc4c8zgIXkBugw=
X-Google-Smtp-Source: AGHT+IFrWUVq6l1nS395CfiIcyKNT6DSygmpfiB+tI5u/2+sWwofsKb78LA11Ll+t0ii+Gk1Pil+iQ==
X-Received: by 2002:a17:903:287:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22c31abcebbmr17817755ad.37.1744762733812;
        Tue, 15 Apr 2025 17:18:53 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e90sm1489655ad.2.2025.04.15.17.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:18:53 -0700 (PDT)
Message-ID: <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
Date: Wed, 16 Apr 2025 08:18:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/4/16 清晨5:52 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for exposing SPMI registers as NVMEM cells
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 45 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0041babefc37ed4d82d7d6f68fc67d29eed53d9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic SPMI NVMEM
> +
> +description: Exports a series of SPMI registers as NVMEM cells
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,maverick-pmu
> +          - apple,sera-pmu
> +          - apple,stowe-pmu
> +      - const: spmi-nvmem
Consider using pmic instead of pmu in the compatible names for consistency (see below).
Also, the PMIC definitely has more (mostly independent) functions than just non-volatile
memory, so I am not sure if it is really appropriate to model it as only a nvmem device.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    pmu@f {
> +        compatible = "apple,maverick-pmu", "spmi-nvmem";
> +        reg = <0xf SPMI_USID>;
> +    };

As agreed on the series for SPMI support, this should be pmic@f, not pmu@f.
There should be an nvmem-layout subnode in the example too.


> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
>  F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
>  F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>  F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
>
Nick Chan
