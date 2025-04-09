Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96954158218
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207123; cv=none; b=bWnkk/pCPd+uLip+gXHI9aYKDl6t/XC6OivCu7iDvp7d3LKqct5feoJnyCVfOT1gH61++P1WPQ2NYuvo8A7jVQ5qgMEm1FMUFkLL20W2PObvjZbzSVXr9fS5jVCEv85Fvn1sxNoxWauBCTGe3a9SFQ8WKO7M3WdvA1QSHIs9DP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207123; c=relaxed/simple;
	bh=t/S97uM0OQzmLF1RsSm3zSU9KoV3Eb8EMj9maBmFYT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuwbUU1JVbNkTkO3oftssLE0J8LiWH0dC9oSUSIKk61ICSZmoD9KdpfAughzNLYUB6TBhGte+9eVJmfeiZt/6CzflsyN5YJoWFs6QV4hZjDgn0bU87F1ubHR4pcOIRhkoOOmDCOVHZKJIKZPIaUsaQWNgqZxu/z0Csj9VXxegRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWToxUgi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWToxUgi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f2f391864so3793327f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744207119; x=1744811919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Azu3AUAQUy2/C9fS6Ba25nQGoxL9rV4VIY4SgkwNTA=;
        b=DWToxUgiR+18kCPRp41F6mZiPkpUj8CNiieboDZw7bXfwJA2qJ75YyxQryfK2/Zy/Z
         qpjJSIgbCAreVBFstI/FZ6ErJbCrGpElEi5/ADia3utkjXyG5txqCnLOi2df4rBE+epQ
         k5TvH9sUOdR7bm+ttD4s0T2osWzOExGAndq8QVVfpB5BjYbQb5aj3exdBjPufSqFNMpG
         5Vd7YihIWrG5NmX6WZ+zzkgdMmIx9/euw6UqrSU2gc+SM0EXZRcCiYQmvIklG0YUPEYg
         q1vQJjjX8hZd8wMPUxh7g0lqCxWUDumsXXLmYJoiInFYtOFln3BHJcPEs4vupAHc0WQJ
         jBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207119; x=1744811919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Azu3AUAQUy2/C9fS6Ba25nQGoxL9rV4VIY4SgkwNTA=;
        b=kX9ixgdV2Hob4BH/kXcoOUZ8kRfwJPZKsrYZTik8Xw0Vje9Mhp/OIFG1d/yzeEh87x
         SeU3vzfmwfRW8vKIqLfzpa/iproby85C9PfRxeyNj3vwMVFJWqTzRluWpk59PmKGdzvb
         lC5H9BjyUiZD2iby113yQDQZMZYleQn2uzxBivbZJXntIHYprQkGeMCLFxKJhoxeN1nm
         qiRI33xvuHwnXQPBefS26+ougPx98TS3KbGfw6m75jt4E9IWSVsl7Ki2QQSqxSNiJb4t
         tldkt8Xk2hkcpHqUgyCfIGbtowhTQeigI+O3qIEXDnVqj3d/d8ccC7/A+p+aPN9D5gfe
         tkQA==
X-Forwarded-Encrypted: i=1; AJvYcCVqS0Nwk3t2JXFcsdBFZ3CyaCIy5UJvKPoflpEkONGE/9VjkNrjnk/WasRoTRXyv7oSspCJ/VTrDdoOpZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYqmsXPSsZCAHftCIoAZrsl9ZcFA25IM9gad5oi0OIRUbVJZ2U
	IAPE9yAqH1eMBOixb37rKY9hgDbd/Neh7EVYAAUOmtfVz8IPfxXsoUqLZxa2SGc=
X-Gm-Gg: ASbGncth35XwZk7+OvRRpFSrEuNvtrelJqGWzQDN+RVmfQVAddBsXzBAtiYuGF2wIjq
	e59+Bv5AJz+oLGCXHaGjQApRs1Ju5qY62/TNrBV4/cdfF0tuVl/wNsGcwADISYULRrkSh5W1jZo
	PR2mv9XgQ34cp1WNjY1uPU209Jc1z6x7F2UB/mUiY/vPklo0DZ7vviK9QvlGmoZ8QVkQPbB9V2z
	fQEdNemjVYglWWph69sFo0mj0BBK6LvcKn1+tbJfGgkV4zclJmMsAlhvLyErbPz3H89NwRrfy7/
	BU9LnWE8KiOnJGlz32f9gfCQrgBeEq9QAJ6qJC3cHUJlNisufQcxDL9ebJnty+uYVEzCu013Lpz
	9ELihfg==
X-Google-Smtp-Source: AGHT+IHCLRyj5tGrglz7jGGJhi77SKkVODo7Bo744HBiNUOuH1yjjm2d3tWnAZzawQD4MlZx8yyBRA==
X-Received: by 2002:a05:6000:1ac7:b0:391:23de:b19a with SMTP id ffacd0b85a97d-39d87ac48c4mr2967406f8f.31.1744207118882;
        Wed, 09 Apr 2025 06:58:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d82sm17370525e9.37.2025.04.09.06.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:58:38 -0700 (PDT)
Message-ID: <48eb2db1-094c-41e2-be93-e713e67f8cb7@linaro.org>
Date: Wed, 9 Apr 2025 14:58:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] media: qcom: iris: add support for SM8650
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 16:24, Neil Armstrong wrote:
> Add support for the IRIS accelerator for the SM8650
> platform, which uses the iris33 hardware.
> 
> The vpu33 requires a different reset & poweroff sequence
> in order to properly get out of runtime suspend.
> 
> Based on the downstream implementation at:
> - https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
>    branch video-kernel.lnx.4.0.r4-rel
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v3:
> - Collected review tags
> - Removed bulky reset_controller ops
> - Removed iris_vpu_power_off_controller split
> - Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
> 
> Changes in v2:
> - Collected bindings review
> - Reworked rest handling by adding a secondary optional table to be used by controller poweroff
> - Reworked power_off_controller to be reused and extended by vpu33 support
> - Removed useless and unneeded vpu33 init
> - Moved vpu33 into vpu3x files to reuse code from vpu3
> - Moved sm8650 data table into sm8550
> - Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
> 
> ---
> Neil Armstrong (5):
>        dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
>        media: platform: qcom/iris: add power_off_controller to vpu_ops
>        media: platform: qcom/iris: introduce optional controller_rst_tbl
>        media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>        media: platform: qcom/iris: add sm8650 support
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>   drivers/media/platform/qcom/iris/Makefile          |   2 +-
>   drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  64 +++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 277 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
>   11 files changed, 413 insertions(+), 142 deletions(-)
> ---
> base-commit: 0d6ed9e013fcc33da9676ed870454d2a014a5aee
> change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
> 
> Best regards,

For the series

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell 
Inspiron14p

---
bod
