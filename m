Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65894248863
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845120; cv=none; b=fvh5bojAZcsa7VgRJQP6oG8qNa1doryWESzeubp/VVoRbUBnEWXo9ERq5jsPMdaDyBsKcxandFAQ6koM9V/tLom5xCcxYCA1C4IsE0bPeltRqeAThlt/sGbAAonTHHY6YTn2Quup4dIQnk3bF1TVkL8LjONK304PUEh63whT4gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845120; c=relaxed/simple;
	bh=HvqzOVu+JAeTVaLGzhd177+MVdXkNQAqTHwFGndoIp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8yBbgyTqgzQCf+t0Rbc2kMVHZ/WAUVJVBASfqrPn3zh6AYwOJ5EsPF4xMxiz9TTkfG5+1IbNOLH3x7WVrxCXChjiNdXq3uGCJ1qaenCe5M9wLhiLX6AYc2xlRLEHpIDDXyRkrlwUWC9cJ694J1SFAYS5ZhS2orXqMgYth1EGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMfnBcr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMfnBcr5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMa7rs006001
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=10e9Gm2RPGDf+oQLDehdobGU
	Daa+U5XpyPoSez3rMCg=; b=aMfnBcr5HCNeSj3J1sOS2UQQrEYYtqAMgtbc13hx
	jrEzDtXXg3gWz6c/NrKgCvfKPZC2j40txojwvXbjEsizncb4L6qY7gHYOdZljgfm
	SDw/HUs5kAQzeCZNC0oL8XFZxP8y3Y2iw0HGEYU7EFtcAmQvW6NPsjiIAos6Q9eO
	fOS8ohEQ2RuImLrQiioMaGRH2satLxtF6m2T3A1aiE6aOiAfx17EnuKzOiZ0QPqh
	Q+ygy9ShgjRD6CMklNGkOG02z3NTVTLxKLg8hsSvIEbtSMdVq0RssXiYgLWsJA47
	hTnkCKFIcnkZw+N1zW4hPf0/+9Tkv1duW6l+RAx3s/Slng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqd80r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so21121416d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845117; x=1745449917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10e9Gm2RPGDf+oQLDehdobGUDaa+U5XpyPoSez3rMCg=;
        b=MK2V0dbTzGRaL/IZE+9Udl0aN5p7iD4nlWanPjLEzMThJ1Cd7K8VE2GVWuXn8CLi6O
         VY9GgTWA1S2JkAhWfyGmZ6ibzi1JNo80qQ1ZlDf2vbQ/sd8hePNLuIcrqq6cDgERhmGY
         qNn1oR7n2gnYXNHsYywVmnVKOXqOx5Z6F75yP7ntKKW1X66H1Bn2ZdwiyBxMg5du2ySp
         K8vB5SabZ5YA4Lh40m9FNdBQW7nb5gcIIqRfB4M76qnBw+Nv3eXJxH+xdl+tMfXeIuVJ
         60s5GMjj0dvfbfzDTWFg+9G2oCm6I+2FITjcs3VdUMsDHZ80JF1sOiFpiCrJF/18aBLL
         31rA==
X-Forwarded-Encrypted: i=1; AJvYcCWk0lKtMOxdOJErhJJ89CrWajjAvD1e/i8HTN9Jw/AfGwJHda4kxcc2UQVVfQ51k8KxugcDhL5Lf3ePT7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YypOswuQnFMVAr5V6hqWLq77EvelWWSCFFQ7IO+AK9lAv1MZW6J
	rUug2Zkg1lzTCvYvlDEqquxOxufDjWVUUILsDJ6idi8okmv6iNUpyvWtnnK49yH/FFdC+6Cxb6B
	YNkDN+OkptiwR3BMtBw/oxNDpgXX5nQS6uT3I5lZ9kvmaQY3f71MsuMXjmUyyQ5I=
X-Gm-Gg: ASbGncvBfCEcHZER9HG+56BLvujzY6nt9ZK1JCoAI9hLfGolSmrZ2OoDRynqQ4Lpcmm
	JY1bArYSXxiRMSaapHcaEY12ovB3oXBnH8AzZ8VckS86EgL0gw6Yhsp/6DnhQQzWEOWF56hGLqN
	MhJWiT1KC4acCJltuT7GyyIe1TfRo9rlQEAtDnEHMqLJkxCQC9olF3QzQPlEu+IeiyDU0z9FXZz
	e3s8HUd0HU7m4vH+FD1vKsa6CeUpe9fvwTz8gB4Lkr2efZZ8vOMi48eLyFVzU3LJEtqL+bclMcc
	qHfT+1Qi8ITTAGbUzRIlEJ+7r6YC0O8rHcqfsyoARs83MOLybr582s29ztV8Z25j6l7oNhA8YUQ
	=
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6f2ba665fecmr13701446d6.8.1744845117440;
        Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgAiezriok5YJFlEPY56geiSrXUHE9y3nHh405AYuoPCKrzUZwk1oQwHN9lCS5j+H7KnD9zQ==
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6f2ba665fecmr13701116d6.8.1744845117120;
        Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9f2dsm25270101fa.53.2025.04.16.16.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:11:56 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:11:54 +0300
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
Subject: Re: [PATCH v2 05/34] drm/msm: Rename msm_file_private -> msm_context
Message-ID: <lb4to65g2xr3ryzhhabrejau3h6b7impchrlcfpv7bogme33r4@5b5gdqldk5h2>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-6-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-6-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: s7rffeoAcA7np2_lkpa5USRtHd9HiRvy
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6800393e cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=OUvj5yb-mTn8qsDSrQoA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: s7rffeoAcA7np2_lkpa5USRtHd9HiRvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=766
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160185

On Wed, Mar 19, 2025 at 07:52:17AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This is a more descriptive name.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
>  drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
>  drivers/gpu/drm/msm/msm_gem.c           |  2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
>  drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
>  drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
>  9 files changed, 49 insertions(+), 51 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
