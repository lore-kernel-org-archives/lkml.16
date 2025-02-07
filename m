Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7E1B0404
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918504; cv=none; b=pJyB/62JyXWIeLGts8Saw8aGrhXc1Ant6qDfKQEblCpxX57hhf+RjOyHWVXThx1Xqn8V2NzRhmkkf2GWII4x01K6cGM6fPXd4ots6z7bc1KatDT5Qk8dXlA2n1wEp7jSXvmTyFn/K16DxJmAO7xkOgO4BA47kc2cVvcYdBjIdGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918504; c=relaxed/simple;
	bh=fqWb2OfdJWD3lslZIW4tyZKp6Rmxnzk5Iyy35cjg0DI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cUAW9gCP5doysZ4/k5cPbaAgUoEHgbqK7NUXlkW+7uTDW89N/94IGhJJpVsh31jkOIyvcd1buYIJP8+uMcG5vJmwlikunJRX69pHLR6xAm3rLZtzicEUT+SoXbLErP0HnP++hRdvLRqhGX3KHrOtcC6jaBR+aRaSGF3i0ug+GZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POvrKBBs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POvrKBBs"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38da72cc47bso1340797f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738918501; x=1739523301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NA/X6pVv6MhxU2rOACQGZ3o3qUufdc5q7/UZzaZAT4=;
        b=POvrKBBskfxhWd572+FKkeXUwkqW83D3Jkd4H7pJoE8zzpymXGjhvxTSf+c8BH5sjI
         C48yp7lLoS05wtjEg5Hf9B+/uo2k8IKOGZmYoq4/rXZxjdoseVaLpmDGYWfS1roi3mNt
         Nut25k7B3wce57hjd9Tj6UBo/o2WzQj7zxZuK5zNUtdGHyZgeXEuNe/ZECU87JDmDNMp
         6KkIQNZ6r6KSXGvn8i9JsKQhDXrT80BkgAzSQGOIPYQUm0bzcYYBl6wdUbM0monGjwHE
         eMycRy8T/ZuVhJrs9Y8MclKtEsD6+5xoEcVpc+BsAYXgNRbCm28IvhnfewCeG9QVSNLg
         qZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918501; x=1739523301;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NA/X6pVv6MhxU2rOACQGZ3o3qUufdc5q7/UZzaZAT4=;
        b=ET5Z+fWF65D1KFZqOMyDAXjkaMVk6Yrl6ooGmy09XAmI3sg3Qo1vY7j6GakWQ9URPA
         tyBsS1bJg2J4u7CZNe3ghuX6sUOLZ6K7M8n2EuPLZsGzlot1OZUe0OwS8iZMOKfh14e8
         G7eZi9N8tcoHD4z5ZrruTWakszz8lim0j2WN+Durp7Pia8a21HQxZLL3c5fjBWHKe6ke
         Tb1f64QNpYWN8mqaNVJb60P5zQub+tZ5ikP2bGhJqxbJKPCIEkyqpch9kduMF3vWiKQD
         VMelVuNGFJiimyybA6pG5p4oeTEVZI315XT7V1wx+TsHUuyAGGkofP/z9SLzeqt9mGtz
         Pp0A==
X-Forwarded-Encrypted: i=1; AJvYcCXGw3KGsHWgCnTRHmcCtpmrSaEz/OXLNQCjhTmjJuG7cqQu6qaIoRqaNEVXvrGq+00KBtF1ILcNp7DBHpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMFSKzyfUqNLf7Liw4rPMhykNIG169a1024NgZbXxYGUn/XaFp
	ucmf4Brk6UKSd/jdP3+MpAi82cAI8yhZiGndYxNJzv52OtbBgzVq7CyYZyCMV1U=
X-Gm-Gg: ASbGncu5oYwmF5mNotxoSxJJMBOm1nTwgDXba6ShuoJ5pwGlH30o5egqwCb94Y2v0bH
	MqagsJUyhoE/l30QjGxijS7AkXpy0Qpc8zcgsJGt21LTHzdjPeM4j8cXsZrJRO6TnmMXWtiVArD
	afJ3H3lNbztqKJ6D4RlQah8emMXe6MBcaHzXvI6xVYomBJ7xWH15uew/TTA3vEQTL0p5tSdV6Ah
	LK+zFCZwEUg5Ju24KlWQnML+J24LV9tWiu5MeuVOWwL7CtZX/5SKSAX4GGdbhmHzAs7biNS5oqx
	1qbOFICp+x5hwl+L9A8qXTDPNnzy7QbFykagNdB554GFUCVA1D+9+2eYS+Y1gffDaBxN
X-Google-Smtp-Source: AGHT+IH/4XDsyicpqDQ9Y3WcFD83TXmZ51RuwSfEt0UMQTshRCiwBSTUAjS4DsFc8GU0SU2TumjluQ==
X-Received: by 2002:a05:6000:dd0:b0:386:37f5:99e7 with SMTP id ffacd0b85a97d-38dc91133aamr1353355f8f.33.1738918501273;
        Fri, 07 Feb 2025 00:55:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd? ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94db77sm82525305e9.15.2025.02.07.00.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:55:00 -0800 (PST)
Message-ID: <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
Date: Fri, 7 Feb 2025 09:55:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 04:48, Dharma Balasubiramani wrote:
> Remove the compatible property from the list of required properties and
> mark it as optional.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changes in v2:
> - Instead of moving the compatible string to the other binding, just make it
>    optional (remove from required list).
> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com
> ---
>   Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> index 1f0667828063..ca3d0114bfc6 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> @@ -29,7 +29,6 @@ properties:
>       maxItems: 1
>   
>   required:
> -  - compatible
>     - reg

If you remove it from here then it's still required in Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
so please add it.

Thanks,
Neil

>   
>   unevaluatedProperties: false
> 
> ---
> base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
> change-id: 20241219-mmc-slot-0574889daea3
> 
> Best regards,

