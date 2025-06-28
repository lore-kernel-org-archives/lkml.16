Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419D275AF5
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130179; cv=none; b=kK5Dp2qAYOFB/ScmNNsD1O6Zjwm00kVPyob4n22hjw/z/Ts5eXPfeZ5p9zU3+QRcc8wLS8xbAwB36QidO3BOiOM7TJC7k0kDoAict10UWlfRhK7B94ZyvmgDG7cfUrtV/OMPu9CFOvYIUDjsq8G1EAHZt1MEzlRqjHGW+0bRRDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130179; c=relaxed/simple;
	bh=VeL9FR4wnl+s6naOeTuls38upzIvMRVBiCfWQn/MRq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSbdc6wrD6/M7g/z2gx9LC55lVjrp0AYs1I0HJmfyY8vzfYVfnSd0aORE3uWu63GXU0lECntFUCXEP5kccviYAc8vVK/jnxaN6x3vzOtXzJJRrBT3rNj9rIZRPKgeYMSYsa65Q9o40mhxyLXyEr9XVIfgHFcVd1jftb0GBhPk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWCES6a9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWCES6a9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SAqXQP011661
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xj48wCGbKF6Pk72+CEinz5Ni
	1UPAQdUCNNhFshACoN8=; b=aWCES6a9PNuvJBf8I1GOUboxLb+dsJ3NMbLdhhZw
	EojeEV0V0W0CyJA8cS+gClV2ZJyTGiM77oAsGGaJxaefrs4coLq2F5sPlQVQWSkx
	2lpeVsJItlLfePj9RYkU/DOdEL/4M7O591yU2I4hTz+O4JpUcBozkwQx2Rq6OZgZ
	VrA2sghSVGUI6tTJmwXysHSIT6zaWDiJE0KR266LlD59nAbENwlrSneJG+p3zhyf
	oldGDtI5e2uXZwibIqQhIE/8Zt7WtNYvInH42A8XHJH3rLjUhDhT7CTJUNlGPsIC
	d6Of7lW6Y9fJMR3AVrt/SLVUMhPzj3ZnfngOfMLwkDpU/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m60wwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:02:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44d773e23so222810985a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130175; x=1751734975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj48wCGbKF6Pk72+CEinz5Ni1UPAQdUCNNhFshACoN8=;
        b=K1IFXFaWK1JrQoeu1yWHHGZyMErAh5UmFGGhKK084K8cI7we62DdXskhmi5NhkPKqe
         UTkdGhP499c0Ql4rBy6N5ktdHoiBPFO9ICi/MUnQuVmudzjCDCv7mJwTqPEJhWHhskZZ
         ztnCeGNYRLEOjH8pelytE1u0DfnqcRsDBcGXL3i9H/cprex7IVvbTJO2GSbC20gorp3n
         fTDhi2mZ2aUy1ArGkkWXObi30/rpJ1OF3pRj0xmy2alsbrRsTdc2W3clFpSkcflBaew7
         LWlv9pi1dQyBIgmgtKB1VHpTm+JGxCH9JThJ5I5JgL99p4/+KMX6ps7+gbAz/ptXwi7u
         w3Og==
X-Forwarded-Encrypted: i=1; AJvYcCX5wRiH//TfZ3XJgR9DLNDBoQPjVOrHtNXrDS3cTd0YSa7lHAiN7dtAHjOhAmUn1Ep2WBsWcCG9eEo1eJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBNKsHZhFop2ObobCLNL1WEpQDjDMw0pv1yGlsS8HaT42LSjDU
	eLJkLCbFMrXVW6W26asaPBmqVwEY0ATZ3dsT621GFnXrjgcXxK5irXMp2x0Lr8db3fPjUtFv36S
	i/YR11d2M60N41WcPbZlkm/zCvbU2zU4fNdVMb0x90pZ0667lhmXSobrmPx5z2hRG2cA=
X-Gm-Gg: ASbGnctPm32t162hTpLvlzgJ2jDAfthkR8OljG+007MP5TXerYNHUJ39cSzvxq2Aj9t
	bMryCoTb/UwpZWGPi69sYFHfHBviHU4lg9Aaf2uxKqgfTw+GLwe7s3JJDX2MeA0ZcPjMvlDSg3a
	0ZOTisYd8mygg94BQzi1VWiq0IeDheLf+f/BtYy4Q8gM8u2EZUyiiAQCWB+QBmN1xzBLzREiejq
	ZmndmCOnh51XbS4kIcmnmMf/7fIsi5mfOoVVAf+vzJHDVkERotVsHIdzTJXrMijgvJ+X12S2IPL
	TOzDcf5jLTQeObnATNDBEdLTVpZBdI7kbRpnznw9RHm8p4Gwge1kzpPJY8O5UaUqOniLOc2xbEQ
	1fYMRkRSGohHh1G3Ny4Pg0IA3qPPyV9kSjkI=
X-Received: by 2002:a05:620a:46a1:b0:7d3:b094:d212 with SMTP id af79cd13be357-7d443990ae5mr1065894985a.51.1751130175122;
        Sat, 28 Jun 2025 10:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY9eY2qjJG5GC1z2t+E/qTvaYQxv7sH6/mlQPjsokwBuEJDcnaEoFuKASuBnrgaF+wIVxjjw==
X-Received: by 2002:a05:620a:46a1:b0:7d3:b094:d212 with SMTP id af79cd13be357-7d443990ae5mr1065888985a.51.1751130174550;
        Sat, 28 Jun 2025 10:02:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f01ac0sm8375661fa.101.2025.06.28.10.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:02:53 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:02:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 04/10] drm/hisilicon/hibmc: fix the hibmc
 loaded failed bug
Message-ID: <hpqbr2xngohjb2kyauwz5gctb7dglvu5tsmapbazy5hbjtho2v@lmkptdfeej7z>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-5-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-5-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MiBTYWx0ZWRfXyah1kU1YGma/
 CI0+XjaUEgngjuP22+u/u1HtAB63/9W+0KP1lmLieELC2jxrbuB38QVgA5CcX5Q3BaDZtjQRbA2
 n7gDROwgjzATf1NAHJ8rieNrrT1HB1soNIB7l46BLNNZwGLQjiaeD0MeJyG9wBjPCqoQf2EiMxB
 P5juFH5UQ+FDneiTDNtNKtlqc8KvuYjiCfibFNXJETbPUJogM0LAo2Y5Y9aT0IpbdqXjvA1tbv6
 8fCrQE2i069CU+L05yGUFE2ntE6Rc/jtbt4XgR32UswJuwLnte2EXBuugRdMs/Z5+hHD/TphiZ3
 w+OVFn/ZCyEMSVF3MZ9dHma225yJ0pN53DNf9SP6tsn34foazAURyOTeL8gzvfCNIj0DAZBtca+
 C+cHw9yLV1XsqgVIAzFNkWolmRcLMYb3nerqfB8eL3uadekvzph3TFdcO9bEQ4t4oRckHXO4
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68602040 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=Yqf8pivnL-G9Aq_Wef0A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: U0focZKKI2sDsl3AxuobD5cLjRF74fAL
X-Proofpoint-ORIG-GUID: U0focZKKI2sDsl3AxuobD5cLjRF74fAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=668 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280142

On Fri, Jun 20, 2025 at 05:30:58PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When hibmc loaded failed, the driver use hibmc_unload to free the
> resource, but the mutexes in mode.config are not init, which will
> access an NULL pointer. Just change goto statement to return, because
> hibnc_hw_init() doesn't need to free anything.
> 
> Fixes: b3df5e65cc03 ("drm/hibmc: Drop drm_vblank_cleanup")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
