Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF4253347
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017553; cv=none; b=d9uUWv7Ywe8kZsC0rlXEAMBCZylWVXOowsOFCYIp7vmeh+P+m3lzckMar/Ygpu1ifz/STzblyE6zZsZ9tFwDElqAZtnpVu0fY7/e8aytV/aVb/8Pfi0drkFLjAv/WUdsp8JBWrrwYla/XO956SRYum3cyi5QIEUUkwnOtxzsdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017553; c=relaxed/simple;
	bh=hEJgUS8qfyBdIBBy1jMSOghOaaiuoTU40a3fcivZFtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPQsObm4iWxrg3eBHJB9a5U44rEGI2+Bl7Wil8LskCEXELVD4q818gfrTS9513WO/yzoy9aLpdVED7oVJnMeuSJwgO9IkpfuBv9/iK/mwDrEOTP2Zf+/NEwshxhvH04FuESw04pP1+Rz5snV+8WAN9bt839v2IQ0nZsWolgT4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAnD0l4J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAnD0l4J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IFuGG1013115
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V8QJgEdBBmdXG00IRKFSzJ2Q
	lscxaEHZ/g5OcrgAEXw=; b=hAnD0l4JvW6vvYR9/nEtwghNNnBudR/3MMl0Rv/s
	2sKLvJdo5E1i50B3jfKpUXyR8e3BguEcErmZ6xLmH2i3e3TuCw0+OBb35tcOpga6
	jPxc4vBDu3KwOib7IkIwbzh0WeggUVhTIoLVkBB5ngwpO1A/kLDJoSd7qilvqkoO
	EFEF4M1J6zXguFsaODwAXvewCm3Qf1g60AteSI6e3DwQ5syfyPOaDusv0TYN1rJr
	fa1eLuDvI5ghSGV/VfEVljreu4AQlCZ954gssG8q+VM25Faui6CQly6uSpuqlPac
	pQ1Y+p5rPc/0pgbT6/lBjFOihEuPH8jHAn+zRbF6qJe9WA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgju02q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:05:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c94f8f11so21550786d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017543; x=1745622343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8QJgEdBBmdXG00IRKFSzJ2QlscxaEHZ/g5OcrgAEXw=;
        b=p5M//FSL6rz8BQGDOmY26oNs7dKT71DnTVOwOLtkg1gtgbb8Q+BYX3CVXeUkN8Ykxt
         OB/km8HwawfzM3SkM/C5Az6Chy4KQqB409SqZcCkJD9DUVkAEmKLMuUSokKAklvSYdFY
         K3AXuHHrVPu0vgbvGpcHZ+N7QCI6sDoRgk8zjSnIpAyPE31GaK8V6Kw/lndPmOZ48hbT
         IRz0aOyW7GmPXVTOA950uvhurRPE0JWP+wPoCe+9I0ULeVkRwYTOLg1j5LBm5WLwLtYm
         FHsjDwBk3g/lOm3ey43H8Z5tE8u1oTqSZ2YJ2A8LM7QfuQ4s8A87kwzhkovRbrxmhvrW
         e3kA==
X-Forwarded-Encrypted: i=1; AJvYcCWROe3bE+NSP/Zo0VNpLxxfo8phNCxkDHtc13dowSvGbEkmhn56gd4t9fYmOPXAeVrOxK3o14AuMAV4oZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QamTZOfgR0aRSX7fATKLIh6wat7NMHeBUbAAm/yDW9KklzMz
	fNSuZX8gNg/filqM0mB5bh8Dob2MvvBtrI+9UDR71LEtxj0qwEeVRsyNkrfL0r8ehydmrwMcyGy
	oet2M5X2YnRydgOaOOgJ3+H783P7R/7bOJh1k/BcdvEI7ZI9epDZqs+lCyjRlaliKQ5ql/Zw=
X-Gm-Gg: ASbGnctWRRE3YHpVhCOV572ZsD9YqWQ/uey4NtRFrC6S14o6ST95gyvyJtZmBQ6GCjE
	OzUgv4Z4GOfPbHpB3mqVj68hvYlDu0wsX5WygUF+kHxbOFBgEnN9JUz49eY9pcsf2Ye3gVZAK0Q
	+iyCTkx5jNIn/NkWZp69bylZ0Tm01Br8Kb7Y80CYxVT0dIw+2h18cKJ84Mj/SPZA2u23+O1xnEJ
	/uyjhutrJx8suWCHSL7eNTjtXtT1sH25yK9uF84X1HJBt4RSPoQCGpgkaHDBeWue16EsijkfMIT
	blcJOZIjJfDJ4EacEDDF2PlmbEV03NRexZA7y6ipCfr7bDpvYGz/gbAPNh6EFYg8Vah++QaGkiQ
	=
X-Received: by 2002:a05:6214:5185:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6f2c4678a3amr65315756d6.43.1745017543575;
        Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf26KzMLQvj2MKIJpjhCLfMiXPBJMSzk9JeFklWtqtVydsNaw/jNQAzTgwl2B8HD3Bgw+5bQ==
X-Received: by 2002:a05:6214:5185:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6f2c4678a3amr65315506d6.43.1745017543272;
        Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a6736sm3482341fa.51.2025.04.18.16.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:05:42 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:05:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <asfwnyn5grm426vq5qatrxfffv3wmbuzx6266rblanzqepffzx@7773dcxfaqe4>
References: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
X-Proofpoint-GUID: m9FKgJnE26bvtn8R9nfLNomytN8YUtWf
X-Proofpoint-ORIG-GUID: m9FKgJnE26bvtn8R9nfLNomytN8YUtWf
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6802dac9 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=CGpxOeS8x3tCTpWUsd8A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180176

On Fri, Apr 18, 2025 at 03:20:35PM +0200, Neil Armstrong wrote:
> Add DT entries for the sm8650 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> available.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++

I'd say that these are 4 commits.

>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
>  4 files changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -894,6 +894,11 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";

You shouldn't need to specify this, it matches the default one.

> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> @@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
>  	};
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> +	status = "okay";
> +};
> +
>  &lpass_tlmm {
>  	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>  		pins = "gpio21";
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -824,6 +824,11 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  

-- 
With best wishes
Dmitry
