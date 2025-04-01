Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41A1EB5DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496447; cv=none; b=RrNLpFNZbhqzBZtjqYE755CxlIg2O5+xquy9937QStwDdPVpxMwsKftnkX7C7D3r1xYvE76a7aJyiqSbKIySmCFTIfdqSRU5vRgXpHoQL/EBZHEqbu1ctBUvWYMwHPJTZTq6g4JBkT8s7Mu4mKL3+zjTkrz/2RSAryjAatKKR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496447; c=relaxed/simple;
	bh=zVEmiADRpOhBA84swDsGjRBgTLMxVUMfeKqwa9ETpFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3grJv6JBsk8RzVqe2QhHfQxHNmAwc7PbI2Rx+QCt1uk3+a9yntxdOnihgMCkH41LmbZFpNG2i/f7QCrccQzulbMpi3ayRBrEsazpGBbfSa2lZoB8xr0kyzGemBteAJbX3O4nInwYhlrCo1d2u4U40K1lqV2C4TLKElbToYSzq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRwuvUBi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRwuvUBi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912a28e629so341878f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496444; x=1744101244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Es91/Fmi3Z5RjbLhOFvYU3nKjRD7ALX9CP22nn9A9Mg=;
        b=iRwuvUBix1e2Lgh/XUJMp5GztbUUMKK1fMrKjJ/3Wl0YsWQ2xFUfRQMH5Lca78j9C2
         th2t3kLnHB2lWPQsGoKwJ4pyQI2Bh0nlp5W66toxu7g2s4qPdlSpVqF7ts++hvzVBcZJ
         0PyGBCr8tCu3azlbJ3r/TX01Phf7EVdcdyqlbbHVQYeUCy8ArPF69ySbtXQ3wmkCyHYl
         bcBOlDY7Y4a6eng8sVOlEXvAY9R2JGTcS8rHLX+dPNB3hOQ32xw+99U8282AeH5b4Zj6
         W3crPoRdp+4iiReJc0RZApo394jLzK7fnBSaXIyQpmg0jeHMMOsQV8uIXpwgs7DRPC7X
         nADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496444; x=1744101244;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Es91/Fmi3Z5RjbLhOFvYU3nKjRD7ALX9CP22nn9A9Mg=;
        b=hUHxq0GVEol/8B1F+pyP0aPiEAXLy2eEgW9L5890FSYbC2ejrXW7Ogt0vu8UJFYPg6
         4HckbtjLY2nlNZsV/WE8ld1Mdyzx5KMFwU7zK0T6E6ezcaJU1SXlw5h/5/VPyDem7qX3
         bTVlqyLSN3X2eetCszgQJ5eXHDT6RNZjqFS6uZJwPahAvGMyqGEHz6nwfceVyJlWKPP8
         +V+Ng93R95QWy4Q/S9RxrM5bdo4tBBcpEUUtI8vCuWKRgXVAt/apNWGqutJbzdTNmktZ
         Gp4SgCvSExO0nQM69++T2nG+0ycuAyVGmX8YYwb6IBSQXDUIDVO3aemJzuUjWSIxd+lq
         LDpg==
X-Forwarded-Encrypted: i=1; AJvYcCWbdXDL5+54fIaBvVDs6FkZt/jO/BJWT/SvMCseOlo+KuRIt8D+oE3ZdAOjDdQoD8p1GPXH7MczcAF8rNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4mlAElGQM7FQo6AnY3wmiPdXulDhvmUDKsfklSSX7s6HK+Ez
	bXCoIaCdtCrUAFdZg8btLtALjdIafp6rbr5eN8qyCbuXR3pVUUy36ZKVyR7QvTU=
X-Gm-Gg: ASbGncsLOX5CQYOf5mQB7vFtVP8KMrIDOOeHdl0DOGpdFFUTtdiJ8fiNtxJBXcgwkpX
	i+v+0y6/YPzCFq48IRSYcBFzskuuGr3WpDgXAs/DneVhE0o1LklOV1R8FmPwpyEVcAupZqwW+dV
	JhKdRrtRvgocxlZPzW+n0MWPe8Yn5tcA728d5gVA1GQYVtB+stiXYmsfY/h2NJzTJq24uTDDtEI
	uU83ZadUzajbvBruVQpuph/y9+Gea7AwP8dY+IciRmRF9r8/LH0RVWk4ER6tHkjNqPMLVx2aM/Q
	2NMFZOuS0CrxuQ6bU6GPacc6EzjScrvBJppyHaX0U/HmKmN0IEuC1DgP10SBz9c=
X-Google-Smtp-Source: AGHT+IGCGiiiYCIUaLZcb5s98tRnmPNuSHQrGIsm5DOWVPlytR6KcVfUJCMQWo0HpevAIXioEGpZ+g==
X-Received: by 2002:a05:6000:2210:b0:39c:e0b:c621 with SMTP id ffacd0b85a97d-39c246f26e8mr350768f8f.1.1743496444201;
        Tue, 01 Apr 2025 01:34:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90000f48sm147463665e9.37.2025.04.01.01.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:34:03 -0700 (PDT)
Message-ID: <abfea9d8-9992-44e6-975e-a18b01753aa5@linaro.org>
Date: Tue, 1 Apr 2025 10:34:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Add Clockwork CWD686 panel
To: =?UTF-8?B?Q2hhcmxvdHRlIO+/vWxlxYRrZWM=?= <lotte@chir.rs>,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250401081852.283532-1-lotte@chir.rs>
 <20250401081852.283532-3-lotte@chir.rs>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250401081852.283532-3-lotte@chir.rs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 10:18, Charlotte �leńkec wrote:
> From: Max Fierke <max@maxfierke.com>
> 
> The CWD686 is a 6.86" IPS LCD panel used as the primary
> display in the ClockworkPi DevTerm portable (all cores)
> 
> Co-authored-by: Charlotte Deleńkec <lotte@chir.rs>
> Signed-off-by: Charlotte Deleńkec <lotte@chir.rs>
> Signed-off-by: Max Fierke <max@maxfierke.com>

That's not a correct chain. If you co-authored, how can you sign off
before max did?

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Best regards,
Krzysztof
