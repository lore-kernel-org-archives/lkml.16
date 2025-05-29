Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5521CC4E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511024; cv=none; b=I9TBY0LAoWUVC/UyieTlNqVUBE9HBAe9bhtDS1yoApUt5rAZJ9Em+O9r9uINLRcnqyIsSnvfqPeDoBFvS+eZJon+aJj+Nbp1hNF8opPM7bNOrmffBifP12WsucKUZowEfXh/48r8bfm7TMVmw5oMZ1aBL/w42qG3aIE+oa9UR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511024; c=relaxed/simple;
	bh=oJbshwMwiTS3jx1ryipl5iAEMXIg4CHVBkd8GnK92Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYFOqQeZ0ivTp9jUeLyUiNIMY6Zt777VoJvzJEcAqDz2Utod7yreRxktyaHTjSRoX9aRQov4EqTUFjqa27fJ53ul0Muh3etLLUTOddI2U99Ulz5pb5aH1oquuNg8PbflPIs7tydFoTLUnb+3xTn/Py201KEOlDF2bSUt9I3DfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1CyIVtc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1CyIVtc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2CaDS029201
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=; b=h1CyIVtc+vGV/xG2
	EpTVDD2N4Wink/i+fXnOTip+5nbsgLpaJLUdRMnjxlXFzoMwIi3bAOrk7wgdljwI
	xfVHPHyYtWjpoMBxprHsGaIjbsDIB+z4IRYOHdB4kQunPiWYnrHZ8pQMqIdII5Wv
	yqEtCbEBgVaIHtk2yzHo6H3laeCBwtomPCk9qU0wNCg88Lcjg8rTHvDL4pP5icq6
	8xWUSMzoNlaNfJ7ZX2qVMC7wwv84+e/VV5bYwLpTjxIU5t3/YWcWGlhpMpuCD2QC
	KinF1ZXejmH7qX9TjklM1YWXsZD/8n4jW2TLE1UjfP8UaaLVC75wSahLASZ5Dc1j
	8vU0nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992q9hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:30:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cd06c31ad6so276122485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511020; x=1749115820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=;
        b=AC1dViT4xjCzrdp1gaolARHQzLmgIKwuJS6je0fvuenqjbgeJSpTc9UTeVBo5hmYGg
         w2unMVri+8qFFS/Kp4a0enR8V4aDSUf4yzaVkXFgJ+Pk7rAfkYMgpm5faqcbeIUKqbFE
         GWWPrYo80KDVbzit4CfiE3lBrKQMDF7h/6F4+c5bVJVrP7lQkII96O6fDAWjkPtK16EB
         v5YhacABqYuZmJfW6kaXcu7CnzapoloprpE76ZP+tM+abo2FCaIdv3JeLMvsGkrMd5m+
         hvBbaneJWOqCF6CekvLpb19ldekqM7gls2OpUMI6ulYiCFQKDCTsyYf75I0OZCNz8Hhn
         4+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUOsHzZHZSbP3y1M3vp+tcRV8yXk54uscE2t+l2R97yNxb4SrO8NjkmEzcdnlhDxDGKclbQ7Z/u9KE29v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI+szDaEGu2uCjVPa85cjafG1/PW9p+eBuFDlnp9u3NoyLVIuK
	cgZHzYKQPwVbC4TDkxHQyF1AtM7ATkR4ly60ptz6/7NFhOt5Kxl+13mY5WLhRYgYuC2zMJ6x0e1
	8tPlJm2s4nuVeK8eph4yGEkcyAvN3rHVLKioWQum/V1pPoYm3fWTNbDWupAJt5AVdHPc=
X-Gm-Gg: ASbGncv/dnFenCoNR3Pov+2T/f1quxmCNPYOpfNISRnQjaOTvuDsg41zN6rD30B8U9t
	RPEiqWxEcR2jlFQGiNmxeRGQiFyhXKCg6bkLZ7ntFOtVQOdIoy3xBATkelu6cHfhoGqiSFDOnqW
	awneqRylP24foAJjZ1RHQRs1TZChUT9XS0mHLB5+emyb6XhZwTuGQIkmuEXLm0GjDLYqnXK8Tj4
	74gbruYFZoz+0Xp2YMQ26wbzbHVSjX4Fm/I1lb4w9cJDhWmR9rtHOsyrvygjkPHl0iwG6ieuCAw
	8vMs/TQjGFlrFRUshz3iIav/oBfji8bwZgjf3w==
X-Received: by 2002:a05:620a:31a4:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d0987e7ec8mr430402785a.28.1748511019853;
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWz2AvGO86BMuA7xGy7C7kufYtby3ybNxEI9G9NE+7JyBgPrSRhr6xuM6E7oQNmqcSWglyyw==
X-Received: by 2002:a05:620a:31a4:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d0987e7ec8mr430398585a.28.1748511019468;
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm1405830f8f.41.2025.05.29.02.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
Message-ID: <457c89b4-b491-4653-bc5c-d2bb4b448b86@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:30:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ASoC: codecs: wcd938x: Drop unused 'struct
 wcd938x_priv' fields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX5/T6i7Z4sPpe
 yuyhSFEQya9IvdXPlkXnlAuCyZL+zlgKa4Mun9ufcq2vE9G6Mdpw5Hp5/6NPwEr0OyuYKclQUfw
 A6hRlbmB6TQWSBR0bHlHXZv27rO/aqUs01Xr/sMCXSlCATGJxKfWUpAhgUNTp+NfNfgq8YpUAsh
 dAGgDnqB/IR7oeLKgvPR5bQD/z5QyHsGA22LkoOu8kziMi5rIrEN/KqVsX06UptbLNEH5vS2IZP
 7rZEZfW2d7b3BNSE4zMxXvETCMlx624mvyb3LrIvJ3/IpWWgn3Lb+cuvoyzwAz9nhrUPHZe0K8F
 7cPcGnGT2mXn2p15P/ciGPkRuyg3NohVu7sBmLHOTyWiYahcZI92C4xzdAtEpGyQVWv2bTIhZgb
 uQ8zZOZuW4bRi84z3oEKwwphXGW0t/44NwKjHgdh16OUwggDgBIMBfB9CxNNfPXlwYA8x3+E
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6838292d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ta2c_YJw1Ga9Y8nrc5oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hX2y7RHDtHPvGbL6uQ989T7KsZQIU6VS
X-Proofpoint-ORIG-GUID: hX2y7RHDtHPvGbL6uQ989T7KsZQIU6VS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=846 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd938x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd938x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 342d1f7d5dee3ac2d703e5b5602aef9ca2987158..43347c14070ca6dd8035b0c290f0dacb0326122b 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -159,10 +159,8 @@ struct wcd938x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD938X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD938X_MAX_MICBIAS];
> 

