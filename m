Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6045219EB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474329; cv=none; b=qToTT4s81q2qh7TPk+kYL37cnePVX9TzGpG/Qm/6TqZkeN7/qbbOiLNyHxNDWtf1m7CTN3XfYsWbE/TC9KArDbt3/s/5qC4K69+hF4O4ECGGIyxX0tIoILK5mOmj62KPq9Bv/ftOwRBkGo0eDq4jVBNYXpuMN7aP2irg1Qf2XGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474329; c=relaxed/simple;
	bh=CyTywWegk+0yor0slgZnZWbPyKHGyckBx4eKm0eWBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTXxLvJlNyQkXSYH5FqDuPuvP9CTqOjh6lB5jhB8nqBy5D3oQRUsVwu6Oq041igEARSPZ/CMhwuUVqBx3tQeCrqiGQLrS2fAcMQTJ5Zys4OtyESpL6KCbE8UotzEdEvcOoutlhkMHQgahMb2440tJNyr2mTRQ1FIu1wu+NBTazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lB9G+JBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lB9G+JBK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599abHD000485
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 13:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7xkCVUQwqf7RIq+KwaSJ+GbN
	K/6py51WB61ukwc4n9A=; b=lB9G+JBKRDqQx8/SLtb4+Vz7y3LWXBALFUokCXRv
	xS/ojDQormalUxO0F4XVKuNJmUoq9rvSs+FWv9pyvi9HGOqWsxGRwV88uBLUrU7/
	sxQMHQAXnpd3mxwX/dhFDvbXsqIBqhBGyUwFIvZa/NG0sbfwlKoRqAuecZrsN1gI
	fwndSjbJ6dB8Z8ki2f8eCrq5w43xkD169DvvNa7UNELhvIKTJB5X8AXQtxmlvY1e
	rY62E8pYP9TPwZhNjrcb8eQCMO4dy87P5NbpBCK+IoOXlgWPSp4xyagneNSt/wmL
	Rn3H8BeM2S7uPpPByEbd3424okOCtiWwwrIVw/28PjrPqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x9gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:05:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a57fea76beso102847151cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474324; x=1750079124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xkCVUQwqf7RIq+KwaSJ+GbNK/6py51WB61ukwc4n9A=;
        b=FexBvQ+sJRDRgbcayAgQDgTCbu2gFlGEmpcJMzaSGQy2Z4Gzp8aM86gS6fS4cNRqtC
         LQ4F7NHHSPS6FWaiU1PsriYxn9aLip8OLCOI3Ga/tIQIlKbvIR64psdJ3ZOLh2yE1n/Y
         W4lJGyMziA1aMPnUtslf7OYFM1azVMBem2qxTpNAIVJsMZDIklj/1NS7iudMP/1nEFXC
         RN21C+IFshR4/Rn9sL2iw1N08FsJCvAp16WMgRt6mJWQOosLuUjXUdBF1ryTkSqIfalu
         5Otdwh6FFeFTXK30kSKfpbKYU7tLHpzZcIg6ZFqoYHcIQu8DRIV6N0ztXwKbgMBgMWPY
         du+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUxUUnaQ0y8Df5LqfbCiT4QwoteikarhFxUiSi0uDkel9iCmoHv38KrEwNVuYl0k3hpymWAmG4yJDO6aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFPaCvGnph/6YotHKlZK9y4XuwTE+0LgUFcSakfz6J6vUKp53
	97Cd4wXM7qd9sH4vfVoupr2wy8gptyrHcoUN7Ara+HhaP2kvTc9pTOj73dvxV2UcK7FUHYoOlJM
	Tu/DVZ7izQ8ZIdJDg18+ecdGHhmyIcbwAzFEGCpN+wYqWHKivj5e9pYrPhpwqloLj/5oMwXwBMS
	I=
X-Gm-Gg: ASbGncu/KbCHf9oYPh78wSeHmIThY9xKoptTd2t2E7s/CI7m9lQ179xG5WTNDd91BJZ
	cbtok6W7lkv6RBBmzvD96N10HwCLaWkj0gDuRTAOgP+8WF/0kkExfIhHIggn1YYf1aqDvdjUW9m
	W8MUINd/NQxcPCYdqGiTMks9QfnKMoMDEA4dVZds2oqwHJNI9tP60BvSr8Gf5u/6SAg2iBKPNcq
	rc2+tABxMDatFUjGQoLpsaWR989YHkvNur+FYmjmVKBPXIYjJLecUWqBPLFPljhOyDW6fBGsZD/
	S0xO6mGdzNb/dJLCtQ0axu8KDIO0FuUXM7fbjM25VFevhVTe0BvO+COor/9B1exj0UCAnP0s6Fg
	9CeHgL+pX8w==
X-Received: by 2002:a05:622a:5e12:b0:48e:5cda:d04e with SMTP id d75a77b69052e-4a5b9d7a8ebmr207421041cf.36.1749474324093;
        Mon, 09 Jun 2025 06:05:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEanFjvz+Pab/BnSn6wIWlNME2jCR2jQzVdPVbp6lEZBUiSoLG6wPdevQH+wVkpMZKGh9CrVw==
X-Received: by 2002:a05:6e02:1a2d:b0:3dc:7c44:cff9 with SMTP id e9e14a558f8ab-3ddce494e22mr142829055ab.8.1749474310150;
        Mon, 09 Jun 2025 06:05:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a429sm1139330e87.147.2025.06.09.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:05:07 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:05:06 +0300
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
Subject: Re: [PATCH v2 04/38] drm/msm/dp: re-arrange dp_display_disable()
 into functional parts
Message-ID: <ikvsacoatahnmjff4c762cpq6lvmr6cavlbjw6z7oyrvuno5hp@mykq3ts2hhbw>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: vL_-yH1KzqEvR3sNmaPwK11c2rvZ7yEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NSBTYWx0ZWRfXwCKJzm/Hk4Gq
 pXVCVOpjLZXYbI8HnvdzpRxVKdVkN9ki8PmB94NmAPP1JwaQHRJSN1AdpSgpxjGgxwu0zq/fnI5
 FNXPagI8neV0O2c2dmaTgJy+sGhbwBh9Y8a5gPw6iaYl+b9CF20HAQWfyvNp6xI2PSGxCwrD3na
 EJgdFaRpMmBpiEareS+SGj1iZaI/bw88tbOLHzRme4jnXtHfIaGj/UMWofU81kR4j0SfLRAyARE
 K3qHgzlch+xzWno6oQsh18JIVAk73Xn9wWLi06CSScAXOPCHeAgxNW8fic+pduOb+egA5NBN6Vz
 2Hj0wsnVk77w0TiEWMcbRtfBl3GxPxH8MPwjzHQNkjd7P1WnaToo5j0tUa5QtsV6FSGYcSNIgK+
 0F3OnPlRmOJRpzuZ8YTgRWOWDOcEhvoHmzhHtxaUbQ7ruvBVFJVX4p+S92EvFvWevoGHjzY2
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846dc16 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yxpq3E9kyWjuSYLohSwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vL_-yH1KzqEvR3sNmaPwK11c2rvZ7yEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090095

On Mon, Jun 09, 2025 at 08:21:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
>  3 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1e13ca81b0155a37a4ed7a2e83c918293d703a37..1ce3cca121d0c56b493e282c76eb9202371564cf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2081,30 +2081,31 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> -	struct phy *phy;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> -	phy = ctrl->phy;
> -
>  	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +}
>  
> -	/* set dongle to D3 (power off) mode */
> -	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)

I'm not a fan of (almost) one-line wrappers.

> +{
> +	struct msm_dp_ctrl_private *ctrl;
>  
> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	/* set dongle to D3 (power off) mode */
> +	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> +}
>  
> -	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	struct phy *phy;
>  
> -	phy_power_off(phy);
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +	phy = ctrl->phy;
>  
>  	/* aux channel down, reinit phy */
>  	phy_exit(phy);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 42745c912adbad7221c78f5cecefa730bfda1e75..edbe5766db74c4e4179141d895f9cb85e514f29b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -20,7 +20,6 @@ struct phy;
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -42,4 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5ac5dcf35b789f2bda052a2c17aae20aa48d8e18..a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -925,17 +925,15 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +
> +	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0) {
> -		/*
> -		 * irq_hpd with sink_count = 0
> -		 * hdmi unplugged out of dongle
> -		 */
> -		msm_dp_ctrl_off_link_stream(dp->ctrl);
> +		msm_dp_ctrl_psm_config(dp->ctrl);
> +		msm_dp_ctrl_off(dp->ctrl);
> +		/* re-init the PHY so that we can listen to Dongle disconnect */
> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
>  	} else {
> -		/*
> -		 * unplugged interrupt
> -		 * dongle unplugged out of DUT
> -		 */
>  		msm_dp_ctrl_off(dp->ctrl);
>  		msm_dp_display_host_phy_exit(dp);
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
