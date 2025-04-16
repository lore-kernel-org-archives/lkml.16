Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DBB221F24
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845657; cv=none; b=lbKOacG9OLn9i29eSEDDTZxDBkSqIIqgH8jiYEiB/ogNP7tTLEPz+Jlm509+cHMS0b+JFJyvvvxz2HHEYT0qOaz4AKH/Xt0/+j13YCRjH4VcD2NU9gY08CuNRScEGm5XRbiL/ZGC9PLXD1Cpc+LNF/QM4QH4qx5YE+7sfYYPZWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845657; c=relaxed/simple;
	bh=n/UJ4zfd5eWbWds+vSxU1j3cVshSHI+TyU62weqbJ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RU7LEOMH0cycabzmW75c21mkbWWlsPrHGWNBMgq7vglxM6RyXz5s12Kgq7XYAYswUJ3ZFXCtiwirsdtHzxD5F1oq+4lPjI4lKo9RE85ddNaHOVp5geAbPkbsuafad+rRwhXk560VlAQdTlMDBFdBc/XchTuXnW2Gr0rYSP6+ZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsqrQAXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsqrQAXT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLgIQR007820
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O+bay3u8UkUVUh3z4kt+jJUd
	J2Y3Kg04YyWU0gm+6Mc=; b=CsqrQAXTNSS7hFeXDgqLDm2NwS456itAL6Lf+0FU
	H1+oESwd+4CmlAEVCkNpbdgtB1Qmr9ndpC/wx0H+sw49/ak4SN9ISyPwTy9JyQei
	ToVBZqQoqvnS+MIvLrxETEiNhtSCjw+ZqnnNWxfM9u2w6d2Y34uRC5h0BL4Ru8zV
	a0549cC8O3REmpKAFZspuvMBEEMoUk8x61DFoHXMk11Sbp2iwohsxpchydXxp/DO
	u3xnw+9mhp1rgscNr5z1KMXoY7CNcbGxyh0b59xGgbILfvIfSDbthbmTAxlGRMKy
	usikbt+TUAW3gmO94+t2jRNYfK/MXKm7YzSSb4S8LkpScg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6n49t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:20:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so4616866d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845654; x=1745450454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+bay3u8UkUVUh3z4kt+jJUdJ2Y3Kg04YyWU0gm+6Mc=;
        b=cMyuP2IIz1DzwCcm9YGrvxuhhow2eai3oBauIUa/Ag2bAXnJsmQc6xdfx+8plceY77
         HrnVTSjGUBxyhaaGwPVLYQlgb0UI4w5Y5n5ldijJWSV9Zbs3WS30eca2yCJtYxyZhari
         Q+B+tredo+8F/9mK56tOhLxLjQz6h3fh8peMJVEZ804YGMBN1wPCH7g0nv/nFHhzmf9J
         Nv7X493hE/adF+jQRloogG7q3Ra9f1BNiERW3WEcy3KvWoAKyXhfDFJisivcrhM2SsdD
         JhwDcd2u6zxz4M5/2vD61j02kql/LsGUWbiAPoblMOzQh5P47aZOiEUptVPUoRc76OV6
         7nMA==
X-Forwarded-Encrypted: i=1; AJvYcCWSpkGvc/wRcLKuSn3O5rD+wUi3eVsfASKbQjm91c640KzPr/4H9YLqeHYKUvipTjiqF36v3chcTyokvuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI81+1wfr0jtKlMYfzyYn6IDewNjWCcPD4QCCBCwfqTAXXfvaD
	y9QpPqs92OIHJfcMNCls7eZtN/Eg3TI0+8qaHeeEFtnU9E0jLo/rnoKLn9nrzO6ZIxwNAI6LaF5
	tcFD6bjdeEAQkz2DhJAJ9ZQtK63d7kvnzMv1omct9dtBCRes/7/UHirXdp1RWdic=
X-Gm-Gg: ASbGncty+583ubQf1ap0YdgPebWkdyVMKM44JZbSuFuiI5XYFHRpwXck48tvbP3EXDx
	ho9mPiPtloRhIPzva2woV1RDoiH9gzskHctywcw77FMcmxH64ngErrW2bNtW2AjEi0TxPeBuzmn
	/sU7Mjme9SgrYuy7FLy5/lyWLhXccIv5t8Naa5D9nL+TKXctM1ZzIJVFeu/Zb8jfcduHmY93qL2
	JGVJnqMx11ZxapBsOPJkEq36nmwhAm0XveW2zFoBIICZenB9ENbshiLPJJxAqn++o2NypRmSuM5
	KIjpZyaJuzlNBSGYpRycbBRwdT2Q2EU+fIj9MnzZKldsFb1iu+gdX3oR5AiXFJMlwCg2aj9P0vY
	=
X-Received: by 2002:a05:6214:20a2:b0:6e8:f65a:67bd with SMTP id 6a1803df08f44-6f2b2f3e4ffmr54592246d6.11.1744845654039;
        Wed, 16 Apr 2025 16:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBAA9vrfbsRJNy3z4MIqCYUoUGx8TD8fWhZnK3l2Nt2B+kFTS0IhIbhX4Oxt4YB0i74q0tEA==
X-Received: by 2002:a05:6214:20a2:b0:6e8:f65a:67bd with SMTP id 6a1803df08f44-6f2b2f3e4ffmr54591936d6.11.1744845653574;
        Wed, 16 Apr 2025 16:20:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d520389sm1784976e87.251.2025.04.16.16.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:20:51 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/34] drm/msm: Remove vram carveout support
Message-ID: <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-9-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-9-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: CQ7MdK9qK0YOJypEPUOVQ62-oB60WgkL
X-Proofpoint-GUID: CQ7MdK9qK0YOJypEPUOVQ62-oB60WgkL
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68003b57 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=9D-VRocS9j12M_ZVpNYA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160187

On Wed, Mar 19, 2025 at 07:52:20AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
> mention frequently broken and rarely tested.  And I think only needed
> for a 10yr old not quite upstream SoC (msm8974).

Well... MSM8974 is quite upstream, but anyway, let's drop it. Maybe
somebody will write an IOMMU driver.

> 
> Maybe we can add support back in later, but I'm doubtful.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
>  drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
>  drivers/gpu/drm/msm/msm_drv.h              |  11 --
>  drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
>  drivers/gpu/drm/msm/msm_gem.h              |   5 -
>  drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
>  10 files changed, 19 insertions(+), 287 deletions(-)

-- 
With best wishes
Dmitry
