Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4194D2580F3
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205138; cv=none; b=gPeZKwgisOz9OjyvwwEsnuhJUgHN/JDEHOStf9Tg/IJX1hVUqjAcXrMmllSkysjfeFnveWknYjffkaY84DKA7WGf32OgAXErQjX5llwj63ceQQ5+XlYCSm4Bv+ubsVKWjyvQJEotJbJRqVbRPpfN+N2za5AdoRXXfedjlNlLM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205138; c=relaxed/simple;
	bh=yjvTFCvLxXIvRl5gg0DCngvMbkd22bwx/SjzjhNxGbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmbZrL8dP0q30yfpFUfojJxTkb+0PVEhfOAB/V96iLh8DM1Dn7ELceSeM38patDCuVgu/8ZzPlOgdO+9aWYQE0vy88oiH9j1ijGywKCi/CAzusqVwp81DcXeE1L18wsC5LSU1zyaqOhBIXX8+TT5E4B5JtWMMRxrE31TW48w9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gH+hBbsr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH+hBbsr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9lLWR004958
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCHUXPT5Jmbjgw9rgNlW8gb3OHlH09svIQMyIII50QM=; b=gH+hBbsrMoJ0EZtr
	8i2tmGkDg5i78VFBr5c7s4xS0HArBGmQZ5On0j7eb55KczTFAI0rXFIu1h8jEy7D
	eu61Omh9hv+m2juT994GxYFqaNRblpSa1k1vbWFxm0cH2QbpkHbO19U0e5r67RCW
	a2vp8t1nr3uABuHc9TVwQszgo11vfz/9UcFND7sJAExK8Brv7Yq3dSvH9Fzn0j7N
	+Pe100+3an7fT3omg76JyVROf9UVs15e9vPfMySrF4PZmQDYh/u2qutk50Ylg4SD
	3optfukyB7cOoZKqGasLI5Qm2sy86HDFiigktd16ijFO1KOiS8/XWpJcu4HFlUCn
	wLzEKg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxmy4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:32:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e448963aafso9486616d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205134; x=1739809934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCHUXPT5Jmbjgw9rgNlW8gb3OHlH09svIQMyIII50QM=;
        b=h/s51bDVA3ECea+LTWCkeszQ2uQYDwZDDB7FBKrHl2rMo/clGDENHZH56yTtzVc/G5
         nxMWvmUEtpOHyyd1CdC/mO7sCIHAynZKLko/47ZX3sJzz20DBc9OPaw44L6pkUvw9h5r
         gndGTo2afu5jgFLSLq9w2rV3QcM5TPUwimBHPa5MC/skHA5xniUYmu8wpbW2Snc4rOnu
         M0MuQC9wCxA4+da8bUjjPsPvQDeIx7DHKE/OwFp7knx10fDkBPGWM3+AKhQMdpueUvZf
         iTNl7V0FQdhZGBeOfvrys9P+6d3IyHCo0L4R+pJMYaD35HQj9B+s35NsFR9JPaf1G+4+
         xrxg==
X-Forwarded-Encrypted: i=1; AJvYcCUZp6mw5h89wL/MKFoXQn1T2KwK3Gh35aXKID9wT1BH4bruirls84e9g3njlXHnzVnWqxEyAJeWVToB8FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8MmElWgZMbTq2hTYoA38DWDefDV8jPBmqfikCz/ZV+rQgF5x
	e2QCMihVJB1h8TZSP0yyHi4zpArhTJlXwZ5pIsLfZgi4khXXo9I9kE+szJdO1UBvTHs3hC6e8/F
	N12DzVZqt2MhRdUmIyE8DiePYvyiAX6LEzkm/L/0D3QZUO/hoP2iG7xjZTyX0FFM=
X-Gm-Gg: ASbGnctPDtmLqLs2e26AyM3jwqexkzI0V7JAOZm9RSSwg9Ogy80/AKrMP1HhheeTBuz
	xylRcjtchEfxvfpD34gM//s26ObbqpZ3BD1AO3LfRtP5g0j2h8K65tcHJMUqHp78FnGfv9wMsOn
	7vD7DgrtPH9tKhA4HpPXaOITSxFdrSNVU0bT8oLLy8gqb7Z9d6K6UjtqE+gTs8Xz5vNN2BDknDD
	faVn/tcQcyZTabBdLrh98tQ61bYwNlU3KVgo1vMXMmZF94DgW93rTQUCCgpTlBf6Ydw5H9ipONa
	2ZYB2ELVQ5ms6h2tmciO4HYayxC9NfCLgf0xeOai7Rkbj3R0R7CVtNLB2x0=
X-Received: by 2002:ac8:5852:0:b0:471:9ad0:9cc2 with SMTP id d75a77b69052e-4719ad09d04mr9899341cf.10.1739205134090;
        Mon, 10 Feb 2025 08:32:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQbeD0Elon8YIvNJ6FOZ4xgWrOhjbb6XFnJ6XLJ3Ft6s4VlucVZP20dQP1lS3ytB3OAZAtQ==
X-Received: by 2002:ac8:5852:0:b0:471:9ad0:9cc2 with SMTP id d75a77b69052e-4719ad09d04mr9899271cf.10.1739205133726;
        Mon, 10 Feb 2025 08:32:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b5d8d4a0sm353484466b.159.2025.02.10.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:32:13 -0800 (PST)
Message-ID: <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IO0LolnsDq7LSgzfFsYCLytyvidmH_EN
X-Proofpoint-ORIG-GUID: IO0LolnsDq7LSgzfFsYCLytyvidmH_EN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100136

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>  
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
> -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> -			interconnect-names = "mdp0-mem";
> +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

w that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
