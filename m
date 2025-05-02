Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7E25D20C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202809; cv=none; b=cj1dDlpwwnz7fRkuZn1cxNfYEdM1VvSzE0qqbnWrd2a2LbD/IjIbGhV+eKu5LY3ZKMHdpYNnHFH27PpFbhPqTW/FsM63gHergs+rG2+6gU+qNLjL4vs3nzdkrNZAuiRUXnDaCwQNPt1n+NE1AsPCQm8ZARlMwKhbJRW5RimL5pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202809; c=relaxed/simple;
	bh=3EjapqU+jeTaOQ/Z8/xEhQVRbPLYwk7rw/gB+eafJ+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4EmRFJh7gHcvWYimLmSdw4oYODNfs8ShhRpvHrcAnuH2FJSxTP311dKeNdhYlPAWE2YAXw54fPVUrDKuAb0hWsuGOXIFvwOSRzNS+/3cKpN9QptiKdYD9AIsXbLLvTbWtXkCCL3WCdr0tDnPR8kisWLjaJSwxRa/ef+I2klpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UOzNlvQK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UOzNlvQK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf680d351so17771195e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746202805; x=1746807605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/bz9fn1ApK8ehph3J3EWQJlOEkbeXH0IsSy7vj7uAo=;
        b=UOzNlvQK6EQQdCcXpcWTbDPQQgfrI7dZfCSxX3OgKJJpmTEkcFnK4YPLVo+4H9gZfd
         QsgrEx5ZwEUpo2OIC4J4htyyD/KSwamS0s1PorXa0ukd4K7tR3dv7ih+F+ZNATGyvGl4
         2udlan8EWKJReejqKvmM+cG1eaGbCBEmnhATlDv92ApR543E0IBxcWcYLGqaNr+6h8am
         YOY/kFcA8zV14H7pHcij/ypFeup7tGfWi5qgtf3QqKD7rWpximN8Ruw8j6VTYoC6cGrs
         MUPj3GM02DCFDpTslLpZeSOGKY2IxGNPs1/BIT8IEMEXL+mEKPMuHT2s0/Kl+XW5baRP
         zCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202805; x=1746807605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/bz9fn1ApK8ehph3J3EWQJlOEkbeXH0IsSy7vj7uAo=;
        b=hoJ0Y1B4qL4HYja2XUhNi1CleDahgpVkPFTLXwTo459fw7AmTJnlZIlqWarpp61gg1
         NCkKAmWVrFBJs5ff2FGKXAWtRd+mUzUDxoKe0DlWW8899qQa/1DbQP3/Jknfst4++edR
         GT/kO/8jnWiDOh3FUmlLi1URAGSbpz8h4jv7bfiwLBSPv5WzwPcfcqlP7Khpw+rKUxCJ
         NUMvX7elnbnLjLTakfyLrxwKf0GyO2tzyfms0W6fqwg3dNj42hc7KRInrSCEOmbj4fpf
         Uq/p1vv132XYDgbrxFlFprtpPKerVIL1P+puuBZubj0yv+xyVDVze6M25xXxyhI4dINL
         5V5w==
X-Forwarded-Encrypted: i=1; AJvYcCXa2MUIBZ0FbAEyZwvzNz/tLsD/20XTCo8NgIMpO2dClGUPc/si0qB2QvOkM6odSfNF96F0t9FViQ+m+gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWU/2IGTFXTRLhOSxPxnDQ3IAAJni4KvTb5iRpZIGMGNWqEUXo
	Eia38ujRhp7ViOX3TcvVf64O4/q71Xo6aWpY5Y1FYe3f0oE4h6efufmBr1kWFEE=
X-Gm-Gg: ASbGncs1MY+Lu+X8XYfeOkxix6Az7BrzH28ZhGN0/Hf4FsMNIUM+S9cXU5ei6sB8EWY
	uV61tgl+Ob3uT71YWmYLlk+Bx4H2lvZqmZADg8FBKg3chBJvpYtJJI++6pZ82BS750gu7RH1E25
	WlqmWUbd4oLhq1Do7eTaqclHqVpcK9b/s+qMPDhnyCeVMglYnfnUSjVD99V5V41L61Md7HBve5H
	yqZtpvFszhe4i6RxdsREifRcaFEj717DbJ1Tn/MkxDsanBi4IR2weErMnf5HqB2YnQ6UyB5KvNi
	D8ZWfEjT7jeD+D53KgfxQqwOXDKQ6dAb6auEDkG3QbrPe/BRmDN9OUf1DVX1q1bdQdcqbnRyibN
	KCjZUDw==
X-Google-Smtp-Source: AGHT+IHxteQF1bGkHCKmd6Y1/yMn23d0yEys+sIe42jqect0CeKlrVJkCO/XXn6oUIOdI381iLRBwg==
X-Received: by 2002:a05:600c:8711:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441bb88d42emr29490745e9.12.1746202805361;
        Fri, 02 May 2025 09:20:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31576sm48340455e9.37.2025.05.02.09.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:20:04 -0700 (PDT)
Message-ID: <68aa8c09-233e-4997-b2f8-7db4cd411351@linaro.org>
Date: Fri, 2 May 2025 17:20:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] media: iris: Add a comment to explain usage of
 MBPS
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-18-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-18-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Add a comment to explain usage of MBPS and define a macro for 8K
> resolution for better readability
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 2 ++
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ++--
>   drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 2 +-
>   3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 1dab276431c7..3e0ae87526a0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -21,6 +21,7 @@ struct iris_inst;
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
>   #define DEFAULT_FPS				30
> +#define NUM_MBS_8K				((8192 * 4352) / 256)
>   
>   enum stage_type {
>   	STAGE_1 = 1,
> @@ -172,6 +173,7 @@ struct iris_platform_data {
>   	struct ubwc_config_data *ubwc_config;
>   	u32 num_vpp_pipe;
>   	u32 max_session_count;
> +	/* max number of macroblocks per frame supported */
>   	u32 max_core_mbpf;
>   	const u32 *input_config_params;
>   	unsigned int input_config_params_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 1e69ba15db0f..deb7037e8e86 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -248,7 +248,7 @@ struct iris_platform_data sm8550_data = {
>   	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> -	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
>   	.input_config_params =
>   		sm8550_vdec_input_config_params,
>   	.input_config_params_size =
> @@ -308,7 +308,7 @@ struct iris_platform_data sm8650_data = {
>   	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> -	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
>   	.input_config_params =
>   		sm8550_vdec_input_config_params,
>   	.input_config_params_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 543fa2661539..8183e4e95fa4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -127,7 +127,7 @@ struct iris_platform_data sm8250_data = {
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> -	.max_core_mbpf = (8192 * 4352) / 256,
> +	.max_core_mbpf = NUM_MBS_8K,
>   	.input_config_params =
>   		sm8250_vdec_input_config_param_default,
>   	.input_config_params_size =
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
