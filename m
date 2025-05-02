Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD9211A1E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190255; cv=none; b=fSEuA3HNUgq352f5d8SGni5FRtKll2qw/NvmSEgTVKDDDxLf2BtDsOPmgxmk4Zn5SoZFQ1xZyRaYLdbN9wF+RIon4eOZCtNnqnVUtHWukrfXtn1oJZSTsgt7XtHEJq3tYUeLEOul1RAESv3DnNhznPLuukJTy7mz9sYIR8MgBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190255; c=relaxed/simple;
	bh=I6QAVRToiFrvXi4WBLFZ0QTX2zbLl6IKDM8t8exjEX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFOlk4kDWkeRnHmlKcY3ReUhoxx+M/SEBMOqZfVGJxUYFH5Au9WacLUWZoufXYfkLcaVIar8/GVLPN7tmFx9mhwm2dKWfEhVNn2Cm5CIJKo72q7KBD4ul6akkyaZ30QSIu1cA58daWth/wv1S/MzvuXFkKJGNyh7A+veimTol+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHKi5deO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHKi5deO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so1127414f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746190252; x=1746795052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVMDO5iVYdVsAgbbPuYJnfbdpZGyS2sQg1xq2ZTg1LA=;
        b=cHKi5deOJ293bf3CRIphFNNfccXuVpGeTQkweNbYsuGDGPRmyAAqXcSf5TKyhYbBxM
         B6uqGFVseCZrUIpOcXA6AV5eqC/TPGFipFGqvTsnIhQLbiOdj7CBFbETeiQQ2mSLXotS
         M+46dYNWyhaOiiV9Htsi/iJNJWUVK4XLrHuEr9mUrslroilTvHcIe5Rmd/SARHlCKZQg
         T7AvoB5qPsb3scm1XUwFntqLFeBFknb2WhhfhT9liYd9nrknsSIPF6NcxWgOOFwrrifk
         eI2M5D4cP40H9elbFCMdMXJ3J1cp3WMdeEljoW5SX20hKkz6EOafP8sbBiDw8m/04POJ
         Ukxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190252; x=1746795052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVMDO5iVYdVsAgbbPuYJnfbdpZGyS2sQg1xq2ZTg1LA=;
        b=L7vFC0iHY84WU8tnWOrlubBxB6Z7qZ0YE8iRD5UUYV05kWR73AvLUY5XYDQmFaU4YD
         CG0hYi+9LGO/ke27MxNzxwUAHa9InSR+Pnczg9CIVY/gAyXLHedtbxZ/3AGB25HpiGqs
         hbpVs8zOzD/sjNT2U/nOovNUUpD6BwOE1NL0BFOxo9cY/kVEhjzyR9EKLjvDRdRDYZ7w
         nSaLbDEBg0fO5/I1s4mKiUq17FHIZAyOGVyNCPEWTHJ4q5ZbeKJGizQ8Quhbbk8pJ7ZZ
         se9Rp0axl6E6OxJih7Ho0WkuKmu0mWj7GVoTsEyBz1SxPiru8Gq1wZ2MV5MnDO6UWN8s
         G3hg==
X-Forwarded-Encrypted: i=1; AJvYcCUTgFtph92kZpic3EPQjPx8zyd4X82fHlMneQTfgDEATiX1fG7KrP1upVwBRD3RZiRnGxiN5vgHEGv/7cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4gr1+kH6aDeG5JCBSWQ25sKarbGkEQY2Tk44m1CtloNMEX7X
	IA40sEfQHsYoVEW2Z817ZPMh0zgypCrlb00ELXUSbWHLUyiN75IMVZhYQuKA3gE=
X-Gm-Gg: ASbGncupZD1mojQi8ukOPAyPSA4XaWWk2Qefb8t+DtGp3CnTrMqE+Bp9IQjyy9NGWPI
	oE3o2nJvXOXn84mK4jgLNu0NH/fW4mIJ9j3Tsr9tViytv+TjrtauiwEK+GqZh/ymVV8hkBXT0IK
	CvM45iegx4zmI2tBvXC1dy3DVsZ3B+ba3vtHSdtSFTZEh0yEskeBsBLpLhjWj+fGX6qlXCxoHaC
	CkThHUPCNYe0L/BE0Am+HWhzh2P/J1con4aptl/E9ncqu9xd2Cq5L8AyeTy5kYX0KN5Y795kfm4
	O8dYuHcFL0HfL2+Eba1ZOHXRyXKWT+sKirISaGNAF/gwynMKnZ6l73d37B50kmE/KrbmRVs3TLI
	HNlN0H+SurImd8hOJ
X-Google-Smtp-Source: AGHT+IEpWxj8o8pcRmbEsdS/lBTeH4fuOpeC4FeLOdr9sgL5/27OXW/XpA743y7zHGnyxTK8bCoWtA==
X-Received: by 2002:a05:6000:186b:b0:3a0:90bf:b9b with SMTP id ffacd0b85a97d-3a099ad40dcmr1861666f8f.8.1746190252191;
        Fri, 02 May 2025 05:50:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb54sm88637035e9.10.2025.05.02.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:50:51 -0700 (PDT)
Message-ID: <6bd73ae8-28eb-42da-b916-fadc114e2fd4@linaro.org>
Date: Fri, 2 May 2025 13:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] media: iris: Add handling for no show frames
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
 <20250502-qcom-iris-hevc-vp9-v3-14-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-14-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Firmware sends the picture type as NO_SHOW for frames which are not
> supposed to be displayed, add handling for the same in driver to drop
> them.
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 806f8bb7f505..666061a612c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -113,6 +113,7 @@ enum hfi_picture_type {
>   	HFI_PICTURE_I				= 0x00000008,
>   	HFI_PICTURE_CRA				= 0x00000010,
>   	HFI_PICTURE_BLA				= 0x00000020,
> +	HFI_PICTURE_NOSHOW			= 0x00000040,
>   };
>   
>   enum hfi_buffer_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 3bb326843a7b..2267e220c9ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 driver_flags = 0;
>   
> -	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
> +	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
> +		driver_flags |= V4L2_BUF_FLAG_ERROR;
> +	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
>   		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
>   	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
>   		driver_flags |= V4L2_BUF_FLAG_PFRAME;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
