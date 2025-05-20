Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7A1A83FB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773348; cv=none; b=WZgnaVowfw42aRm3Sch+fSLf3J8JX8CIV5x7fr/6FxC2ZtiW4jAQ5E5Kl3Eaz6i6eySG/KcCBTiBtng9bXB2wZogrgT+JHNLkLHmYnd+7L4+co+1oQkuNKXTWzkgju5qudm/N5GWFfW6RY67E8EJcFKGYhSp4qeatalJROSQaDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773348; c=relaxed/simple;
	bh=8YtDnrfQwAauwiWArmVD3Eb572CsqEFcBXMUIHo3eZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5pl2s0qy6MIq5umVZpf/F7BsbI8HKB9p4VJpfXBFWo1mISJDLk85Lv1Wh2JduJGtJn/mO2LVrjY9q9GbSVOIr6r8UaRB8NmcOWsJq3Mv8Pf9pY1y7EKL4jyDQQpfJWG+EgCQ/lvXnlxGY07gALF/3j3mr/BxNXHMsgIWAhLuRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gq35RemC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gq35RemC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeKpK002494
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BOzaeAjRPbR4Ral+ZicyhMnS
	y0Qc/MtOAgofjjWMqDA=; b=gq35RemC3vbS1CnqU+i4Bu3TqP5cBB7gJD1VAHpH
	Dp27FBrBJm4gDlJ/3SUBWy9ApWneiysjQvdg2emjPLoy7UVk6pZeSPrw6yeSUKrn
	VZ9TgqcWpLVy3jxsPipVuAz2M5qbazT4F3vVkSAe+SMAnvUzmpPY8SiIWUxMBcwP
	xJfVdNQqiI16rg9MPDXu0J0U8vCM48X6Gz5CF7NvU4VAKfQeIVWJUm6vx/U+bM3x
	OHsxWRKwAvwhChoPrrgfF0QgOIrMUbKGPg1pHM5Am7LbeBJfudBmoLel4qcSEfM/
	HEDxBctVa2MJaxjOaLpyrunxqCPWPnHlmGWEZjJ9bar1YA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0gjjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:35:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so101144626d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773344; x=1748378144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOzaeAjRPbR4Ral+ZicyhMnSy0Qc/MtOAgofjjWMqDA=;
        b=BdzoCsyhe3Q1yUTgYCeLN3C5GlGHyf/z12CnTDYAVgvfdcRefu435qJTfNnqoYl+Oq
         7aF524Da6rovL7mR8wn6I1uDrtfsBRR0BG1kOmS4bsfyWx8cdp9JZbCKAW5idaWjCjLE
         gr/GhdYvvoUoRl9yfCs6sMwkHny3azbqD7jpwRILMGoQ3QqxGbEj1G76CNYHl6zuTD/I
         XrChZ0HC4BOizm3tQ9HdLbmHrQBc7rMY6wEMm8cXIQ9MQa9N8QWLiLBHWo1a+Fks+gPT
         0ig1NWYb01ypIUak2ZXimZujRHfRVvjz6eJOgIPfgsO+U1/mLZtuaiUsle7Z335wB0y1
         MAdA==
X-Forwarded-Encrypted: i=1; AJvYcCUsOW8K9ufsKpQlHpGUZZT2SH/nRXFTXLFbnQQdDXdPrcgkbqJQj3ufH7t+aCJPEi2DIEuUQT/jY/I+mXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ThE5IltwpidBl4Rbnq+aYq76EpI2ihLivIFN/nRfNGUXlD1W
	GbdfPTEneyqOOs+0YmvlmXndtbS/Zd4BvDXBtk8Xw5NkPAQ2lrGaVYjbQSHWjffxdvCnp3n9hPL
	HfLsTaTtLE/uxwk3uPEjgeQH3T7+1FIAcCQLvKpxOYYJuS1qNpz8UA/FH+ZkfDr8xYMg=
X-Gm-Gg: ASbGncuuXMcuMqVQKG4JkNjF0wNGsHl5QutQbcr3uj2idvWVGqS9BUabh/eEj0jrnbR
	8gcsnb6qdNSHj5aq9BAqAB33wj430jLGv8wUR/CtAoqst28vcGCOrajiIYsq3UrNedAGfeEyccF
	oydBoiRR2qR+cE+i8vySYVa6yukVLQLOchIeGt6ASMGTlxqXzH+5K33RIpNwFuxUY3gBQbrJWBU
	jD1EVYm3VQNGvrDa19VLQaSjqCzu0IjaI59ll6TSrIgJ3CvR+PhhJNdFqRbPAMxC89rv1VE4KgJ
	v9Dfi6ZbPT85YMEVhE3Mu9lU8jojEMtqy25rkGOvy6n9J7vw08+FwizKbM9NfWVrGif2tB14cio
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr289469326d6.10.1747773344293;
        Tue, 20 May 2025 13:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAkP639HcUZ1nSxa6ug5u6UZLcMp1VanGG+n7IG1RTAVz+h/i7VJ8/XTm9hA+dno+sXsN6mw==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr289469086d6.10.1747773343935;
        Tue, 20 May 2025 13:35:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e704026esm2482834e87.241.2025.05.20.13.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:35:43 -0700 (PDT)
Date: Tue, 20 May 2025 23:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jens.glathe@oldschoolsolutions.biz,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1p42100: Fix thermal sensor
 configuration
Message-ID: <46jqmeaozwvpcnfxxctyeslcouzhpqshztdl6l6uex37ybtyt4@ghwxqs32dqzs>
References: <20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com>
X-Proofpoint-GUID: nZqXH_ZSYSTH7epI2SAwXPj90QV5FTtz
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682ce7a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=wngnwIPPOuKcIasdbY4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: nZqXH_ZSYSTH7epI2SAwXPj90QV5FTtz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2NyBTYWx0ZWRfX72dCPNYi8kZd
 aTjQNCFC1Rd3p6mEoZTXgRjQ7ymYfGS93yVKc7VUYAxjbcArkVZcFT2xpwoYe/zEzkh5uBwtzL8
 kPDMrBuhRBHGBKmrv0nRg6VazRl8GzsnN5mnXfK/bvRhZTx+QzZfD6iCbvXeeED/BZcBUzf6SPQ
 rHWzMUYZALcsshDoZEpVtzSCpfJ6MQRxqxXH+LrxnrCYEWwwuo+056Y4XWKryjm1ZP+6cRHpySE
 jnUeNkblggM6nRnvDoOMYfcPnClQBejmGEniYKdXtJhNwXxrEGpoc8UXnBwfNm5mSTEvl3Cd+OP
 hBTa69Osp8asUoUm8FS7cVMwgxnD2i6ys8IYzfIxYMob6q8bMyc1L8E0uEMgkYeVeWmKgAX+lQP
 SUqIF6jvk20OSm0oDYfFNggaRIO9krNaDfGoLrv5w55Syl7l+7K8RSQa9oy+LixBD+9zcX8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200167

On Tue, May 20, 2025 at 10:14:46PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The 8-core SKUs of the X1 family have a different sensor configuration.
> Override it to expose what the sensors really measure.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Compile-tested only
> ---
> Changes in v2:
> - Rename trip-point1 to trip-point0 under zones where there's only one
>   of them
> - Pick up t-b
> - Link to v1: https://lore.kernel.org/r/20250520-topic-x1p4_tsens-v1-1-bdadd91b7024@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi |   2 +-
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi | 556 +++++++++++++++++++++++++++++++++
>  2 files changed, 557 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
