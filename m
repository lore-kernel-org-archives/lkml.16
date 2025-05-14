Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F6170A0B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250159; cv=none; b=MqSe63i2mhLT7uxg4bmTkz30JUeZD7qLyK/SzqiLiOBhB/gbrFpkL1bcR1gEiLC9UtZpHc1B6Lbdo5gSd0VDIpuLmBbNSiq3v3fCi3yf+ejpEuo46fYO/Z87J294wAdU3rEYmE+wLGY297khabxIybfaclBKZQp+Vtcl5nDMVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250159; c=relaxed/simple;
	bh=yGq0oWYOZL4p7OWYU2T+E/IR3DXTkh+/Q1gAyQq8y2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBqsVSQPAHkiS7ze0jfQjCjiqg8slr5+yVp/pkDEBDGw85X7NYAZyKu7tEM6fE6vGRT8jJzn6puESd3N77G/AvzzgbaS//4uF96gnalnptTI8wlO1y4DXRrVxW/xQ72n5pFj+x9OnJ7/nRjFLN9iI6DNJNgdSLjEH7Z6iwrZn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWhQUa+V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWhQUa+V"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvjq030369
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CSXJafEBndEZ4eDNGwf9CSLO
	amluuCqjk3lNWaZUCTs=; b=XWhQUa+V6rN2CsgxftM/tNuwyqZIhh8kyre0Sm98
	fmFSfoT33+sOOKx2N1rtffKE450g9zKSMuezD3zxgx9vFLHlUVzwsbR40vxb6CFX
	vXWyEVBhbwIQkVhMmEhjsLFZ2V84ru3hR6v2Wx4Cmx3fOAoOPusOT6mU1r5GwfM9
	3FNRyCQggbDrFHRtbJK5/Tgzz58H7T+j8IMFrgKQx3yIQ4svKaamvPptHW6tYSg/
	YDYxuHqaXYmeoJoexQVRi5cl7uDntwhiyO3MebE47dcw1GpL5FfQevN7oAEhzCyn
	0hMoBRue/7NUAGNZHfHp+jsK6hOIdS+SEm1DdBefDvKgdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuud1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so10470485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250156; x=1747854956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSXJafEBndEZ4eDNGwf9CSLOamluuCqjk3lNWaZUCTs=;
        b=FO+LUEmNXlUXsiv8Phaqz9PivwV1kSdVQVZYMZDKWOJt3WnNjHIiiHsnzSFOkfmLLz
         eb6MIShVtfmMNjmvQ7TMgxKYuFzu6l+tLXfqhv+QiraO/+foqybfqN9tbBpxndxrXRze
         xGNHbcCB2S1ObLfRRvgrqi5ONrzslgZ1pOFasYbz2tVbPTg0kV0AIQYnY6pWswKyR7m6
         Snb9ZRjTzBBNc30zCdEgn2uVeU4o/pwwVjoG78+ibJIk3gAnF9hTwYF8b3bk41DOc2TF
         AvSaIkFd05TLoObqtAJGzvN/xnHxhjdvAkWJ1Ei8Ck4lkKz/8/amprfwn1p3KCWxjNXN
         zRxw==
X-Forwarded-Encrypted: i=1; AJvYcCWjtytmY49rLbzBAxylZkzyJptZs5EFHoOnHbnAZN7/K/Q6Et6PWfP5mc/CfnazO+VlOYmi6gMLAIb6Wqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrdmm6LAFA8I6n0LNaILGy1bB1cUbWET+5oXh/6Ja7qv8L9FYU
	k6oX/r7Y++AdnuufrdwmhwOQOCQI1nTXngbgaqNYFv77h3jpvEp3zX8JRqONpYb0uF2KJjqFAB8
	Mwl3ZGntwr9eOL3AMHlhRnPjTziGYA1w0YCbAspcpwHQ+1+4s/XjNYY0t42B1qU0=
X-Gm-Gg: ASbGncsED8RSyfFEwsM9driYx5JOU+7nquzXUCsK0SVJZJ0dTq5Y4IMkjJvHUGoDTwH
	+nCLq9PlA8WFnc0F47WFC7yTh+O537IdRD4UNc/7diBb3NkNltGc9RITlXkQGSHgYtplk8GsbIx
	BhsNXggwbZw58LKswKT7WDvxogasUpAzda1QhFaVyOtFDE50EJQXw1fQelpPMlN3EcFRF+y80Qh
	nZYSvTmT7iQMHjvLEOoLwYe72YQwhB2/b3E9BMHPsRT94bwTjWmfKeAVZK8mYcBS0xI7tPjm/2I
	h5aO+ly9M6ZWwbf//TnXG0bxx5nGT8X4IzGnfW6NbY4vdmoLDgicfKMIvb4oXbyIogZRPJkydj4
	=
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7cd287f8f48mr580084785a.4.1747250155807;
        Wed, 14 May 2025 12:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+lsR3EGAqk/P0sGN2G8T8thDbUtAJQH3vvzCa+2jovpUXOQ2pgDytWPOHkOaAfe49pPOW3A==
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7cd287f8f48mr580080185a.4.1747250155227;
        Wed, 14 May 2025 12:15:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccb9csm2355737e87.234.2025.05.14.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:15:54 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 09/15] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <3btixgw42sg6qm63znc46msxeyzvutitokb6zxbxwftxyyuyw3@22rlivbf4gvn>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kEKi7lk2CQfHcRF3DYvujVh974TaI7uq
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824ebed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX/k4hZlnYH1ha
 tsHwVhbmPuUtcYOLz8obiHU01VZaIGfTjY0XVe+phDLwez2jWslxPRr5NRq+xnwh/PGgSpGlvFu
 LTvLetjNL4QOabP76kkWd++1qM3w4nCXX2EBZpELXuPbUlGri0l5shADA4f619fffN0AuMfopap
 CexTNgAzJkV02hzevPVYVS5nVi9Df+A1SEM5JH1TqOg24tCjr6YA+TbG89lOSLnQQIerb0JYJBb
 ZbnZ3GBmVaObQ1/RzP9Si6JHtLAKyISsSRPD8xyEpxjyqND1AUG/fRcVxeFXkF8GJDJ+CbIG83l
 i9sNSJFx7HK43WIKV8ypsr9T7RtvCt4A9oV7GxN75muC+Yzru2HAWjLeXkvwoWfN0qy6SK1XEVS
 swi3bjGoqb/y5PeqrhCUKNwVvTudqI7kAKx4gYlCTKYgll9mJ7tVbUw5NlxlHL426xwRgY9B
X-Proofpoint-GUID: kEKi7lk2CQfHcRF3DYvujVh974TaI7uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=766 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:29PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
