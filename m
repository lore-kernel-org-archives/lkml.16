Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB879F9EC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744924238; cv=none; b=GeXTYoQD9F32R3Qru4LpzzL9dDJsryUlXO4wuVWG3a58En2UmEA2CXmq7K9fuPx38bZhh5OmwSwcLOYFLGYu1IZP1WDA/Xn9PjicOsVbaJ1f6jgicUlFixKOGOAIBD3v8mIdNwGI1ArXXM4W7pYDrC16QG+/yDo/xOkiwLu2TXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744924238; c=relaxed/simple;
	bh=zayiWsGQgbypU+9CEl1xh662ru7a7m6M637EKU98BmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxziLUFIdayB+NZmzmLIu5ueD5yIJEVDSwvz0n7BpDBe0mYz9afSguqLrdHQv/U8MRiDdr+pUqbBy7PTLKmvKJHiX8mJAm/2jRp7hFBDsmxQjsB+hFA7hE+1/PxQWAgq7L0dX6N7+5Nm54uQq50cknlFnXHF/C3Tu8VE9csJ2tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXgG5wCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXgG5wCa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClPar014927
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7BgY9XqHUX3hFGnIp/2PCnU9QUDjev+cgR8XFlagS0=; b=jXgG5wCabCGSAiOy
	y5Ofsvz26d37XCFhUVZm4qHe6aDKHsYrFWya6puT0zDqjq/NIg+QnBZ+bAWhVzum
	oKpuqFP114+RO3uU/snSjBF++Pnli03emu9X/G3Qt23AATbP7Jkb0pQEkw6dAJA9
	QakHLlboP/o08WcF75SHPIUKxvdYcw10ErPIKP3p2VYYp3l4Kmjhb2diW6DYLcsr
	+Hsh5dtLYsfEgGlN3NPAe8ED36VbBXBhCUcKLURqmE4DXk85tzv9PxUIyx18tGQ5
	eB0ihiLw4smVlmfQffTJb3zXeaNGdENTbaSYDVakMDqgev1du3GqyPSihspHandq
	AUexxg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6rbaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:10:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4792d998b21so1978291cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744924233; x=1745529033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7BgY9XqHUX3hFGnIp/2PCnU9QUDjev+cgR8XFlagS0=;
        b=o/XhL4zJUFpqm5PkKmrOYhboDi9SUnkUjW05JniSX+pdIgXlnGVqlY+4yh+MlkwqZC
         FMfJn69k3l4d8vHE3K2ZJN32mWbxGMUU7jnqY7JmAwZk5RNa3n5c/zybjAv/ja8fDtVr
         Rqqtag9NSGxI4Pm1S0NBkcBzxeUsJQdopA/hgTE7hPNTISMVR+qLpmebwzETNXGqCYu6
         IwjowcUaknFtv6yYaHbLBuE134eVhCWe16l9xug4c0uzIqy7avyvcjccvr5EpU9bDReZ
         Aq0IjbrUcFlIesX5JdbE5aBWOpXdImJMCvYM4z0Clo3NbMiV4MU5vN5Ry3SimlUVheLI
         cFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWl0n7K5VTTxS/uPIY1grPYwV6ApYJoyMxBpayWNmtRW06w3FcfXHitWsKL20ahA3/atmTcUiX6DJTApxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2OIsEpgSDXHLkLItxaCwTjn+AppOgVg0tJJyxhknkIKECSfrG
	UERfrQb5FAtciKDWRa/0ZCNe3/8DDbCKTHmzPsO677FwL/YB2hNBvGRKDq7BO56xNMPG1mAoav/
	UueAf45a/3uRGfLlbQMpPUoll180Bi22bz2C6xLm8n08bjFSP3zgLqjyWqw7tiEs=
X-Gm-Gg: ASbGncuiHrsnZKMQDAp6DrOXoh12UmwpGAhw6zhg1dSFHwF90gQlz5q+R04g9INljPp
	SVOfCNmtTeewd5n+JtB3RMUIwKEiR4bU/1bWbDcegtk0AWH6rLNOQDzXJL0uRQ0tVunl+LYd0Nf
	U1HVM48loCGdOmN/LyiJTm79cbOA7y8lo1IjXuVFr5EmjcyabEzppX+FPckm09AOO7rcQS+0SYf
	4H6Cec0tx1lUJMNSPg7ZDRbOw6iPvo+kHu9cs2zl/R+nSdx6VRab4K5hFDGPQqxRYYT8+sZXB6u
	PpeDCFH+V6BADyq7SoMf7J4sK+zFYoPmJ6cFlKuX0XF2xxBp4poibeaZAJ8h2cdW+w==
X-Received: by 2002:a05:6214:4002:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f2c455d583mr3156536d6.5.1744924232787;
        Thu, 17 Apr 2025 14:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKtWdxfBKZ2i3dNXJvyLNKutWRDck70NGeLsfxcSiel5Fprx2Taw91T8qGaP9AVoaybDiI2g==
X-Received: by 2002:a05:6214:4002:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f2c455d583mr3156306d6.5.1744924232396;
        Thu, 17 Apr 2025 14:10:32 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec10ed0sm39494266b.36.2025.04.17.14.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 14:10:31 -0700 (PDT)
Message-ID: <5fa5cade-fefd-486d-b1a7-622f3677c74f@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 23:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: qcom: rpmhpd: Add SM4450 power domains
To: Ajit Pandey <quic_ajipan@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250417-sm4450_rpmhpd-v1-0-361846750d3a@quicinc.com>
 <20250417-sm4450_rpmhpd-v1-2-361846750d3a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-sm4450_rpmhpd-v1-2-361846750d3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: enSH2O-DQs18EoWWpVGQ1WVUwEWF6m6A
X-Proofpoint-GUID: enSH2O-DQs18EoWWpVGQ1WVUwEWF6m6A
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68016e4b cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=h62wbvEV51DO9j2QOb4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170156

On 4/17/25 7:07 PM, Ajit Pandey wrote:
> Add power domains exposed by RPMh in the Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index dfd0f80154e49d882a59dd23a8e2d755610c896b..078323b85b5648e33dd89e08cf31bdc5ab76d553 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -360,6 +360,21 @@ static const struct rpmhpd_desc sdx75_desc = {
>  	.num_pds = ARRAY_SIZE(sdx75_rpmhpds),
>  };
>  
> +/* SM4450 RPMH powerdomains */
> +static struct rpmhpd *sm4450_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MX] = &mx,
> +};

/me wipes glasses

Is there no VDD_GFX?

Konrad
