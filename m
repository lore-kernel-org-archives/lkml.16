Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0387633DF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323709; cv=none; b=SkdovrNUN6OCsqmVrMndDqs1WeDmK5/8R5Sgah+1tkKu6EpTm5fMFOPX+qibHppxtJSK9y/b9wmijbMGTsFtladPIPORzYsHsGkd06fhIIH9e7o1H3y6fTvU0Su+5wgJmlqXZ+U7Qr6HW+NfCOuI5nkei4EAb+yfs6gvKXCXQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323709; c=relaxed/simple;
	bh=7ywYiiKNLO9A8nztS2XTnBGliTV98wcv1CVo9aAO7eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rR73YlDY1dFYWQKVMKDrqjrKYolxny96X/jBX5hdasiU226DV0laiI3NsjqXrfFSDpkxpF3Q7vsiy5bK+VsqatH0dhNgYEvMCoEWc8d8VzWgR9k2d22qHwey4zxGY9Ub5Vei+q2ftGusSQhyHZn6eKaSPfPfpMErVi7k1fC+0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWYwKoDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWYwKoDu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEjA009131
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/0ojRnSWXvRmL/NeRTFyIUoU4Q+EzsHrqsYsCOLaMc=; b=WWYwKoDuM723eE8r
	LElS6tFxfrFg9Mew4iYi4haIng1XDIaRkspLqfu1IXDkZdOveJyJNoI2OEK+Mj19
	uqRpJ6+mhCgQwqU5ngvMESTCDHq+0Z5D1Ldeg0JAohFtmW/fPuJwrvrjF33vzCQj
	OsEY90lgwMTefvNv/tDQP9P9htinKTnZsvcnKA8CF60yGMCPVf3hKdssbQ9DsXaW
	LL3ZN1DytBp60rRCjQp1uEHd55PFFSg7MQPQIZtre/JPDOKoeYpNKO53jDmGYsqj
	WTb6wM9oX6SrkKiFqqXLr657ZzB87hbPReDatFpKFexYEtkzfA1ThhwYfgnxOG2M
	vW0nYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6pcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:41:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f899c646afso3524276d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323701; x=1747928501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/0ojRnSWXvRmL/NeRTFyIUoU4Q+EzsHrqsYsCOLaMc=;
        b=HJush9XpxP5fAWaF5nTUpgqx50SMPQ5G49Sf8XjUdXUv6PvIuX8fqEaMgy7rFM3teu
         wvhrQPbyVic9DPIseTSVxtvQhRXHtd20ZpLKTsIqJqVpu3m8LF68ao4tDhLnF9DVLp1H
         k+7SvFkT/hso8p8BrUHcV9RDip8bSbcvNVgGEy0qoVB0diBkuYoGQfizKu4nvejVNBYr
         ynwN97LZp0F1K11qHyEHGpjiVhGmnR+BAyMTf75pOUPmg1XrRfmE0OEHwV5XC1wSfvmr
         ZRktou7idbfQzJ4ocanNxJ0nCcIJMdzYFB6dl5cFnjbASc0NPw7KWUswNS65nd9xiryK
         EdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXohbRCmMQbC81OLHPUuuJtFGpVpy91QtAiU3KdZ/yoDfPiKlivex8SkWzkWBrsk8Wls3jBjaiLEtZpe4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXue01SxluJ14ToAD2LTE0LxdkrmKgBbqrrI4H1w0sqertELfY
	so2gVYhalF9W8+GbwUGHiE75GcwK3Q7SULmgiCqxoCYbq4aFrwfYb+0MMgYWwg7ljs3YgJ2ZpRo
	4zZ3DmeFQPvSqkDHxiE3kAROf4RF0sNOMBjiv0TehP9vSO+r/FrOMNyll35bqc78lbvQ=
X-Gm-Gg: ASbGnctvcRQ9e7t5Rm8Id9ThEvaA1a9/cQDMYtAH490lnWZ/8R1Kt9InO2DXubx+HZW
	tyyxgFWsrCgZHkDFcCXRImRPOm4ECFXneoUaWeeePfQmHfjGe+JYcCqxLFL543dgX/AMZI7d5jz
	ua4ZGUbjBaSejGSa/o0h9tcOlpA48yqSVhgRoE9k6/KywWmxsfxt8JEtmNVDB+R5woCr5wHPrFI
	bHgacwiCZAUIkb28ilB+BMOYhFKXpvRI8dkZ1ucvHAvMuHMynY8zfB8vbKEuLoOUvR0AMBK+5aj
	WVcHaVCVZl8GFD+H/Hr+icQIu+p5EFG5qVTeSZbrvR9BsrBWdnGMSRx3kwO4M5r1Iw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1101106d6.5.1747323701170;
        Thu, 15 May 2025 08:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3C7W2ioUB8m6KAq++Aglw4cWZcPp6NjrXNXBkMScIXWVKR+28o/8L6hATFVney/nMPPQLlw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1100906d6.5.1747323700776;
        Thu, 15 May 2025 08:41:40 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502ec0sm15772a12.31.2025.05.15.08.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:41:40 -0700 (PDT)
Message-ID: <12bdd004-c2f5-4246-b103-f94d239e9f91@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] clk: qcom: camcc-sm8650: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfXy25Oy87zsJ5j
 t2GBaXEhrAeLn+EQFpSuLwInlQg2NEbH8UC8GwbGX1dY+wV4V+PHNaY7nbX54T/7A5MqQ3FSRlX
 ibpV3rDzC0W7NUpcFaeT00WjSMsVPDdp+t99DWrU4wSfqWdW+Gf0/4TrhpOiR/M92DzH8Zabc/k
 enJJ7X1VqASR9Co+W0F6lTtapJzZR+NMtkSkA1ZKW0h8KaPcnAoyJAwmEyLjoh/5DxIk+w2yxiD
 fYChGnIPUiihjhJadzyS3dBsWccD8pn7QfbHJHwW5Ir2goXwCOv18jnIws1FasgpZ6GMyzuVLEU
 yuc7L+3wbDUNPIQgzFPB9mxt1I8J4lPAc1pGDdrMOno5eazZ+4oz2HDIltkgXJTkmE142jW2feV
 z7X0LlRFv8fjq2Edbt6abdOQSawtBKb4QmjmCvXFp3SvGzxHkaPNYaL2MIsZwzb2Lw8SDYRc
X-Proofpoint-ORIG-GUID: xihlP_D0p0f9LsRfQrGozHEbDHTU91wF
X-Proofpoint-GUID: xihlP_D0p0f9LsRfQrGozHEbDHTU91wF
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260b3b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R-MJ-YjwOO2PQHfhffwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
