Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA427C863
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770669; cv=none; b=tKZuqGpUG5VKGofuS8TYaTzitzmCaRw11h5lhhXPerjca/Ubo21pNOIm+3M0LcV+Bt1lmRoKWzPQ51NODwATn9On9rkchnFLRPoGsuMZa6NcOChjdCnQTRUT1LBba4thBOUp67uFQhSBX3EQsGpYpVyta0Vc8YncWQr+AadaZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770669; c=relaxed/simple;
	bh=OQuO2MX2mV1qr8a9I8/izutKfXng/fSywHuJ73ey4iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQyqnoq4Pw7TqnPnqEy2JsGRnvXg0jbOfE8B0XBbmnHNQlSxUn9h7WHVL/RHAH6tCUFdsMSPO2m41Umd0U3sLNMkUBHI1v3NxrQi4yWPTlx2H5dcpHW//6OHL5ShglQiznD9yCcP1Y8r7icZ8/RHAbMX95Vos4nzTLtFjdW4ASQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkiTnEhC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkiTnEhC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0qo000730
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pc28nC9P0XjjUTuMWViHDCd7
	YDNUjNlX8fYiEK3QnUs=; b=PkiTnEhC3vWKHZ/T+7gfZwGXnYi23ge2NdrGCBls
	fScnV3ydcL4y230s1Y8yYJTEMJwfCK8cBzGBLMAcEls1kUsIlRhq7pi+nZzR+Lh1
	KGMhuNE9mfxeWEiHnUtkcD57feeb2djjv0e5osHeFwmKvT3H0ADfsTcBi5Wb4TAA
	rwdtnjr/butNRok0fpg6d0XqijeJLQLH5tDrhw5m3b53S51PRqm8u4f4akgyUT3J
	L2JudnKy1Kb91vrZkB1I/kqjk7f5IeUHT194h1KPAtSpXi5ZZ/dft+KGuQMl+dF7
	2Wltg6uMsKpbl0Qgb74x84pebmMAjbSLLE6sgpynVo45zg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rf7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:51:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8ae3c3d80so100356316d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770666; x=1748375466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc28nC9P0XjjUTuMWViHDCd7YDNUjNlX8fYiEK3QnUs=;
        b=SXnoHfJIwsDLm3oCXXsR0BtnA4EdViT6bW2dodYXAzMrS0SVTNeuacIYv46FeODpuo
         HuRi8rr5hlvlRqX7w3OzuYCevAl4cpgJsUYay39rCBYKxfuuh/dlHueOqyJi+CLwIVxr
         4QtdNzmm1NEolMFEJ2WfAV81rNTOTOTuzwEmYvZCuJArpcQiLmZz1TQNr5qDX50o6wr0
         HVXHjO3QC3K4wHtPeMLnTJxkPNAv6NvreThoupwX7Z+OsJd9h/eQEBvZfsYK5nwRxdp5
         +KFiBYOGNQLM5QFvje/Y7ORT+i6mRPXFNaiD8tDg44eu2VdMIlk2VAMh6cv5JCsDt9Ro
         pSMw==
X-Forwarded-Encrypted: i=1; AJvYcCU3MxiG330iPfFNgA0lWXoKcVBIkvHZJv6Ol5ZsDkXmz1Pq3ktSgO+BDheAhckZocuCbZcMR2Qz+gFjYUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+VwI9gkIcBJNY9Z1SSMrEIVEMr3aSJ6sE+8ogV3FdWz6gkMl
	cG7UJir+Trk31D24G7e0EXO52x4APU04jw43AWkrHtQlHcn8iQAM1BEg3IDEZ7MiXq8BPzTMKyw
	Ypsjj3tTCZBwV05aTbPEafxTi2Fulvpyw0BlOgwjCCBhPpZ26J5Trvt5VzwG9ayFxiiE=
