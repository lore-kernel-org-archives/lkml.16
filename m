Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909F1F6667
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204970; cv=none; b=RbiGhTwfqgl7PmASfKIyj1q6bWLG5AZTCQFyjFRUzTfuNBx92iUQ6fjgY2iKpZ6kwPhpE7rNpYlhSor1Z5kBwCEhA/SU+8si8mH1HXo4NVR1k6PVpiv2auKUA8XgULqmZYop7UXhDMy2Tp8yc1poQzf4KcjsDw+rMVh7dAuKYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204970; c=relaxed/simple;
	bh=W2lPWkK0xtLvB6EVRo0hijyvktlOgtLlUSX5Erkw4Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2cX/ggA63ID2Heoe98RJWJgxN5nMogfC496girnms5OWxH+yuC/UJwHKKWgw+qMzsRd0p9i0Wt+2GpNImuH87yLNlxJHG7Bb30twGdkEFLdXqitACs1eXa9Wl5BVPfHPNvsGhMT1X5vV249znGDduyw285LUi9C00XE8mcf3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkY7rKVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkY7rKVA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E40hDh026067
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=; b=FkY7rKVAQBZQLgGs
	hhYD/mzVaCZ9Y52SZvnHOGxHF6AcOAp3ICdjiGOCzb6gUldH4k7bEu7OEWVwF++J
	U1objVR9edQ5PBMw91kobQbrTa7PmqtO+jGNbXJ4RKI7Ujo2KcWXN2QrdGFIxbPd
	JIFejx5Bq8I/PKX9fGnxLkFIvQ7PmUOOcaudB2v3SxFbC6j3c969KHmKpVarR3X6
	yEDKjkDNlfQbqBqXdLnZfZMlsKEL7b26HBn84gxIwAmjsN2lI04JIDwSbTXwuBaj
	dN9GfLwFA0nDJY0f6kBeqpl7i5zH2Y7yagE8FlII+liBhFsubUHdWo4IP/dKkWRr
	IPK3GQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew1nu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:42:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so751311385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204965; x=1747809765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=;
        b=cn+wpuV//6QwScU3I2w1prbjHz1UoClVAHeZxQqiQtcwzNM9rccDo+hmTR0eEnWcMg
         e7r9F57+GYDeI5R3UWs0oRN83tFYuM6VY43mlOKMDQZwKlzoMjsh5EhOee+vLjBbuVsS
         7tKPDtLt7GIxVEnt5sX4CabXv1/JNnLZRckUH8BJn3Gf+j9ZbHe5VI0FJwMuggSBkEvR
         90qfQERBTMV1uFeRmN8Zb2sPR7OQEjgUYqABnnW/BWKQcV/6QB4Wu2OY5rnN8Vt/w903
         aFOdVEuIMiRRPZXR737/mL0erFV6v7POurDH/1cTqI6fawFw6Hbo6MiZhED7qpSHHwOs
         Z2uA==
X-Forwarded-Encrypted: i=1; AJvYcCXN2HGxsgj38P+7ALM010L76DckiToCpNpr8EP/KukWaPG7q6GL9phHE8mcryph74Kr9X97TuhGnYu7H5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHyEXs/klptM0sb7Htf+1pjjgUiz74HdeI3HbMg73djTnMB2g
	vcRfc0QM04dg3/nHVmdxRAzXaaD4UjNmOlXjrcZU6pMcj+EeQp7/fgcIjX8imUpb6HD9cnhRyMw
	LLvS/slhiEJPb507Ot3TTTQk8zbC0dxPL411csvnM+wWETgaVC3qyWZ3FbU2ZAoE=
X-Gm-Gg: ASbGncsVNOuEZLiqJJ5S4cmYApTImgOpmPgNGRBN4NmzZapqTVURXBZTzKafUR8fSpW
	OT2nxphHGfx/4awG+NiZWB+/B8w48RgGM+QnK/nyx09NJGI/Ivt2qAtwQ4lJL87ihMtvxyBEcau
	V00hsIP66HSVfF26WvgrcfvRwmBEtuPP5DsF0tBSBbX2+fRXy3G62/lKHWMsg64dxgIUPIxEv0p
	0isufVFmqRmDIjnCBaRHwWEyN+Pu3gNIF4Zihzq9AAf45paVWvNGY5w+J+33xm9GBj/UWVDklyR
	+EpWa0ekbdK/DwBrkPHVDHo8aiGZ6VS+9htgKe/i8hOw8aJYbOHIuQJjRWA/Iw==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7cd287def2fmr311051885a.1.1747204965041;
        Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/TX+EOyLGPx3RCZxzUdd7gY67Jbmj+T3fCNfY8HTMGXEWyH6YEm+X+YAuMYfMaxiKp8G7Lw==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7cd287def2fmr311048785a.1.1747204964660;
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d0dbsm18271702f8f.88.2025.05.13.23.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Message-ID: <ee60c802-f4b6-4d0d-9c0d-b16ab732e6c5@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:42:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NzmZMmxcKg1gP-92_W_wFqF7u-edy13i
X-Proofpoint-ORIG-GUID: NzmZMmxcKg1gP-92_W_wFqF7u-edy13i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX3F59BLHhQJGA
 cThni5+NpqI1gQ2K1J+wjLqwRb+5U9/PnO8CFxeP0e8d/BVRLLUv25U9hyHeMnIVfUorfYmPWMt
 X1vqsAZZFrVw6PbeG6swL6yJHJ1GaZ3VGp38D4wBjAMDTVSMHTAhwoHxil9LDsnh8gcbPFcImVL
 ENE8K1oyMRFYEQ4YycockoYJWvp+hNo/2elRyEO3vMzC8c/IAbiwU4JCvnv/jUq5zMp0bk6FktH
 HazdQi8fVk+ubnwzXHXfoGx+GlHTg8XLifb1fxQAfQvgKTUZM8exuGo4wHLJL89Reb8lbtrHihi
 a7U+7M8u00NhvxDcIpCvlR7pj7ZxKKVBqejfvDftLYGHZ3EvPScLKGb1I6Q63GIvyMeNd/OKtzl
 69LW7EUUF9OGhvAPaMldG1G9qlPntkNG/c+HYQ4m1BuJwBDDaN7A4aG+3YgrbUEF8sNsmWWz
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68243b65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=6H0WHjuAAAAA:8 a=WerGdG9rmgDbcAo0O2AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
> Srinivas Kandagatla, and since no (known) UCM has been written yet this
> should not break anything.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -16,7 +16,6 @@
>  #include "usb_offload_utils.h"
>  #include "sdw.h"
>  
> -#define DRIVER_NAME		"sm8250"
>  #define MI2S_BCLK_RATE		1536000
>  
>  struct sm8250_snd_data {
> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	card->driver_name = DRIVER_NAME;
> +	card->driver_name = of_device_get_match_data(dev);
>  	sm8250_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
>  static const struct of_device_id snd_sm8250_dt_match[] = {
> -	{.compatible = "qcom,sm8250-sndcard"},
> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>  	{}
>  };
>  
> 

