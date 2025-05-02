Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3324BBFD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188960; cv=none; b=aGm/JTHbxLuNPCLPz6n1XaSrXS4Mm4fLtiS8PAmto7+sy70YaD1GHK+FMpOjIEsfNxCNO96yqrOsXG2k6LBIqQOZZF76GoDeSuBBNMYsKidrO0wxiPMMrKUun3ggXZfNt7rfRGf/CMDwsFnhM6iMq7StpEezYgVprTuAI9lltMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188960; c=relaxed/simple;
	bh=zvHa4X0rrQTDwYzkbYkZYw+dLVBDwFqqMgeUnHdOFUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTkb7JgJcqmauWdAfIkbj5KuA1XtTcvz/wNov9dehpZ2FeH0YL+vxXjzwlmYDDnMhcRX/BVG0Ri8VmchGBxHmlLiSZNAecNpO2TvPU8ElYIlZexjwI2x/U8byIIBmKvxa29jUJ6FH/X616e/1qSBV+n5rlubw/pJw+FeiBGDcjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dm6V/Oiv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dm6V/Oiv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso12030385e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188956; x=1746793756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPXhl5ABY9Cpe5wfSbh97dWtdpEKAOmViXZEiA/5wSY=;
        b=dm6V/OivuHe2fp0JRkEb9KUx8oEhQSYiDYQvawtgWI7c8JaKpi2eq82uR6SRS6Hdhe
         yJMhyNogRRIAMKo+w3cC1XC33lJjYE8c5FA7ntLQ4OWGfvBWfyDm/ZaWePl2oE5uDtbC
         rO78zoGActrCZqWhCAUxxH7DXxDeQY7y2+L/s+9KqXdsR6o5BXWGAuojQFvRC1GABtGn
         mECO5WqMsgvIqbTS7IGQsu8ayY3k1hHS98KRUkW0VigALT4sd/CpRUHjbQBL08oBOiA3
         BKglN8afU86p0DHG4Ex4VIpTOn07i0tSzxySynjyGcrzdWL/v93nVujGoKs7zC24ACri
         K0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188956; x=1746793756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPXhl5ABY9Cpe5wfSbh97dWtdpEKAOmViXZEiA/5wSY=;
        b=UzrFxZrxunpnabT1KSEaqy2z3eppqq7y/T5DaMKiEfjKHOayklBXTf+RJVonkxBxCY
         J1PTxFqbQ4lFKeX4biD0vVX1FfJ8Bsy82U7v+0zMY+jsYLJXvWpoWqEkNX7vR+W6khJT
         J56mtGFrK9ZNhOOYCbnbUh33tDNj+TqjLs0shZH80xtSWA5llGbUuU6UHLFFeoaqtrko
         ymjvmFBRtMvPfEOz/csTnm3vLc5Dl9J0WG7p7Wf1OQg6xVClTNNduSxrbjc+vZrOutnC
         WtOSgqRg4y0N9aiBW3qsdz1md5rv2PyRFajTUC0kxTVMb8R8L/1t6pBrrh/AigIhx/IZ
         Ckfg==
X-Forwarded-Encrypted: i=1; AJvYcCXuvRoPTNaNH1OtDSzdAom2rO9G1q7RukOKqIbV6uaJEk+eqHiwk38kG6L3islH5wlOAJ+l4sm8brBKSRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHn9/vaYZHuoO2OIRHKSV9B8Ayny8h99RvvxDNaC9vbiAXq50A
	oMTuARAR+rekK1EL+lvnHcu7I3g8dqGV5295GjK7xl3RHZnQaDNk84ydu9CEcf4=
X-Gm-Gg: ASbGnctPv4RHk1cOW9czJYD52ocN4HU2a5v67D10SRwV4/Qhc32Q6NxEbngYEy2/z1o
	C0nx56RUdNSdWXXzHDF4gGWzlyfSBvcDD4rn35lAPQrHNhFhR5u0ZydxKZAyRnt6Vpkll62kf21
	f7X8Nl9XPqAf89u44Z7FgLp4Mcg3oXZmgSKrmwJXUmSIn4DuzPAStk7GvPJgG6XYq4RfzD5DjeF
	cmCMQIDF5N2Iiqc0nLYpTJ8gPh0nvdZDoW2ZqIMoPXCTgQYsR7GRA0/9shm3V7lb5nEYNsoiIPB
	74+4wzN0wnDVlFVS3bisw9Y3tW3ArHUL266CkeNXxd6DQRg/zOD6UR/mDshpEDolfD14cyLODad
	HgkdnUg==
X-Google-Smtp-Source: AGHT+IEJQc8ArVKhReP08d9VcgU4GcvNbex+0BCVyeNSxBvarnE07Zhzs5sQR2N9SWFhkCNJNsJqEg==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr18854655e9.26.1746188956401;
        Fri, 02 May 2025 05:29:16 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffcasm2030879f8f.74.2025.05.02.05.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:29:15 -0700 (PDT)
Message-ID: <b255fec0-216d-42c8-b7ba-cb0cde51e73c@linaro.org>
Date: Fri, 2 May 2025 13:29:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] media: iris: Fix typo in depth variable
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
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-9-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-9-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Correct a typo from "dpeth" to "depth".
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a908b41e2868..802fa62c26eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -178,7 +178,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
>   						  sizeof(u64));
>   }
>   
> -static int iris_hfi_gen2_set_bit_dpeth(struct iris_inst *inst)
> +static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> @@ -378,7 +378,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
>   		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
>   		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
> -		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_dpeth              },
> +		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
>   		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
>   		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
>   		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