X-Gm-Gg: ASbGnctDvDAC3D9c5vt7mPA6/rRQoxKSF2hsIjTkBa8+DIzpBvSRqT3rYeZ0lyCTN/B
	i0FndfPFtm6MYQihvrpz777x6xnG3c/E8gZ40Vfp708uIHyGSjRd+BL0b9GHRlmva1csFpQDcGh
	JQjMC/5lzBlEoZQeZtYOrxRYDHi7fc58DXvWdqA4FU06UZvy9SlcM/cb0GQu1BNuxGzP1LsqZDZ
	oeHVo5Rl9WL906CG05ie7XFgu/6BcOrH7z7DS80mrLd1CaHbyXGh8mf9Y2RJV0JT3KsDgu5AXY1
	1E/0w6XMeROQB3Gcuwpc3jpIjjCH0mxXonjYXLj8qzJB/UbxNeQ6xoPW/zLnO1qktFykg2GxZ3Q
	=
X-Received: by 2002:ad4:4ea6:0:b0:6e8:9866:7398 with SMTP id 6a1803df08f44-6f8b0827d98mr304389506d6.22.1747770665767;
        Tue, 20 May 2025 12:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAlrRavO8GE8YIpqqEJZw92ZUYhqQUxS+53ugRsRkVied/hyGm7s6YLVBT/5Wgbq9F8FR9Ag==
X-Received: by 2002:ad4:4ea6:0:b0:6e8:9866:7398 with SMTP id 6a1803df08f44-6f8b0827d98mr304389056d6.22.1747770665301;
        Tue, 20 May 2025 12:51:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3289f29953bsm19216051fa.86.2025.05.20.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:51:04 -0700 (PDT)
Date: Tue, 20 May 2025 22:51:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: vincent.knecht@mailoo.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] media: qcom: camss: Add support for MSM8939
Message-ID: <wc45nu55l7venjmz7mllvxofd2j2ymmj35efefrejaupnyf5xy@27k6glye4n52>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
X-Proofpoint-GUID: 3Qg8i-ybF7jb9D7cGiWs4hsVfrEJE5Mp
X-Proofpoint-ORIG-GUID: 3Qg8i-ybF7jb9D7cGiWs4hsVfrEJE5Mp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX6mYKtQm6xgUY
 a43Kaa5zRB0CNSCQce+/DtA0isdIu5EFeYwemTTbWUE/zhcD6yr0hM9V/TuvmQa4u+j0OZqFpW4
 mO8vPapzKHFlHfG4/l+qikcFHdG8+bKn2wJ1GDUVMykVPJLhc5HCNSgZsceXme4dwZaZPDcMNKn
 2tXlrIdXXQhc3Lx0gq2f/tj3qn2VcLgvPNz34kQ1ETzb+BIpUoqE4X32MeatiYpKJMt7nIkCK1y
 0KKX6KhkqfdhwUhtpu/U3xY01Gx9iYzmEXg2U0IwQgEu+UYwz0QA2Bqkq43lTAquvCGiTB3OfGw
 Fllov1QkNrnwEyRhat9dIw3gyzqWQv2CoSsBdkN/ugwsBYRXjcTPsCJyBO/oHf2++fwMnQ65ADO
 rftu7xuhEgNgMt+7bghq0pAHe/QiLpuv3lOvhtHvplJjO3tKKul/TRnbOpUwC4NapSH6CDc8
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682cdd2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=I8k2uAQB9J5w4mxu1W4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200160

On Tue, May 20, 2025 at 08:39:07PM +0200, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>  drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>  drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  11 ++
>  drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   7 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
>  drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  7 files changed, 184 insertions(+), 2 deletions(-)
> 
> @@ -742,6 +744,15 @@ static void vfe_set_qos(struct vfe_device *vfe)
>  	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
>  	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
>  	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
> +
> +	/* SoC-specific VBIF settings */
> +	if (vfe->res->has_vbif) {
> +		ret = vfe_vbif_apply_settings(vfe);
> +		if (ret < 0)
> +			dev_err_ratelimited(vfe->camss->dev,
> +					    "VFE: VBIF error %d\n",
> +					    ret);
> +	}
>  }

This chunk should probably go to the previous patch.

>  
>  static void vfe_set_ds(struct vfe_device *vfe)

-- 
With best wishes
Dmitry
