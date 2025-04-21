Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F020FA83
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745224104; cv=none; b=UyLkEKOsvWZ7lLD517O/ljGY8wP6deVD9LfIh2Hag0/UtLpXSz6+HXrvfhLby7XpsWJsJjuFU3dI8u7Lwky7WTFw+Lk5cQ3Z0gA0fNTj3IPrGnmTlweQZT7W1ZCuMQ/zBF8YzA+le7VLyprwEk5z0z/tAzrM9Ub0IGcQ/tDF/4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745224104; c=relaxed/simple;
	bh=/0aNXCwveXnJWr0na5IeH9M0B4BweXSamO+dEbHt+AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj3C8H7q91fO6Z09sF+6PMZ3QoTm+xESK74iu5nfvU3vfWKPNd1XOdhJQiMu8EwZffye8nksAE808/kMavf3HHTsSnjkIgaNoZgKaDYGaMu8ensNKWSc74D1kzUJUHQbsImkK5Mnzr6Yy+LGaB/CO0HPqFLM1HLvmSUTyKGffDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JrtSz6Ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrtSz6Ld"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L0Wvfd029250
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KGqEasxA4rkg6EXcFnfbprLt
	OulRWYiKToEs3VK7vDQ=; b=JrtSz6Ldu4CP27v0sPWKABFM2mkuX77kbriH/VCn
	/7O72GjLv0uvDM/XJpERxbYFSrD9uSi1fWPA9n8oViN1mCTRzCvHRuSsbZpnjxYe
	NlMSmjYHCr0MZMlyJIQF1EUe0oqw9EF4M7OnSlwgHCdNZZup8FpBJ4R/l6Fy6SKR
	YfGdn/4SKcvYz9IA351Ir7GXniezR8Vkl9DN5GQETae0JZlS6C3BT06xFnnQpsrz
	E+vmeSfeI8ZRicXS+lR4NXHa73mG7tOQrPvYLQRCfmJ/vEgm/tEOTPyjPPe4sdH5
	mLPVsY0jCJ8Nae4w4s9NDaUTlJNF4gHE4xU/PV3kAvUeYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qupv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:28:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so577394085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745224072; x=1745828872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGqEasxA4rkg6EXcFnfbprLtOulRWYiKToEs3VK7vDQ=;
        b=Blt9vjgGewaiYoa1tUMAuuCDzlB14Ejtg5Ud3frcNgCQUgVDF5l67Yv//trNMwoExs
         OwacRy5zrIK1Pq4I3ZCr77Ewe23QD233ReqP6SaknsA5DVWyD4PH6YqAHNjmGLTuKMUc
         dec19Z69diVDP2wK+GaMrSM3OScYjIrGjCK4jEdh+o9zwJ5wLfIlaCa0lqLaD5NVdTZU
         fIUHHKVCSUVT/BRNfhwYd7M6Q82CZPDOGVrx+OOGd9AvEV6HGLlXcxks+55vMHXPIbOf
         OE+K9t7wVbpVwQrDpS5N+0fCLnHxH44881KixvA+Y3gkPOgfqXD0RBEbLrQYMeXbAerG
         kQuw==
X-Forwarded-Encrypted: i=1; AJvYcCUQVqignLLKEnuPc95aOOW8QaunZpCnnOH2zO0p35zQigBKkDgqrmB74+Q00wIU3yy+V2NaE/9mr2ECbGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOf6HNqgO5rGqXaXXCBrqgCu7OJm/vXLlrwvbyMHHgE2PjQoYD
	VnYlYU24Gc1IX9B7sBDeBOqKwymf7sdm78pMYCrCzBYFgqa53WEOCBSWcPxaqM4YS3C2HKHMaRS
	6PK85R+2AeJtv5Pc6ydtBmTp+vXokN8JtDLKKL4MKRI0LLRvbgW2PrEsy7Ap5+/A=
X-Gm-Gg: ASbGncsi7Sr3X6/xgy/IOjsz/6oEcWlXXTxzBskB9gkH0GAB2y9s9/uMCaaiAJzon0f
	8qkQeb3qFaDUss2IvHinjCSj45UrbDF6/v4813m2NMEsoD4jR6DOZvrhT1pboDFTwrgiWYbFt5m
	Hon7nOqhWdhQ3NOzAdVxP4xzoZuwQQpNHwMKRN14kp5hVJu+YVclNOa17Lab7uK6GxqudJ0p9SX
	gkPeXgx66Ambfd9ZlVcXF2RyEulOpBKx1jrnVRqMoVSVoB9kJIgo0dxjEm+G6wfXWDtqrswDJBC
	ZD1NpPdLiWcsA4FgY2RyGnLnRVVwVi8BoX4ywW8U9cUme2+/nZRFMfxmMg6AbLjua/qa3/TwyNI
	=
X-Received: by 2002:a05:620a:258c:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7c927f84bf2mr1482969785a.14.1745224071746;
        Mon, 21 Apr 2025 01:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfQRiSWXcdjVXs/7z1f2HgaA+Rzpjr7swp5+QHl2EPbuJv2JHGnaXn96gkHgq+qSQFCcdBnA==
X-Received: by 2002:a05:620a:258c:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7c927f84bf2mr1482968385a.14.1745224071356;
        Mon, 21 Apr 2025 01:27:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090826840sm10911011fa.75.2025.04.21.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:27:50 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:27:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, quic_jesszhan@quicinc.com, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asrivats@redhat.com
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
Message-ID: <pfsct6z4u34rhqa7w4tc7kfe5p7g6xlo7u27ff7t55cxyu4yez@vauvrkhoby6r>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
 <20250419041210.515517-3-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419041210.515517-3-tejasvipin76@gmail.com>
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6806019f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-O-_T6ZlFlcQpfhg6YsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SGpnBe5REiImqQxlzGnhcxkNA_ycebtw
X-Proofpoint-ORIG-GUID: SGpnBe5REiImqQxlzGnhcxkNA_ycebtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=572 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210065

On Sat, Apr 19, 2025 at 09:42:10AM +0530, Tejas Vipin wrote:
> There are no remaining users of mipi_dsi_dcs_write_seq and it can be
> removed in favor of mipi_dsi_dcs_write_seq_multi.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  include/drm/drm_mipi_dsi.h | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 

Nice!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
