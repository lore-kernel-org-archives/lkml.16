Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1A20469E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726808; cv=none; b=g1+ieaYnZK6DQogZsA8IKC1cd1xi/sKeXm/bSX0SlyqwzWlyCHXKLCds/TAB3judSgnNy5pKGheAoKh7WQWDoZe7bSlkcg1mzeddS8muGx4FChD+NxDCfxvXSvnuwJtjcU3vPltUwL0He+6v+G38STGcor+H5cR157bV0ES1dAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726808; c=relaxed/simple;
	bh=groN+RJqDV7k5FDV8ZPREj37G2iBdyik12AU8kIACEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0GSD0aN69WLzubXW99MyXsrOBnbBLPomTMX9Wpb6DcQIFUjUnFvuuFN6nkkTwgveDM9H0d2oNBnxh7+SabBf2Bo0dsCGKVX1jB9fqjkRnPOJFNY4g/OxO05sTEf4vwyqrCGoV0MXdAzfj6qc/OPPFPrViw4vCwVzztumjFd+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vutmKMv/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vutmKMv/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso59199335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744726804; x=1745331604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXKjxnMoQUwfTbUXCqJlzEVhnVQGRvKpp9LSwIPdUJ0=;
        b=vutmKMv/QAIsAq9xhXtF6atnAkRBhbemdkZGDXWC9prxLB5MOrssp58haY004eqF96
         L9mRoNWBDfK1CLZwcUV9UP5YpMuhuFZzAB4oLeo3XLj707Lbdg4MThldIcw1ATzBp9Ux
         sETakoq0U8T9edOGsyzvbFp/X/WFnDixOpiO7IFxXt8Q6qd3Hqq7v0JJuAgFGaz8q1EI
         qmJMxp9WeelgOhroO35o2bMeFwa6rjevv6+yq4GHc0hHQVYFu7I5pCBFseeNrsk227b1
         eGu72M68T/+v8ez4c+qRADEeb0AHEZjLoXWpFCX3Y1jy0ZMZAmvIDQS/Vihcyz3vkhog
         fuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726804; x=1745331604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXKjxnMoQUwfTbUXCqJlzEVhnVQGRvKpp9LSwIPdUJ0=;
        b=Z8j7dY0/P5VoMlsXcPEU/0o0MKz3/CsMsGJ3GlfQPwayssTQ91gqxoW8/ODNw3257p
         Dwk6ADqsMKDWzlUBiczhyi818teXNnTSosu6Yn0rqb9V14XC/19Psh19qEnW9m4pSEJk
         KP9d8MouKJ+D/yQ31MNaUHtb1Re6d9FFjsb7HIna9kG0qnjjJ1R79tos22tqbUzf8BGA
         kG4IYpskAlT6FpRvN6+mA7mvpLY0hhILi9PdrROxS/3qn+ukhHzvTEtwf94BLHPtPPHG
         Nv8F3/y219Ctj6H1M5VDtgd5ykAIK/IuRLdxJaPr09RonTuy+GKVEbCDjKC2xqF8hPl4
         v+jg==
X-Forwarded-Encrypted: i=1; AJvYcCW4ibpToO2FkQz3xOKN/FxBIk6KjuwlaWW1mbFA2lloIOZNV4lDhfIOS+S22jzVK1dYC5SalcKI2tg+BK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+DNJjS5EcQOBoKjPq6bmIBZRR9f2MSBwHiM+cKNh/mdu6YmhF
	BmCZHPgD9sbonk1TX8FkZdOcz85QZsF3h6cRQaOQ8neJmYofWQAs12zkRNNu2C8=
X-Gm-Gg: ASbGncs7N4QZb05GNExV9Oe6G5QDrqvy0M9JQvMjvr+H+3uwhs1I5k/HttF9Wd1WWg7
	9FPb6bv+a5fuX2R5Fv/R51yewOef0mVhV1jjzMQ4zpBOmqAcFUw1gZS56Zmekx3MaEYblUehE32
	2B1mZKE15wXCyKOxrZtbt07ijrgTfRQXjvBL83A7tMwvVF+G6euCarxVTZFsh1TUgKlSjymb2dU
	fjVnuISBcOVQT+t5WWCAD6qVImzHQoN4PGrpZDqBDmVuVr2rdv78E8cZZZ208I7LIdUHhdDXI70
	wcNvZNwVAKEzX2U5kCdxD+IfJ0KMwwNmrJrN+6v9zG+zWt6dLRXlQRi7oc2d/labKvlVF8LtPHl
	pu6ol1A==
X-Google-Smtp-Source: AGHT+IFHuCjBCol6ieY1BDDq4pk5yi7yjbY/hlWuVW8OtROYN0kmZ0rTHkOXvlF+zTukhd9HS/iXXw==
X-Received: by 2002:a05:600c:4f10:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-43f3a94c657mr195976435e9.10.1744726803832;
        Tue, 15 Apr 2025 07:20:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm14436191f8f.94.2025.04.15.07.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:20:03 -0700 (PDT)
Message-ID: <d5107ddd-284e-4239-a251-f6ee16bc873d@linaro.org>
Date: Tue, 15 Apr 2025 15:20:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] media: platform: qcom/iris: rename platform_sm8550
 to platform_gen2
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
 <20250415-topic-sm8x50-iris-v10-v6-6-8ad319094055@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-6-8ad319094055@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2025 14:47, Neil Armstrong wrote:
> In order to prepare for supporting the SM8650 SoC, move the
> iris_platform_sm8550.c file into iris_platform_gen2.c that will
> contain all the common HFI GEN2x structures.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/Makefile                               | 2 +-
>   .../platform/qcom/iris/{iris_platform_sm8550.c => iris_platform_gen2.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 473aaf655448180ade917e642289677fc1277f99..e86d00ee6f15dda8bae2f25f726feb0d427b7684 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,7 +10,7 @@ qcom-iris-objs += \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_sm8550.o \
> +             iris_platform_gen2.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> similarity index 100%
> rename from drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> rename to drivers/media/platform/qcom/iris/iris_platform_gen2.c
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
