Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1A920DD51
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117556; cv=none; b=arWksJCCH++QxL3utODTMsNnPO64q4+biEkg4BbTdj0JFqxNIT+FWXJrJGXS8lYkqU5fI6F5wgb4nphEpP/I/+xI/cAI3YkqFB4wn9CCGmgSmmY7CSbQS3x3H/D4XYWzCHa5tFjduQpPkWob17sPbN257EeB9E8dx4gnF8iLnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117556; c=relaxed/simple;
	bh=OhXqVvV2jok1I00N0CwDqLUrzDi937D39pRWFVrmM+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klpXyPT/B92fnA8lAjYilaKaxv2O8Y/mmc3xmHl5+NPxqs/YfT0mb/rb4KMxWGFdSPkXu2SodeoJQO5t3dlmuBirBMPR4FZxQOIDjAXAV3uH+s6Jynk4BwYnw607DFfMQS27Q8RG61K1OUMefhaalAP0KIeSyXJfBHX1YzEL1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9ym1hJ9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9ym1hJ9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1781645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117552; x=1746722352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=;
        b=b9ym1hJ9ZEoxqmJcQCERKbT7ORXyjEnJY1Z6q+NHeXPwVZSAeKno5CuFuVkBogi12P
         7HGV7koORLkmb90SOMigUZnNVnJriJ1ae0pK2zsQI0H7b7q/Mn1EhAlLKQ8lY0aesU7x
         kq7ldRX727s/Y3Z61fYqj6T7ip2r5hajsmp1XlNie46rHe7vU37LFDARGHuoJKO2hKA2
         9FqyHrrbnVKRsI+yXRiFmgiUv2s2InNkcvT8GjT5PPxgs8vtywP+6coMvJexe6KpxSAC
         r0gXZvrHYmdLxIFhJSvtg866f9chBA3StvNBOb1+LbLHWogMwKw4iGhaaWO0XLBvN1Pu
         yI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117552; x=1746722352;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=;
        b=uo+IiiABNj0U67drNm1eOpijLP/V+OxbVDTmBGnvy4WBLmrR9Cen8gSgxITlPkGA1q
         5TMRtQD3T0U7KCDc0eAww2kFUrdoQPcCZjXFPNxcPmqQpjAF4Fo8AXo0Lts5Qov29l+W
         Vq+5MPDSZZOCe6+fQ8ZGq3Qovf3rKRT5h6tVc4zCXQIGJGdGFNletzOtMBgZWN3GQVw/
         iq9EM0tSCE+ruhizYZNHkiO9NKJTDcLYCd0SXxRvqEYnRuqRcCQt7maIJj/4YSjHMIQv
         lBqcsbPnjUB26mNIw4h0qVdaTXxvVt4P5xvNc0/64aYGA7azCRe0YZLCM8/zbFppFk1Y
         QJig==
X-Forwarded-Encrypted: i=1; AJvYcCWezV04VEKMbhdv4p29Rd+UAmKsAM7u4tDFXsznZ+BTGAQvOKA4pbSq0cp0bIsLhLV0GmnfPXsQMIpCrRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13O2/Scyr+bmOnV6YkvGNzC0N3dntAi/0YrULeqLmciR04bnt
	DCRiZ6rGN4dfdoTbIE3LV3U4a5irmYI0akABQXVZT9wHarRyUrbmj2ag08TOr9A=
X-Gm-Gg: ASbGncu7sXYM17Qg6HVf+uzjMfxMI9T9Tr81pJVP7fp7SzcKKU1rhMY754Kalxyr8nQ
	yNuza59wuqJBx9L23v/E9HZX4F/BT9TYISOqQ5N9kH36BKoQqYLSFp6v+JCH6ufhvTJwvNkcJg+
	OkQuN32s77rkY8EjGdonktZw8Q4DdYQQWphNQTtPiP1gQp5+zJF36VaazjSho8dyv1uGxYXO4vd
	y77PY/OiLaFtwk9598TIimeQpFEH8EN68XzgubvNqGy72ZEvrC/hClGV11iKuHm4kbLwFB7Kboq
	0Z4K0LvzsJ3gfQJ7kmJIUweOrq5pXTFWgER5Cbt2Mdhud++3gAKVyNL6OabwWXyeaMTO3A==
X-Google-Smtp-Source: AGHT+IFHLM3Gn90P1rxzB0WphTkEncIZiEbe/YA5FpOViIqbhpj9J1eXj04iTVLfCmwcAEk/SUFj8Q==
X-Received: by 2002:a05:600c:46c5:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441b2dea5cbmr25205735e9.4.1746117552581;
        Thu, 01 May 2025 09:39:12 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4f5sm17693655e9.18.2025.05.01.09.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:39:11 -0700 (PDT)
Message-ID: <53e51779-1e05-48d9-971a-efe8f907e12e@linaro.org>
Date: Thu, 1 May 2025 18:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/3] iommu: omap: Simplify few things
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2025 18:36, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Combine patches #1 and #2, add dev_err_probe() and drop the comment
>   (resolving Robin's comment)
> - New patch: iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
> - Rb tag
> - Link to resend of v1: https://lore.kernel.org/r/20250212-syscon-phandle-args-iommu-v1-0-c3fab486b426@linaro.org
> - Link to v1: https://lore.kernel.org/r/20250111-syscon-phandle-args-iommu-v1-0-3767dee585a6@linaro.org
> 
> Few code simplifications without functional impact.  Not tested on
> hardware.

I forgot to drop the subject prefix from b4 - this is not a resend, just
v2. Apologies.

Best regards,
Krzysztof
