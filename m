Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F421ABDA
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296452; cv=none; b=A/cFs/cHzA5iFSXRVKFEuPMIHoabRXxTdj2frv0CoPbV7JaeppKt5jK85BtUsrmYB3kcBUiqaQnyovozRXO/LuiOAtzHRVSjattyrgUjMqkyWJ5W5lYMHHFJ9ZTOJzcACqY2LwMuEqTTg1bvBc+LtmgvZ1xhrIGS0EZGywhFff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296452; c=relaxed/simple;
	bh=ubJJtE7i8YMPz9SRvgygJqN81AJ/lnwSeX3JzR7GieA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUeNSRgShnJIGSrYitUUAsBLYYcT9K+IYn/S/MckN5ZxlPvWHy8kWp9rsCWQ9oBp4p/2PYg8nwKrb0Q2XevJWcfnfOF9hZRSwK+Nq7Zo/9I1qakF5tXqsGlQ3dzFtdMcKS1XAZLyU50VOJdr+hOiQc4RxKNkFx0KIa8sAGf4WRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EzkfRxVu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EzkfRxVu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-addda47ebeaso558866666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296448; x=1749901248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiKPxyE+L/mL7ntMB6eAW2AGGkAO+xZvdmfN92Ddt1o=;
        b=EzkfRxVuzuJi3pL622gzlOW9f+US+z153IKlduDkd2FOWJp6wK7e33ej7Ljvk9niIY
         +MWoRwBLv3mmE8awEfIVyjrCFtimM7gBo/Y+ZpMCyBVOTFut/yHiNF3K8seYaGFyYi2c
         Ms7C4oJ8+IfvT5PScg0QtoD+/VG4p1hyd9BB9cMcHbwEKp3LkvAhs6OgWyux7IQaFVd5
         dS2YfT26JulgirJyW+z1w+CfQ5o2JSHhDwffSVfXlAHrtZ+gc5KX6vfA5nUfsW2/Nw/s
         /zDAPdyNu4ZpETD5q2eiDXfO06BJC8/nlOvKFb344ZIMagnnAYxRQsD8m/fp42pBhz8B
         LkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296448; x=1749901248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiKPxyE+L/mL7ntMB6eAW2AGGkAO+xZvdmfN92Ddt1o=;
        b=E9al4/BvzskCKAEHbJvIXj8CXZuSwmK2ZVpvezaz1EXXdMU/BoiY6V1S23KKbbMqix
         TdALy0hmHr0zOZ7/vHT6/3HCDHByVhv5h+iYgoM8vU9EPRzs76DXrTo5pEglG6feAtPi
         R5oBS9Fq4Yxt8zCzYSD9mF+uKEG2JRSLXFiA9LjdK3mmb3H5XySmOuIlliexv9Q8a+87
         yHogJfhYKWLAuZvEdJ6eazIgJc1lCa4qvXXqL1lw2mAFKEeDqHbPe6pctbzaiOXndqoY
         /XRrR8zixu6HeZMhubZUu2Kyi49kklGgyQdqtuexOR05PQqd1zpBkO+aqN9wJUpZYfeR
         xLVw==
X-Forwarded-Encrypted: i=1; AJvYcCXW3Ql4+MCKWFGhbBw7/PazQ1VArHxADI+1TRUnXxGInE2dCmwO1uwnKV/l3UAcUgI2G3TdlymmkM4PaV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnXUP3q5vfG8LmRjgkpfili1UFzUagurcGZptyI2jq4NPy09q
	rLfASMXENypxYZ2y5ZiTEsn3bqAG2KS5z43t1neugD2+jODbClX8bU6yeWkuMB4rUrA=
X-Gm-Gg: ASbGncsBBXfxazUPq05UH2CnG4OlqbWpdXLkzGdHIHDqQxPveDgA6hMxU1VFtqhtuQS
	nUEDMZtRwq6P/yBHIpGafNfVa/eezAwcWnLP/NzLeJqi1qynS7LY8CatCTJvO9D0nAUmUk+lpL3
	qmrf3fDU3JSZ3LdbreWqoXAP+UXD3LwApAQdnwVyMXc/KvHLXCklayJ5P90+6WtYiuj4uoYd3HR
	RroINXsj/WUowSxIqebKBI7kUehpe+Uz9ZUYtz4tueK6df2u/rDIvp9j+rwRePv8KsPnShfFM6G
	kMalYdCEEA5WI/uTDBQYw/wdpQFu3U0rk1S9rvuLisYtLURIYHjo4SxTUfXXcUUOIXbGYda5REY
	Xq4vy8w==
X-Google-Smtp-Source: AGHT+IFH+/W+aC/DziM0dgJNs2fwK23eiIJdn/dAFXAJM2ZH6flXjX0d+7niB19viLz/Kl7VwDI7TQ==
X-Received: by 2002:a17:906:ef0b:b0:acf:15d:2385 with SMTP id a640c23a62f3a-ade1a9fd850mr693582666b.16.1749296448424;
        Sat, 07 Jun 2025 04:40:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b3b6sm268238766b.173.2025.06.07.04.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:40:47 -0700 (PDT)
Message-ID: <f03c5c49-e890-428d-9c5c-649bad512170@tuxon.dev>
Date: Sat, 7 Jun 2025 14:40:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: crypto: add sama7d65 in Atmel AES
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC in atmel AES.

Would be good to improve the description here, e.g., specify differences,
similarities b/w SAMA7D65 and SAM9X7 or SAM9G46. Same for other similar
patches in this series.

Thank you,
Claudiu

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> index 7dc0748444fd..1de4ee70a05f 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> @@ -15,7 +15,9 @@ properties:
>      oneOf:
>        - const: atmel,at91sam9g46-aes
>        - items:
> -          - const: microchip,sam9x7-aes
> +          - enum:
> +            - microchip,sam9x7-aes
> +            - microchip,sama7d65-aes
>            - const: atmel,at91sam9g46-aes
>  
>    reg:

