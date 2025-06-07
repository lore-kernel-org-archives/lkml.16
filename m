Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64522173C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296516; cv=none; b=p7SwbQGd8ewfB6+6LRq/LymozPMNRcMdUQdVqDwQF2UeargFrJ2qToRZvB9vPhI5Pcmsm8JXYGs+Cf8uDDi1M241m+Y9tGKVB8z9G2TDrqoAYCozeXATyp/8dBlzUeDkNPiJpTl6Obly3QAoy+jw5qM6sGKfiwEJsKlcXLVG20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296516; c=relaxed/simple;
	bh=n9BLRiYHp/pW68m9cNwDmNZcQuNo9c+EYcVWkQCKl/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0TiybHs64idmJGNnGi5W15GELNzRy2uhL3kGZSM3VVsqQuWeI5JiwlEPywQBmPJUZ7zMgSM6qHSzFRVs7oCYEZ1NTuHOd59frc808QgFmBQsbWuJnsonGNyTyH8R2NWc6jsSniY3l9CHV85Lw/qfGiiH5z0xK5rH6E8ZXVLvz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N5Ss5/xf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N5Ss5/xf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso5176369a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296513; x=1749901313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHhYe6pzYBYGqwKCCAoMr63vtu8LUhyKvXIdPxuXhzg=;
        b=N5Ss5/xfQFbF0pfSdsUliAuW1l7OXrya0ipva4o1vQ3+MeQntkTc815PRK4jP+XkyI
         pj3EJnEPgiHhpfSxwVJbLUsKEb1e0V9I/Meg+kJLlyift3dw+pL8rTN/v1SJy7SQMvdb
         19LKmZiMQPLzNVHV8uxS3gzQpWAkfgcA++ITseCxYyf7kZHgVX1xrHWfSsTAT9lpQb3y
         gnlxZ3cQH/kEMuR+5rPSR26yrJnmIDfcLoFEbtPBEHK7A/HlkI0isdy5WTRpmYQL0qEs
         OFhN8hA4aKOssKzc17b/pIlC0ZC+knexq3f1Vq/Znl1QQ24bVGUJ1zGYyB9lYtu90dOt
         OfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296513; x=1749901313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHhYe6pzYBYGqwKCCAoMr63vtu8LUhyKvXIdPxuXhzg=;
        b=mclae8ukc8WODQ1H/caSqp4M704UhgcFB/Br1oTJsBJ2uskIXl+lAaox27VYScjaae
         ji/+/x0zhiMjiciKtdVz3z0KNaj373bMlcDJYNI0T3qq1vTib/FhnTIiVoVawt1Rdy5s
         Py7fjLSWITgKCKULosvpREDlXUYz0u2xXcNiwI1Fu3qMji+kA7pnYbFtamScCbeYReIU
         rLGkONb1+0b8Ce8rMZYX6ZFQ3ReYO3KnzeAnMIbGn8JlYINJ+ob3NBdKZp97ufWPTRrV
         h3nZbC3wEu0Gji2pu5Q4pQIW+rHbrG/Wt3BXO5EIaB146xpayf/bgbleldTrJmLB0pbT
         T/yA==
X-Forwarded-Encrypted: i=1; AJvYcCV2+iWwmqJ/IDcTyJUQoKuPbu2lSGYajxvhovJKpyCHEYrFJCazRWQU2bO9sLB7TFkXE2L8zQgs/5/7er8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXc8GGrDuh/+u+TSZDu16yIsaswUAuZo/fMSdotxuJDqKCZpq5
	fPCzkLUw8X4cwt4jNQU5uSZ9P05w+1ZiAiScG2qpLBwYP65+FvOqHHg84wypoVRIpflAnSZYrBz
	0W9wE
X-Gm-Gg: ASbGncsUZxVZV1AYJWQAjmjbJSjksBRhBw9poZKqNqzmLqJbDLkAJ93Yfe0B/OEO4F7
	AhnEtNJ02p7gU721ZAflKtE3vWSe5U31s7lED0TfjoHqSgJt5v11wlL64PJIECl5+aYQI09oIGl
	V6XElqpVpXb0OK7KqqCbAGfHfKliybv3iHKdzsBFVr0ROaCeE4jo/WPkrJ9+skmKjVhTv+Iyyz3
	OCWP+P0fjBh0VzVnzis6Dq/al7hyhdX0ITmknxGzuaJyNZjqZ1S/JdNyGQ1IdFmEqCj45l6RyEQ
	mx2ijJdXvcuVY6hFjilbt09r4vAh+ySqYre/s/vCQ3U3VaY7VNHPoYRro/4mERSSeCO0iZA=
X-Google-Smtp-Source: AGHT+IEHOrHRiEO3rlu+EznwzAVzUrSE49TkufXjg7ZU/CfkAver/3Sye31MfxSallpfyQfqoyrzfw==
X-Received: by 2002:a17:907:7282:b0:ad8:9c97:c2dc with SMTP id a640c23a62f3a-ade1a9fcf5fmr648072866b.15.1749296501262;
        Sat, 07 Jun 2025 04:41:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade38c11d28sm137366866b.12.2025.06.07.04.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:41:40 -0700 (PDT)
Message-ID: <84184dc6-2f6b-43ae-ae44-c081b8d510fa@tuxon.dev>
Date: Sat, 7 Jun 2025 14:41:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add compatible for Microchip SAMA7D65 SoC TRNG.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


> ---
>  Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> index b38f8252342e..f78614100ea8 100644
> --- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> @@ -24,6 +24,7 @@ properties:
>        - items:
>            - enum:
>                - microchip,sam9x7-trng
> +              - microchip,sama7d65-trng
>            - const: microchip,sam9x60-trng
>  
>    clocks:

