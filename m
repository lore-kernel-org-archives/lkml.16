Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20E1E505
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480253; cv=none; b=ZBhKqPhdhFv9DQSuKgmC1qSULUuEsgKF/Eu80mgeO3vGVmadERmZ9B6e55HaNggM4nxzG75LU2r86CNBuPWsQy5HD0YOAFkZa2ClH5v3G1O/OIeuTSC6mT1QBJQ0PlcOgRzToIu91GHE4I3UsP/1jtdYUIS/M5U/nfafBD4ZPK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480253; c=relaxed/simple;
	bh=wQjEsSlZfkHE70GZWZGvTokM1OCVTLMGItd9QPeViwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln+V+e5JxtymoyCYAX1tVQKLwk4fU16ZmVzVkMCTcROER3RQs5Y6O4vXZK53zZkQ/t7nWbrZb/uNb+byrMEk7Vchy7DEZnMjGs7LCLaBeZPcSLDamBKHrU2uc5PLVd2edfBLK7gbNtlR2IvuZ77I1S6QyqDnoVmuCmBWyUnBitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxgdwTJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxgdwTJ9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599S2qM013230
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lk4qXVb6U7k62eOjUPKQPHc5tHe5IFjj55NY1+eMTE=; b=FxgdwTJ9vXIkOJKe
	uQSbiulWmFuqiuc24Ppr0U7TQiW+TWXnvCL07zOWelsZJO6W4/IV7Po+y4jmy14P
	CqRPEKs0zKgKLCSxNN65xg73JQwLEZQ3wc1TXQAlxgFqNNzrxH4eOUFEq5+vXak5
	2sdwgck43qG1KM+aiqqT3QqSJf8Z+fQW2kAXgzj9Hqsf+65+7vRcdE8DGOW2WzF4
	LDIN/iC3HveZtQBkGiEd2I7solFO6m9gojSvzPfmpdmJkEO1r/P7kUlVb1GwTRMO
	tCCvq+wYoq/LLyHU9zpuYUG9hfSnGiIG4iSicL8AIGLwNL78kbqgnZ04U3BRr5Fw
	pl81cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11xhvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:44:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so743157085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480248; x=1750085048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lk4qXVb6U7k62eOjUPKQPHc5tHe5IFjj55NY1+eMTE=;
        b=lHVtphXvMrafTqncul3TQWvyxs3c2uZOadkWksUXIlMCRF4JpRRvrYz1H/f3e+U0n8
         BWDMQAC8OBWYhnMQpU5E869UH8kOI+ZHEAMt0dF0lNTLeNTzMTpTpDOvewi/vPHJKmt4
         jtq0RUeo+eSUlgA9QtyK4MelM58sgcDWdrY8YgEjeKXcMTLWHqIyw5AeePP+aKgUlqPj
         lAbJciZvFN4kGdNCnLGVEl5qXmz9NjeezeE2EfPbV8YVLD5GzXjg3RW+u6BHS9gv+ldl
         /Bc4KLLtVDJ6Ve6cUuIl/H6e9JHlk7v8XikrqGh9kKlO0raDE/JrOA+VnqKPM5eutIfb
         +0uw==
X-Forwarded-Encrypted: i=1; AJvYcCU/iOeat8st1CoDqFChQghUwO2+zNajQEVMrc7NE+lFJ9XEf7dEP+cTY+HYjabic8gZEwGLChgew7Gbyw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzSbE+vGLjxEo5m3fPiapB9chI02/BsGvxWWDu+PA63LNzrS0
	xvkQtIrmar2y1Y3164Lfw3df18PZnmXh5hoFtO3BqzzgyXV5NkPxcx+rA8AuzMox7hYQW6MQpVk
	QoR05JUUbYiDeeGN3X59b8NIbTzRayeCafg5Ru5abS3R6uuGE8JUg4P9pJXt2eX9Ctqw=
X-Gm-Gg: ASbGnctLnNov8vbaUQAK4RMc8EmLPS5jDnnr5kNY9AwydICt3LIgzfCP6zyPR2Tc+Ra
	neWk6sWZBjWGKYKiFiJPD25fhUYjPY5dAmcbqA5ki1cLFwtRY9te9mmL/Zr81+ixssMf9APFl1v
	q9EPNIBXoQHmi3m+ZSjxa3MmxD7/AQ6NTx8LakJ+kLmd0Yb9Y+qNo43jx38oH+IBPOm/R09zIPJ
	SmMLjgE3syl5xPR8bheRjVMVh9GtyhtrDy38Jf3yf3n1nR+BulUQXDi1ueY5e3lmbJ/xm8Bwpc6
	slJSevdb+11bjftuZeevx6mQvN4KEHoi/GNIwP3aebit3ytmrJoKYtg+HpfREACC+jr5ptXRfHM
	=
X-Received: by 2002:a05:620a:2a03:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d2298d6eaemr1815632585a.39.1749480247850;
        Mon, 09 Jun 2025 07:44:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsEWFGVkDlPTwmsMHbybN20i8t3PV7oDWgFQp0aJTKLiHA9vwJmMx+0ImeLu5tsgrrcimiw==
