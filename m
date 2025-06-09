Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA3421CC49
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495273; cv=none; b=XKU4B52riZh9UMThzmdHqKuy1SeM2hs/S+nTlzQMrpweHRfDa+M/iltJhlwuBuDl5ZbkV6YV4YhGb9act/lxtTsvc6ZHoDwRhaDD+Nm2DzKnp4fDONcpUJGIZFesMBYhQb+t1rEzNFPQTdoV6l9g/EAgQBad+I3kmZp8WRMYhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495273; c=relaxed/simple;
	bh=E5QR6jQFk4D/Qqx8U6Pj01fxZiyXoVlpz3YAjVjpI+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5nqT+h0XZ6fIvzMI+fATMkADhNysR9KMSAnQP9ErER9VAZYJgdZP9GTQ62lH5sTVH5+DQg82c4ihxM6l++T+ZE3D25/OeKCE058R4lb7AQkepy/rO9nZehfpXJ28Um0NMLAMsOiuAt3JG+ByYprfBBmRoWfw/ShLv/vW22tSkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrs7N1q4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrs7N1q4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994P2C001845
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ol8PDG/DdkJ6brMjCQQkiTgY
	8p3wDi/HNTyGiH3uujY=; b=Xrs7N1q4BL8pGdFZFko+/h5MmbRBA5Cg2qicx7fn
	sNZcVPieF02AA5TGbJlY1kttzTNEM+fqjv/AWrBoqtEaJovLbUixIPEgZUe7azuX
	yYH8engzC3xfiA2iu3gKnRbljmbKXHA2+l2ysESyrMhotjWnjB6Ze7QND/3RrseK
	z0ALHpQCxajEKIPWEuBCivTs+IMK+6YSjcIwFyYUEX/P33u6jW7n6WpH8HMWHTJI
	z7USDKL8uejVZ2S/L6b0V6/baDQxy4plucprQzhtlEZGNmgVV60FvXKd1oaBh2hj
	4TDjfVQk8v0apE42uBRpsIGj4p0BctBSly4drSfg6DFqgQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxqb07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:54:30 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72bc3351885so4582561a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495269; x=1750100069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8PDG/DdkJ6brMjCQQkiTgY8p3wDi/HNTyGiH3uujY=;
        b=Oii0vnRc5LxNTSNIB+oGKgkIAXOmpTLRWtk3SnbpDB8rGWkv2esqrT6W6TN9ac7kXt
         lx+DZa9DGWC0rDLWmVpI4PXPKPcoDicsuAeld15StHN8Cjg2ZD1o+8mMyTPv764dFK8H
         AFIFKA3fjWLyrmQ4bOCTObElW8XziG3m1TGKR67aufxDBzLoaq0v4IJfSihXbk4+K2XG
         J8rE9P/7bZqH7/EmFr1sF3NjZxo7dW68r0pJsksSrVaW5ZnLrbnXRlcPBsIfQ+4hBYhV
         NmB4K+eZpEW5DWhkXT7a/I6RdBTC5u9KibdjuBNSv88u2Pu7AdcZeqyu4v6j9FsJkHtt
         3JCw==
X-Forwarded-Encrypted: i=1; AJvYcCX0EeCSpj1XLuaJ906yn2SWDqr/5/jRDMEbS0MNJS+mBTIXlkzFMKs+mYROQw9jtjrLAFc0zhVXLD3P750=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xJG7GlpuqOLhzxyWw/6kITOVTaFmCjmxzN4x0DEDepVh82BX
	rkrghHacouaZ+FY3N4G70bftO/KH5wIYN2DG+QMIVMgRjFML3DDhNQFUl9eZc2Wu9rFJIrT0erM
	AGz/sH+vIPTe0OAL6m2lXWxme4FOsX5DhDhwAlgk+tJjkd2vOQp+fGSqB5QOQ/j7UkFNbWqS4Gn
	I=
X-Gm-Gg: ASbGncuOHkFa1klKgtcsXhLpe76hYUiCH031p2mobO1oNgTSdHKCfMHNMFYZVq28N9x
	XGGSUKmgp1lrvCUMacrHZw8gVs0n+rIcLF/Mtnh39awX2cLH7z/qygEs7iRScDX5RuCyYZ3pUeR
	awNDcYnHmJgFW/YPnaL46y1K/2VB4IlcQJPlkgLWsqI9xLPiRgXSvN3IhA14IpYtbY/DK8XeHxS
	PJhByi0LspARdxgr/062Sn+ilc3jf0m0UxZtMZccCv0O4qr3nXxVNSylzQSDeI6m0pfbH4Y7D+c
	stuyPoNASH1YLvOyzH/CBEvMuFphHilNpJ+BP2gGOTHm+TRVMZKhR2P72r9fNN+yRyzvoTfoZ7A
	=
X-Received: by 2002:a05:6830:6602:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-73888eba1d6mr9644143a34.17.1749495269684;
        Mon, 09 Jun 2025 11:54:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO2dqN7vYHPlmZV87m41nP8/ZqssxU5L+Yh0s+1ZIu2+sJsllrp9Mz+wf1imIYHMK4S61yLQ==
X-Received: by 2002:a05:620a:2b83:b0:7d3:90ab:814a with SMTP id af79cd13be357-7d390ab8376mr930036185a.24.1749495258901;
        Mon, 09 Jun 2025 11:54:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d0476sm1266162e87.35.2025.06.09.11.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:54:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
Message-ID: <jowyn4tkqy3f7tiqzkp7nw627ddqgzgqms3q4rp5kveiqh3xc7@wzbhbaxxuftc>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: G9UXHxq_O3FIvqPITIITgeKL2Sx60GX7
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68472de6 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: G9UXHxq_O3FIvqPITIITgeKL2Sx60GX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX7PINmpz2dV8u
 WblhY+rXksPRrpNq5S6cOyMW1iql/ryK+gXKbKpjndctPDEDJE5/MpA48ohE8CP85IquvfXlbam
 wDUjfuqp/S25btH3e66eJmalQFZ8maI4qebAq0yoNvNTV7++iIhZxF9gcmNEgtig9h5ysfUvHXO
 WSJLbAB8OgeixdYNGsE8Uh77ZmokZRTag42VVEOHYU6dVNQ26ALQgl0FgNpHZAgd8A+/gIwwJmv
 R6kT7z4yNjdSPb/Z0hGsc0jkk+HPAQwKJMMm+AGysup4D/4v93B0Ja5OZsk1qj9r6SbrMDVYtlS
 ROXl+aPZisiwEXAY6OWJyH7WhmOYOrsbNl6wbeyKNOAoOzrzC/siX7BQDx7xLyBdCc685pgQnuc
 P2Y6k9q2+qLRfjqlcBIC0RkuyUTI3KcAhLs36X8ZeBA+jeK90Hq/ugL3cPK/4WSH/9xzuEvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=704 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090144

On Mon, Jun 09, 2025 at 11:24:37AM -0700, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
