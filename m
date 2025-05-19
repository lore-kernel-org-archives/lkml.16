Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95E1B4F0F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644958; cv=none; b=dOEPnDc6EgLoUXE5EAjDkPwDZ74laerXtlbMiTNebfRm537ZF3qvds9/lUm0RyRT/VTRTiOIG7+ZJHEOB5SEUNNXeI6Hw0FqvudHuYJplyFdd/clrhCi7h1NY0Y55EhsmtiHJ8QUeMoybB1gj1vJ6prEbqwzjc9DI209MWXskt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644958; c=relaxed/simple;
	bh=K0vti24UgOSsQ4ruq6gZQvCZo2mbAS4mzkYfBLYUldI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogbidP7gZZsDq0zjYFa8nXPVM8BPB6NvGjrGCF61Ks4fxmb2Ao1iPXisljrUX3+KiO+TWOZC36dso/S02fgDctxv0MOjVGOb56Lkx10d+zKSMRsb8aqMp4/+WULQchylYZ8trsOvOxeyWYHVk1cRPpgbp98ElUO8CdIWHpmdtHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg49GI5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg49GI5R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OiSQ006146
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJDrsvBMltYMjK35MmAzj2BbAZsdbSWYh/aKVvhjTsY=; b=Tg49GI5RYdEpbsFT
	GUJKTFbPoaIHSIUfT+TlVxqmYhV7LLkdTxJo1v1oNHP7A7q3dZftqy7lGfIEyeEN
	duPsmDLheDz8AfsTHE/Okv9dkTqkdsI4VYFQYID3crWt/xV4tRPs2/4dMUksx/0E
	Y5aQNpFIdXcmve+D09cik8hntNtLa/wgwjH/eCzkmz2K3XDkP6XOwQYxmoe1cAQu
	4Ys5eDgq2tqYzp1uTXULGZJdEx+ockK4x3vvKYuBxppAmoVTfbezU/WMpaC7dn6C
	YTx8mnq0K7gkUkk5EcN1x43k4/otOaL3ndAx4qVYPvqWWD1r1xx/dbmL7aKoycEK
	Jhk/BQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgfb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:55:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8cc1c047dso24576776d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644954; x=1748249754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJDrsvBMltYMjK35MmAzj2BbAZsdbSWYh/aKVvhjTsY=;
        b=FVqXXl6mF/qkeu7ZoEVbA5Ads59ZL/rX2XEW0p5TRe2FS+H1ftRqOR8QyWVD0d7j8c
         w0YvLgYybKuhMRvsEwjZjWM/KPkScA7XAxBGHhu/czKSjQKcMzeX7VsOejlOWxqMTqeA
         j3E0Bj/qpTXvVezP2QAI13l506Vl/u21bl41d+lOYP1TtxoPVLCC9fAcboNJrrSQx5r2
         PvDCwQDvsv5kGrgrzTERX7iPD7FhN0gg9PvkoJ90j3PNF7kRDej84BY9LmEsPRtXEVTv
         diQGCvlYpOS0SqNeCb0iCBQgeYgLC2gbmY5g38u3UWKYZc8W8VBaSluEsIqW1u9uBINe
         9Erg==
X-Forwarded-Encrypted: i=1; AJvYcCXs1Lc8hBFomgr+sUDatdHVj4Qk+cn92Aw1VucZbxGkxguLsj2ZajV7luIrVLZgnCVbbRxTGDKxKX26Q+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/zgL4fEXrM8c0VNQkgdYUaPnefPRrrwhNak7KsUu7SACuZ/y
	GBc0znPYUAA5gpS2pez5wzDeHATBnBc7c2r/nBrPWgv0VAgkfYXYdf9AyxaUI6vhjQPwFx8Xq82
	bx+13gnzJJRGoRzoWE4C0AKAJRXgak+FDqqe6f5G0J1lB9y/dGHka3JHsXzNhFh0IDV8=
X-Gm-Gg: ASbGncs90clvHTK99jhpbdXnAc/AZjciDsttUveeZXO7TWPXtFcSrAW2CN/wNfPyClk
	Z9AoLKDlIKoIeajbimUXYwyfXAUc8/+T3JU0LiUHcZCl+Lk0Aj8WAGklYHwuft0XcJdS1J49PM8
	UoRZDn0WF+QZtITkHiPtkTn5aba4hc8COTJ0ww8IQ6oA1VB4oIGi9Sb7TEvrGVIWpqH6CChpYnV
	QBoyKiRs7MI0ct1W1DEZc4Qa3Ibnz3n1K1eskpFNgX3JT5tpWI9OycAhANWYrmUL0+JcNcM6V1d
	tNviy9Ld71x3kEHhsMtIw++53UqUbjEh5UHSPg==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr205380496d6.20.1747644954533;
        Mon, 19 May 2025 01:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErzNEm9Jhf+vM6qFifeQXZGioPWFCKXVSnYAhJt7/k+6Qe2F/OgdHap1Eg9GiydsmOPQVlaw==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr205380316d6.20.1747644954157;
        Mon, 19 May 2025 01:55:54 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a367205338sm8348074f8f.98.2025.05.19.01.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:55:53 -0700 (PDT)
Message-ID: <9d59167e-6fd7-462c-8a5e-5781babdae02@oss.qualcomm.com>
Date: Mon, 19 May 2025 09:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for
 QCS9100 and QCS9075
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2z08SQce3iA7mdJZNi7fq2sDB9zY5G0t
X-Proofpoint-ORIG-GUID: 2z08SQce3iA7mdJZNi7fq2sDB9zY5G0t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NCBTYWx0ZWRfX5wS77bVRc0w0
 hvuJR/Ff7cOFT5HRcU6ywNoNc3wmoSI12gdcapgZELn12V3dcQGrPW5xcuKfyUOkMkwAnFvBp0k
 8aQEnYnn8v93HXNf2BUpPDtONYXP30XpqltMujBCn3yGKXy1d2qEkae3/klYcJea65svb7ctTtM
 ENXOayeLu5opHxBtaRFEZ35s1B3N8qD0+wp863hoMFHgKVn38eiIwi2tLwTmIkn5kByzQ48hndx
 1emuuWnM8/mkm9I9O5bEZV4QenZRuIH7kKI2quvq/ktjwW1I1DGZJPA1cSbisFC3sIQ8NkUeTgJ
 nmaHchf3yoWDapltvgu7wDNm4U55IiJtd2k/YLd95Ax/UuazyTbVzVBBKtRBNR/K+wf6gkpqBNR
 vVdxF+iHuhELdAzZouMgWphfc4bnsuB0eySzqQzydsx7nE+N5/pEOaEtYMh3YB7jRF8IboAo
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682af21b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JQYwrvYeIx7NCKdDp24A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=961 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190084



On 5/19/25 09:32, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 311377317176..99fd34728e38 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -186,6 +186,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> +	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
> +	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>  	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},

