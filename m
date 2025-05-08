Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751E1E3DE8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727024; cv=none; b=aqhF6QvIl8w107/6O1Ds1ObzS2NeNHRX8GMkff4PoLa1yfPiWHdu/yQ5SVP5xqMXpZr3O48Kpmlk/Ia2zZiEKYekL8yJnvXulRUm4IwxcqM9Pkwl2KDrap7w8w8cWOJg9GrTQjWcBd+NNExyve+RoIWeUYt30XOrSwUpDvEnn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727024; c=relaxed/simple;
	bh=vGgzOqvmtXTNDUkxEJrbRUfaL/N3ftCRZlY+IGCRt90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+/i51d5/bD9RQELsnspbn6DVpOA124Jnu7aECDkym/qHyMDQH5whLHwPe4fEJO4GiJB96Fih4OMqcyUyjfTBf5iO5kmadW5fs3fn79K1HC39BlrvVDnkcyAe/oNIEdQ0cMFEJ+WQM5ea3N3U9hYFuHl7tIxsVb5Ood6qygPONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CmGfi86i; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CmGfi86i"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60657f417c4so650658eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746727021; x=1747331821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/em9Rm7s3BQodglQQHbeSlKuDWm4dZvuXf5QXXEEcY=;
        b=CmGfi86iLWxrgyVqghNJevQnbmgJwkiw+NEBzf9iwQ+rm6D8lDItcpj5gyNbGwQ/sQ
         MJWMlNzj4l/LY3Jw9PAzXKQVeQT2iyCIH60DDYj3Urn5mt+zzixgOu/2poJCSseFjP0Z
         VYHen/BReCvIP7xDCiQqaJzMLvCWUrBI1HDVUj6iPqRXa8n3QIC+GeuqrApBVKxxotHh
         g+9hZJRfcQOpaFhCBCHruOt8cqmMesVrGsTwawA5Zhyh77JCVYveVlEmqUIPR1ayFRM2
         2WiignIGsUJXqs+Fy/9clmsSwmFf2cjxgENxhxIT1pi/DpSVwFQMvnyXy8IPCwdTuHrJ
         3CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727021; x=1747331821;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/em9Rm7s3BQodglQQHbeSlKuDWm4dZvuXf5QXXEEcY=;
        b=RtcAifev7gbiqQqRl8RVDFXrNF8OqVKfrjaXkx7yZLEiuPuEd7TwS/EX3tJJPFEoWV
         pfhmClfOvQl1PVNJcgFfqZp6Qil0JF1V0cwjR01i8ESa/5UmwMnuZekfVGXur0wsenW7
         wLeWrI8kLXzhlrAz8jbWpBl9Pr4CrOBfElOY4OXukhXrGVab89izyNW002C1veqIHP8O
         iAEQ6RWEMsZbC8SiVFTlFFoXxU/gqcbujGUDXHXS5zCY/ALn1513AJWcwdzWXNyEN8s6
         X442j0LnmFlY+Ni4c+/hBM0KP9omOXQxSKyQfWpJKv0xo3FbWdwdCp7N+9RktNAyXkuQ
         wy1g==
X-Forwarded-Encrypted: i=1; AJvYcCVoo9QhsClU7yveBNODVKwaIblhxqeLmcgeySAsv/rIdZzDAKS+4KauaQyhzp8iS9deiMwpVc6oyGKiTQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNhZ7WVOjqIFC81jNxJNunwBCSeZqqLghc6UBEYa7JU127A0M
	2G9f6oBAmyx3e188vfhyp6FTgKYIL0enXQOOaNYeM1nKBEiynuuzBlMYYtKP+rw=
X-Gm-Gg: ASbGncuTR9VxFrHyMBLghZ/52zvvEiMRhGrLNAS6wtoxkYGRyrQEoQKedcGKcwFOIgg
	iPKAkB53Dnsp99M+Y1P+SN3NPOSmNl/f76BHlYsZU0yJS/7/grokF9DII9osYoOFrdL5vTvq0hD
	VENAnCQ9cb+fvdVxxKoLvyrTSPumJdYdMkJqDFL4HCJisfnuUsTPA/NTSLABMMM8hYD9Nk0ekeS
	41CC8H3v7IzSOgRCOOVq2PFIVM8m6b8GMnIojef2962zf0FKogSyGnl7gf92zpVdRcug8LAxCj8
	55qWW2GTEli1eTMecRuQxIlPWSoTa62iYQJbiBBTiibpLq00MCuElkDKfQ8EIaHSfpOd0EtA2Zh
	hjayw2qY+zR7JF7BdIw==
X-Google-Smtp-Source: AGHT+IHJwGAFlFty5s3LWKljU2VuT/aTgMb0iNLaZ1mqX6ViwEULZHmp7hgs+wI4bnWsmWOPe9FWlA==
X-Received: by 2002:a05:6820:4b0d:b0:606:8986:55a9 with SMTP id 006d021491bc7-6084b65daa5mr237000eaf.5.1746727020707;
        Thu, 08 May 2025 10:57:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6083fe3c829sm81452eaf.15.2025.05.08.10.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:57:00 -0700 (PDT)
Message-ID: <4b6a45d5-a6d8-4334-a405-df1cf4c2fcac@baylibre.com>
Date: Thu, 8 May 2025 12:56:58 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/12] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1746662899.git.Jonathan.Santos@analog.com>
 <f62bcaabde172e0b2880f7d05dce97d684cc04ca.1746662899.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <f62bcaabde172e0b2880f7d05dce97d684cc04ca.1746662899.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 12:03 PM, Jonathan Santos wrote:
> Inspired by pwm-trigger, create a new binding for using a GPIO
> line as a trigger source.
> 
> Link: https://lore.kernel.org/linux-iio/20250207-dlech-mainline-spi-engine-offload-2-v8-3-e48a489be48c@baylibre.com/
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
> v7 Changes:
> * File added to MAINTAINERS and Made trigger source generic to include both pwm and gpio.
> 
> v6 Changes:
> * Changed description.
> * Fixed typos and replaced GPIO pin with GPIO line.
> * Added link reference for pwm-trigger.
> 
> v5 Changes:
> * New patch in v5.
> ---
>  .../bindings/trigger-source/gpio-trigger.yaml | 40 +++++++++++++++++++
>  MAINTAINERS                                   |  3 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml b/Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
> new file mode 100644
> index 000000000000..1331d153ee82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/trigger-source/gpio-trigger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic trigger source using GPIO
> +
> +description: A GPIO used as a trigger source.
> +
> +maintainers:
> +  - Jonathan Santos <Jonathan.Santos@analog.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-trigger
> +
> +  '#trigger-source-cells':
> +    const: 0
> +
> +  gpios:
> +    maxItems: 1
> +    description: GPIO to be used as a trigger source.
> +
> +required:
> +  - compatible
> +  - '#trigger-source-cells'
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    trigger {
> +        compatible = "gpio-trigger";
> +        #trigger-source-cells = <0>;
> +        gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01079a189c93..9b2e9a9dd8bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24569,9 +24569,10 @@ W:	https://github.com/srcres258/linux-doc
>  T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
>  F:	Documentation/translations/zh_TW/
>  
> -TRIGGER SOURCE - PWM
> +TRIGGER SOURCE
>  M:	David Lechner <dlechner@baylibre.com>
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
>  F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
>  
>  TRUSTED SECURITY MODULE (TSM) ATTESTATION REPORTS

Acked-by: David Lechner <dlechner@baylibre.com>

