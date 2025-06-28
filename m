Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FFB1D8E10
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075929; cv=none; b=BGy6OTXNuP96tb54O/KcM/Drq7o0TZA46sLz0PE2wwENE0qhO5MywQPZDnF+ME0YVkdVVtwFx8bSwZFoDjEDUQbiYGAmOnBIeUby3Me6XXaNKedugy6RvUrDPJ4NrcVCLqpiXrQPXjJ9xbV2sUWo2oyQ7hEy5BnG7FbgV1MdYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075929; c=relaxed/simple;
	bh=d9LKJBFIUYg9q3j4nrEfRvvtZVZljnjssJcrM+FyHus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrluJ6cmThoCDxSntbgj8Ek58e9tM0U/5C33Srtf6IcPCJ/Yp29n0Bjesedn+WVdHi2NqfIA6T+4h5gRdV/p6VD6ow7JK47JXsZ8RcQ2wg1CImXkrwYU2Msk03IMM0JznHkKqDQerW/KmjJa2Eiisiw4kxHrfozpx3Q2zl9cnsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GScHrxCq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GScHrxCq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0sWbs001140
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eILDFaNaizkjDCv06c5JedL2
	Rc8EWoy8Yse02GiZCR4=; b=GScHrxCqgi9tyxBX6Eo06duCyR9cRm9KEoKX4rqs
	ATXdTfow8eA/ycegO2ld6PxL1Pqw33JVI2dAq/OI8GKRIWIUHrEeIghZmHKSn5qN
	qn/fgLcSw4EIux1UsJ7nw+cGz3X42wN8tOkMunrfDl7iXTmNgXRdb1uhKfJxVtkQ
	u9TutO5Qj+mMYJKrZqzrcli/wecZETmhounHe10uNZhPKT8DJ8G2d5szjm7miMVZ
	QXH01B2l1YL2WECZ3rrmgmY5r465MH8k6c75xcDO0AKiws15Dc53Hnl2nbYsriac
	Eb8AmGwlQSp+23XM4PYk+q3lw/Q9AUDk27BiOrqPhDqzWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa51pmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:58:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso418793585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075926; x=1751680726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eILDFaNaizkjDCv06c5JedL2Rc8EWoy8Yse02GiZCR4=;
        b=rvwYSI+ztV1Md7/L4ZgV0cD40x6PVXi57ty/Z2qL2lJJRmisHKGPZC5H3zcfcVHYVu
         bTFOo9oNd3Nap1epug+jJ2N6xoaYiI86hGt7XC8wCutrP1SSzFRb7kITueWZUnXNJCC7
         hvQr0lCT58ShFLJf5sMyxW0RScHdep/4kcwU077mQdsczum+2RQyGstg8j8DlaLger9v
         KrqGboJJI+d+1bj35Vrj1ewZm0mFGbxCuZAYuccnhPMC5dGc0BDR/Ac1fSBgoAxJSsGD
         uGrlPUxwu37o55dm+cl+7aUt3ZSt7d9FrV2Gxw8J+pu49g51rUQxFa++mA+6pn8vT+4h
         VTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW01TLvis54rsmEhEeYJuk6mLBwAPOsw+uBlqTuaDcYg2a1eHtVY9aS8Q0AuS4eZcoNObU7IuYZM/zO1vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6y8tDhyz0g8rD9uCnh234f3qET3jrFLhSEOTU/oO+x7toBXYx
	0QihOILr8nfbyYgwpPo3ZoGdCFQIZMlhV2ZVAMnvh6KNtakdXFEcAXKqvhnZhD7FMD+iVnbz76b
	5rmpVrC//7JecIG/yPDMNF6kc3aBZL5uiZI9AYUWzV46C4380hzQ8VZdAsuOSgGBmLaQ=
X-Gm-Gg: ASbGncuv4aNiW02N6XXKHQ+rntY00Pv7NtW1sl9CHEmvsaYxganJfCzRjBxwbiMaEn8
	mWqZMsxuaR910ihm99oAek8yE9ejgCEipiDsyaqCjQGqO0S2dWfrUES6g/MJBCMzBFeDqoyCHtX
	tdb4kw/r2PAmqz9sg6GDSo+dDS2DxFEQ4WDZhRN7lzIB5j/NvlUq1R/riJiqpmtAr1FWtfDYAS8
	CfkvczMLgYq8dpcbFTU6awycALAx0TY3aw2FpjIW/6HsIo2VU7tSl4upF7/vnfN2mS+qvrIIY6N
	F1ZOI4QNsxhUWbg+zJR7uUk+2rZ7EZprTDp7xHwDBCUQCF0kqHDYlu6w0xSJtv+hXj4jj/y8NfK
	rdZb98a+kdez9D1brHjtjpnFO07/P2U9jHcI=
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id af79cd13be357-7d443909ecemr804970785a.1.1751075926143;
        Fri, 27 Jun 2025 18:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe6lwj3S9nIkZY7XE5bY0HRz69nnX1UC0J0DFAUuThqtRm1AXCajgP7n99Gm5BwELT8jCm7Q==
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id af79cd13be357-7d443909ecemr804968785a.1.1751075925765;
        Fri, 27 Jun 2025 18:58:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f2532sm630248e87.252.2025.06.27.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:58:43 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
Message-ID: <tszvojm35xaq3fqx4kbpqh2wa5l5mk33yldsis3wkw2b4f3jc5@gok3fhryt52v>
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685f4c57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=z0jYOjsfy6L0UbeeUVAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aAcI0OUBlrpHviDdoYFBxPkMVfO9qwWh
X-Proofpoint-ORIG-GUID: aAcI0OUBlrpHviDdoYFBxPkMVfO9qwWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfXwugIOsV/eCHw
 putGEIYU0IEb1b6N0hYAd2Tz7KFZx6VyLupTX2HY602XrezeG3r2KUTimFMIbofOs88eMhp0YpX
 XC3ohX0MqpCTqP/6p2Qb1Bre6env54YNhTMSsZ8+ySgDypnTJAbSE/w2SPljnlml/dePLGuw8Ze
 wZ6tYKHm8kU3uyXRJ4aKb2dTv08euM8tDmc7yAMz0tnbxrOnuUf6j0MrcSWfpZndjgmc+B1Uzs8
 ZoeF53YIopQIVXAV3lp0SkA8B2ar+SJ7cFs75iMzAhUzLvgLS5IOooturs0o9cW3955CPlquLYY
 2Q76EAIJs6cyyiaRp1yktFTXnjznxYkCSoLxRc80FD2JscxJ9bI8CfN0aaOOJ7os6j1Jb7WWbDZ
 TmfI+1APRJUP49lht0ttoXZWY3jGbzbsWY4JFg0rvHN/weBLaG6Og767Ngf21QCOKD77RzR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013

On Fri, Jun 27, 2025 at 07:18:03PM +0200, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The change has been done with:
>    sed -i s/mpd4/mdp4/g *
> and the modified files have been compile tested.
> 
> Maybe the comment "/* TODO: do we need different pll in other cases? */" in
> mpd4_lvds_pll_init() can be removed as well.
> A similar comment was removed in mdp4_lcdc_encoder_init() in commit
> 9c2f63da6a70 ("drm/msm/mdp4: register the LVDS PLL as a clock provider")
> 
> This has been waiting in my own tree for years, and popped-up recently
> because of other changes in the same area.
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 38 +++++++++----------
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
