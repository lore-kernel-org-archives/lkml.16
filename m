Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130901A4F0A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511436; cv=none; b=Szwp48lAsToHYuIuF4A3x17VuSfDqW2C+jx1yJlVUOh4cCD5xXguH388cHMe8qhj8OZ6JW/WLTHrhXEAmmYeZR7bb8pGQCXeZbMwbLj5HadnPPuoKuLmmGXg7PRmdUTg54xdhHmJDlQS+vC/Hk4IeSmkRSxy7uK5yavdvC5RIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511436; c=relaxed/simple;
	bh=titktJptRoaayWPqbvRUNSGF680iVp7T7IBr2ktAgjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2Mig+dNcq/Ty2/8/jPyAXAEwVVqT1Og781XwKc+taG2GkdYF1UvRSg0VTmu4vDMCpAEeABOHe1M5zcfPJTUqtK+1fx4+DLtLFPSNfUk29VT7iefDvkUvEw8KaFpOVCOmdd8PnGAI+hfZP7bYD3oPJt41aLG5UYSiUanl7MAalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pr0xzVQC; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pr0xzVQC"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7272f9b4132so1031703a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745511433; x=1746116233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=;
        b=pr0xzVQC0NtZV/XeXnstGtO7nb4NIyEHMRv97JbA6CPZ09BcUp4irAkf1BPQFjmHSa
         AcdNJlS1NUXD18SSJsIwmqyS7N5VkdNlNZ0eJmH2JB1pqG3d7D0S6BMLvZlFkOEFyUBR
         MXW67FNW46a3NQNDpYkF6/3feLvIOheuAP6u2VxPl0COuYbPLgCJije+qElA7qBbprYq
         lDVYuT4Wl1y2r+f0no8sdRLoMe2c/YjDw3ss2FHUaVdQ1jQYwzyycq32z3w63ubg3gdj
         G1CIZ2aC6xe4KyUHXX58HGSnzbNpCxtOa8QNA5YU/s990lO6Gy4PNr1p7tQLzNjTCiJ2
         HsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511433; x=1746116233;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=;
        b=HPUrq5wM6gaCScpeXDCqBDqB5U4MhKb4TCL025qXYlRr6zjkFTc81Tmt/fMic9BtdV
         A7QdORiSaNptUZ+CdruwC+Ny9pvNO25I1cbgfw7iebEux5h3Dwzatmr5SZZOnnhpC4es
         satK/kQrXpGwXeATMtEwL4BuSp/sWGoFLwhTsGCi+t/M5qajLiasc22ZM9f971BpeCap
         DZ5bSlpblUb7WS2E8EyAlgD1pRA82RzQY9YSh/LZtpbKPPgfZlPvJI+8Aeknony1SW4t
         Yo/AJrZnrhtJQjVNNksVX0ym+qTcWzEtV4nJpjENJQGkeAhRctUDNOskUiuWIavniAg7
         ZpFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSJkbCwV8QqNIgSvgw2DXYPkX3Xvqe1UOCL6/ivttSLwjquraO+Lt09ITB/AsF2uTJCBL2QTGrWpR+LjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNzRQH2YVVHxGkPdQtFmlxEVS5+glwWqAQTEmcWK4jjH8qrkP
	dtzB5J7hPbHLRFeWOOQQU6Y4RqoObb0FhpKcFbHT1TB7V/v9BP0AQCQ+gYbJKTY=
X-Gm-Gg: ASbGncu92O4eJlaOvjWzCe4lSLXBaXOYw1uQaEq7pnCb6SuCfHE+jW6N0BG+nzUO9Qf
	oM8FBOB72VaFwjvpDwGNXtgLCh1QR0CMiBNaT++dckm1jJt8sZ3x5EfTr4jF5+m5g4t/bqxx7/G
	TNazTj9ezyIR/fhmy4uGNJHWoNJrrHu3dfXIuBRZjBpOZY7/gAPhMdcFDzdiM1u/TNg/A3uab9v
	4hERBfEqTVNpuv7xvcdL3STJR2J61QICDzzDgNZdGs1wy770p7SxAQ52Yw12BaOPsbhk1AZ8ymn
	2msHJ+2nTEUn7gl2liQ+ozF6ccrDt9menCKggbcpa4b4NTR5QcRls0wtYwsf6pvFbkiBgZKTw5X
	4d67CUOTXDyMVoaiNig==
X-Google-Smtp-Source: AGHT+IGYpdBfV2Zzsk0/8jMa28e3BnEWDecgbttEk0HlgDIzoWmi2sopZs6+yVh5h5dJX7VRxbT0tQ==
X-Received: by 2002:a05:6830:2586:b0:72b:872f:efc8 with SMTP id 46e09a7af769-73059dc7e88mr305240a34.24.1745511433030;
        Thu, 24 Apr 2025 09:17:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d? ([2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188882sm291036a34.5.2025.04.24.09.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:17:12 -0700 (PDT)
Message-ID: <ab3dcc4e-bb85-4a5c-82f3-36bedec3e79d@baylibre.com>
Date: Thu, 24 Apr 2025 11:17:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iio: adc: stm32: add oversampling support
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 10:16 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing the
> data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution, a right shift
> is applied to keep the initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2^n ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
Don't forget to pick up other tags. In v4, I already gave

Reviewed-by: David Lechner <dlechner@baylibre.com>


