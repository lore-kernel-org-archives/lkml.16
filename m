Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172BE18F2DF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824443; cv=none; b=po+VEWwPVi7DW9zK8fl9TwjrIos8gXJcjC5oR/kKpddUKzI96jHGDgAr84nW4dEuxwPwHxZlg3DCUnUscAyHNCpMi13t3NoSrlw3EpC5MfEunr29HMY9JcGAEuQuJwzCLUUAMVaUF1qQ5NQN6W3RWWtx/H1tguTLc+2t0arftLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824443; c=relaxed/simple;
	bh=kv1f/hNYa1plr+nIIidlV+b2spVNxEsefZHdz8jWfaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asc2kzDkny5s62DzeL8l5aMbspKC14kdgEVrpp5uPBVXmXtK/OpFJS+QCLCQ9w7R6O/dwgrsl7qFE/niXqFZblByTfzvw+mM5bZW06gMrzmJ+Re3cU52sLzxQp1BALty5JkTyNv3L/KnoUi+l/iMPhliBh1MS7uzFY0nC4y49vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdGpqlWh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdGpqlWh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1480165f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749824438; x=1750429238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4mYyZ+2tTkkCoL3k1TKqHg7lSWacSP72TFpyhWIgbk=;
        b=cdGpqlWhs4QxY2Y5nRfZyKIdS++zLpr9DaOp8VmmzNrHDbkYI18BPEU2L3hd/waaFx
         1wJcppnAAJddTIfPilNpHUyQm3x2xteyv7btSqWn/WlxeuK6x9GeDmYYz6TjO+Z/1yPY
         H+qWxIQPfGE46YUtvHV+x5wRI0zkwvtE+vPNFyzCjXb0E5MXlc9eKflSMREE+hJyA4LZ
         dv3MGcdco1qA5YsgW/mvF6HRwAq7hDz/KXRlR+MBIvs+xQtwHXDF12cx21D9xU/xs01O
         F+kaN/B7SawErRKCe4HscnutxhRLMnsr8Mz7N9Jv5yXhBglwbWgrPF9gz67ciJuQnVaK
         NhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824438; x=1750429238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4mYyZ+2tTkkCoL3k1TKqHg7lSWacSP72TFpyhWIgbk=;
        b=biZCR1Pg/iUYUsZ6GdzcW/exlGUzamuOMt3fC3JmRIu8INnBvUj0DnvCw5b1oXxogj
         yScutQEDPp6I0J1YsNHQ5xeIuZXmk3IKDjjJhO+iNdd2d8fxvqdL4tcsIChqHF9rhj0r
         WQ51cqytqEB9fOV0J2l0NFlJLvLsoV4JQLnC9fwTbZvfUVzg6VROd/2XP/Q1qKv2/0G6
         Vjdd9r5K69XrDYGcInCyqDKH5t/sbMxReJxMiRIv43wmkC9+m1g4M+YfGT1FOdYHcSOZ
         fQA0iqvdrRXQXQoMeZp4u85O0jmzbLtNG59ahncHP32XhtrjEb1tvsbhWXHPqIAyHA20
         Rk6A==
X-Forwarded-Encrypted: i=1; AJvYcCWes4b6xyWiCdJFSXQzCRrvneYKh8joDuCWHluUVV0J4YyMJ+WCkPckLBbGrHcwMbSLgLG2V27z4OTFGVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwanzJCOnTD6iGhpxPKSck+P8wmOUxV1EriiDKW7WAtJNEOnhnR
	pT6fVgPxe84ZvSOgDgfyrYzvLb8ftRtIPetnAKzQMedTLwb2spd18GVjGRSmWTOUk+Q=
X-Gm-Gg: ASbGnctAH5R/o7Mp4Bvk68zRHLJWYhp0nO0dgu9DuGk2yptSs8LW8fQ/yyYyZ6TOfaz
	//59x3CwuSj6DzpvpJ0H6FBUkf2QkKDy5uxB0JHC5srcu6yC8ssre8ni75uT8dH8b99GmDRgI2I
	EOh0ZBx7Uup5XP1AdQIvASLQ7YK6dkoEWcdWFB1GTxkTU+DykrFRHV70GG/FgVnHRIGf0V4Ljzn
	V+lBj3F5Ik7tddujD1PVLRv88p7GffMdwB6fT29s2QVoPjEVxbQ/4UP13FwT+R0ZfGKWuNJP6Ol
	0aVQQHUyqFY8FDA5gFdApNr7uySxs/g2Rgecfdl1+0ad2sI67/5SHn2fAqYY59cmKMEzlw3YdqH
	RxXg3hbSipl2rGOsKsyo89THyCGg=
X-Google-Smtp-Source: AGHT+IHKpd3gkAfLo6eOiMysNrK5s5pbt4yXFjsI7TgTM+VJCoP0aU+9dffIVA6j7xP98PniNPjEAw==
X-Received: by 2002:a05:6000:26c2:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a568717afemr2779241f8f.48.1749824438442;
        Fri, 13 Jun 2025 07:20:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm2510693f8f.26.2025.06.13.07.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:20:38 -0700 (PDT)
Message-ID: <68d6ee51-3cd6-4e2c-8a72-6885bc33cb1a@linaro.org>
Date: Fri, 13 Jun 2025 15:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:04, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the venus core.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 736ef53d988d..f1f211ca1ce2 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +static const struct freq_tbl qcm2290_freq_table[] = {
> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> +};
> +
> +static const struct venus_resources qcm2290_res = {
> +	.freq_tbl = qcm2290_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_6XX_LITE,
> +	.vpu_version = VPU_VERSION_AR50_LITE,
> +	.max_load = 352800,
> +	.num_vpp_pipes = 1,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/venus-6.0/venus.mbn",
> +	.dec_nodename = "video-decoder",

No encoder - you declared one in the schema.

I think this should be:

         .dec_nodename = "video-decoder",
         .enc_nodename = "video-encoder",

> +};
> +
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>   	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, venus_dt_match);
---bod

