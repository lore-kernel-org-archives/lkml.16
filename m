Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7C211A1E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190203; cv=none; b=Y2KZZT8pkIP+vFZb/t32iOZhGmypsQkGvq2Aj048RmEP92XXPeHgKZ2EGa9xaDryeCxR6QWdvswFeY11f1LBlw/WBcT8z2m+7iH1BmQGFfmM7BFC8JZj3h8sAy8sgK5HpWgBT3jwnBKQVFhlhjFeBDXiNmcIZaWz7i7pqgghPEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190203; c=relaxed/simple;
	bh=JrOubkwGe9p+sK08ebhN+YAgR5LXsT2jghNi9jx0xWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRzeAwQKctnmsx6Y1c6XGAbhBCyW3Uo//nCV4BEnr3WNotmbXdr0ElHRMoCwl1/4PtH7ALan7Pqy6epsCfoDx3Srycj90UPzUi6c6ytdNpGR0FEl5MjQrjDiPdR/FrWLfuFV/cHU0ZmS46xI3YCfF/Z2cIqeoHaiw9wPCVhsQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnHTSFzx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnHTSFzx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so2060990f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746190199; x=1746794999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhKThSlafFeqp4Hvo+pSEwoDYjQos7s5HRDgvc3EtFA=;
        b=wnHTSFzx3/6pSWrGx8P7N77VGRiwT9Vq1nbzjX1f1Dj72T9VhFmJf3+4+bSp9zSyQo
         5hvTg8gz7fJNUt+T1yFdzeofPFaZyZQ7PeCm2QFnuzpB+Fqq7j2uXfMejsfoNsYyBzU5
         +aBaHC7oCyR/h9nziGbEmTABIRdSrzDAvBRd6pKjQOLpj6kdP32aevnlLXkJO5qaDjfM
         ax+nFDlwWMdRYu4LczEZz/5AdukH32mZKk/NfpDRbixV6wG3jg3XlAIXrloJvwaLNtmx
         N7DuQjIk64FvUOQzZ0uZ534+Qz0fR26M+8mfBQ4NEZq8LlH34MtEeMS6DbqayUzvdHPt
         dUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190199; x=1746794999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhKThSlafFeqp4Hvo+pSEwoDYjQos7s5HRDgvc3EtFA=;
        b=b0R/9yYXRuwL30PKMJ5vKV3N0t+ffIXANi1fqOIlKqQO6uR3Eb7YWpfXIyMn5jBbHy
         9XGhlLQKHi3g2qL94IogpUIKLax6dLgT/or+Sfl4d5wfo1n84Ih7Up+fABe0+40xj8IY
         uSC62YwzqgoAaq4Y8w8tz8r7lVm0TiU/H92Y5WLIsTD4qVg/qFxoAJsqYrL5s8tB9Vqw
         dlS1gLJqOSyDc2ckqSjndN+PhZ4m/UKRNBbTwJ8sCE6+KZd+SQqqUVx06c3NPGaAZk+4
         ajPS1yrb3UP4fEcDZSIpSmly/pibu+Ly8qGHupiMUBMdBgZYWLhbjKm82ePVgbhmvC+t
         cBUg==
X-Forwarded-Encrypted: i=1; AJvYcCXUD5Q5JgTD13e1BwK+F82VJ5dvO/Ky/RvneVKbvpK9nv9fyvaJ07Kl1MIzPblZnrz/MB7lHHJHjII/UKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuAXA+kW3s9dm7JvMz4yvYnP8zJSsbaI7AsTdeaAA3Y0OY4yq
	KXDUN6DAJu7Raj7q7L3irKKPWawRkwaSxGsvXLhiyQksghloH7qQcliTsZzBu4M=
X-Gm-Gg: ASbGncvry4z2NpXlDVipRBofXltvvtOYOOn1ptEZ5cB35+ENn28qPRd/JqieoE2R5Xl
	XsnbzuFe8xQHAIhKn8Y4imIckVD7IoCgCdHpOs4e1cF42LmmcbcXWEMI1oclPG/3jFWMRh1XCLc
	i7h1si38/ksEKiHUj7750dIoF4xgRVL7NvD2NUzzZQ4+3RGikSgkIZzwJeFMSbG0gisBHbHA9sW
	55t/LL5pTHLzEVi1Rf/uYizR0GiVB6wEMYZDMY4I6FEY/qqymbnweKk7wqofbF/0627jrCGl/ur
	hbU4U4V2TK3jGkumD8/Xjez3nq/LLw5VU+RoLM7sjE1WQDLC0XxV3l00Yg7l4IJag3rWV2R6MOW
	r4Rmsig==
X-Google-Smtp-Source: AGHT+IGSngeiJzMwrYS7IpeghcL1Q/aGw28NETws0AJluPOXa5GCJRNjj7kYUwaCWH2uCBerdODN+g==
X-Received: by 2002:adf:e38e:0:b0:3a0:99b1:bab7 with SMTP id ffacd0b85a97d-3a099b1bb0fmr1867838f8f.55.1746190198863;
        Fri, 02 May 2025 05:49:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm2072190f8f.71.2025.05.02.05.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:49:58 -0700 (PDT)
Message-ID: <f9767d12-a9b4-41f3-bd96-f2b13cea5b86@linaro.org>
Date: Fri, 2 May 2025 13:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] media: iris: Send V4L2_BUF_FLAG_ERROR for
 buffers with 0 filled length
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
 <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Firmware sends buffers with 0 filled length which needs to be dropped,
> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> Also make sure:
> - These 0 length buffers are not returned as result of flush.
> - Its not a buffer with LAST flag enabled which will also have 0 filled
>    length.
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 4488540d1d41..3bb326843a7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>   
>   	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>   
> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> +	}
> +
>   	return 0;
>   }
>   
> 

This is a pretty complex conjunctive clause.

Is it possible for say 1/3 of these logical criteria to be false ?

i.e. if you get to:

1. buf->data_size && inst->state == IRIS_INST_STREAMING
2. !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)

is it possible to get to

3. !(inst->sub_state & IRIS_INST_SUB_DRC)

?

This also feels like a bugfix ?

---
bod
