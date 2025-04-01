Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC66520C03F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525234; cv=none; b=Sk615vgL7/aCkV71R84yfmpF3ik37i6gLhlwWE7p5CT8gudcsqheJ1GHa5uanaMKHHa+67VAyS8fjYLDClBEDy3Z5BtDtkEjJJMhlu3JiCH+LEGKfQ+zN8mPFO+JT48PFAMSMMlhPWJ0QAQpy7tIuUUfzzUSS8YWgobATNbnrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525234; c=relaxed/simple;
	bh=M9Pbj3w+PfosHL3d5ziPoL/UrIYCJ5YGd0n78EmfXyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CudRRTS8dHuPS3abhu1n8u9ZVt+BCe5zE6C91sDQRw+ayi2z/g34IpvEwawTfFdfYZb2K51yJqvQYrtYvvL0tkCnIsvXYN59YNBD+inqrXk0gCSYP1Cs7GomjaffZ0ikNmgWkRDl4N9fEKlPG/5QV4cI+nUtzfJ9MP8EurglSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igExcAsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igExcAsn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531C4WiH014253
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 16:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdH5ImqLsAfzw0rN+DyjtJIQgSEvd6hICuNkLGBItwY=; b=igExcAsnkCz+EENS
	n+r3cHHD7H9QT+jWp06limHSJswkuTXBnJWp45rP2PZWrNJQZZVhhbAYl4kDCEwf
	d32x7tcAVzz+v/7d3bi3PZE2BabUMywXAZJPUOwLqWje7uTy/D/svWats74TMjTz
	Sg5+7Xh+3IS0LmREbfAqLTA8T3jHNWam2Trw6DJ2wqjnArLs4wYFTxsX6Y1PePZR
	BzYutlN87FomnzkxNYcYc53gHpJITQA5ZpnEYleMV1cskF7IkvAzoV3ul9glbFjS
	9SBomIeWxwwW8lD/noKeNNrPnov6YP6pxrkJS/pp07Ju0boUHnMvqpwcRJa3IuXf
	/sAiCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvgntx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:33:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so29602785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525230; x=1744130030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdH5ImqLsAfzw0rN+DyjtJIQgSEvd6hICuNkLGBItwY=;
        b=FLByBWJ6e9Ydc+SSRZ/FCY74KP7N/URFixNh5fGQCDSJjNLBPcb7ZB15xDrMNsKVm1
         Xm0Dkcd8uX4Vm0fiMhIyFwQo1P+R0xDl66B3YbQVEJJHKT3Gj8zOnhbuh3OEIDMJ15t0
         VQXOqCpDVy1e5Kt5z6HfEWZrYCHzgsXW45cDQ7cu8VnhhI1tB55S38kWa7XZXzVCRH2R
         hKZmUtSXdgdZBIzJ+k88TqC+mIJvoZMs3B01bz0SCkF+L0NYK9AWGBsgEP85xu8sGO/4
         pQQFI80jh0FoGNARqSJZ9haJOJna8Q8yW4WAts6Sa/6g3u7Bb8T9qfGoMW4nPg9Kb+xJ
         5ufA==
X-Forwarded-Encrypted: i=1; AJvYcCVFLkakqT9SZWmTRoX4w4a01MsGXIAQFoJhwh3ivb31WbnEGcKVLa34A469keI4d1EA+33+8H2C8m/rU/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwvhDLLHYrnCPUQ++sirCxVV3NGWpxZ5k2a5JN6chCrL3H8De
	LiOQuBDMuohQCY2XFpo4PLWbNG2mI2jw26V/WOowMaRupk9eaTA70ZEI220/X1dJG5lXZUOPh/4
	0Eroo0SEZmiSE8DNANPS19mJECnM0Is4meVMweArOM9+6k1DFm7GuFv46E/EPGpg=
X-Gm-Gg: ASbGncv3Nft61QxbD1IcMLhxijN6R0QLeMR3u5oOmhMwnIHSx2YDipfzpi6EUIhPF3V
	WuYrphN5Y5aXdH7xOg/A+rIV/dSphoOQ+c9YVLKJ8coJPajQZtJ9ui+cMT8iLfuVmrcWpF8YvrX
	28yoSVCQ65d9+MWDxk4L9cKwneQIfWcXAx2F6+etYMBQ8sPBwmByz42Wm4sIZLQzMcecFVWlFj/
	+HNYAOUv8J5gVGOVED/DW7spVEtLkgCRrL8y7Sy3K4UmssGGjBL5H3sjL14Z6c/jg4bqzGo2KSk
	MThrx8WFJjKsWahrfAidJqCRNeahaD7dMkO14QEqApdiGwnfrMEwW/Gb1XWCI1e/2ubT0Q==
X-Received: by 2002:a05:620a:248f:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7c75cbc08bcmr142818985a.11.1743525230598;
        Tue, 01 Apr 2025 09:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8gYIudImK0VRmpucB5H3+jOQkQkQDY3SIRjp3Zb82Fo8Z11SPAmLmugt5+xJrqRVHr2iRLA==
X-Received: by 2002:a05:620a:248f:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7c75cbc08bcmr142814885a.11.1743525229514;
        Tue, 01 Apr 2025 09:33:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fdc6sm779778566b.127.2025.04.01.09.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:33:48 -0700 (PDT)
Message-ID: <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:33:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ec1570 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8 a=ESNO-uGJ9VKVP_wUy7oA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: pj_TwrBWX286oe_isfZzpcOCpRBr1HoG
X-Proofpoint-GUID: pj_TwrBWX286oe_isfZzpcOCpRBr1HoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010102

On 3/24/25 9:41 AM, Luca Weiss wrote:
> Add a node for the videocc found on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>  			};
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm6350-videocc";
> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>;
> +			clock-names = "iface",
> +				      "bi_tcxo",
> +				      "sleep_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};

You'll probably want to hook up some additional power domains here, see

https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com/

Konrad
