Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BA288D2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223377; cv=none; b=q/pPNWxfne5JA7tEAqVNkpEbrfit5SEG82wWTeWfMiMq6IfKgNdnxw5USnSpeDLe88vIKl1Tq8rr9TJ5lYgI1RV6+2QL1NIgjxmZqJEdTkiyiTQccrDRN9g9Xg8TkaVZMknnwQQuI/ZsGkqPkxBc1FDkxZbhqXtsM5YuuT3EdMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223377; c=relaxed/simple;
	bh=6HD1n8xs7n5w8LD46uLZq9L7Kk07vE8rM1+aHeJvTPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVGd46WUZMOJ3VDmSdP7z5kfJMSMMEZ8UkiAyGDIiVOjcbWupo3JK5q0TsTIW/wOwLu3fge+cIaNVGwPE9kElhTB5dsI/UkAwkvD6fCAN8BTD0f4rxoZNm/a6IxVDLV3tSP1zrdZHSECP26iGke4V6gCTK3Ydow8fxCMGmk2nvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3Iz+LpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3Iz+LpB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMKDSG008977
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=; b=j3Iz+LpB8LorWG4/
	1CRgb50Hdr7BG4LFJAXQcqfgg1+Uj9+RXqkWfEfMwjm6Apr+D8X6NSY0xWaIuiPb
	/8b4y4IATVJqv5A4W1NFSukAznl4+FtXIAf29CGI6SUP8+15uI+PgyGQ/vJlGzTc
	OJC/P7bHBUgYXsXmTkC2GpGB/vr5ToGLBauB5n6BbdB3Fw2TqPrV7e/ha9ILEL1n
	zai/mocynsO2NurF4QT4Cn0FxuUSuYd3QNDdlXDj+Bkzhx+1gn/wTaoigp8VD9EZ
	bkn2lu58n0V5tc2ASxUlKGGAUnFYjV7lMu5pulZzGR+MYYZPmuNf1VZjQpDQ51By
	NTUDIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pbc3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:16:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so455286685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223373; x=1745828173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=;
        b=RqiURWP5jXn6cnEc3GgVWRtumzFRf3uyCXMrOeGFNvx7blMILFB1pOc08P9Kmr45JE
         CsiZZy+Ii/nB/5tFNQ34QQxY0nWUMrJwLHvsdPvk3AKexBLaFcBmEgyaGTxlnGllsOx8
         OEAT16xTmpevKJSLnW23o7hWL0VjE15RCznaYi/4TiPat+++hBAXNnJh5FugHIECix5h
         596koSBqRC7fwnPxQhU1MxKk5vi50bmG5Th+AwTWFCbpBebqEJgKjTGL1vdO24q5sFFl
         N76tSpB6KcbjNlOFuC+DFA6azmcDXDga8VDWHyr37Ax4MePvDJlt7zhfrb60bDbE2KN2
         S0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIviKS+vQsUkXqNTtjVSADVak5Ok76mT6E+NkMW07ZfhkMCwVAdOi4+EU7sPZXawPNk9B4MMstfABdEI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX0kCbcWKlGRkKW96KDPhEVQD2TgkSyLfagcJ3HdFOBVWb5nEG
	yA/W2VzajFg05nkW4d7S/v1HaUe32lyG+veJMmjV8prUz3cDg5tgGCwB3egybQK3pmJ0g6yXtO7
	D5zj8uqw8hSYMiDQVjj0ealIymDFZ+eMFFCUxwlMjnf4Xu0ZwQo11BdB+mlvl1SE=
X-Gm-Gg: ASbGncvl8+wcz2fcE4QVJ5eiQLdZo7s7b+ZMGxPnahd0DHUbI38z9u7VqG54R5a+VLE
	q/Kn2OvQw+EdlQjhT8UUsBrlDbCeznAShG51IAvvN3yXIFPpZP6AO/36na00TD0UkmjQCOhzdlb
	iBwyAN3yVyAXLuADMiqXMScsCQeZnbvlWRK86n/c4j2XPhAhrJieewV8OcmAm1Hw4rIkJccSDjq
	EURsU7WAafuRfVSGuYc1sQcOESNn/fG7c92oC+DTehE8HbrcD7l49LyMJIiJbF2BvwrVPOXGFAy
	PtB2rLL1YwhatZVO2SVSbaXlgn9js8YRUmH+Z1zykvlf1/AUppPdXpKiZBTA+1mOcFkR90i4ml8
	=
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7c928049ca2mr1716047885a.55.1745223372987;
        Mon, 21 Apr 2025 01:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwyE7MQkTDxkTD4bMTdrQVyq0KgcRLomu9pE/oxDMbBAj8GbWGPITnj/B2mJvuVUIGwaJfg==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7c928049ca2mr1716045985a.55.1745223372683;
        Mon, 21 Apr 2025 01:16:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5424b5sm869330e87.95.2025.04.21.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:16:10 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
Message-ID: <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6805fece cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=StrfYul8zGH_qiMLSD8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 3tnGyOUCqQ6KxopuPduvgCWuNfOrjqoG
X-Proofpoint-ORIG-GUID: 3tnGyOUCqQ6KxopuPduvgCWuNfOrjqoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=889 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210063

On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnabás Czémán wrote:
> Sort adreno clocks in alphabetical order.

Why? The order of the clocks here matches the order in which they should
be brought up.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
>  			reg-names = "kgsl_3d0_reg_memory";
>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>  
> -			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
> +			clocks = <&gcc GCC_BIMC_GPU_CLK>,
> +				 <&gcc GCC_OXILI_AON_CLK>,
> +				 <&gcc GCC_OXILI_GFX3D_CLK>,
>  				 <&gcc GCC_OXILI_AHB_CLK>,
>  				 <&gcc GCC_BIMC_GFX_CLK>,
> -				 <&gcc GCC_BIMC_GPU_CLK>,
> -				 <&gcc GCC_OXILI_TIMER_CLK>,
> -				 <&gcc GCC_OXILI_AON_CLK>;
> -			clock-names = "core",
> +				 <&gcc GCC_OXILI_TIMER_CLK>;
> +			clock-names = "alt_mem_iface",
> +				      "alwayson",
> +				      "core",
>  				      "iface",
>  				      "mem_iface",
> -				      "alt_mem_iface",
> -				      "rbbmtimer",
> -				      "alwayson";
> +				      "rbbmtimer";
>  			power-domains = <&gcc OXILI_GX_GDSC>;
>  
>  			iommus = <&gpu_iommu 0>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
