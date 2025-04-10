Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08D28136F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294807; cv=none; b=YxkVb32bpikFojsZN2boo/PYNC+wrbk2WvMfKcneOS1rlWvE62x6CxjInHPcroALYNrTW6YVckV0zjcn+ctzkyi4Fejk8Iw2yp1cmOrZTR2x/MwI5RSQJsmaS/V7KIenSZLra2mBFDhEDltwyOqF0LYwqONuLK0tc85TfK+ql8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294807; c=relaxed/simple;
	bh=VnOYWb6385MBKS5C5EbcoWnAXa7f1VfLxfL6VmciqGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhaH/QFfu91EO6UUFnrxRoojHxMYr9CilCudXj+cuSQiwSB+2CGMGz+SdgOgWPapzN+b13ewi5fNpjgzo4gn09uL/RGZG5E6LEgKjU2mqGBUlYG06fx3vf1Y96eEh31r9tl826l//B1oyD6khqlRr6yXXmYuOvnr59JdjaSWyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eWjhJmLq; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eWjhJmLq"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c2dc6c30c2so228785fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744294804; x=1744899604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=;
        b=eWjhJmLqNcEO4AQUAqmQj5v0Z0waQQXL5JBGOdL1fRLg8I1QlN/x+9vLj+2k0N1vu7
         +P8nINHP4A1R0NH3imjOYdvwyIlQLSmjOo0bcU4MSTkO1GEptNOjw5nuYjCJY4dpgc13
         RuWvBzLtW3zJBn41o0mGkBq/r3JunV+zXyKQtFo398rabzEzrBSWzxcmuwVo1cf1QsEt
         qb2UYv9fmsnkh1Aqq2FLhuQsjCg/3CaONtRaj0GUGDs+MamUddZPQp/m64pVHYourTqB
         2ptBaD8pg+E/Ae1ICZuXXtcPlhoStkWRDhBOv/rYkhnwab1UgR9nv1zXAwSt5r6NGUFJ
         7GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294804; x=1744899604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=;
        b=dAeIXNNn6HqN4OqXzqAbxzcje7WCbTdhZ7WOvRdR6CGm8oSFe1AcR0isHNN4noaXad
         9d5MFJB19HTqw32sBV4el7ZfFWzYRsPLFZ3gD/zm/O3hhdv6QqbnUf8H+NaiRro2iR2a
         8ee20eGS6UGGt78flIVij1qLw7EF2zeyOqloE9sYSxY0nOXfv3foG1AG356n+h+DWTwe
         OIRpuih/8XGVLBT/+z/ASCau2/DeTXH4C9QC/q4mxycd2ipCR4aJ3rY/+y21/bBaXOpA
         27Zoe6KMcfZO8fL0qJ18P2ixMKL/hdUeyCNp9bfwgspANGBDPzch4pnPL1o++lKH+sEq
         BEpw==
X-Forwarded-Encrypted: i=1; AJvYcCXhJ6INT2F59D0T6tYKo6/aKf6txkrRPQP4Myrbji8Kn27Ol4+YfdRyAH4R8XpCzZ93e2apVIvnk7SBzbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lM6yfXHX0SwWS/lsB5G+r5cVtvceehcJ6q5CojnEbXOSRq2T
	fou1SSX9IAyIueiP/Fc2mfl3uAtrQvmInup56ofw2HWrNi7hNXdVJp332uQknQM=
X-Gm-Gg: ASbGnctbrlDrds1oeBubgkr+6Z3zuVsCkntGPQcuGOEiTauYUVFZQnjGDy9gsGHrxeS
	bXRTd3i+OtzK1bJGP5s76UEySXBKTcb8si00FSdhwKGMyzhSDbW7q/PvHRJLMUfSF/eVJ5Ivqxs
	7NNoIs8GjsecBFHBVMsdi8TEC89aKrLAEDTzy7WAsFOyWCwSPJiXYyxxfSoPXuVcYd2WzURO8Sg
	2J9lpaMHondiYRdQXK+PogIIvYABRzdlVxLgUj9/eo4ey2ZYEJ6mOtRc3rJ8FFMyF+325TAfoCg
	Y3CcpcUPFS4RGyCQpkH36XQI0BqrzHNxv19Lxtc35NEN/0rDC2VCVOTS/SHR6/S1RRTYTksA+5M
	/1A==
X-Google-Smtp-Source: AGHT+IHmprFnmE2L9dl6TZiZJCp0rXROk32fEiGq63fS0aW94IToqZ2dIpCTynqnYIATWgqEA0PScQ==
X-Received: by 2002:a05:6870:158d:b0:2c2:56f3:1c84 with SMTP id 586e51a60fabf-2d0b3820255mr1492765fac.25.1744294804016;
        Thu, 10 Apr 2025 07:20:04 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e4db34sm578067a34.49.2025.04.10.07.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:20:03 -0700 (PDT)
Message-ID: <22384798-eddc-460b-87d8-8c13beeefbd7@baylibre.com>
Date: Thu, 10 Apr 2025 09:20:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iio: adc: stm32: add oversampling support
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/25 8:58 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

