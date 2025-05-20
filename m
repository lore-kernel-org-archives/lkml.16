Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84919256C9D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776606; cv=none; b=FzzhY8aoOf/EbR36Wjjd9g78kPQ5azHd7kDq4WVRlb7pz4qQSQGcKS/bCoutycZRSo4BG30qXVL/n1EGC7KgBheC9QLMkXLY3Byykw3abdyyAQ5S1LGEwFaY3k5IF+h0J1WgerOEMe2fTzUu0on0t7KqvQWznZY79lsvh3mkgNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776606; c=relaxed/simple;
	bh=08+L51Dn57LL2+LU7AopFK66UrS0HEzgbWTWcFVWtps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PODHaG/MkJjKEGQI9A/xQRvS1ikTLNr4zq7F3/P4JYlYuxR+oNLRLMjryWnS9el0zUg5L9ErqhM1C66gL13S5jZIRAok4Cij1/IcSDfwmvVpFDqH1Zt3Lq8LnYgrCQVQLnR3z3tkMeStkSwI2v8/S5DJyt3LEG5/GuEYQcw19Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHCzveXQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHCzveXQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdpMe024730
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yp6gS6fiXRKVst4i/0JwkECc
	tK+Yj9KUJFbKtK5dEDM=; b=iHCzveXQmDV0zvg6HWoiNu4PI3BCnn+CyijSFMCQ
	yNR/imF0BhjPSk0zRXtsfmizj7CEQAQbGFlmN2GjfZkultGsPHkOIVLRq5sKRENK
	Z033bEmvEd0HyU9MPwBQoZfbQkzovi/Q8buD+TODgWteQszKgIbepDHDZgvn37Zi
	uL0ay/XuT5Q6CTah/7Hvx5FmI/rjIczKWlb0OWLbrnAqJOYliMUaAjSliv8d/hLy
	dL9Bbmj0XG5rtD8ZKz7YXcKgBP3VhR3w1EG4Jn4pI1QXDWvVu5p/dYvHCEeqURR+
	0AP5POt/Z36iTLDI0Y4u1w0o2zE/7xgJJmyCDo04g/xO8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf30nxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:30:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c8a36dddso66838156d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776602; x=1748381402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp6gS6fiXRKVst4i/0JwkECctK+Yj9KUJFbKtK5dEDM=;
        b=Kuih02eoL3M8AzoNB+ZdMNxam0Nnwze5gNNo2QAp8dcalg1VsQ8y4f0J55opSP9T4F
         dkP5h7Xv2/VsnALKtME46Z1kTVavHXg4TfZ1+er2n17bLgEN72OI4nSjBcpgwh5xfOO5
         PQv3fB01XSm3XBRQM0PJVLl+RxZi8TebWlH2JzS/SV+k7DKaAfJMTjzowivkaTR3qH1N
         L7JWfmq0xzIO+OfHNgsTtAsrpchQDX3Go6ZTUgbOQ9JiAF2MMuS1Qk4YTbNPrK40xyZ/
         jzhDDp2kywsAsHZAAx+3rrYd9SmcPVuK6Z0oFJFPX+Zxm9kICfiQNeF3EU7seYO3VFeH
         vG5w==
X-Forwarded-Encrypted: i=1; AJvYcCWM81/urft7ttFyIQRR2AcMKcBqoEbSAydIZZPXHbRL9C2jgCSScHSNf703bPkOcKeS9URtMVrlCBHZrVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlvBRQ9Hy1DumObco2BYYhVddIgVfTBw/6L0HZjgAyEUJVX0d
	YHxat+JDnAeze1UD7+rD5gsoLHY7/r5MvU+qE+JC+SOayZMMFBZDfe25rtLkmbFtub+srTersRc
	K05oPaT4NWKk6P5iQE4d2nYR1b12m3eDTnl9+G25MA2FJunRDCGSZe8TxGVii4D1GYU4=
X-Gm-Gg: ASbGnct7nzahciJ7aKwtlap4lW89P7cqCj+kxPDwNoB7BkJhXoXmiMn44KTMu17j4wj
	1+xJjJa2Pu33UB6M0Sfqs/jyeLxPAW1I2NdjxPvnF/H8YLqbXemzJ7JLdYDoTwYL0WzpLdfpXq/
	XFAMvjd/O3UD3o8n9u53w+FaNG7WkpqZJUHFjsY7vnPtm9qHQcyZsQvM3H/fT1nqVlAzsqEkHTN
	ivj+guCVKD+dA1Z51BaC+HK7up8emZtz+R9JsGIY4KqZ1+eXrBZbdqDrcbTGo0msSqfWoHeiVKC
	LufRZgbUmpKUwjTdoBipPZWQUQ6mkoMAv+jCRgYWMwbXwAJBzBWEEqggnSvQfOnuA1aM3jhjtaQ
	=
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id 6a1803df08f44-6f8b2d0fcf6mr190470486d6.30.1747776602229;
        Tue, 20 May 2025 14:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRHg3BPZjY/B10Mp1qFG51/Xus8QH5zLJpu0aZ2V7CVv1GX6G3h/VmPHQU5N4wG981wP+NUA==
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id 6a1803df08f44-6f8b2d0fcf6mr190470206d6.30.1747776601801;
        Tue, 20 May 2025 14:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc7d8a77sm582050e87.186.2025.05.20.14.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:30:00 -0700 (PDT)
Date: Wed, 21 May 2025 00:29:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
X-Proofpoint-ORIG-GUID: Nq_qZFZG4hp2dFrNUJUZm81UQfXNeBS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfX2EhR8vS9E0Em
 fdkEAEFS2MWE+Rab4mxf9pu9iPV9Po3ciVuaHU0xE/oXWTdDExZ4cmXgn1X9N/hm3iyqS0T4utR
 sjt5c2ALU/+Zmcf93jcRd0dfG4R6PHbXfzUDLprDhK4efgdBayqKX5iPPggH8W4D3t5j6BJ/hfa
 beXrJTs7zGBDAN+kIAkSjPI9ziPj9kUlrkXqaXgIaXP2CA1q2xqR2PSzqtBPWHlmvn6FLJyWpEr
 WeiI8TmQPBhlgik6K3lTXXwJQL6mhCsochtQKMjrKctbQ7ZwZPWmtfb7xQHALW8GZB1VCuNUwfH
 ywXqLUOag43/OC8CFBsCzoQK3rXFmSH3p65+NT0WQm8/+DvBdxLUfFfwqA1jbcnrg+OMSYt4NWM
 gHUIcHRZR5qixQS3TXn/LoST53J+scSxKi9PkaE5waU4/zAt98erMdSBc/ykHPpPVG6ldGXY
X-Proofpoint-GUID: Nq_qZFZG4hp2dFrNUJUZm81UQfXNeBS2
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682cf45b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=2NsQiy_ISMybaogD8ncA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173

On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   17 files changed, 6 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> 
> Why did you drop the version test here ?

bind_pingpong_blk is only available since DPU 5.x, the same set of
hardware as the DPU having DPU_CTL_ACTIVE_CFG.


-- 
With best wishes
Dmitry
