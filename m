Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02921C9E0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511092; cv=none; b=ZPnCdyhJbJW55gqQ+seOEKCaJjNoBOnBWxNnK0c74UiH+7+f2tlEJFAXDcdv2H3d62TPAD2THpzputEFQVekocsHdNymGnwn7K1t1j2jBqlrLPdwy4iuHr8xtcc7uKPNaPfk4nTnOOYdh+Xsk8g94kZjog+MvkeRWJ5J3VJ1RpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511092; c=relaxed/simple;
	bh=x1VRGfZYgMo8RCX4BaSZc1zb6VYt1ma+2qcQbg9CNZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffmxbq15bJCTso+nbT0BluCiZnpxD+yQoO1DFT++tHDOzF4fLW0B7j8BC7qXwKBRtx63aUwH+fsXDZLNqv0as1RBpDgwV2NVtYCn1prQrVx+6WYfVFA6xJq1WLt8jx9dByy0kR2zUtD07Cu41L3h/IdVWtlC4Rae4PTNFRTO8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9H4KH6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9H4KH6w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T86bJ1010533
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=; b=n9H4KH6wZFVqFKwC
	s7dv66wlnKp0VNBOw14X0mPYF74fu9KtGmg4Uv0OcejZc3yeAOMYTfEOwP8kTydW
	nFpx2A7/8MULdwqEZs8UDrrK18raxPg1BlEOKkGryJoIlfsYuL8bRcjnTHlP/bjL
	bqOCuMuGt32nsSjCQN2ar/xe59ABK8b866NYCftHyRKX+8x+X1d7sY9X9oq1oMiH
	YjDr8o2fUgnqNnqINFhdkAXhqOP64RVWPR8jvJbb1+pwtE9o51zkN/1J7wjiNsU4
	BV/+Jbsc2Nz1Flrhj51rZaUiAoxqlcBtS2vhdKdYoR9v4OYbF46W/eMjmBIGYCWV
	m241Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03muf56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:31:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so129338285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511089; x=1749115889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=;
        b=o5uPiEAOq0lABkegkBL9XobTdrPvjJ54JnzPWEwYmYNuD4eznp+UBuQzE8X9/9g6C7
         rgEL40l0J5FVSDtEtYer4R8++XVoy9+KMbmTabWnU7d/Fw1D7iHZkpGpTv8j/2dX5PFX
         d2pTjrApSru1N7BaXkyWbkD8q7mHCVqkCpni8erX06s8pZ0subBLzqE2xe3HK1b2TsXo
         lGslGr3BCJwFZUuTl5WHQl5MOgdRr+91U00cTOEd/DWmEjLCTOmPwXDGkN2uiNCUSbtX
         Q8iGgQ3Gn+gi1XKkFNMKfDMKUv5NbCEX4EYfCHL5Ftv42XxNDo5HaIk4frZMsPLqfztf
         PeFw==
X-Forwarded-Encrypted: i=1; AJvYcCVbCLKqmkyr3P4rRnJj118pbBe+uysHvZU2Ya6bs7FGMKsm2kUZ90st9IsYG5dcfJUPaGnn+3HEin72Hu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQoXkk0oONHpJbLdadiOReZqqegxO8GsU1qbngNzQMWM1Sd/fx
	euXPHEi8EoXwINB8SqqYJ3WJI2EVTkgTR7lP8/jFDOiZo5WcAjuBHq9VyiyKajWqXgiaLtR24YD
	4kDK1GE2w7gGuxW/FVIaSMlWEZ+dRJDILeqi+BzypqV7aslbhVAsXm2jpFMXR2qfFexY=
X-Gm-Gg: ASbGncuxW58edaPMaXAJugmP36SXiwWb6tyXuhxn6y2w06TYi9oDt3oSB4JUb95YekU
	4gvJRFsMu01OtECNi3RR4s3Ca+jGS6SNxX3cTWf6rrCWZ42L2VX6i7klGMoL/rpv7k38QMkb91i
	Tvnz4R4xHgAfGXYWiJops/g8r/XbKz72R173itmOMIG+O3pofMaYbMH0nyLhH9x58dvcjXpLvrL
	Tfrw11jpkpkP+sPSYnU3q1eZAIghcdf9JdgF97rB6KrzJmq1mipX1TogF4aYoCyIkV/bImj6koO
	8xUdmuQj1ZybkTO+es1hsYuNUSvFFA0z6de+cg==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847327085a.7.1748511088812;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBbOrTOd5S0R4NHuiIM3rmHA/A2xeyEaZjKpqahVp5pD1+DlUILFY2WUrOeiPk48+sME58JA==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847324685a.7.1748511088454;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm1414133f8f.26.2025.05.29.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Message-ID: <3cdda3df-a2ab-45e9-8e40-988310c759d7@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:31:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ASoC: codecs: wcd939x: Drop unused 'struct
 wcd939x_priv' fields
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
 <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _7ckRr_gfmO9YaYt5WMfYL1W5M7NiEgF
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=68382971 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RFI1buZ0A4s98qjrA-8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _7ckRr_gfmO9YaYt5WMfYL1W5M7NiEgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX6xmUEAtlk0yA
 msXXZt+UgUbuPi1uVkchx1VBYUJYP3vh16orAV4PcNvYvy/jTKGwAp7dMMNUUmT8WSjta07wx8i
 +kbN+vx80bFc6hbqD8nBIlH8RABRszhNJf37VAcUFhF8qrw7u7ZdqKqXBcosqsxEux6ZprSWE6A
 NmlFmndPtGFBEiQxA+puT1mbgHK8uas6nr0azN0NLjwxCpIH7jh3DZM9bxm61Z10JEz5fnpOwpJ
 k12blhvwJkAqZt614sxQN1sKEHxcmpe1tB4OKAzw9rVZE/odtgiIacHpr8RLdQs9j7GdX08YEqq
 JQJSMhQj+hPTTU0TeoO5T37RlyclDd5hKmVIblVhqiS8biV+rjcEoEOeWO8lNK/WJYLu4pgWUa/
 RDYWQlB2ANtf3u1nOyMH5WyRfA9Lk9R7WPkSgO3hHUswVyDasDmP68A7cXI5L2T+39GKg+EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=846 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd939x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd939x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..bfd4d2c8bdc9bcfcdbf673d20458f779922eb464 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -190,10 +190,8 @@ struct wcd939x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD939X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD939X_MAX_MICBIAS];
> 

