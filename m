Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6C279331
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430207; cv=none; b=GyeJ04EbvdmLqoVX8vm1skMLNsA1zfGs7oy6niy/1x8mugIUBo3wh7YAaKJOseNZ2NGRYHIup+KRzoNDJH+4uG0DVlTDj44qt8ePYDUUV5G8cGOrGq28yOsMieFtqbGg5IaxUI2Zebag1jbo8HtlhpmqTZFnCDrR5wQr7dF8sbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430207; c=relaxed/simple;
	bh=7AD6vqWhqJX0O2x4ThO5Pg+jVQYeZPQYDx4U83BlAh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDe1zQBmndFtCJZ8MngiMUXlergMiAlLn7vzyEczsaZW656hfm/GPlvqEWZGGuTbN7TpK51KjtTUAfW5siATgm24EiD/WwZg2lNMAJGVFfT5OLlmULfY/vRp/Ennw/yZLqAp1UobMoaEXwMiWDjqdcAMhR27cRXSwMtfaJeHxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWTS5g1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWTS5g1/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S3HQNW013944
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O3hxnjE8R2mMI7zZXd74HKiJ
	V55TvIlcyaFBEmbsVko=; b=SWTS5g1/WnnFFprrY0D8j3/H98v3Bi3eAeo5qIm9
	6Y3h/VGX8lhbOTgrePAIp6Wej6ZqKB/y7eIe9FWJPnwuCme3sMLi0po/JRuNe/FQ
	cVLAzkIT+0yHrrL/l2T4IxXm/fTrR2rhcycH/2/lRVy6G905zvOka3zGCQkQTGx8
	vVF6mFAZPrk6K1/2QTCgLd/7W0t8uxaqOhEkcsum53vfy5Q2SttoRKnWHkVqxBjH
	xGqFNw9yh9tJr3dBD1aylKAuaB8NiHvgm6L/kM80umsQdltFco7pRkuZZE4PKZ0/
	Vd5S1wHIAUvzY0E3rFiKYFKdd3BOAjWYRzMvLMJGrJ5HzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549hxjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c793d573b2so787461785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430203; x=1749035003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3hxnjE8R2mMI7zZXd74HKiJV55TvIlcyaFBEmbsVko=;
        b=PioHk+sbvRgjGIibDeevNFXJRNJauy+D1E8rI1bsnkRJD6OuYaevgHwfl8JZcytEYL
         SeNbeRT8AC5xnc+oFxRKoYjwQMYNpS76+/tDztE9jR/HkR35kBbMf+vwrmIEqtf0Dr+l
         xgQzpYYmFq0MDI7FxyAsitOFxhkNX4jl8nViwomdrtxaMNZObA1jiqugsf4GDPVz+7Wu
         vltiJOuEsSCq4qr7qUubnKaLny2qdE2ASwCjrbCBJoq0N4Gd7WhSNTKmqloxRdbCOcdL
         WWcKervxTvnc2LxT4XgXqfFM3zWWDzu6/8Sj0rWUO7CF3gEiPIQtLaBS9A0uHlSLNTy0
         Uhgw==
X-Forwarded-Encrypted: i=1; AJvYcCXHFxPorQCNNzp5HXmh9q3xRCen9ve0AUqhwEEvOch9O4sdsbtUdUioZTjY/4OXWOyzHquty90hv787hfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNyaSDkscBYdw/44TAXRrBRbhQ/6Jpq6Jr2/SRfZfuYa5ZkKf
	NGvZG/NSaTy/coPDk3U6QkD0abBjcNR1UM3pxlw/6dZDYtuF3vO+cTi3AnniNymiSgrtu+1Pk16
	9ERja4hX6mDRYSp2v3bbj4bNSktmEyHMPbxdhPy3RVNmzzy1gf1r9Lyt8Zg416SkLDF8=
X-Gm-Gg: ASbGncsFXDSoNeUKrImNcZMnKP/2veY5MSI9igKR+YtrpMgISor4LhQXpJcmSPurQSo
	R2lW5Wo9LoM8UmKVFii42DsSSAS0KHcas/LJQSLlEUOqkdfjDG9xRrHQX3va9gAmSJNs4Ll8MVM
	8Ap3GiaClhjTOj9PoPP96EYYNmcuQ+Hgj+3dwKYYvOEfVneYz+JBcKrppFWxdLPxiL0K+T3Qa9K
	PPFI/Tm0+uIeKwNDwpC10LFMmFCv4BItTwL5YeIeoPSnq1DT7uoKWchYVGueHZ03rxQIMDSDAOg
	VEIpjA0Y3TXlEnK13fqgPv87GShiGunT3yIzktVbV7GCpT9hZaU/nhyyuOxd0SCzj7/4odouFhE
	=
X-Received: by 2002:a05:620a:2987:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7ceecb6fb2fmr2461803985a.5.1748430203412;
        Wed, 28 May 2025 04:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvMnEOEZ4WQNoRontgIBRNZol/vl733lzBBoIgKYQnnSwGg5aPaK0yeBDFlXxZZsjumy13Hw==
X-Received: by 2002:a05:620a:2987:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7ceecb6fb2fmr2461799285a.5.1748430202950;
        Wed, 28 May 2025 04:03:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a997sm234879e87.142.2025.05.28.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:03:22 -0700 (PDT)
Date: Wed, 28 May 2025 14:03:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Message-ID: <y6ciwgsseaasx7ob5ygihysrt77pnfsttsrbtijhakawfe6w6r@x6mzgmi4bwgc>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-3-b4b7dae072dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ddr_stats_-v4-3-b4b7dae072dc@oss.qualcomm.com>
X-Proofpoint-GUID: 8JQnvdTjXBdf7SAv0e__2bZJ7ISBHpxV
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6836ed7c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fX9Ow7R_rwjDEiK7aGMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NiBTYWx0ZWRfX+GIB7QcgCAHy
 rzwIjRwuNmCsq7endlujLJT5Z4I1Z7GJrojimfb86ivIZ/ld1ssuBVFr2cxb3NqO5hkoTv52tMR
 28mgm47NI0h3JNc05TrkI+pUBblZdFkzie2vfP9CIPMMm3MdIawSVQIpQzWmy+z35GXowNCFHJp
 yq1P/vFvILjpF9ILxYpZe6wLtTitFlcOEPFMJVGAdGr5DMcU7oN1L9Y1nWmDyAEGNlynPO+h7gY
 CSUvKa7ixdxbsTg4saDHhEhNpeAxpyb5rXIQHn1y6X/nRd7E5jVREKxYeMG6tL74j68XYg3imr9
 spnEXNF/jt5TDX6/To2L23uvoKupczZR9DO4IXgpThaXa8GJT7EE3drT3Cp3Hsp68ON+i8dxNsD
 Ll9OnRzp2Q08E2S8x88iNKNjtyDJ6KGdmZifmvHoMlD85PQrioYuGuLXzrWIi6sdPk/BSQWS
X-Proofpoint-ORIG-GUID: 8JQnvdTjXBdf7SAv0e__2bZJ7ISBHpxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=695 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280096

On Wed, May 28, 2025 at 02:51:33PM +0530, Maulik Shah wrote:
> Add QMP handle which is used to send QMP command to always on processor
> to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  4 files changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