X-Received: by 2002:a05:620a:2a03:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d2298d6eaemr1815628285a.39.1749480247414;
        Mon, 09 Jun 2025 07:44:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722445sm1170794e87.130.2025.06.09.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:44:06 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:44:04 +0300
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
Subject: Re: [PATCH v2 35/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to
 get the intf id
Message-ID: <75k7tekvps6227tagfn6z5medhqn7zzkhii525aao46hndk4iw@6bto2vrqkgih>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: Lz5DFqDNQXSgh5ApnV6Mhs4jx577Yue0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX2u05hRfcbHYg
 MFoSvKgs2vaXKzwQVpQKBqEVvQKU4qnTd/v/09L/ranNL3hBJ9Cgjk3FaiqVU/ZXpOd5TQ/fhPQ
 EZ+jQJNBpF9BV6pwMcVXdrhoBrYBNVAPts9HIgrQVoJZ+e75m9lHKKu9HPjKeh3znjJ2wnKVlqF
 kKk3/MTKEd/JMsJpeNKQXwmXYc4J7SF+/O6fXupVKnfwXqSxIMYW07WYchecL3OMQP+0/ynh0S0
 EZEKuxcuEwYNtqBGW3CkuZ6z0YjIlD6tHmqZNmHV1VNzfKuacAdJkj/hJujtlZSgk7UC0AmuHUr
 SeyPE/AZ7m+lYz4Jq6LUEvM4kepbuilsniT0C5Fb48exsrQyD3BDtb6NKxqkiPF9K/aH0D6ElBs
 XWYzDqnKykOLDrFOBsfDsPXmKmK4eC36ajuwU3vc2EtYhbw5WnZQMTkRSE8LdW9/GbzmpXxq
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846f339 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ax9iHmw9lJn8B8Mg6a4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Lz5DFqDNQXSgh5ApnV6Mhs4jx577Yue0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090108

On Mon, Jun 09, 2025 at 08:21:54PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 ++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 43 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +-
>  3 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7020098360e474ee149824a488d912a7ad8ed06a..75cc2d475440fcdc941aa9eb19e78a87e83b5f5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2611,11 +2611,13 @@ uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
>  
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
> -				 struct msm_display_info *disp_info)
> +				 struct msm_display_info *disp_info,
> +				 int drm_enc_mode)

Rather than passing additional argument with very special case, I'd
prefer if you expanded dpu_intf_type enum.

>  {
>  	int ret = 0;
>  	int i = 0;
>  	struct dpu_enc_phys_init_params phys_params;
> +	u32 intf_id;
>  
>  	if (!dpu_enc) {
>  		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
> @@ -2658,9 +2660,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>  				i, controller_id, phys_params.split_role);
>  
> -		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> -							   disp_info->intf_type,
> -							   controller_id);
> +		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
> +			intf_id = dpu_kms_get_mst_intf_id(dpu_kms, controller_id,
> +							     disp_info->stream_id);
> +			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
> +				  disp_info->stream_id);

If stream_id was a part of the h_tile_instance[] (e.g. by using high
bits of the ID), then there is no need to patch this function at all:
pass DP_CONTROLLER_n | DP_MST_STREAM(m) through h_tile_instance, then
parse it in dpu_encoder_get_intf().

> +			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
> +
> +		} else {
> +			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> +								   disp_info->intf_type,
> +								   controller_id);
> +		}
>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> @@ -2760,7 +2771,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	mutex_init(&dpu_enc->enc_lock);
>  	mutex_init(&dpu_enc->rc_lock);
>  
> -	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> +	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
>  	if (ret) {
>  		DPU_ERROR("failed to setup encoder\n");
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e030476dc4c69448886c29bcfe8ff3105949b129..f82dcf7c6dd31f078bbe4afe55d4667a4867f0b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -574,6 +574,49 @@ static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
>  	return -EINVAL;
>  }
>  
> +u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id)
> +{

This goes logically next to dpu_encoder_get_intf().

> +	const struct dpu_mdss_cfg *catalog = dpu_kms->catalog;
> +	int i;
> +	int cnt = 0;
> +	u32 intf_id = INTF_0;
> +
> +	/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
> +	 * DPU_8_4_0 - DP Controller intf to stream Mapping
> +	 *
> +	 * +-------------+----------+----------+----------+----------+
> +	 * | stream_id   |    0     |    1     |    2     |    3     |
> +	 * +-------------+----------+----------+----------+----------+
> +	 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
> +	 * | DP1         | INTF_4   | INTF_8   |          |          |
> +	 * +-------------+----------+----------+----------+----------+
> +	 *
> +	 * DPU_9_2_0 - DP Controller intf to stream Mapping
> +	 *
> +	 * +-------------+----------+----------+
> +	 * | Controller  |    0     |    1     |
> +	 * +-------------+----------+----------+
> +	 * | DP0         | INTF_0   | INTF_3   |
> +	 * | DP1         | INTF_4   | INTF_8   |
> +	 * | DP2         | INTF_6   | INTF_7   |
> +	 * +-------------+----------+----------+
> +	 */
> +	for (i = 0; i < catalog->intf_count; i++) {
> +		const struct dpu_intf_cfg *intf = &catalog->intf[i];
> +
> +		if (intf->type == INTF_DP && controller_id == intf->controller_id) {
> +			if (cnt == stream_id) {
> +				intf_id = intf->id;
> +				break;
> +			}
> +
> +			cnt++;
> +		}
> +	}
> +
> +	return intf_id;
> +}
> +
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct msm_drm_private *priv,
>  				    struct dpu_kms *dpu_kms)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index a57ec2ec106083e8f93578e4307e8b13ae549c08..388cd8f84fd579ce30a69989be5ac116bb727878 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -168,5 +168,5 @@ int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  
>  unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
> -
> +u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id);
>  #endif /* __dpu_kms_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
