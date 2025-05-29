Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A904A55
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510879; cv=none; b=YaxNbVvoPx6BgZMpvTpGYrSsjVVedgJX+1nHaMV3KEheWlhIT3r3se8Nx7b7yoSufPleh+Ewl2tgGD69eytr69OedUwPJz4S6FMJ2wJTxsvx8tLoSGXzYUqg9aBgvQrlpSeBWTdKnyYdjCxDwPz7ie7N7LWLDwQBk3bSwhfeTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510879; c=relaxed/simple;
	bh=38HSOu/T3KkXbvH/8T6Zvh4srhNNn+nMGnrn4pkq2ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZNEUcyOqFiR82cvHwuKNGUqj+Qxl7eSj9eRx9ap4YOGqIFZBc2u0O7c9fnIojCellEoHBDqsjGprAq9T0dL+BRbnjnKG9YZpuLk6uLRD1fGnNYAxrmjNNQ/NkxaxJUMZnC0738e5mz7MikKudHaUH6/HwXhzVqCOmW4oHGi2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzxLIlnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzxLIlnZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2QIEn027807
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=; b=FzxLIlnZDhQwevYm
	09rGmnA/fx3s0X0UI8ttCiJQ4w947F8HmT2FHRhBT57ka0D463PUd/x8wO0ecCoS
	WjTOEtFPc6QXmy/T17dHv1kaDocvDqzJX5+7JXgLGfOynTeQ7hWN3vomj/Jp/L7r
	IV4vuois2cBlQs3ApXFM5aASVCH+YqNg4Zgz8mtl5OLBblPWiNWMKx4w9w+pk+p2
	DX27OgneVX+4S+3P2uT4jj6zrXB+yPiUEWpUCXTKGCBXxPTmMyfM0x7frgLW+CZF
	3XSu3VLKPL6fO332qwV4R3l5/9yoXD7gcNKz4BokoxTRL2yN67iLhT6rfDBGQQYZ
	mXXQqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992q9b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:27:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23415056f5bso8966965ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510876; x=1749115676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=;
        b=BNsv2wPEd1i886Ojl9BLJdRkCasgTlkFRKB8DaeS3aEkICjyCtGA3Uc2vMHyZaRbNc
         OA5Fv+OgG/n5DlczweWyV2XDSVOpfYAXY+Kxi9kiaSYjEp3yKze8MvzcTgZ8CNVoNVX0
         mjnJ1nhQb0+XF8Sa7X3ZmnjYo430nAMm/Nx8pGFs/r4oH6qZGmYpTnd7I9TYvgpComgH
         7LmoxVF82IVnjvzufbhedACL3kUoVdM+MmfabyoD5LM9iwWy2uxDo9261J05uxLxoM49
         gW1wJRJaPz9Et+mlMRnK9vqmU4Gx1FQtXsDNaJVw8DE+IaNZ2UKkX3SmELznVibVsSMF
         L5lg==
X-Forwarded-Encrypted: i=1; AJvYcCUBR9UmNcH4TkrrHA9k2Icfh4puuRjWDdWzIMgCiBe94LMlOzUyEUKPoct4ZKgAV/szJ1bO8Rb4SAepzSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1QuGgim0OISf0ZtgUe63UTT2JNI7mSQvw7rU1t1L3RffgDE6
	oejkXuUvKyZHvwuxYcRqJJQkfOstzygnxPOdU/X3Q3tDpds+qAKumZ8iUoQuFE02jloaIRuAt0r
	Hu/UndqzsGpB9kX9fVOZOMpUJ30IvwJpeM73pCv+XeMuujNr/OT+mKq2XQXgMqY7jTC6ug9vx6u
	2Raw==
X-Gm-Gg: ASbGncv93BPmRP7WRuqDEW/vfQmBs3xFhGXU/HuNGhVWPMYeMTAVETgogAuQf+QxXlS
	wKkn2fD5H8iDLG+l/kdEyzHuQ0f626SXqg+gkJNil1erg6TsyjDFpBMdVBlCX++ACO4q36Sk44A
	031Q1dbVO/Efb4AOh1McUjLLrFYCOXvL9Gj2J6H1DFRv55mYlVGLTnTIOAcGCI2+9yzYNVGSEqT
	N+WTd65kX8w4cIZZ9uGl9s9XxVypB2NkxrgLhjTQWveHzA4S52Z+bQX/inJpRmmEFO/CkLTqehw
	PPvSCtfcsc0tJRVvL6xgEgtUxpuLcRSOWe2HPw==
