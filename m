Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AF20127F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205018; cv=none; b=KmElz6K3Jx3yNOPMUi7q+FD9N71XwsgLvrcpJa1FDjDvbtPViKE8/co2PZ0LKC17t465ezcHzG6xv1Pm/QeltzJd0tJQndE7fc6X/Kb27Ck0AGzHhGoh9s6GX7Ls36OYrS5JM9DWr7W5REOJfabcaU8NXarLkZ1Wt56I8944p0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205018; c=relaxed/simple;
	bh=t6oieiC6PkmHUBT5J/m/ariSEMtMKZPl7YTPtb1Qy+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgnEffVTmKbZ3+g5K383olWghujs1jDjem+qkj3pJeSc91+fXE1rSuLorzHOUgFw2f58tqACSQiYoaK2/Bst0fgi1Ro3nv9/ibj/xTOMdy6howwrVblbzu79f2ZyvAgBd9xLgi9VgwTxt63lI1ngCWeBUCRErFf+f7ebNjCS9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODUBxBGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODUBxBGC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2Tw82029323
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=; b=ODUBxBGC3ip4iDDR
	qArtlQ7am/X45/1LBoNrBWnK6VRqXHKfPncnRFigXBAG6d4mfQJaTMHu09duID8C
	qNFrL0A0+n28pd5X3ynfKJIVjOaJ7z3m5yrEloSiUecOrm3otoBJuSVQS2S2wyTD
	E5DSypKc3cxiGgWB2DNOrNYYVE+zPpHLkocgDKadNoc290V+JFExWLGjOnES8FRt
	Yeu0y+mQoGjmcEgLesJdOAov1Hl5ki6SKEDa2Td7T03w6V2ltAwA8HBxIW53k4Sh
	Ndlv8176VxptKF1xb5cnLe57g3qXX93y/ECF02ewYMWYVqWcxRwHWvqES91pnsme
	t5C5iQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnhnsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:43:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so2147608285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205014; x=1747809814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=;
        b=Y54rhyspH8yK+sksOaKVfZTtV+nsb0CjfnidOwitrqnysB8q1s/112VjnQsDY+cgQj
         E8BugB5h2M3DUARJEiFONO0i8wV9bUO52qJIyHCvE/pNUC40IReGRu68974JhWzUYlG4
         ltYmy6UNSO9PiOYZmYBUJ1tNZpUu2Jp091nS4BfCzAz8Nn8mangENGiSqts3t2u0e6OV
         84ABO8SskexzoilHxmTn+WN4a8eO1NmodilnCF5JtBVjwT2J87m8MTytpZDXiicA4ES2
         TciVn26eN/Om7CdsrkhVuoBt+hqA7NJHRcixTwToz7keApsiAaW3YL53kMh7dO+Uzh9d
         uxeA==
X-Forwarded-Encrypted: i=1; AJvYcCXRhcADBT+ilc2eSJBYJeJ0OL7oXuMGNUPuVzQK06nZIB/z9zbcg8V7B3wZffxI9Eq/bD40uw52A4x7zv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOg+jvMLmp4idb7UYw4ghfnRpcMqwDnpYp3f+WM5FgtwmX0r80
	oXknX7+Miv7efboxyQBHBVXfp5d1GszO1Pm1mc6hCT3cfAK/zPcQv1zdHuhvb31bixr5+oSjtcx
	RHqjDmPLtdmhcfFwE+S9og9KPQl+NxC2Uhkl5l9I/MxsDI9zUXPgYBUYH0WWT+TQ=
X-Gm-Gg: ASbGncsYGztUqGwXdoEMaHmQL3C+498w8KNnUiYEExPKaXRSgq3n5+LDUHGeRWLHoZ9
	nAZCom4pnZBrWl25PaXwGSfxOCa9SoQdcMOS4W/UYrt72c8FpbXo3Iah2hYvEWu+ODiWu4V+HK7
	SBDTDktW1Qg021W1Mo1W4IEQ4+vac10VmJ8dn41Z7E67mspDCGe17+lw8XHMOzOqOG5gN+oxKJN
	nI2DfZVd5MMsEps6nUtClj2bkK4BfUGcay/sgiOMaq7gFmxh3+iqAsHjiT5GFMCBzFKNVFPxRkv
	k+sIeafMYHqVHwNQPr2zEhs1gxE47ZL4KQIxEGgskopOTDARcquZaWcE3r43IA==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287541185a.29.1747205014571;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCYe0F7XxHWYbhu7NVkdrepacB2uWQjdlsK87LfnyU0uT99TRX1IkmjHkIXO+a5nsoJ1a2jw==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287539785a.29.1747205014272;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm18334688f8f.5.2025.05.13.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:43:33 -0700 (PDT)
Message-ID: <bd36e7e3-480a-4876-98b9-73af8298ff50@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:43:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6ngtvwZSDApw7zApzokUIbIozTBabNA3
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68243b97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=uaetQlgIYQjjGCg3SJwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 6ngtvwZSDApw7zApzokUIbIozTBabNA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX8O0kRc71DUix
 cwmDR1S/rVZsMLvTd+ZRirJL9zXGK4qm5Bdhq42CbzCf4pTX0t69Gf+vEfeED83Kx0zv1ivk4xT
 kBFpiEYtE2KHO0D1XF4LGNOjEdNcmlj4cWPW06cMqqe/sY0biUVcUVm8qOIZDXy3rur/hrOD2xY
 8/nuydZAow8EfBEEOpQ8Od6PEE9bYUyCdfGUwzfeh9ZuwHy3sJlm9yIbjt6QSGDkKLCM9TlQ/Ir
 Hu0x99jEsWwGtVQIz45w8cdMJOD9cDD0kq8M/+aLKAxRnEpv36cMB4KZrvv9+m5VEpzi0L9g8NN
 HrWenCjByL64hfUPsDiVMbgIG9nuP6lc1DiOcmn0yyIq/Rycobxko9TXgV5+9onNJ65dW5IN4Cp
 Xq4XJywBDYhaNaBWQa4oOvRbM+GfzC0kvHSBHOfTYfm4azIm4v3maBW9s1a9GVPqkoaeHhOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -25,6 +25,7 @@ struct sm8250_snd_data {
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
>  	bool usb_offload_jack_setup;
> +	struct snd_soc_jack dp_jack;
>  	bool jack_setup;
>  };
>  
> @@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	int ret;
>  
> -	if (cpu_dai->id == USB_RX)
> -		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> -						      &data->usb_offload_jack_setup);
> -	else
> -		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> -	return ret;
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX:
> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
> +	case USB_RX:
> +		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> +						       &data->usb_offload_jack_setup);
> +	default:
> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +	}
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 

