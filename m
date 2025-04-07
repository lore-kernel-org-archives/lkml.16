Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB72063FF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041139; cv=none; b=sFLgsds86Z7H+Bwc05iRC/mXnZF2A1kGICjRH6L9RP6z/gcSsP7bSj9Mg6p/7FIbKLGq9REg66SMfsRbvr7ZoydQIHiYUcwVb0r5tNEZa+Df0nmneCBH3ZZoQLSNHnb+8sWns97rF9CQ6pbDNl9dQCpcUnONDuFBvTy5a9iCx94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041139; c=relaxed/simple;
	bh=5Y1kkD63GffpokSvoVSgAXKIhsTTpE6ldnuA2Z/5/+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Js6F0EHBgbNgncXHFRsbq1UIeDn6GMX5KxDCvwGxY6q0Vp5vKylIHsvcJUqZpztEKtchT0+aRBW3yMvwcH3dLXi4M864cpUOV09UPgZuYnx1ePwQxAgFMcHDIyrY94YHBmokAQefLo6IDP2C5F+2GkveLoT1ilIS0qwmpZYvuoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IzM0GHCg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzM0GHCg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso24965935e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041136; x=1744645936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKXVpHnQ9UfB3mcq/Ytnee0VY/Oh+/K5y49jt5/yJQg=;
        b=IzM0GHCgX+u095Jd6i7+yevvOfA93QfXrYiF2RWJIuW7ZHX6t3HTYZx/WxYLHbOJgg
         +P1g+QRWkD5CGvuT04VaK5ZjwjUj0FwicAuKcqz9XfN80dzhSGnSGzwNpaSZHQuaDzau
         6tXbD0KibM4XmL9WTM3NbJtWhJe0hE0S0KC5NLZOrQDUqY25s/sye61ZsMmO/TlJ/KmJ
         V1oGkwpyOu2bc94hPAi1zziHTap/bR+MLgQpHT1ubMczNDnkEen271jf2p6OStz9rgHA
         GN7ZyWFgUCLdNoOfvt1P86IMeT2x7RpgkZmAhOvP2wd2Sk23D0/A7IWlGU48o0flETcA
         RtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041136; x=1744645936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKXVpHnQ9UfB3mcq/Ytnee0VY/Oh+/K5y49jt5/yJQg=;
        b=WtA0+3g/exhJRUZBgJLiwjOZ+5AaU/4xZDcnVqZS6F6In4hyjeGQnOnLooNJNz2l/D
         JQxwyy2FtipHrlkUuEh+q50voZ50chIU0V6l1Fnu2grWHMLqYN5sBCxbK4x25XcxM+20
         AbdBm6dueeG77avRkTHvtFFlqh3a3X6mqHpQBMkc89e9GIvMljrr2FJiH+zxRveLzYP/
         hBhlwxzzrhRppXCBf2uEBAfQljFkPrCY7nHBlstky3N+Z+rnr7JqCCtRWTgzCqMmVL38
         DIG+/Hj2QMBoQo1j7wrXSPF5DlX2MLCDj82w25Bm4DbRLc+vCyg+eaynZvf3BBXYvHCw
         Nc0w==
X-Forwarded-Encrypted: i=1; AJvYcCUiTjlZZqXTVWJvl5C6Vq+0vnhH4A/MjS4eO4VdG78BbIHUxYmMjaKXLS7Bnb7zwBSssmpQwbBliLY5LaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyMR0hON2Xvzu9+XgoSf6k0xot3Lv/07lJcgnJXAEbYOY2DtA
	KEOhU+IQ/6yZI3WVPug7heQIIDNn8DZAHjBquzSsvVQ02QT9WiuzlFUi6BuyT+E=
X-Gm-Gg: ASbGncu0hZ+wBbHF6Vz6FZty9gv++stNYPSRfSjIRZM0IyPqwhN09BiDpoZIbVBmpil
	l0KBQQFIl1etixG09/R/54dUFd1e28gjFw63d8UEjVAFUZ2G8yFYfqW17usADfwIYhVQbbm9XfZ
	V2VFVnBaDe3ebmJlh0FDG/nGQCEDRlgOpiyr+2PThKDSgAd/LCo6Oq3QSHxnsWMB8EhvFxg/+VR
	T2we9Di4lhEBGl+cqELBrMG6RHmRslqHjPf441SNOwyeD9WMT4KgSSBbE1oCJyK5/9P1RgrUGnj
	LXbd/OmD9ebc05jIjHsHjj3AGRci1D9JW+4dzrQ9plHboBC7OYzvHvLnT4oDa3pgMByIE1J4hvO
	BmL5WV+BsDw==
X-Google-Smtp-Source: AGHT+IFbrdnI0bm3X3wXVKLHpcb20gRsAzFE7lNyp40eyc5wEc6nf7w8wnTgwtpWKtCfdc480jt9mA==
X-Received: by 2002:a05:600c:4fd6:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43ee0616f6fmr94548555e9.2.1744041136210;
        Mon, 07 Apr 2025 08:52:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm133750525e9.18.2025.04.07.08.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 08:52:15 -0700 (PDT)
Message-ID: <ecb193d1-2bf1-4d99-b9c6-9b5cde1e936e@linaro.org>
Date: Mon, 7 Apr 2025 16:52:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: platform: qcom/iris: add sm8650 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
 <6zCwYEsWlyaz8z8Elw573sfjWDZBB46nc0IA4Eu_-pKdy3O1WzYh2sr0jdSPRr0uBHqfgMaK3WC5d9sN6-O6cA==@protonmail.internalid>
 <20250407-topic-sm8x50-iris-v10-v3-5-63569f6d04aa@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-5-63569f6d04aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 16:24, Neil Armstrong wrote:
> Add support for the SM8650 platform by re-using the SM8550
> definitions and using the vpu33 ops.
> 
> The SM8650/vpu33 requires more reset lines, but the H.284

h264.

> decoder capabilities are identical.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>   3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -35,6 +35,7 @@ enum pipe_type {
> 
>   extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
> +extern struct iris_platform_data sm8650_data;
> 
>   enum platform_clk_type {
>   	IRIS_AXI_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
> 
>   static const char * const sm8550_clk_reset_table[] = { "bus" };
> 
> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
> +
> +static const char * const sm8650_controller_reset_table[] = { "xo" };


At the risk of asking a stupid question, where are these resets in your 
dts ?

You're missing core here ?

20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org

---
bod
