Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA0252905
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188938; cv=none; b=i29JwO8AocVdp402+Qh6SYJJqgP/XosciAuDjNcws6zziQLjeU8zpuvfAUvID6gpTkGuhf5iMCRJfpiuWM9z1SAEtCeViB2ou5UBtWfOEcjS88ZELBh3l5wdRYwG6apdfkQcrh+igFLfNcQYjwMwA/BT8x2LpL6m6AzjIagmbDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188938; c=relaxed/simple;
	bh=hezViJURrVOoPpXb8OTUuWkHgUlYO5MOuHtWGN/Nd/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHFNnnaLP3LAdodj10JDPq+oTRO6hH2oPiJt3y1XoQRfZBCkWc1YbH5Efu5FUbiZnbXREfaqm7lLqVrrOG42mIfUQqLOQbGhPuE/A4TP9YLlvj9CTpPTgiBY+7S89ZHFAmTP39zBaFRqOdvGXc/ciyvfuA2g99EPGp13R91tjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqXgdKSm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqXgdKSm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf848528aso13150205e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188935; x=1746793735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuKJjEeqpYYqUAoutx/iNQxZ8cud4TMO/EdBgGtZGBQ=;
        b=VqXgdKSm/IYlvWiR8iG7ny7q/2EZ2yEKC8oHQzZxn7XHf7I34f60cCCEPooFJdsKUR
         qifW/f1FT6wqHEdfdoEWDW3ghYPe2N+qVouTVnOZT3xlhyXUioi/m/fLcgsYcdcqyOiH
         UjHZ6+b5QyEHUlAktoKIvI7upCwiITZOw1byHtFGhZBgDo5NgDYYRFujguzj58QatDO+
         xyAqakFsHe/tsyo5Mqjbe0pVCjpIdsiFND5DQAIsykrbgRogppOQt7apnGqODlfY/tMV
         33rw2YvYWUEQqHHVroHxnxya5jWkL9XuqLSzkBRHBDT1Jv5mIT2q5KuQ8PIdvYwabe9u
         /cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188935; x=1746793735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuKJjEeqpYYqUAoutx/iNQxZ8cud4TMO/EdBgGtZGBQ=;
        b=NppBPK0NF1QAsiRcbbxZwvkoNlOr41Hkf3rVA4q/KsbJuekKV1NQpnIuKh/JIASZvd
         GWJ7vsCm0psvMKJMfWLxn1tF2jHWJG9cafE3d6m/miWETxZm7CZ7jgElzD27EoOg6oRJ
         jJ0voOPO0fhYfw7Nk4ZnyXn2mXeRGbBGTBRF3CvxoFnsgtkBYiP7BEYdUB/1EKHpnqpD
         dqTP3F0HGWhypgK3f2GOJZR8QA11P9z4TF7h2pkw35suCcsFkO8tp+oiYrkqnSiGfLdP
         6X/dR6ZIrjDP4QsTaw0mThwQCJ3+M2DajltNB11OFYx3Z/zOZqw2MoFH+mdHjUmvhcFz
         JyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBAZCjwGJmZlPuD6vnv7kQ9xwOJbcM8cCLzWNw6M7ttR4KM0x2nF8Uwwh/WEKgQNll3DOyz8KQMsMP//M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ue7Wy+iXN79c85d1sSnHxBF5VIM49eQashkLZiAsc1k+KQIw
	+IikP4bG30GLbH4taDUx1DIx3UtrKg89c+Dzydiw235xXUbnD2gXqwGZXYCXlZ4=
X-Gm-Gg: ASbGncuKXDfi8QljyRKOL42g1a8diBIVJyaz0XPBHMiC6eELSlni71rFh5NNlZkJR1i
	ZhxPGtDmf+YvVkX+KDB49t+/kpaSLu0DVc5luO2J8cKUQQCBwSx6HVC3coy3hVuypRIC74ccGfJ
	g+xMRtkLFsCNaIytA3IU+FpGFgFkQ70jTbq5rRfYMYlKaa/ICWtVw4tvg6+G4WPwIeRZ5/mLRG1
	dsSUpcHKeEPOo0MmaHqNekPL1IG3MvArst0uleS1KbI+7/AakfL0hVI/wp5HlnpepULKceDHtrc
	sj6l9j6nZRf6sE5G6Jbpg8DXfas/16u2rTjazx7vD5a+S5r4he+4tYXb9teBVGUbfAXFV54MnRj
	uE6nCfMSNqCT3REVJ
X-Google-Smtp-Source: AGHT+IGjhiW8tlzqpxgk5VoUKCEl54e77Nr773Jlan97Ttw4cL9jyMAsrH6+IC+FpMkUAZB5kV3tVg==
X-Received: by 2002:a05:6000:220e:b0:39f:7e99:5e8c with SMTP id ffacd0b85a97d-3a099af1056mr1924634f8f.51.1746188934794;
        Fri, 02 May 2025 05:28:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bc0sm2020496f8f.20.2025.05.02.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:28:54 -0700 (PDT)
Message-ID: <54d9f9a3-6567-4d36-a020-78da0f656ed7@linaro.org>
Date: Fri, 2 May 2025 13:28:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] media: iris: Fix NULL pointer dereference
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
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> A warning reported by smatch indicated a possible null pointer
> dereference where one of the arguments to API
> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> 
> To fix this, add a check to validate that the argument passed is not
> null before accessing its members.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index d1a2a497a7b2..4488540d1d41 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -265,7 +265,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>   {
>   	struct iris_inst *instance;
>   
> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> +	if (pkt)
> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
>   
>   	core->state = IRIS_CORE_ERROR;
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
