Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C810F9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633669; cv=none; b=f6/RQTw0rhUEpp6za+rB2ICptw3idELahNXcGfDIHbDNsrBxi+qqqKjJJRj6TtEDUnHid3WEPp/HUMY/P2HBPGfN6FxeLO+JRg+kKQQPqEr4fM8im3acRVAnbKaVDHcwKbz9fXLpVKsOUEq10JHHiVanFSkVI57mS9bOcmIZQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633669; c=relaxed/simple;
	bh=2gqHTxm5x25ahTJWr6Aseu7bkfHM9w/CSCDnR/EYyj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3LiApu1FYaxJLw48I+KL16dlmSgSjzV1v8zxR12EDuBY+vWJikUDCYhBD6LHxkRsmifyJs0DtNl+91rm87rePY3h8GdJfTEnW4VBPvUr/hEX48zom24uSobRFC+pe5cFT++ir8poZdUsawUIkyJRirGueeD0DTTZ4uXaHyaEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuZq90Qn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuZq90Qn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q29CMc023551
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgng+bZEhvkzdq+Q9IsrPjDz
	pcDeuRKzrGsRNiJeN6A=; b=DuZq90QnvyeAXJrBQLeh4pnppAyjgmZvsHKFYDzc
	LB1EaTQ2tS9Q3oPhoNHbb/p7053FXK6yqaXwHtl0au9wZY43eZsBxu8mPI67hIYp
	xm6L7IApmaGrdl+7MNrFPxBmO+LGKwd527Zozas5I9c2ycVI8FrWPk/Sh1HAVZd9
	as/B0Ti+/cpux49GKXRDFik91n2+bhSkk6znNjxMkKno4eJQ+KAfHFwR7hf5ioRL
	cbOAhoKpMfXLu0m+NYEMB6L4twQPnGJwuDN1bgSz2Yup0HJZRMXyQWhNeKTZMo/Z
	aDM8E9YKw/P1N6FToQP7vut+8ODypQtHUWXPqpv31+cWjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pev808x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:14:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so486804385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745633665; x=1746238465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgng+bZEhvkzdq+Q9IsrPjDzpcDeuRKzrGsRNiJeN6A=;
        b=SAANo+4Z9JXOAK36nL1s0ndUI90mAEJz2oW6Vrrh3bZn3P79LuB+34hVO5q7tF2oVp
         QYnrsU/pmWOz+3Q4mf1pas+Kr17DihIyep2uXKkkpNXWKFgWR4P1T5nmx3rEq9mrlisJ
         jdTLCfJZX4qGn83pW9+X/2rbYoMfElvBmEwA9oYP0K1MM/FfQUUUry5nzcY6baT++sOg
         8TY03OkxuMV/qTACqy1XE8A12hePm4ajQx0PpO090bx4IX4fir1nij6x+0t2+kjPlpwC
         E2CsQYM8Q1xFWUSAfHMXi0JOL9IP07PZznL+DHNjRPUMbt98sLRrA6At5lNIOXChv06X
         gCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjuVeEpwEbbUUmANgral8u8+/mvGsbLpO2cY5PthXdCcSJ3H4u0pmB80YByb+I0iQBUcJAwFKrs31pXFw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0u499wHAn9K9aoBBiiYFCs4PYPgRTet/xm+wNTzjaykaxxTMF
	fCQYT+FG1oifREwdT7jfIBZtAWNgfhB3lNPH1dD0PvlEHw9ueEOa+1xl6v1iG95qb6Vf2Rqnrwf
	+orFSbQtuJmxLzAJ81+JOnSenam3vxNnwn9PprVXZB33g7TcY5zWpR87YPyq1mOlkqHz5k9M=
X-Gm-Gg: ASbGncsR+pqYDOSB4xfrBEX/Qa+hPWa45rvfVFb/yOwIUVy6ZLL0e8To9kPSWeocCyu
	UbCqDjg1celdSD4TSFtSXs7nhlKSJ76zFFYVDGWlw3X4YwJH6dyx+kZwcsih1vka/TQxm6Zqjaz
	oRvHceNA0prnLSR6fyJr83KZ1we+PU5kSjrNG+zfIw1gF5o8OLUTgFI6Kfao02AXub/LojxxJ5s
	OtrnWUNA02yx6fGZJMLTHokq4onKqj5w84rZRg9N5sz5xZd/jIh4mccqED1BSokYSfVP4JUGKaC
	F5SHNKcSKlaJZNxMtHTGbQZcHU9xhAjEcakmAGxay313OuAonEHmeJcdQhjlf3O/IG43h+dRtRY
	=
X-Received: by 2002:a05:620a:2847:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c961991dc4mr708916885a.18.1745633664937;
        Fri, 25 Apr 2025 19:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJRrQvRJIjrfWkHem5vyugdvDgcLbJ6kIDx3TUrqL4s9VNbnAJXPTQD63gl7jCjJp60lHIg==
X-Received: by 2002:a05:620a:2847:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c961991dc4mr708914785a.18.1745633664644;
        Fri, 25 Apr 2025 19:14:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659d3csm9778971fa.18.2025.04.25.19.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:14:23 -0700 (PDT)
Date: Sat, 26 Apr 2025 05:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
        Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <3u4lkr75kbcgx3qngg5m66hxqyd52uz3uqxetizqy45bmcs7iv@rsgkph3oxea4>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
X-Proofpoint-ORIG-GUID: WI5LFEtEhdQaURAfR2YoHKdUWe1GEJ2U
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680c4182 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=9PZjv1JVX9cdHcjgR4AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: WI5LFEtEhdQaURAfR2YoHKdUWe1GEJ2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAxNCBTYWx0ZWRfX9ljmPYIhZJn7 1/D5BnyN+PzMOVf6M84jC76x8dzQ7yZJPgWquEXH8ijbON1uNdU8vrJEX8L2TlWnlLH5BnjaaEX rlSvvTgKR9bx9OxTEces1ZWDbrgYdG+EvKnCTc3+3fNLt3xK5501LyAPle1HNPBdXQ3Xlt8e2lu
 fcm8jIM5WHImIuBO3sOqqEUANyVz3tkLw3T694Pyxanz4tVQps+mj4zMNjwTMbfAYjzLRq6T6/C KcZm2RCXmRngL4PAo3bFUlF56xoKDYtE3Mp67W0YvT5b51B+avvxGN77XIf+LA3MBelb6Fy2zJu Kw85c68GTaGiNuHNSu1/qeO9H4+v50eTd9F6hKnZdjXZRec7wjx3maopPyB1Yg1XPb3CnPUWFti
 DS561NLvuoxZ2upHmOXLkiwXhfKbizuEgpDKSNKd/pXGeuwq8KHaqyYXe0BJf1xYyJmDCyAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=719 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260014

On Fri, Apr 25, 2025 at 02:01:25PM +0300, Tomi Valkeinen wrote:
> Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