X-Received: by 2002:a17:903:4283:b0:234:bfcb:5c1d with SMTP id d9443c01a7336-234bfcb5cd4mr78984865ad.40.1748510875706;
        Thu, 29 May 2025 02:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVu8gsVIcc+j2x0F4CmddwNg9zAzw7EDQGOQrTCjISKQhs+iM8+1jN3A0gsZtkJaioa2g2hA==
X-Received: by 2002:a05:622a:550f:b0:47a:e1b1:c6c9 with SMTP id d75a77b69052e-49f4781eaeamr309670811cf.42.1748510864998;
        Thu, 29 May 2025 02:27:44 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm1386641f8f.49.2025.05.29.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:27:44 -0700 (PDT)
Message-ID: <6668e85d-c60d-42c2-8ada-fe68eb6a425c@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:27:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] ASoC: codecs: wcd9335: Drop unused sido_input_src
 field
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
 <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfXzJd6ROC6DWZx
 HN/898Zrf7eJ8IFg5CABKLq+ZfPQylFVIqpNElNgJfRPhzBZASdWjQjQS4j2kzODDuFwHf/F/d/
 C/R2MylVEm1Ejh8E5m1PdkKvoYftv1JXIokLHRlLruf5+hJHG1xtkqmdjFD96DKfllHR58pILdV
 WI+tMG0AYxywcQu9PUrYF/zJP7IxSNwxO5J963dKKOeRPU4yJ+eMn1LIEyYQytGBL5jHScm0lkv
 bpXEZKteR0eXnPSYM6l5Fd481p4XmQuY5T7Sp02h/AlZqayxUrLJdTi8QlHpxTbtg9PsCQbDyNO
 Qv5Rcs6xgV8xQaUT3HOudiIK1Pwx5+QHC854Pknrwz8RpKBXngbNrGa+eGo7Zwjb9WepjYBQCuw
 4dTiyWO/sVS6QPtn5sdQLwfC4ppvcW/T9KW1rj6LqE6WOkOdtU3FZipS7fs6HgvvTtqnD8pN
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6838289c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_jUoxkvH9Ww3fLBRgmsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NJPin4gMX0h4DbfRRWlfldrISIP0JCZo
X-Proofpoint-ORIG-GUID: NJPin4gMX0h4DbfRRWlfldrISIP0JCZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=838 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Member wcd9335_codec.sido_input_src is not read anywhere after
> assignment, so it can be safely dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---



Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd9335.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 5e19e813748dfa0d065287494240007d60478dea..1c050b8c19de43cf494583d2c96f50f65aefe567 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -312,7 +312,6 @@ struct wcd9335_codec {
>  	u32 num_rx_port;
>  	u32 num_tx_port;
>  
> -	int sido_input_src;
>  	enum wcd9335_sido_voltage sido_voltage;
>  
>  	struct wcd_slim_codec_dai_data dai[NUM_CODEC_DAIS];
> @@ -4725,8 +4724,6 @@ static const struct snd_soc_dapm_widget wcd9335_dapm_widgets[] = {
>  
>  static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
>  {
> -	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
> -
>  	snd_soc_component_update_bits(component, WCD9335_ANA_RCO,
>  					WCD9335_ANA_RCO_BG_EN_MASK,
>  					WCD9335_ANA_RCO_BG_ENABLE);
> @@ -4740,7 +4737,6 @@ static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
>  					WCD9335_ANA_BUCK_CTL_VOUT_D_VREF_EXT);
>  	/* 100us sleep needed after VREF settings */
>  	usleep_range(100, 110);
> -	wcd->sido_input_src = SIDO_SOURCE_RCO_BG;
>  }
>  
>  static int wcd9335_enable_efuse_sensing(struct snd_soc_component *comp)
> @@ -4871,7 +4867,6 @@ static int wcd9335_probe(struct wcd9335_codec *wcd)
>  	memcpy(wcd->rx_chs, wcd9335_rx_chs, sizeof(wcd9335_rx_chs));
>  	memcpy(wcd->tx_chs, wcd9335_tx_chs, sizeof(wcd9335_tx_chs));
>  
> -	wcd->sido_input_src = SIDO_SOURCE_INTERNAL;
>  	wcd->sido_voltage = SIDO_VOLTAGE_NOMINAL_MV;
>  
>  	return devm_snd_soc_register_component(dev, &wcd9335_component_drv,
> 

