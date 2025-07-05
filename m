Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C561465B4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730356; cv=none; b=rM3gRnxZNLvxAY5JnGUtrCdStWlE2pIm1H9vLEkGbzo+T2lZ6LmhOI9CcT5xwx51W1VtBxmHGY4oyEtyEW921nUouVlbcEcksxfuC7++GvzqVsLI42xPg1jd4JxcsNIVmyi5Ha86ezcCITWJFCT9hCW+l6ih7yYSP6QW8BJxK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730356; c=relaxed/simple;
	bh=ip2c9ywNLoNqp5SCenERQj0St9i4NgfcBJlHCCsixEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6ZUxdy/GdMYHKdhoATsg4qOFhhXCO31ljUDyP7UzjOLzTJOdLiQaat+Dbqj5OczQLJi6tqwsOsRETiU3BAUeL2GaRT3IDxB2IvCUYNLU3C9g4JrE7kVIAV60l+zzoZKJhVoeNrn7gxkfM3urv4XueiqvYpMk38GNtRuyN7nO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVwHtiv+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVwHtiv+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FUTSI015090
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 15:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5hl31AIup9VcraO0H5GHnK0
	/OM1c1STFA2QallXhVg=; b=oVwHtiv+ZtmLyH5r/aP03VJeVWYz+DFWjDG1czY/
	9KBg9HLOiGtVpCvd/dK705+COHYSSVEOkRDuhNk/pFwVWNuJR3Y+9sYEiBdcKDKc
	iDBbWKTFABQGp0XBTsyxL+yUFz5TydLBujRf/h4njil6v//vtoNm9cL+4Uytxm10
	vzr+GC73C7v4J3W0AcCwfEQOfGRcuRYkuRpNDw0CUMT5IYOtezbed90gXXIv103A
	wwi5prH0ZocjumEokBJSmqadyn70E+0tPN3xzLeAYFsXZKpGo59pqRs/1sHjjeW0
	NUF/kcrQiUEhz9dkKQ1yZ9Biz6PDaRbrLmty50DfQKJupA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm9fx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 15:45:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so478296285a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730352; x=1752335152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5hl31AIup9VcraO0H5GHnK0/OM1c1STFA2QallXhVg=;
        b=ZHeaZ/r32Xz5WqrVs19CH2JE44Fc6jx4wbPa5M9kNW9PoZPczwaFw/HgnRP0hGXFdZ
         dIz7enRSlA63Hfo16fmAUBrfF/oM3pz6YUU+b31XtGYcBF5ewkjCSmQ7yDcul/AKvngy
         VUzzoIFaIkRNOuYJY9irf+D3DMPGmW16WygWYr3tkHfI9staTbAunWGLYsX8f57G/lmj
         tJ4M6wD5dPXreVS/C1JxVl7w6QwXrNz4rR+op78GyWH1GcDhbnroQBjeDwqzxJL8tKaZ
         y9JdAQ4zPqwd5VfkD/azijWiOMs+7FrQRYPSaPHQS5ObbwoyDnvyNhpM+t/3CFkDAVLR
         AV4A==
X-Forwarded-Encrypted: i=1; AJvYcCUXwy6lYpAZE28KtbRDyeF+/ZicDfcst3+pQmfi5XJCSdhPpWbQbVN/2EFIZmbqgVTJfvdp1LJH5QPIcys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyccevQ6W3e6R1TyfLD/EBJ4sEpo8jfY1Aj3xA+ots+d0ZZFdJ
	3YrWseHYRlKMds6nXSt9jeSxq4DHnfBcWqgEWH+kCN5Os/Vz6zzhn2jTCLfFq6HSd2YEEhlRThV
	85+U2k8OLWiuce7+NmFkAuu3k/dpBJLFmK5MxLvB0SRJ1jFhfOAaVLtgDhHElyMxC4BM=
X-Gm-Gg: ASbGncvy7vwJKmBHtQwN3ctdb+yCfa1otYCS+0NRiAiu+FJBCn/brfl+VN3biM3xWZQ
	qXp87E4RdMRfNjk+5zPc1NsMS2e4AyPafy9vI6Mjnk9RezDGuEYTrTcbqBQrAsm8GL+EqJbDUcP
	Qc1c4cmAJp7F3zkEfveibUU/kE5XXeGzzpUZinvBtxE3JFHB4R3dCPD2JKzUQHet2FFK/pVmoL0
	OaGv9oQOd42f4ivgAVppWG6C/eeidV26KwtJzOHQ0I3b76dO7isD5YsAg7O8cp/+nAt6Wr8QwJY
	2TvWQ8v6Ol2rLPYondg/l4Rz6oJMnAZvVW0J7P/5m1kn6x6gTWiyZoY5+/9VE2cE4VIybDMy8tK
	SwDXGsZmLcHgBMvBqqBvVMp++Meh0XtBxw9s=
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id af79cd13be357-7d5ef3ea581mr460740985a.9.1751730352395;
        Sat, 05 Jul 2025 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdyY0C1qvB2PcFY3D1k6Eue1Nah+mBAYGZ3JSrRq66wBkfF8pUORakrJC05vzG4Q4M4ELeA==
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id af79cd13be357-7d5ef3ea581mr460736985a.9.1751730351976;
        Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d906asm621676e87.81.2025.07.05.08.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
Message-ID: <kr7rjmo76av2mbobsgixhgdskak7nllsxghu2slmt6au3icm7x@japd67zoef77>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686948b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YF7ZKVCZQUMDimIUfr8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uwHd8TO6suwjddJzvR8Jv622dAgV9QjS
X-Proofpoint-ORIG-GUID: uwHd8TO6suwjddJzvR8Jv622dAgV9QjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX94w0u4t54Ubf
 rlr6Yqkjc5/lnhtLEXgwUrve/vUDrooAlQ3SkvSloMbaVblVvuerxBoev+AAGvINClkcsMttWe2
 kPG8bhuJH5Kz92w70NCksdUZdFt3beMfbxOrWDkYLzO/oxpnkgR+WcIog3UM/EKxIPd0FPczn1u
 bRyepmr1FTqgY/ShKiHTaBEassFI3QFcsYmkNEeCK8nZ4FNXprIXo9cRr8hobTaKQKaIq44QqLI
 Xz8G9ZHxOVLpPuWhiW1xN9V2VYW3IuiqopEL6qylDV2F0zxTeLMWvidTPS8fFskxLiC/Dvbt11b
 vSgjJ6MBvjtvc4A0e0500xEga1jZvN9EIvoxcMMVsu0qKnZMHhP2Pwi0q8l56QZcl5zKmJTL59m
 WzyssUWjvlm10qX51sG+q1ebt+VzyvaHTjy70b24zbrRlB81kZ9koTs2g+t5O7xLS4D1XMle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=884 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104

On Sat, Jul 05, 2025 at 07:52:40AM -0700, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
