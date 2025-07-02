Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27021E1DE0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461156; cv=none; b=ogkv2aWqIEDVpnFw6bmhlLJdQIMi2gsI9seZYJ5P4VByQf6PkWnl5aulooQbSvt0959sM3ejbS/fc4omizCrfAMYygUxEEdgW5TywIbGHUcpJhuOfap1OEBC/u8a+Q8olnakSLp5Yx34/0X13KDKdeAdER+qqUE5IzLepLXl2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461156; c=relaxed/simple;
	bh=7a3eTrGr9XfRQUpiwBbwOSAQkr2uzzC+oxMaTb753jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX2DEdCVZd/5g3oa+uBxqqvLFdil8VTNP8knGqFTFhftG+TOBPjXOKUrEchozPHEOviC8RBtszWkRf3eBL/11PjzUyeXZuAYlaSMz4WSQMEVce4gygfu2hfiBC4Lm6NLniXdMbRm6WA9aFE04H6INAfHNBmJkIq3eCkpTzTuNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdepuzD0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdepuzD0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5629vgar020843
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 12:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsKpkDLAMavfVkGA4EX5ge2UPkqSdTkl1bx/vsyr4qs=; b=CdepuzD0byKoJmDV
	pl2GibA1mRSngF9CVs3fau2Pt4xbGnNo2fip5ojgp5OQ61e6WJttPFYiT59O2dzX
	wGLgMKBmTOHNtrp0ERosgG6qtCcXkgKYYscesGp8KZSyJlY3get3/1pDz4f1ccOC
	28mn6ltYHS5XiIVZfrd5oK256FzNC8T9qg+tvuWtnRuQEk2EBmO3odabv603gOYw
	b0yhUFwh57ylupC0IaGZ+vtraY6SJWPV2XQCErHqNzXviwjYZz22pSILm6mGF7hM
	lni3Y5S7A5j7H0bAtR556aYGCzEjqEmQ1tp1IhvPuJcMnAAL9SnTb6w1WhcXLku/
	NBmuyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn3brt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:59:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so176515085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461152; x=1752065952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsKpkDLAMavfVkGA4EX5ge2UPkqSdTkl1bx/vsyr4qs=;
        b=p+9pEXh1rIiY5DcEDNPGPGHlssbz5MoVqE4QQwBCwlQttV6EntJnP15JNYfvLCpGbO
         UZVT0Ov5tmzd0JWZcSCP7cN5/SIfHS/Dn8R8vTw0zUCLFjOv/3tTzQomzJKiyddON3gg
         d0uQMmFZaxI6n+0gkf6Q1vGb7hIMWpEsqRCZrGbdT1xeAKsNrH+r9hdZ4zS37ahaWRBD
         Cx5JL3o+IenHrN4g9YlF4ddnonwV/HxokFM9B8jkmHtmV7lvmUeNbt2KqsgjdbZL/Mkk
         SMINTpetWpn/JHnJynBK9ijURyuOa2ivdnj9G/f7Mt2Rtkjn7VS2zSDADjzZjmlOJAZc
         ivBw==
X-Forwarded-Encrypted: i=1; AJvYcCXi3RB4BIUIFWxlXooo6vq/wQg/yvoEa1QZZppKQ0qU7JAWopYuVQqktCcUwa+Zx7X/4czc+Xc29dISt10=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJggTrCLYO8WSdijbLQuCL9A3XXlP7Ac8jfSppst+vhhIpRnV
	d4hsA3gNyVijwXhoktjIYUcJkVpLg8HXjUSN6enBhlmV7axWgaZMd1cqtknNofsViocyq04dWZa
	5N2r8bMOoUFFV8WSUltW8frNJsaxsWDVaZjO090avaKJSxnrbRYYQLZkoGC99Txv42sQyTiEbm5
	c=
X-Gm-Gg: ASbGnctGxs3w1ZXpCRkTxnrSJuJ1LSHIbplcvvAB7KSf9YTp1ndS9ADqLGSVkTyhBcN
	GUzLBg0JLAPDhB6Rx2kzu1Yvxy2JTQ0ShKcBH6DKMXAC+au6/puCAHdVpih2f2OzKW4UPQsO6GR
	8MGy+7vmFNECelnTS2tbz4gEAoQ3Yxsl+fRUlZG25kAZHs7KrsOMpenx+JybqoHYsW8iYWHgspP
	gcLdL2i3D1KSwtuHDO2parVUoHIFRaf0UtYXmCr9TAxv8KsCx5PjZGMKjx7PA9BfD3l/LglLFJ6
	2e7NthKDQ6sUK/9RZAkMV4a5PJcIOTcHPK3+WZQzrQShAjX+M9wrcVtQNGm/wMthnznyj/zXntl
	M6ZA=
X-Received: by 2002:a05:620a:27d3:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d5c47c0546mr131566685a.15.1751461152334;
        Wed, 02 Jul 2025 05:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsX/0Bu7XtnAsaaKViVrxiXzcVHQFpim64YsBpD1vejdKhImPsxlIZwN+Qtm3R+kpBL59M9Q==
X-Received: by 2002:a05:620a:27d3:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d5c47c0546mr131565385a.15.1751461151853;
        Wed, 02 Jul 2025 05:59:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bb5csm1067844166b.112.2025.07.02.05.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:59:11 -0700 (PDT)
Message-ID: <96073931-644c-4d77-9c61-45ec65adf928@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 14:59:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNSBTYWx0ZWRfX9Smrkgy50pfU
 6sMcWoZAmwe7EnEbALoQhvlFImBoafqFyGeLxYRd++4fxVHBek70N88AiPHqoZsgjD4W7QvlDvO
 Z+F7dnD/TT3w4g6CpK84WLRhyGXtRxCGpenQdrIoI4lvsTVxTSxj2WguulNATwYdmrhtVjuWgox
 7sOe4xWIZYpJ5Sejk7shq+z6yADTRPoDVdLSAwNlqc1imac9OatD/ESeArD/7pVFy5oRRQX6dgM
 fM7khCpPyl7OqkqhfZbm4fAiJuKJMhBdtmjYr3vKW6lq2aYE4l1CsaiyX9k4bHhqjXvYi4GuGd/
 yKYeLikUils82HEg3CudSJAAFopj6bccdJujoKkG1S7N6JSdWdWhl0RPkCJa6qlW1HixZQzjrBX
 DGK/bTcrdXazILzxg0KWXnP1UAPUnrIFBe6WtBmrUOdtKd9hTewPCQLqXHRM011+3lQBDipl
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68652d21 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: f7LHCD3_VvV5C5iW3D1NrGTlTLgjKPOn
X-Proofpoint-GUID: f7LHCD3_VvV5C5iW3D1NrGTlTLgjKPOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=869 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020105

On 7/2/25 12:17 PM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is approximately 32KB but only initial
> 4KB is accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
> +			reg = <0 0x08600000 0 0x7fff>;
> +			ranges = <0 0 0x08600000 0x7fff>;

I firmly believe there's an off-by-one in the docs and there
isn't an odd number of bytes reserved in the hw

Konrad
