Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607B1C6FE9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571949; cv=none; b=Zhrj/e8Jz9yC2UWwNHF13nWUj48Mju1p66FRwZypAnCpJhRSCfmgGAZZ4a0cQuOTSbKiS6kDN+fZ0rSK8/E9SrcZ5erj0pACs6JincLq5aNncFrbLKXvqk1PBJtxmk+afzqTtfeiSPIaTtIYrQphvxrr88OUPRT8NV+rcmdoJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571949; c=relaxed/simple;
	bh=LQPTbGns/pbiTHOdx0vsWRlLOnEjd9WhaihJG5oG7i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF8nF8s6GipBQQTjJxdhdbJrO+DIVQR6vjlSjcLp3AjwhqU8flZMz+MzmMNqm343qoJHy4TCglh1RQxr42/b3d2rPN7U48zq3eRcSuQVQOPpsHV5CwrfNl29MUXLzWnkRXz+uRoh0BdLtsLUKkdzRXaWupJNM6PJE2X/mWizCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewcoEFtM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewcoEFtM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Ar9LJ024877
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 19:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZCM7QMSDxKv2qFBgS+zVkBmh
	E3IR8xSI0qRlItQCwdY=; b=ewcoEFtMIcZSBpo75EPx/BH/CxTkkphmZBNkiuxu
	9Udld1HDoCowXgie/z+7iCgs4fHNay5rp0GSM1qTQvITb7z/VxaWBxOLlKTehZuy
	er5HTFPjJUxQuOTk3nnA4XNwdiXIVTXWTtJFniD8ktHLHoBsMRBu7WnKZQnfyR6U
	K0yFFaDtCzrIJEvE6Q9PDtVZPXKd2qtH+027PjDWDt1SzGrTBnymoVhAIvrvNjUP
	u7B2ymKP7pNQIGx3MNH40Iai2Q1/yBLqybPKJp46plETX5SEHy+5fW+hgbmgZmKn
	KV1f5bwVmUHDq9aiVnMNwSsh8hRyHQ/G0CWi64wUwzLG0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8029bxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 19:45:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0aa9cdecdso15346785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571945; x=1752176745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCM7QMSDxKv2qFBgS+zVkBmhE3IR8xSI0qRlItQCwdY=;
        b=gHc7BoD/q84r5eoBoDXwHPh9N1WNMt2gcIO5i+9yHJA/vEz2ztEUWYIlR4addm82jP
         +XjPC4h+XnGt3TPrMJG1liHOVxHA2xPhRz8pAfF6+IyF/7qRw4QEd/w7oCmnPhKVDaXs
         m7+Th2TcPb393ZB8NTgzLzuqapShlBjZbcEDx3kTUlKeka/CI6uVMdZcem5HP8D/HkIl
         Qv7strT+SZHCilkhvuYTqFEOQOgktGkXw2Iw8Bl9q0hIcV8YEJ6Entv8Z42CrlSCCD6Y
         c1eoQTO+Dg+2lZST6DLXriupuummF4icz3LuQGbIBHeUZEJPYKOwapMNFas8jLQicnn9
         ovGA==
X-Forwarded-Encrypted: i=1; AJvYcCUOdu1kPDqbglLhF2tAyBOtpc7o4TNCKkZiGSxvcrhJ39RSTdvfg1SjKgF9bvZOtngO1h9krGUhAvY2oqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zvB5TRwJO7oyq+Prwl7YCKNh8afTzigbHUEJKoknL6vTJhV5
	Er0AD/ilHx8AbL7XITDKIO8B/lsB9+6U/Bqo1yLqnxuOJ/STKbkT+KoZJpgFAxFlYxz8ahbxhND
	fDvF8gmS8IWXaS5VdVLE8vywEMwoHPOZQFlYwSiQsYO8b55NgcBRdnk1undZA9qQFJUg=
X-Gm-Gg: ASbGncvyU0UXS6cKOskFTMxGCBMLKWpecPHP+tklMIic8o9aD72ncGChf7Iu29MkhP8
	Ldch3R5vUCxFRhvoOyGjzr/6L63/9tZB+FGV/PsCSfS+Qux+aMJc6HNaE1HQK4ZFEgxmOipL7pA
	NyQOsB9FNPkXhwRco7aG/7g+SxdR+gjEz5pB/DLHy4DnexpnG1E8u2OUw82e5m6+wGC6zGFBion
	94AViq/cQYtdq4BlvzzCT30HKHvU7PK6KR1YdH1+f3W8liyNP+mLhtIgnk7sVEMe04ZoUuZ7zGj
	y7obWl7bcxakfFrI24sYWi1gtOBJBV+xDwAhtTgMFj+Iq4n/g0/OMUQOyKKCd8ZPC4kBpZFewBA
	cIYKf6n0RjtWsf7a9jbqiTzayjA/u4SRppr0=
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id af79cd13be357-7d5dcd151fcmr21172185a.28.1751571945566;
        Thu, 03 Jul 2025 12:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS8RFdz2f0aAezmbC6UWYhes3/5YevtRWhAWpjVXlYu8m9CftEOm5G+GE1c6x1xY4sKoE/uA==
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id af79cd13be357-7d5dcd151fcmr21168785a.28.1751571944980;
        Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494483sm55037e87.99.2025.07.03.12.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-ID: <burq5f43rrr544kn2kdzd5mvdi4yep5yz2g3dfortldchfqag5@23c7ciirwrfv>
References: <20250703183442.2073717-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183442.2073717-1-robh@kernel.org>
X-Proofpoint-GUID: _ketRCXx--50L5BZTXdNPcW0oXIu-YXg
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6866ddea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iv_ZzY4-czSJ8NSb4YEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _ketRCXx--50L5BZTXdNPcW0oXIu-YXg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfXznY5AaUE9lPs
 uBCv52ajHzzveY+3PoYnA4xjibCn57c/JIIdbWBJmmanfQaqFjgBP4W3w5Vfr4XLEOExYE5r+Ri
 wSMsOZZ43EaDwV8Ei/xy8As8nxAg9vAXud4dVXs7R4uAeK0bp2YgrTzXVHNJFYqJrjMaIFNVe4F
 Y7RbO/FFzacOiPR3Nr46KCrisYTWHVlN0AKoiYhxR7natAlNYEI7fR2IosAtMQYP7HbOvxLDVTl
 fd8LBL+Fi0OPXy2FVMs9Q6Tmtvvf3unIaERvDblf8Y5eHTqNaDScIxAK0w1ngPJBtrFu0bJX2B5
 IA1hcoIzpIDuhcWzz8N2vn+pWZ09OuKKKaI6613PUmLv+uqIJPWnbUDcotfiJdc3wC6l5mKNFDF
 m1ZX1AoqizRKjcvnlvzQ6voheqTro/O38stdsOfm05MACgBnQc6trOElpFMDVfQpyfh4Qb2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=739 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030163

On Thu, Jul 03, 2025 at 01:34:41PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The original code did not set 'zap_available' to false if
> of_address_to_resource() failed which seems like an oversight.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
>  drivers/gpu/drm/msm/msm_drv.c           | 15 +++++----------
>  2 files changed, 10 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
