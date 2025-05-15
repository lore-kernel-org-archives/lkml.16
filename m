Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A16B33E1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747269170; cv=none; b=X+HNceUO6t/koF4zHZKolJ0PRwqpr8OH3iwmK8EgBYoOrMKV/QljKk0YgJ8a7JdTK5O+RKKLwBLvXE+ii8Fv1sZYsy8rjI+C5SVQSCJLkzdCtpJLJOiuHgn9+wtU4ZUggFtc2imXj7WFS5WD2HFzNxrfJBLSDDwrFiCDAtbwNJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747269170; c=relaxed/simple;
	bh=UiIcXEy6ta617p/Qw33fSBKI/YQF/+25YRRnXBxysL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izzivdvcVsw5GSisjyAk/g8fxDoYAHKfN2snOvV4R6KsdL/0gs2OrXNt9+lVEFsJWcnqY5AJy1MSUaKahcSwvx7iAI/m7jjyJVH2CB4eLv7INFLlNteOlnzsOScVbBcYsnp5E4aqEuvW98SiHI3FPxBaa2jtAQHAOypfJMY1NSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyRGtW8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyRGtW8F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKAH2k030369
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jMX8MEuNbqB8c/F1/VjebPfy
	Bmoob4q2DgIFRmEpoZY=; b=FyRGtW8FJBxPZRuJS3HpFlnhHAVvxQb6Cx0f+4Du
	KvVR/9+TUAAOJnv8aVF0fjOfElZ4ooF1XRaPdjZkjATsKe+GNPdpORQgr/WocG8m
	Lmo6jOa6DcSqNGWLdeDbC/11ukij0qsmCpBk5gKZTaCNtTOb1w4+DaLWoD7+oFDN
	ZLxnVcAA6fr7HtQunJ1uKjd2386a2oqaS2FHRGEkOlszFw4yWRHDF5ae6sV2Ur4r
	OcNGUEsOhkiCEvyPWYTK8yBFPNnmWfJYD+Btnq6dzXmHL8rH4NZEkq7c//+CrN7V
	cEs/slPKYsALcfbzXVHc8Vqm6fdNpVUvwGhR/gKiRI9+zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnvfc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:32:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so92907785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747269167; x=1747873967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMX8MEuNbqB8c/F1/VjebPfyBmoob4q2DgIFRmEpoZY=;
        b=sCKLIP8Vdtdy+e/83lRqeNET2WBszRa6bQsiH/WXle8209SAWP57d0a5beVRnhvYVJ
         xTEUVle8zmVq0KH+pr3xWG8XI85RsFd3gfGcb3fHO+XOQii8eSXUga/4bWVU6XCwe+d2
         3eKNCpvN0lmFwtzsOpEiga6/28T8SdQEZm0gBKOA8126EVWjnazQZyUO7y+MTTjF6/ye
         zqTyxcPsxA44ySjXI842bq0hKOLPk784976l3raBEkZ3xZfqzlvyc5cvbmIQUwgCtA9H
         JZHBjtPrdLWgCCSC06WhX3/1Mxcuw0IMU07NA/xL3KarARFDJAeqfMugZXN0L6Jz2Usj
         qPpg==
X-Forwarded-Encrypted: i=1; AJvYcCUhsYW5sDtD0hYc9xduz239VVxyxdwE0YRO7613aJGuDNrnVJqLnsqOQIOlA45LCHlbPfq0guESwoL/HEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUM13LHEX3vyU76o2jB0l5vEvD6CImRMSlI0t2nVlHCLAR5J+D
	loDkanSYErXNWe+UmZ5ObQrBugef2EAd570gitMP4m/i2BgjrWKh+KX1/a/hiccZv/LqQl03rIX
	qkS6+02+x/VnDlxy3XYFpqMTDYwdYVZgxXZ3oq0fc5V0hxsC4D8VY5LUZBERO9Go=
X-Gm-Gg: ASbGncuRHBY4/PFRbGTyrQY/dtCcwn3luogMTk7aG00uS+I4vojEAEQaoMvuk02BLV4
	rkibmrkI1M7LFQNvYN9nvJwMlcKq/qvy6oPcNIpxjQhk0Hzpj0xy+oRFg+eZwXBmuWl03p7gjYG
	BST4tgutmpM+v55JpJjilg+blCo5o1Ipcx3Xe9TqkAwMRd4mmT6cXeV8Pv8yve9Ymui5AE9Aa0u
	tHo4Hgy8B2q06uTU39bgcoD6zm3ZmuT25MEiKTZAozlRwjp6VevFI5ENKENrUTbnAH0MsGnD+w7
	hREKIYrdb2GITbCWh1MoA8qHBqXVEZGvk4gIqFgi3BQTe+dsDips+jzt/zvtWkfMFl3gmW9WLdw
	=
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id af79cd13be357-7cd3c80a6cbmr61022085a.36.1747269166825;
        Wed, 14 May 2025 17:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1frL1HZd5yd5hFRUBJhSomzVm57HGiu4Y7gzv+uda4Y1bA5fiAlWFerS/koCTLMIP76ifNg==
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id af79cd13be357-7cd3c80a6cbmr61018085a.36.1747269166342;
        Wed, 14 May 2025 17:32:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cf90sm2401020e87.71.2025.05.14.17.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:32:45 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks
 struct
Message-ID: <2x3wyi2pfyax236zuixmk6xi2agooy77cn4goaejirlms4f7l5@7bhybz5llqtt>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dC8oGBJDATofPaS8WvtVSzRAmYIItCEX
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68253630 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ABbDsRMl8xt5kB7kq2cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfX76ftY8jGu5mj
 6ZV06IQQcvQE7XIepiL6fDl5f7CBafc7mzO4kgyP3c5Oey6qP0pD90NVCan47W88aVG9YVd+kwT
 VUY7fFgKAeJoSmjFrWs4Dt2CKIKJSTNApR3/H1vo3brykVWF74pm3+72eDZxmJ6aKcQGcoc7oeN
 wk3uKm8B44v+i9U7zf0i6WtwwGU/xCFZ9iDTNPDTXl8bUFzCUmtYJ/+++nlmn2oSlvquR3frOJs
 PGsgdbL2+ZjaRghGXTC0wCJMcxRdfuKWLe7GtI6a9YTGQTI+9vZVWloH7IkR+1WbEK5IYfpnhwT
 Rw+Y4MUyppw4unOIY0hIzjeDLiYOzMZwHebgj51AEktXK2lufK8qgeOh5sMuafMtX/CuDSvfyPU
 Zz0igdAp6qV4v5AkTz+Y5MNsV+wLtlw3fAYCF3K6eDQQhjxKlaG6IxemPtqC2kKaHEtUb051
X-Proofpoint-GUID: dC8oGBJDATofPaS8WvtVSzRAmYIItCEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=709 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150003

On Wed, May 14, 2025 at 04:52:29PM -0700, Jessica Zhang wrote:
> Drop the unused maxwidth field from the dpu_lm_sub_blks struct
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
