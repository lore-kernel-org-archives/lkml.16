Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09725A62B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478630; cv=none; b=qyINP15UgxrT3hL2iv/mmictXKKgjxAeAvusanlaCwdSvzS5N0DrYGvx75FzvS03PnfUNLUFdQLMepUUq+TrDzrphgw4Mewu+MdVAgDVJPbn3l8VgaHU8xUeDGEIn+iaKmmBhoSbxrJv/C/DXFNVQ/w3kYocshoGxkoIuw0995Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478630; c=relaxed/simple;
	bh=7TmqjE/3J68+p8PHnc05cQgPrrCp1xhthCW4Jma5mj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTkkY/3DsBsKcrBFRK7opuQbW/2sN4C4nyfyXGB5HojPIbTKo5YGQWh12ExQRtaG+H/QTK+PHv18gSYiVLJC01kIJL2i7EHUgJ2r1z+xhyAL+kHWQlbKSiofawQpMjc2B3QmvaherNcVackynonAzWozl3kYIkUHaA6FXz+twHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgGY+WkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgGY+WkX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55998rat021969
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aVI7bwlPGVd8Av54c0R1XNDW
	MOUYLmY37xlJhTSHOiY=; b=VgGY+WkXGoS8+3WLnJDc+9R3ASU1McKGz4DffR/v
	00K9+8PYYRTeFvLDBix/2Q31EYKhCmWogRfcfZrpQrbfXRKTS+mazgfw2anFgB1R
	BBTOrLcqvl28eQGhdfHCOc1v1ACGQv4npIxJm1w/w5xh229o5WvMX6iz7ulUuIK6
	O/1UokFeta5pvrujRqGRjTsZwzRAji9r3XBVTTYq4cZ9m3slcmIyij2rhr3Vd7I3
	bhMpfeDcAlxWNgE/YrYOpiRNS9X+77EJQxhPsTh4SDnuyu3ZL81lIeR1EMPaRccP
	yEPHcWvVos7adGwyqwWBBxY80iRTRRh11E+nsDNQTYj79A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6je2gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:17:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399065d55so83544285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478626; x=1750083426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVI7bwlPGVd8Av54c0R1XNDWMOUYLmY37xlJhTSHOiY=;
        b=KxVheRgt7OHPKcbfM/c/bf/iHLKq0qN9L3/7pB/T3/xoathn2MtmfKKg41bRGLC0f3
         udLhIHhTcm0WHztsXErf3H8AgymRttvpjlw8sEBLnXQ1mNkJLR6pvj5eI2uEp8MwJ6+T
         SYGQVOd9JgnAsx1TBO7u5XHbKbaLnuD43PnX3KeeLrqp035jUwrnQmKDTS+YMbDuhMuJ
         WSe1NjKsT9OafSZc9PqWNSedq35kgnQrNX2mRPvSJYRoybfzEaKKSep7vVjbVd3qCTKe
         w2CidWb+eVxUJY4MEUBf6w93wklMotpTCLyGMtTsDx20H008CVsvHQW5GrcNv1/fxH9N
         Cvrw==
X-Forwarded-Encrypted: i=1; AJvYcCWa0fjiIV1JbRz5cRiIEeDkWU21Gv+5bizc469cOvn/w73cOFJupiHRyQrGoEFwTzXHq+T5aoEFypatfbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNXNbM+Rci7+UAEmR8rzTpKGWitsWcZFxlthEpTo9jUM00wF3
	TE3YgK9cdjnCZ7UjXx9g8t4jfEm54/3959v1nmoOP+dajkCImZ+XueBrLRgxRa3SgfDFvDom+G3
	fcWWx9lE3spPTpuRp7mIic+Awq1T4IWHVgYgl93BkuwDLpiN/k/9k75hw/KZJZY3ctj4=
X-Gm-Gg: ASbGncsNA9J6UUAq6AR/mY5+6UMpF5cSXdVZQOeKb0fvUcwyuZw27mVXy8Jjzlg+aX1
	3TBsIvGUa91E+YOTGow6en8ILNrD8iOz/qLoGmfIUeTWfj1BJHfnOdnhh5ArNRzSPPPwVwABP59
	1evnBCQn/WYzLzTgj9iDN4VVigdhf0UWlrPtLKrmE8VnNy/6623Y+9SIHnpmowFhPwyVf+mA+xD
	hOs3vVmIc4O1bL4AlRFinTWOnOB++tXREDDgwS4JDCOAo+CQu7L7Xug01L6yR/koHKKod/rY+Mq
	z0hxDMppNklE78AEHSIG1s6+5EO20vtw6FhN4lld4Tuu8qDAssFqLXo7h0+64150UIVGf4KjUlI
	=
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id af79cd13be357-7d22986ec80mr1995013785a.18.1749478625622;
        Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVnzslQ94N1zxxegjmppOQmspczMZd4IHKM4NH9MnXEl7WiguTQ9BljuHGN9i9ooyXLGUUCQ==
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id af79cd13be357-7d22986ec80mr1995009685a.18.1749478625147;
        Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7118sm1173826e87.54.2025.06.09.07.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:17:04 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:17:02 +0300
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
Subject: Re: [PATCH v2 33/38] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6846ece3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3qYReTC3F8QknLo2NzEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OklKke7dhSKjcpdxZsgtfS5LBj_F9FR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNCBTYWx0ZWRfXwGeKGurv0V6t
 OSd7c9F6xhj6yFd6jFhLIyyxPQkdg1OdKVx64bNTmrEFWKE8pQWP2pi6PZ8BWugkWp3G9nrfdeQ
 LEaaYn/TJcaRGPzrjmTZ7WR/8Fauu2c09NxQX3zn4ZFub4zQxN4I3K6aPi3DT42Wa84+m2AGea4
 ifkKojD3B4WrDETI0cNIm76OctF0tfJVQ7jgN/h7+V22gAmKrCXucEtFfA/UV4bIwGxjk/R3swP
 MPqvDz1XUPsbj0oyogUm0J0SxBzuLWhcKSPKl7z5anRfaAZ4b4IO6Gcdt+52r0+VXRn54BrSCGh
 grY7wAIkwHMdReqk6pODQohUejBsyS+z2vN4BqZlBCl7uCVw4Qg0K3wlOfJonA96GGJfDeDXGHO
 6fC3qUvRUXUoZlI9RkgZHz0tLZtDgGsKovKWXRzed0wSb3kisHWZQno8S4aA5latDHzDFqmC
X-Proofpoint-GUID: OklKke7dhSKjcpdxZsgtfS5LBj_F9FR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090104

On Mon, Jun 09, 2025 at 08:21:52PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Initiliaze a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++

Please don't mix DP and DPU changes in a single patch.

>  drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>  		if (!priv->dp[i])
> @@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +
> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>  	return connector_type;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	struct msm_dp_display_private *dp_priv;
> +
> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp_priv->max_stream;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);

What's the point in this oneliner?

> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
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
