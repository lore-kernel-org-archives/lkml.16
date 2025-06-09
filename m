Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9982459FF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479263; cv=none; b=J3n7bpa+c3EVDBMRi+o10N3K7XzGQr2Tjrz9L4gB5LAXmc9a1M0xejeJPv2xykAPeHF5z5BRMfyPCOC9KwvqQx1rqc0rOU0OlYohIzizpiKp7w1SHgbrK+sRFi/InM8+F7ytHLWU/rRzeFSWB6hmrBwdTdShV+6iR0KwGBxemQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479263; c=relaxed/simple;
	bh=LLzqVkhm3akqetdtHVs9jDypIRISAdJXK5ZFhM4Ok1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIL0w9REn8LH66cHzgI67m4oGzdr9qXkRny722aG6oaVVoIjGocbjywcoRGh3lkQ2UHqKol72+rGmN/NK+x02XUmbzwqvk9HgH9L3z/t13zd3G8merg8hKfwgD4I9G4rLuz6oo9abli5FAF8uE1VwEdc88Hyd6HcN99i+z0OtE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGlxAggo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGlxAggo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598OgJY002426
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f/of6TTom4AU2Dvwq6I7gBZ0
	T1k7Wh85jIn8qO8HSos=; b=PGlxAggo6JmRUYZlnbJIreFKI7ywwLexQnAwMDm3
	UfrYRr4rudsM8In0zflz6G8VheoNGziyS+GzNcxC/9brNVKjhtpdWKeGt9VGZsis
	CxUtIKazhK/1DoWawXaYKewuojWxLuImek6oGgC8asE32EVZ5sdC4xEmM2Ltblf6
	HK2WQM3LX2LFrs+hrDH7VMk4kNHwfsuTBgWLKoK7ljUSB19XGyFAMIp3sSqymJip
	tGJrIH8W76wzZViQ9wRIe6kbMMvpGdSJrOV7ifro9R+Sijhyszy4TQsQHcDWr7ko
	eXv1D8yEBAxqJ6Ba1m9X8layu2zZf4xSqKg5Y8oxMf2i8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y11sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:27:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso117822246d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479258; x=1750084058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/of6TTom4AU2Dvwq6I7gBZ0T1k7Wh85jIn8qO8HSos=;
        b=m3zTgaLhQEF8GOYprJfxzJQEc6RV33CheRcfMLhi7WomOoU2Xfvh17pmClikKeXwPT
         4ZmKkC2W4shbHxuI5+pVyE/645E9OFViIqa89uOqJHE2ZFWEnrRYUvwh0b1f8erpQiEC
         VD6TY8Dh22dCwRZsIg8LZ3rXFw3O58pI5fmRbUMOe3NU9KEWrmfbSQa8t09IafxRtyIt
         MsyrWD2+OE+dIxh0tMsQ5Vw6lqx6Ne8S506wBrEl8KV5U6zZFqt6PdD5Z4c/BSSP2qUV
         /3BJc3JI814y8MAeBE0LQIsGYmPVKZk59j7QejLw2kAtV+SVg7yUuDsVqHjzElhGPZsR
         lXqw==
X-Forwarded-Encrypted: i=1; AJvYcCWTOygovC8E3sknMlZF9mROPBXkKMWRj8+7Hq3kZ7+lvby8aKex6bnhEDF4LIM5WCWEHO+BK21VTaNE7hE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgISd7CX+yqFmrT45jTOj/EUjfZDVdPGy8anGgTNbxmUIwyzm3
	QW4eXie+ndpN6mlMEPDbspclwJkWlGiRDd0dTCldWGZ6lqzmSr6EMfavzWqJbtryw86LRxGnnUh
	xnMn+/S7lDoLpYnbZqUKwohlGwALou2nSJvqrTIn7+1CAaF8+RTbQXvhNL+G/eQIkT40=
