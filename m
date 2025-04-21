Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72220E01E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223721; cv=none; b=Jco0bnHlm3OIh0NzOoPtVKCJjDuDo4ymfCsXHGj5Mt/PDeGFKTgttEfK20FnY8cZJKMgzk3uNzBhw2qoO38L3sG+qofy55vmY/ji91B/wnl+IQ0KTgTC//150evH8px/hQ0cEjI1kV+JWeyAFXYNS+AqxVNcSSuGum+Xxd6QDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223721; c=relaxed/simple;
	bh=rfBDcIm653IrfaI7zELXpLUcNIgBnt6pj9hB8cCMYuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnJCejppFKFDCc5KHzP/FG52pP3xvPhDoZ+rpNB2qpDXwOW6Zf6rIy2o4APdFtyeKxujoyVsMN3bB0bgS9rJLxA6jjgxLQravRJGDtHHEJCgY4WeQotW0EeSUAWn0+U6E+eV2htr8tR7mjxgEZMi3qp958oZHQME1fGPPXQ++Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLw130jc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLw130jc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMt2ej022316
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3dOV6TefbQJrNU5fY48fEav9
	8ivZ7YhZXWg/363uaxY=; b=NLw130jc/sr36xMO9dNl/g6IyD7ilOeIFbzF9qus
	2Q7pUhbsYma/bac/sVzWK5N6bHxtztyQWebdcv+txHS2qXQZLFBms/JUBq92ePYR
	uXqk1gr+l78B6NM7yF0DPGmVeBKi+/Tdbh8inaRYfXem5SvLJCnLXwInhQGg76rt
	oaeCoSPiAPzkxaFv89Sz5D3IUicTS3oVwj9/pMJxRvGnbpf4PSxZPao/wZC0MHHX
	W+LS9vx3ajkiHkhSP381maBSwCBBPqHpT1LE1LzQhes87umsssD/O1mU/4m2tUWp
	N/AaESjzu5o9/61s05AVsqSWT+q5yd2MIjKF4HCjoOeMGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbhd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:21:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e90788e2a7so53452216d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223713; x=1745828513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dOV6TefbQJrNU5fY48fEav98ivZ7YhZXWg/363uaxY=;
        b=K4CMPWymkf5wHqTzj5xjRQMhJUODUkL/FgLaDww+yh4v2jFxjcsF1xDGJwjx+BaiJk
         VEMHukOviuNhipemr/q4YpLKnS+XXrmuEcVOpd3jd8YIQuhacAVWUvJwNPyqWJUtve4d
         f0L7+oDvubEIIrLj42kjwUA7JdNo644p1LwgBHpWI46eu+heG7DWZ3OfgQOqRgaHAswS
         MXwsIHHIyfQJ3HIILtCqfq/Cx7fEedLewjcF02Nkju0LS1p82nZ/sU0uzEDeNOR4BXYm
         2Mwr8jEngtUN+GI5liW1lUFMVVNK374apuMhtZkwj+m3EJhJFPMCi784/hBeFyrzJucJ
         cDXw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Xu8mPZgTyrv6I6N2hid5aKS82xCcjTwLEbRSD9BftqvHM/zBmpfpEcwB0RYH8oBvCmSrtT+rKBpUc7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ECpC7UKY2wqraHittfwpc3vV/W0T/1cTy2JWfmZ0BjaQtuGW
	fkzS/+l6qqcipxXR93jzamuh69GsuHrhK2OL6KaA4vsMmVXNhPUbG5h6yAjE6LFySlrgnzHOLPw
	2umvAI8AAJXeKmorhHcB2DsO7jZpp0hqhU5SL+ty31RJPHuHtAfnTNWcFbwznxbM=
X-Gm-Gg: ASbGnctpUHhi1X3UcMe8NrJvI2niBd5fyFzfrT+fcxATOiHIeBa6+peR3mGIqjZlLNz
	dpy/ZAYJslYAXZPPzI2/EkqE3b1YIcT6jAnVhgkeVvKpO5vZZupjsJGdyAhpYPbHAYOQgkCKr18
	bNOgyWedxC9azYC2rDsU+uRtAXWojS/Wi3r1x9xLzBWNScuaaruUsHIAziFb6dhph1wnOI2I9De
	tIPmnpIvyHpZ6jfjtzns0TQ50n96/EXCV6ee4OwcXSTjT3A2F/HAoco09wS9gt8TefBON9THROL
	ch/PLGfpZVVkiZJvUukwHocBcnl98P/+bzmNPu+ozey7vPfcoITfDSput7je1qgsuuM0nH6MJtA
	=
X-Received: by 2002:a05:6214:2505:b0:6e8:903c:6e5b with SMTP id 6a1803df08f44-6f2c26db1fdmr178470786d6.9.1745223712763;
        Mon, 21 Apr 2025 01:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiFDbAU4iG+kC4GnIeIE42J3FEGXYRJXXp4pFCBWX4GU50la+M9HKv+Oo+djrzzh+vCDGc+A==
X-Received: by 2002:a05:6214:2505:b0:6e8:903c:6e5b with SMTP id 6a1803df08f44-6f2c26db1fdmr178470656d6.9.1745223712436;
        Mon, 21 Apr 2025 01:21:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f4cf2sm864754e87.215.2025.04.21.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:21:51 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:21:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Assign plane type before registration
Message-ID: <nxp2vzmushnkigmyk2yv5vz2j7pc7fghtvn4uielhaqqn2dcnv@eq37j45mqpng>
References: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68060021 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=ONaZQ3SXXcwgrymDYLYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: UuRLmjCyuRUMLz_m8bhYmHNXZVSlg64P
X-Proofpoint-ORIG-GUID: UuRLmjCyuRUMLz_m8bhYmHNXZVSlg64P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=659 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210064

On Sat, Apr 19, 2025 at 07:30:02PM -0500, Aaron Kling via B4 Relay wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Changes to a plane's type after it has been registered aren't propagated
> to userspace automatically. This could possibly be achieved by updating
> the property, but since we can already determine which type this should
> be before the registration, passing in the right type from the start is
> a much better solution.
> 
> Suggested-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Your tag should come after other tags, without any separation between
those. Also, if you consider this to be a bug, please add the Fixes tag
as described in Documentation/process/submitting-patches.rst .

> ---
>  drivers/gpu/drm/tegra/dc.c  | 12 ++++++++----
>  drivers/gpu/drm/tegra/hub.c |  4 ++--
>  drivers/gpu/drm/tegra/hub.h |  3 ++-
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
