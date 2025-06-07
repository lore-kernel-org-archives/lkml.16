Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A694E20FA98
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 20:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327093; cv=none; b=rKyVZGecbpX+kxbznMDyH3eO35JgDZoMIspJuHr60MsF4fEHS34v9KDXdvbckRH/aWIQ5sRCzYbvtPlJqB+f1uZ5D53B6VNxe9hyCEZEy1NeCDgUKgMzhl/rJqXx5+3j6C1/CQG1GEvM9aZoGB1cil57FxT0bl3l1O/CLFqWzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327093; c=relaxed/simple;
	bh=QVWBlggtwXPRmOBYb+OrVaPcduin6bVHx32gC3Lt9wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9YxtKFY3H8RK5DPSL0K+FYcVfK+jjabN9O/XAHkVKYXO06ZBrJc0TOJqo2CdK2JMUQCmXMDFJ5WvhA96+rggZ/a6i58HBtOwSDKhnY1YmV/8Z4HiGA943kmbiQk7iFJEeJkfw8hJMpC5dwpoU59iSUM7Yq9aFcBx07oCFu6oKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiLmEOCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiLmEOCm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557Ix9dA025626
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 20:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XYyaI0FB+UTRojumzU3j18br
	P22Fad9SfaLy766ifSo=; b=aiLmEOCmVGDPKjvXK+/1dU5cgp8O05uABTCqjmCr
	iN3xVVrMQXKDweoHyj+5MJWQZb0fXhfvHhQR1zUg+o5zBI8N2e7ux48AtKrsXMjx
	FVnPNjXMLdnfM2v3el/IjTA3i+kqMwZU6XqSX7dgfeYkl/psWg9lC+AI3IVrKTM6
	94U6E2K5dNjf5UaZ6OhyuzwFUZh39puxtImAFyEfrDtNF81kuACTe/s3wNtRG+ZK
	ru1VF6EvfEe+rNkEPueODeM5s/vOoH+NjlXT69DJF9rSpIG6RiF3XIG4uFM+SQZP
	0XlMO34Q1DYqpdg96aIx+pMDEOF38/a2BSw8Ddh46Ca1CQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9h03w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 20:11:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so753445185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327089; x=1749931889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYyaI0FB+UTRojumzU3j18brP22Fad9SfaLy766ifSo=;
        b=Hp2FhgWMlUfzV7DZ2BqUfmhk98PAgcAwngWm/tvdjxqo44zZbQAQtwDFGdgii0yX6l
         1iBE64/Efd5Sxl1tBzLX1ZltapavFlqwbkLiZyka+jtP9y4N2Juv7EAT173Wd1O5tx+q
         qe5ohqF0xx4oLJVOyJNSUSxkHZot0KOxn362XI/6YaaucUqDGK5CiYN4ozUx9jZhYaDi
         OzAuXOuruDO6BYv+Pr+3hqH58T2JTft+666x3k8p31aQscsqyKwGKKUjdJ1jQAwwAG7u
         nm2UYqjEz/0+zOHWiW+RXLOdIvBUjwaP9Cr6/Op1+KXV4pXFCNEBvBFp7FjfGEZOknRj
         A+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF9frvvDV7eb+OiLcLaPZnNSPy5RfvfcepqhC9/fIclHB1MKRKQuDAp/w2CzSFMrzGVPu0b3kK/R+ocFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwQuz7XNUZYd6Gdpf9lIseR5O7B4fQwwrz3D61wf9HgZ3GZKD
	qkn4wxAsurk8766PluZEkn2ch+AgKpPQPHtkvxGTncEAvHOzNa1gleLJtPe/omKD0EQrcu8nGrZ
	rgFGe0LjzE4bgHDKim8G2bbaJZp4EJrpLUAvQwj6Qua97rqQXWMV6BGjeb3XASORDikI=
X-Gm-Gg: ASbGnctlsT2widdbZYMQphuIGVnJ9Pp/bWlOnxjX3m0N489l3DDj61lzxI/GLpyI+FZ
	qPvvqFsI1aJ5u4E3aRmmEgpvH+n43DwlIGynwHMxhslmMYle8ksZpFVO9NkmS25aC/hyu8U2vUD
	FGiQd2F9ZHGzwV1tUH9I874ilCIb7QEJeT0vP3XaxipcBxSQgACo1qt1IUHQ0dirrxBgaDyhuEa
	U7JbN2nkDw9lTh154LHE1nuvmDktiAHfbzrIgzcWo4ijSDtsjsAVQwwHoecUpL8Mqqn5lO3803P
	ux8vtF2cglsVmdi6KPaBF4RIz+NdekEknp/J31sgoMQEuJB5EPa09Hx0A1f4jaPUjtlIHcesM3w
	=
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d229896449mr1172214285a.31.1749327089176;
        Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4olC6W9osviXHPQUeq/X1/7+Ru45fu+N79/NuD7ijwXEkSq5aoqXEsc9qfndAHioC3BiSg==
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d229896449mr1172211185a.31.1749327088811;
        Sat, 07 Jun 2025 13:11:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1ccdd53sm5543701fa.88.2025.06.07.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:11:27 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
Message-ID: <hpnrky4frqjr2a4rdinbsizm3mwdognx2qmx76u7k6g5ocgeab@4vtgu5qqsquv>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=68449cf1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ei04IxUCSHfnpyqhzYsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: npbdwBQw9F53ioG0WDbkZP0rLGsSr82K
X-Proofpoint-ORIG-GUID: npbdwBQw9F53ioG0WDbkZP0rLGsSr82K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX/k1XHhYHH2Hq
 y3OCCnvMFc7zMD13rZFtZze3tx+dU0yO/V1cLhNl/EFmZcGldRaOKtWI94GSmUMTfa+sdCtoVU0
 hnM7/6I53/rNsYC+xbx1mRMy1zG8ztGR3LzW3yH+2heF/xZZsZoLwPIcMqQ0h1bBypK6t6ijXcS
 BQYl4rQSoKufsX/nqh80IwaOL56aF7vHlv3FuH4zhlanMWhVacf8TsfTF7tnPmGiaP8Oxrabza8
 WRYMRKcsUwlkswxZakSHnEuwNyFwD44sc4IP1nk92/hKUiavoMju4mmjHAy0Bt2CUs4ow4b8Lqk
 jbyedKxKqWuUwHgsaCDUYSprodYviUuWWN9gG54+ol1t+6/zXcBIpk+KEZLmHAcW1OlDR2OPsfT
 yxYNWu6DoMTkgboOlcSLnVzIDlShSGbPxxuPbFVOmJdlzVm1TMx7SV7xXnWfR+DDMF/CQUcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=792 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147

On Sat, Jun 07, 2025 at 07:44:59PM +0530, Akhil P Oommen wrote:
> In order to enable GPU support in Snapdragon X1P42100
> (8 CPU core version), enable X1P42100 GPUCC driver as a module.

... it is used on Asus Zenbook A14 and other similar laptops.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
>  CONFIG_CLK_X1E80100_GPUCC=m
> +CONFIG_CLK_X1P42100_GPUCC=m
>  CONFIG_CLK_X1E80100_TCSRCC=y
>  CONFIG_CLK_QCM2290_GPUCC=m
>  CONFIG_QCOM_A53PLL=y
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
