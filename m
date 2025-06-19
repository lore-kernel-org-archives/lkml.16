Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2B11712
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348432; cv=none; b=gpXevqyhWVoH/IJzxUnWImqD+NLuYHd7swnFxjQmqbgbSTvtbpwdu9iXwfLFQbDX/aLA3N9Me/qx/qnEoJqUXPPxttXft/GyN63zd4FacJJ8rwJBRuDJKhB6aUx2D8tiqQ5gpNrFQ+TIRcNmm+BWzr2wJvpCyhRVUlBO83VDw/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348432; c=relaxed/simple;
	bh=ugdpOCezePD7o0TgXKAYQXIsUVZTkJ8svLFNheXBQBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMlRwwhGp82iFYgs8Fda2lK062YtLW9Na+KefLSEjO3zl5PSikf+xN/b2WKutagkt3Jd9djXkYefQ6LHYvzATWvAoVg3wtyG3bZOIqxy9MPF0oIjmurTtcgydK881DFaFmGl5lkRYENUmHpp7BMc0bQCfE9IX6SFIIjYUOmg/PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDeVCTjq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDeVCTjq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450dd065828so7110845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750348429; x=1750953229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+k3NNEekvlr6fkv1a/A9HNwq1j5zrWYmNv2ri3gncM=;
        b=fDeVCTjqwcgTlE39UCjEsgCsJHimcWBD1iXgRhJkzCpH4wioVH0Z5yRsuMwvw8LFeB
         iFPGhydTIJDhlvdFjFa+Gqk5i9k/TkinIMQ9qRE//qSHO58Uy1PKTJzjE2kLYIQlfUwJ
         c8kSu5X9ItId8t45kwDWzrImILXqmbtP3PD5fhtI9cpDyHQ2DObv2j59HdcP+gu6OWuK
         Ou1cT+li2GvwcD1hvHzHC2cuh404z+hB3ZpqnNtuRzwsFMpcvikqg6jPTYV1P2/4qG9K
         99oUdXXGZzNQ9SsHzl9dk9Iu3jflOhHJ4dbo+Hv1ZlXBQW4eeh3CeKzjO8MqgT684m0B
         G1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750348429; x=1750953229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+k3NNEekvlr6fkv1a/A9HNwq1j5zrWYmNv2ri3gncM=;
        b=i1VXboa/Zb8W15HyIx5Exl/fvlYu6Xn1sAuS7wSOFAB7XkrfxN20sCMaIZyKlZHtQp
         rhfvDrha2QEfJzOBynbJY99j6ZNX4imEWzjqaicQQJIn6lZtvEfdOkpacd1Tqfn4fBbc
         8raWL+zq261Q4yyiCs4hGLelF7rrznOXqfgK1J4rUQSOV0x78y4Fy1NgbTwGdinKSamb
         oDcdGxT4IUi4Vq3e69OwI8L6vHseLMB5lf/uXS6m6/TUCOu/nGSE9K4ZiNhn4sastIL2
         aJAOQmVrzCiiVWqiNkmCWmp3hPasKlHlpGM4L8zExLmfcq3MDAxkWua3bobGKg+VEpG2
         4dfA==
X-Forwarded-Encrypted: i=1; AJvYcCVgWkktudJB+r2jTzRWw4rifZgikDgOmFrd9UgviLqscQpvGrPDcJASjwWRmams8TAYO0cMIDkGtJ28R8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5XVnKbIt6VHVjud4KxbRTKI5/No0WuUSwwi1om/PIuAYdJAWc
	hSL+p1kwSi11SxfuQFvNtu+02hinmz7szR5gYnET3f5hFkShDaXYcu3ojPoW7xubiBg=
X-Gm-Gg: ASbGnctFEeWMlSVAzs0+UMtC0woSeTXArdna0n26T+pccPAC83Bu7ty8qbZvWn0f9JV
	c2uj/wdO2dRMcUxGpKqInZw8+Z8bcaixC4GsI0kEaxVW6PDw7wwyv0fHH0vz1mx+mIQfth/5gcY
	0nm4aP9agDTNptVI4Hso0mTQrDX6Go8AnczIn4yv5B7cbc8PdEepKxuzhv2pXuAj7ZLPryW7eiL
	D7Y1Ow7jUPA/M/J+vHfxkAHRw+O8L6PALq6JK0NQWO/EI2MuQVk2g1FXmIXFj6eBJEtwOlbAaZR
	mgGIbrLvuTjNNQQ0u0NKeOJDiTvu29s6HiwZAJI8fQxQsCjleOc519KYX2ubPPs/0zQ=
X-Google-Smtp-Source: AGHT+IFhgF5Hhrh/DcTEDSYXb3z6slUVm4fs2xKiMsWX1+2BhI88RWRGf74eQ6JDO4EbBchzGYmsrw==
X-Received: by 2002:a05:6000:2313:b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3a572e82465mr17345796f8f.32.1750348428838;
        Thu, 19 Jun 2025 08:53:48 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28876sm19786654f8f.73.2025.06.19.08.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:53:48 -0700 (PDT)
Message-ID: <7f9f123c-d7f9-478b-b207-f448a95d992a@linaro.org>
Date: Thu, 19 Jun 2025 16:53:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Replace scnprintf() with sysfs_emit() in sysfs
 show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250619150730.413287-1-chelsyratnawat2001@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250619150730.413287-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2025 4:07 pm, Chelsy Ratnawat wrote:
> Replace calls to scnprintf() with sysfs_emit() in sysfs show functions.
> These helpers are preferred in sysfs callbacks because they automatically
> handle buffer sizing (PAGE_SIZE) and improve safety and readability.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>   .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
>   .../coresight/coresight-etm3x-sysfs.c         |   2 +-
>   .../coresight/coresight-etm4x-sysfs.c         | 108 +++++++++---------
>   drivers/hwtracing/coresight/coresight-stm.c   |   8 +-

There's two missing from coresight-sysfs.c. Might as well change those 
too while were here.

With those changed:

Reviewed-by: James Clark <james.clark@linaro.org>

