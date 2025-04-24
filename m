Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874AC54279
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501618; cv=none; b=tO/l6tLIO/jMRzF2KR/ixvb8B3Zx14z4AKxy9HFta7Q9u8nycfqgm/uigLLoFjMfLEYKwU/roiEEvy90wUzrOpbyxNQ1E8gSktfW42AtOUAhygtS0uE+StZan0Z+sukUzSad8gLRwpHQsGfEMz4/IwRRI2zS1j5kCDmSE+a9kmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501618; c=relaxed/simple;
	bh=7cJpCnWASIdVH0KZBiXA9/dE/KQ0W0rpoyCF4+AhKMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jS+YO/kxWY8L1UowWWGuLg1MV6yP+L2kg0Vgyxn0PpgQIXV3u5KOEUdwLKPAEkkddHEjQTTjc8WMlssGexq0z39ktOwt3yJ+sCXNbqPXlK/+JUKr9Z40a/K9spevUw0uRRNVT/yAqIglKiggFMUOx6Akv3zn0SNHkKm6ZvI8nnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUrjE62E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUrjE62E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso606515e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745501615; x=1746106415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UbmLFXgx+9vZ6ijebG1uGxW4ic4rHWH1tDchx00iFW0=;
        b=cUrjE62EC6oJMXMKYVunisJThThmtT0wVDL09SSE06ZXoMeM81iBNMWFHmx/MlyVzf
         /WbNRbakm+0i7r9Ezc+L3vr5b4zkT/USIZ4r3QYR0hzlj8LMhTvEEkP1VCtNeGBm8aqN
         tXS29O02rhByN1zscfwH9IZypzuz1x2Uwlw0K1hVRQGUyHDb7vcpn99YyGiD+5/I6clB
         Z9Y5h2yAAHQVnEGnAILWdjENCVitdBDkcJb4T/00h97q+AULxCtBktLxxX72v8bTVXZr
         heanuAZoP1Hh83QlC3U75J1RKzeW5GqFXfjRGGEZ3s9gmsVo32vtFvU5jClbvGNjybCZ
         coYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501615; x=1746106415;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbmLFXgx+9vZ6ijebG1uGxW4ic4rHWH1tDchx00iFW0=;
        b=Yb1gqMcphqjJ5/y5XnR45ygA6yjZCQF8M87vGI9188t+xiGUSCkSm+qftgm6bDLRmS
         JrBfHfaijO+O0kjqLKHkrCKKXCF3pRnjwqd4PVrPrqrJO50+npylzucAhOERGg2sTbnC
         UFAbUsPNrcYAr85V5Rw9bLfg0wBD1RdQn2T8ALE34j89FAoHXiI+6Ish21HLNlavwrUb
         N+Fp1T2e1dMW9wZVGVw7lCf2sV5jpkkyjUPZ2F8XtayGmiyvOTa+ip1eWm++zVJpHdxo
         Znbn2HjgfT2g16K0JoV71qWAggDajGosDftt30i/2OPSO9Ix4R+ZtPHS1yqTXmUKmLwh
         6lEA==
X-Gm-Message-State: AOJu0YxOch9HAX0MfMvogHZKJt7K+vl3mOgZig7sYKSyvE00bUXBn1Ec
	LMDRWhqNYSF6idHUlPmCi9qPMwwwY8xia6pWRucIaDAd8aEgxshebmaoFHdpaxc=
X-Gm-Gg: ASbGncvdzYpJWMqfWfyYOk1vP0itrv90L6LTMT8zr3oLSEmP6UwXBj7CFBQt+RRvtUS
	65j4YlwO4D97KlXr5gE5iNAjO1p1sTZUP1U66v46Ro39N0n0Lw18CTAe3wFjza9OVSC+USOfCpr
	IIJIY+JM/lIn713E5992ZiOnFR3ZfxDClAssxFHqCzP/EZRYfg1YgvjsXcYoqX4Pp2i1syskH2o
	oUNAMBZQneMxwxm65EjNKZKX/MlH0A9QHXUwezWLMLEIIZGesVdnYUhHfRd3m8HnRNEf5r1mFcV
	912xz5JavT5Mv0eijllxwtub2KXLcaWi/kg+eOjdozf4cQz+q+MKMY7TvAw=
X-Google-Smtp-Source: AGHT+IHobLnqEdKEX69C7OFDDwylbOq1UzHJd/uP6bHKFs0BfgK/nGV9KzadE0I2ECUqe070spU4JA==
X-Received: by 2002:adf:ae0a:0:b0:3a0:7119:cefa with SMTP id ffacd0b85a97d-3a07119cf5bmr109427f8f.16.1745501614718;
        Thu, 24 Apr 2025 06:33:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c0bfcsm2164111f8f.39.2025.04.24.06.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:33:34 -0700 (PDT)
Message-ID: <2c56553d-dbd1-4eda-bc5b-3a54c1152bef@linaro.org>
Date: Thu, 24 Apr 2025 15:33:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: Add NXP System Timer Module
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
 <20250417151623.121109-2-daniel.lezcano@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250417151623.121109-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 17:16, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
