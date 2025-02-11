Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C691B85FD
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280683; cv=none; b=DaKz1T7BuIvQoLxFbdiZ6z8JGF0g5p2NsFZmd6WjGzMhokYd3jBZLxJph9ADIGxUbDVb1pKocZyMu5WeHp8rtW+IUyzbaAcO4BQOoA4mDkKNO4INNZyB/2D2EbFZBUM/s8TRdOVIV5h4BBhBNXcCjO4vYGKCo4cny+I3ZEbjbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280683; c=relaxed/simple;
	bh=RwTJfBaMW2/pa9J/hvPQKduFjwLKJq8rtjLr+5PGP+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwvm8m5oPTV3qF/xoqf8qZdkYdX4HkOCgoe+Rxk5jpeY5L658A+i73fhN+6HYuP0FhC71KTlqDmpX+akSXSNKqjfO4d9s1mlFwxeUkdrH4BMefb1MjuGs66C1kRxSgBxS9Yut7v9CXYKM5fNoMKxAxTk00i2iM+rI5XjUfI8Qig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti7IvCwY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti7IvCwY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAQkGQ026321
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8gfsxl5wjBXJWzy9IZRbAg+/QZ7NlWDPkHV4SG/aR4=; b=Ti7IvCwYBE7joAfU
	J6wsCP1oRWJ77hUTaDlvc6KN+efAAh324fftecNig1lGEE1Uxx59ZNw6/WGILaJD
	Kc4mwBZpC44ijC5bpiUd0okiLfOMOBTwQZbzZ4hWMRri/jOtqLCtOaBiortGMzmW
	fYWA9wuLUqi7WKomIvyDHmsi+NBDwcKgEA3yNS/MIVrxfMHFDdB9xy4JVpL3i748
	ZQ1pLVpVb8J+JcSvXkGsUUGOAH8mT9FbA74O34+JxhsykezZBZw5RnuFxcZY0k6E
	WpSliveD4lJB/8vC4MOXynL4BrSe4jTrNVxtyGu5IejbjRmQoINk4pwkS3vPtojM
	2ocGiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guyvsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:31:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e18596ce32so13925896d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280678; x=1739885478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8gfsxl5wjBXJWzy9IZRbAg+/QZ7NlWDPkHV4SG/aR4=;
        b=rfdCIAe9ksc00y0I0T8AKanXMJje+wNjy9/h9kCOV6tl0PS8EFkuimL7bv0W2SxiYb
         jvwXVCzDLToVvpZXDrjrgP2lkJ/PRpHonc/wGZe3xt4pwd/r32Jr7Ba2kFwM4l8tQ0p4
         PiYeRixkR+xHzCr1RkjUQRwzWwS4oSn/ZEf4Ur7FRAMxunCGDVOpA22iKNETDe8SzXi2
         1orWhk+24K6Cx5yZ2DlMcmGoURc2W8kJyfsdN3A+lg+QR1eLNnRCzLz4yTqlA8RP0uP9
         yD/Kk2bYZGSJZ2cr+18pDUywPs8UYAvLMHprjVay1FO2KFwD8Iy/ZYL0aY1pLbBRwloC
         JfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhcGdbaFXvoiUyG0JoTLa85zKiFuSb6hcnB+ULA7kAjtI4EsApbLou9R6ZOBHu0H0yq6SAmaCHoWq+VwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1iMk2QCMNpB3XUO5BLwMFFEpRgMETJotf7XKPHnMP6K0C1Sg
	wChl4OGH4s9AOQxEG429pevL6Swht0fFVBXxLJgjgOVruX5+sOPvX6Jd1CtDYztgII8LNDwmGcE
	k1+vb1qsc2da6x8v+zQkE0WY4sNgrL2hj2Zqe3UMvpj/Gm7GbSGoRYBYZ3tpDiiQ=
X-Gm-Gg: ASbGncuyXYLPRXyVhnsOjMbHxRRJO30qSrm/mjI6+GfhByG9mr27A6ygzpaywlwcQ/Y
	m9aIcW2PS4UlmWSCOJ5Y6gDbGdhDc584yKlop6sK33kc807C3ojmfPfOEl8fesmzwe+pPd0IxKJ
	Cxa/0WoW+TdWvHCdqvyUdSrjsJ8uplw2Eb8/hdKyXRGwPzkyQm3f23X1RV+UVpc1VerVaYPFUtl
	MW5JjmHMKzu/QQqresQ3dY+YkWFJtMkzLaYqUb+iWwqbtuH155SehMhguQdcotKIzHZ93yp+CaR
	pHgbnVoP0x/iwOAyOaJB2JssyXOO5hgJvBgFZks6eSAqjoetAAyHALXFjFE=
X-Received: by 2002:a05:6214:c65:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6e468dacecamr11866926d6.7.1739280678073;
        Tue, 11 Feb 2025 05:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZpgOADXexGty6sVFgmRdsYA39yzSbEDl4lVKreV5wAGJ5UPSGTJjaEwsdYbIYB6FhRH6giA==
X-Received: by 2002:a05:6214:c65:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6e468dacecamr11866796d6.7.1739280677621;
        Tue, 11 Feb 2025 05:31:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dae77599sm159225066b.30.2025.02.11.05.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:31:17 -0800 (PST)
Message-ID: <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
To: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
        fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux@mainlining.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250203181436.87785-5-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kcjADHDWOWWHaFmgQAvzoUVM0KIYwwwn
X-Proofpoint-GUID: kcjADHDWOWWHaFmgQAvzoUVM0KIYwwwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=974 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110089

On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> Enable the Adreno GPU and configure the Visionox RM692E5 panel.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
> Note:
> Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
> ---
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> index a5cda478bd78..cda317b49d5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> @@ -52,6 +52,8 @@ framebuffer0: framebuffer@e1000000 {
>  			stride = <(1080 * 4)>;
>  			format = "a8r8g8b8";
>  
> +			display = <&panel0>;

This is allowed by bindings but doesn't seem to do anything

> +
>  			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> @@ -757,6 +759,10 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
>  &gpu_zap_shader {
>  	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
>  };
> @@ -823,15 +829,44 @@ &ipa {
>  	status = "okay";
>  };
>  
> -/* MDSS remains disabled until the panel driver is present. */
> +&mdss {
> +	status = "okay";
> +};
> +
>  &mdss_dsi {
>  	vdda-supply = <&vdd_a_dsi_0_1p2>;
> +	status = "okay";
>  
> -	/* Visionox RM692E5 panel */
> +	panel0: panel@0 {

Is there going to be a panel1, too? ;)

Please drop the 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
