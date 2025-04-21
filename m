Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0851EF381
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263180; cv=none; b=jInjAmD6sxAVhTdhp9hBvOD9WVZBW7gU7Y0IEOIjwVlhQHomuuNVv4eUtcTGra5OVtZ/KM+RoQVVt8VIEgKs7QRsDb9/9Q70EW+ruonZouMfjZTtQ6gfhy8mC0wAcSAxtLsduzbkhxVlH5TwX47kiQuZgY9Iw8coZH/Z64BnExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263180; c=relaxed/simple;
	bh=VZZkf1y3jQq6FtCXeOCClftxtxY/xBKvM+AwIP1img4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrd8VJ/3tJY5o/YDAanufmQW+qlGOttOlfOaq21QhFOVhKVk+zHSHkZrnEqESU6KJUT/NZ2vtZpPaVNmg6HwJ78ryLvhekGHdvz3IHv+/uBSLQET+tLt7Qb09YXQV7CuErPA0gRYg+m06oZvnGYxUN7eksX5bNV4TkaTTwitVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaA+ZPS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaA+ZPS+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgZai029354
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66he8wJaUK0BXjdYpq1b9tsi
	ThpKqiKwEnfuTBsAXos=; b=jaA+ZPS+WTAxCgmecMnXi8Ldi6FLV2+h0D8aiAQS
	8gaITNe1Jn6ylZzPjgPANg7opH3kcSXclq1+KcTwyZ9Ao9Yi8PohC338Kx7TcT7p
	6dfForP/CTruw6rrPlwxSm349cUVPUhCQnmbbPstDohSVDMl2QMRnu2dWaz4ND4L
	bXLxxFDiBlesIUbcUFgRzGjY15idzzSy0G3c3YaZWFxZNhg+A/UCUDnQhdzQJmnM
	4DWQRcLTsNyRUG3ZmoRlsWxhJNb6MPxHY8oeQsKZe6zNhkE3+qSgiWRkEMbD7E17
	ggx98fVkz6lZPt/ElRJ0UzOCEugO4K0DWMHKJgYMohxPJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1d3bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:19:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so86977076d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263176; x=1745867976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66he8wJaUK0BXjdYpq1b9tsiThpKqiKwEnfuTBsAXos=;
        b=BKfeLcLoJEbV6xGymjudiK34njZXF3V3QxuNzCTnOtsiFtPeoS5nBS6g7NihcFA5+t
         WO/gewJTPDX25TuR5Hsi7hyII/VIhQ/9hJ8xBtrg8Bq0+gWQmIvW+n3ddZCY01reNp+5
         a0NefN9ZEjt3hYxTllPK07jcdZ37rI7aF/n7+7Mon/oopf7sREJlEiieWyn+GMKCa7KD
         qA6khqlGGZcUMXvIIhUV5xbBnzV8EIU23hLsHEgWXOaYaMW8Zg1vQNFOp2NXq15qO6ri
         IdJ3yWZ/U6QymZcdnjs7pfueIcic1hvUlNyFqAJKgIqaP1eZ5w4kBqfReImPdouAjo+K
         hUrg==
X-Forwarded-Encrypted: i=1; AJvYcCXzPjpSSoanh6w23OrHiHFxTQPyPc7IbW/d8+CgmK3xQSDgMFHHaZ1tixe1KGfisQdklMuQRvzimpEbY7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6sgUm4oLAxThURm7WYlLY3Z1JbZfdmLoTYCmNZXl0ig6QBYRP
	xDmEylqoBzq/jvUQnCHfXNe9YbsoY4FGF9ysmcc+RDpABPGUG0JbBlN+2vjgfwMK2as73tY+MrU
	+i/JBicEjwbMjig8FeFvLYQL8g/5ZMm4hQZg695W+6Q3Vpj7KSGFG2FVkAMzZjX4=
X-Gm-Gg: ASbGncvxzXDskbyEoqDQsTE/gXh5xz6RNT1jdDTM9EyPWqq7jf67gqr993dcWykNS1M
	TZgu++9hSR3VgXMwmG1zpoamPtFzPG1lEKFlbRWT+8jxeYLN3b8OfAkL4yrA0dn9TQiyCFPgNCR
	zyUcOWcPQzri24zCuep7TlKdHkIaxnQqRWmHQH8MWhqRrJJKnk5lkdAX1xKNIYti5AiLUYWvlW3
	ATopBdFkDLLYgNwOi1u2jiNTskeYrHgLoa6dfnX/UQacqlBKJ5nvAzz3N0T3s4CyxIKCQa3fzkp
	PcXe02+UESpWzmrG2Ey/kwBVS+l4stxHyCFMOoYlfAKGITepCt99rZ47JCJUptSnqFCAtCfEQV4
	=
X-Received: by 2002:a05:6214:5081:b0:6e8:9170:9d06 with SMTP id 6a1803df08f44-6f2c4687a66mr208576656d6.37.1745263176482;
        Mon, 21 Apr 2025 12:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAH//LryHJxNVjS/IO9xATu109Vj5+FzfGQDOXYk6kqWt7voiXhfMu7uNgM4ct3GZlNBErgA==
X-Received: by 2002:a05:6214:5081:b0:6e8:9170:9d06 with SMTP id 6a1803df08f44-6f2c4687a66mr208576246d6.37.1745263176063;
        Mon, 21 Apr 2025 12:19:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d70a20c36sm928895e87.225.2025.04.21.12.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:19:35 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:19:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
        Christopher Snowhill <chris@kode54.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/34] drm/msm: Rename msm_gem_address_space ->
 msm_gem_vm
Message-ID: <4kpzu2pjg4wahdv74kf6bpwmrgzsikkwlzwzqyko6ylt5m5fob@bhvg5s5ky6tj>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-8-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-8-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68069a49 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bbRKhBg7HBMvg3avrSYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: y5UkAQ3tm-8x913Pd5cu2kHR8fXEQBRP
X-Proofpoint-ORIG-GUID: y5UkAQ3tm-8x913Pd5cu2kHR8fXEQBRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210150

On Wed, Mar 19, 2025 at 07:52:19AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-aligning naming to better match drm_gpuvm terminology will make
> things less confusing at the end of the drm_gpuvm conversion.
> 
> This is just rename churn, no functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         | 18 ++--
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  4 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 22 ++---
>  drivers/gpu/drm/msm/adreno/a5xx_power.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c     | 10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 26 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 45 +++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |  6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     | 10 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 47 +++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 18 ++--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 14 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 14 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      | 24 ++---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 12 +--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 18 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 12 +--
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 14 +--
>  drivers/gpu/drm/msm/msm_drv.c                 |  8 +-
>  drivers/gpu/drm/msm/msm_drv.h                 | 10 +-
>  drivers/gpu/drm/msm/msm_fb.c                  | 10 +-
>  drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 | 74 +++++++--------
>  drivers/gpu/drm/msm/msm_gem.h                 | 34 +++----
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  6 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c             | 93 +++++++++----------
>  drivers/gpu/drm/msm/msm_gpu.c                 | 48 +++++-----
>  drivers/gpu/drm/msm/msm_gpu.h                 | 16 ++--
>  drivers/gpu/drm/msm/msm_kms.c                 | 16 ++--
>  drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |  4 +-
>  drivers/gpu/drm/msm/msm_submitqueue.c         |  2 +-
>  41 files changed, 349 insertions(+), 354 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
