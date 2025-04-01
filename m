Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26220AF75
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521232; cv=none; b=UJc7GYuGDbRQR4yFwjVpA9Vzijy3DTk67vdvxBNzIg4oF95arjZcvcF8II3T5RK5Tj5dquMECDFIXTvmzwJELJ+IOqrZ5f38jwuxwbUCvOX3jsFFSGSsLq2SN5r71HawGrAHD8rQtBAdbIkEibKuSsDSob5mnlW2c0rR2WM12dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521232; c=relaxed/simple;
	bh=Qgct0ez16hwhs3O2wDOEibGqXsNDr2ST+s/XMe0kZXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upn7c7LshhyMdfwxxVwCFzZdx76AzCC4z6WlM/mVx8vqKSxsNV66AClyz5CjzaOqCb47RtolYsI4VyFNLb7j4wsG7D0nugsRqO6zSvbuHlSVrm3TxRldrR/8hj57vY5ANXQE3e1yCPJuZgO84FpLaDS7S+xj330YRI5B8bt+h3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnl18lK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnl18lK+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531CJrYf024673
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 15:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CESq9DXG+qVF7TbZ7Hqg6qV+YzHe7hj1ycltHpfG4nw=; b=cnl18lK+oaKnNdVW
	XosNMs+ZSFVFjaOjRQ/zUlor/D3o91Lp1Z5h8rpLddNF5LVq6xhnL/lONPihLVod
	t+iPu2lYqAj8e5DEdve5CIFX7e8fV3Rbuh76DI8g63aUgL/Od9bIniGPTMPK+Stz
	YEgUWdyKzb+rG2yrHaKKVVLR8VfIpZZq3sCugsZdMqYE3r2B58Gw/HGa9J++DqcN
	ddzOY+zBZOSqcBFb4croB9zmrmi/MNcDvzosFvgL1SQPDavc0qlzc7T/iRwGvE6H
	OG1B9XU25G4tscxvc0oG75F3+bJ+OYa2CO2JIIXMLFWfEXu0NLr8J+lTW/ktMGGA
	meMRyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86krhuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:27:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso175232785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521229; x=1744126029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CESq9DXG+qVF7TbZ7Hqg6qV+YzHe7hj1ycltHpfG4nw=;
        b=mbugIzTmpAqIje3socTZBFnk8vBmD6gUsDJm0OT6nXF5oW4ryiq6F5e6xQV5jcyyuS
         Un7pGMlw2DWug5inxq8cp4JNT1KTwoEVAAE8wfkV1aNlcze0mfxM6dmU8lSK3Rj2wQJs
         24wlPeKcMUssKJmfwaHsCVu22DC2ggZmzFKsR5QpdoIx4yQIZEudpEbbA7J+BrFFtZz3
         E6jfbgjObwkmWyIa2OqGXtMBuV44Sv2dQ2c6uFysPUgWg2XacUnKv0pU/spL462LAgpp
         FHis3noieAp3pi8ZzcESDiAFUw+10JJkNxtyNoWjik+X98nJmCrLcPgVs5myHCPnN4yA
         nrLw==
X-Forwarded-Encrypted: i=1; AJvYcCXULlaaoEKpuyxnzJ2wihR5CDBm5YqoFSOlDsNSIwKACjBT4ZK2adLYhNkZyreV1gGiclHXoT9MuJoxHYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgpU1Luj0IVP3xuMUieHamENlS3LiWM8v0EKQHvuKPwovvP8K
	V74tdxCAhvOQ4MZZBV6MmuIIVhaRik1hSF/CBf9POCoTbJ+WX2RWF8OPj/tVakD3ZZMSCpDD9v5
	R9eEhIAeMmxl0w9k0CNayTLkxzrPwCCtTlSeQAD25Y28r0ygIMwF/0xfBvZnTumU=
X-Gm-Gg: ASbGncvSdoORuUbxt89ViJVbABr7sSYMfNV1GuazHqL73dvlHsIBVDHEUY2Gizhd7pb
	VSJ3DT3jMV0TdC9ZZ1rdDn5vnalm7VybVnrc0Hat5aDnCJqnr4MdiUqWzpiQrjLLPiq8WM1ChpM
	p1S4o5kzUybWQlCX8+WYxBQ3W7uE4qEFNOLljniqkRM/4HgFt7ms3PvR55TYTAWzS0v/dK0xZ8T
	x0kNHWEv2c8jq6MfJdxRLBJsMImcEKcyNfgHvyFwJ3xJ0+tUedSJsdXjONvW6CB6LQGoK/q2erw
	bJqpmGIwBdw2odjNgesHWjBt6RSYdt3FuixAswRmMbWzmrB217WBcrjB7ZYt1+MHs+P93g==
X-Received: by 2002:a05:620a:2951:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7c69073e0bcmr731864685a.5.1743521229188;
        Tue, 01 Apr 2025 08:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+GaHshC3cNLj1Z7gyYwDLBH9N8bomcJCm0FfDDw16BCmXoUAh+skUHMJ7I5LGOMOMRT6rxg==
X-Received: by 2002:a05:620a:2951:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7c69073e0bcmr731862385a.5.1743521228814;
        Tue, 01 Apr 2025 08:27:08 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719279ceasm786869266b.39.2025.04.01.08.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:27:08 -0700 (PDT)
Message-ID: <12986cda-99eb-4a1b-a97b-544ea01e2dbb@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 17:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: Add MXC power domain to
 videocc node on SM8650
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
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-15-895fafd62627@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-15-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67ec05ce cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ZLyFKkHq2fKehN92aLAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qgva4sO23ZxpEaSchMWUocoSl2vI2i-N
X-Proofpoint-ORIG-GUID: qgva4sO23ZxpEaSchMWUocoSl2vI2i-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=963 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010096

On 3/27/25 10:52 AM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
> node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 818db6ba3b3be99c187512ea4acf2004422f6a18..ad60596b71d25bb0198b26660dc41195a1210a23 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4959,7 +4959,8 @@ videocc: clock-controller@aaf0000 {
>  			reg = <0 0x0aaf0000 0 0x10000>;
>  			clocks = <&bi_tcxo_div2>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;

So all other DTs touched in this series reference low_svs in required-opps

Is that an actual requirement? Otherwise since Commit e3e56c050ab6
("soc: qcom: rpmhpd: Make power_on actually enable the domain") we get the
first nonzero state, which can be something like low_svs_d2

Konrad