X-Gm-Gg: ASbGncvysbyqV+TRBl9zA5doukisFpoe0+HWiNE2z6byie7iVa9I5aSSohm/ZyRzhnm
	AeCuJeuReJ+qIT5E090MH74D2qjduQrrsOx4EpBSKX5+6lmRGPnwg5d2iGju+INTe68S0cS6hxB
	4dM+Z6okIMkHm0nKTSE91NsmMZQDEr7Vm0xGQOkCYxOKBbzq7qYgTPZbxWw9H1bAPBmkQMaktet
	nl5MbaK/mJmVjvB+blfVxPzqgTvrjSe22C+wXGwajbj8BJRjAizkdKJKvd6YoH5HIsX9qFMDa8X
	dAPs4K6LJLNkK6TTM5VuznsuT298g0tB8yqGUebCXw5M027CqJG5nHdvQJkzNFnrT1F8vf2Nmng
	PHgIaK6dsMA==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id 6a1803df08f44-6fb0905b95fmr180867526d6.44.1749479258403;
        Mon, 09 Jun 2025 07:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENywj9pL8N2WDsT8WlwUxJkuPyVSuk0P83Ce8cs9bs9NhhCmWwbrm8PLpnm0ddvieJHs32lA==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id 6a1803df08f44-6fb0905b95fmr180867086d6.44.1749479257879;
        Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677222edsm1176230e87.122.2025.06.09.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 34/38] drm/msm/dp: initialize dp_mst module for each
 DP MST controller
Message-ID: <oy4inbe4jg5gw77sgrkcgi7b442fqc4muiuwse5bffbftpmcbn@ajqbpxorszk6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX4IR07Uum1c2R
 fKx0pr4fPLKcqEhjbtA3yB9LNCtXN0K+5jlZNJQImRcrqtHpfsPPdBb2cE5Mw07DhsN/5z7IGqT
 /tdEl1ZfCdUsebjNt1DKHKNimJtU+dJCl6M6unufn6j+ZRz42QQ12Psj+TC1lB21QYiiKphpolZ
 D0VNUJy6hK5F44EVLgmgyHIdoL3Gva1hshtoH7bj1LNr1JMEfFZjhpJEwwzGW+ndZXtQXE2VKBY
 /jJaS0TzrgTtiEVBo6tKJybo6mhBK1mt2rbBPVaSbPuWy2xfW4KvVh0S9rEFHsQUdwPzgIc/YPq
 bvHYXWQIIobG9JWDKpZ9RBcpqcf92uJ2qYQD/jFUVavUoEFAOmrKdbZ2z06nqTEMfRQsBDtZwpS
 q2QJPexbzzIxR+fPwZkdXJgqjcX7Ty82mVBpSNlCGpaa/BKlOiAUd8at6GgXeebobGXnzbva
X-Proofpoint-GUID: SDHZwZINon9mWm6WIKPPWJsX9F1FlGtZ
X-Proofpoint-ORIG-GUID: SDHZwZINon9mWm6WIKPPWJsX9F1FlGtZ
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846ef5d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ziSFFFU8-FvEhn5Yk-UA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090106

On Mon, Jun 09, 2025 at 08:21:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For each MST capable DP controller, initialize a dp_mst module to
> manage its DP MST operations. The DP MST module for each controller
> is the central entity to manage its topology related operations as
> well as interfacing with the rest of the DP driver.

I think there is an ordering issue. Previos patch has already registered
MST-related objects, but only this patch provides a way to init it.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
>  drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7..e030476dc4c69448886c29bcfe8ff3105949b129 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -680,6 +680,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
>  
>  		if (stream_cnt > 1) {
> +			rc = msm_dp_mst_register(priv->dp[i]);
> +			if (rc) {
> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
> +				return rc;
> +			}
> +
>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>  				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8..526389c718edccbac9b5a91e8dabf0d84ed1a8b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1667,6 +1667,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> +int msm_dp_mst_register(struct msm_dp *dp)
> +{
> +	struct msm_dp_display_private *dp_display;
> +
> +	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	return msm_dp_mst_init(dp, dp_display->max_stream, dp_display->aux);

Inline

> +}
> +
>  void msm_dp_display_atomic_prepare(struct msm_dp *dp)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index dd403107b640ee5ef333d2773b52e38e3869155f..1496700c38ad73d6edcf56fbb0ebf66505c608bf 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -374,6 +374,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
>  int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +int msm_dp_mst_register(struct msm_dp *dp_display);
>  
>  #else
>  static inline int __init msm_dp_register(void)
> @@ -401,6 +402,11 @@ static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_e
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
