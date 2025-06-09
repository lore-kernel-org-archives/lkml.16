Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5063E273FD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472916; cv=none; b=IwWpmbXQsWx0imnru4izIhsmS0pFXR7mdr8nJgVt3aFhqW6H5eC/FzDQyfCMcXsRtvdj1cMMgGgVwvgNQHFJZ0e/kI2prqFbDXMxPXHM+4bXrTcJRuUvYfv7fVEW5QS6N1tr/7nIY6o/DBJdJrmi+bIon2rlFmzOeoWwSa3RGzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472916; c=relaxed/simple;
	bh=20P4XPeRJ2RbwWsg4Jb4N9ycm84hdZSwHbnUlygYa7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSbP9LsOHQREUMXOl3Y+Z3qlnAF0AgubT7iEYbb7+b1GLPRs4o+6zq9XMvvVQmGVPwE5CUDa4nBYyYaxrLB57p6yMZgKrGK93QMBFTNbpMMkRCvkPJ4qPC0JAMYzD/Anjsn+uIYK+Suhk1WUaw0oCRR1u1yHcWLEzHAMKvWWSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhtIJ5ND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhtIJ5ND"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599bqDc008107
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 12:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TFd/ZD//i6s5v7Vc3GowR/yA
	OLuzDoIe0lQqnp2Albc=; b=mhtIJ5NDGsN29fCI021CetegU6LuUwPgUwMV7OOb
	2JHy0ocVoiayNkIvIMNn+sTo+WCwy3e7wuWWSHFoD0pgudgiJUc7uhQyOKk1udbm
	2YNwi1BItGhHh5qp0f+GAvU1ZyGy1fuJMFojCdZexX2tuvhyMC2KJzTWLmWRTLXO
	/qq/rqI4oagLwnDd5rh4swfzsEl9/SzygA3+yzO2ddcnZWfh+kTSs1br/iRjDQlw
	Jxhpm6DNXaPOKGLozxJw3H9fw2xTcN8pmWHXzwsazTkVweNHLJOhuipwxyqH9GES
	tnCJZMgZvnl1IAjWpUxDlhVI4R257Erm5pMaR2H/PsaxiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x7f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:41:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so768505985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 05:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749472912; x=1750077712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFd/ZD//i6s5v7Vc3GowR/yAOLuzDoIe0lQqnp2Albc=;
        b=jG/xTolg/lIYUxR7dQfAz/jvIsR52VUgeU8eO1jgKiTiYKPkTRKCtSlxc9/559nAL3
         h7ihQVfd2SjXG4wfLKePyw6uOhdxLauGnlBji4IJieEpR8SydUJkYAqCUPJSBi1CCMEh
         b210n93kJNkAOluQVXkfsiTN0blwil8Esr6vMjsI3ZH7FiydW56GcuET0LfmHG2aFNGa
         +RGXq32/ONIUE3/1RVH6Wx0RbPiXYXRacz9cz8qpXZSWmv8S1nSuXw33XcIsSEg8bQZl
         L13VxDx7HjUBc6Zjek9EPQqk2NJsZGRF+/A0pb6rAQYtW116+4M95dOdFK2VlUDeUKaP
         1GFg==
X-Forwarded-Encrypted: i=1; AJvYcCXm7+sKM2DcCrbuHvyl8H2ulQc2J6L21U4IeMNZ5XQ38LAZ7v5xbfYK+qa3Wi9MmASMO2baUwWrAkCBsOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5rcIlUwvUW9OthPirtObYXBZr5CZ7+qBLOEGd1994OUEbo/V
	hPHNsPCvZwWQpQ6icfU5cAKCoPLKRe1swS+p+w16ScAB9WLu7srkKuZuXNEQZmTmuMcmpe998Zd
	jSHfcQvgITgI52suFqmLGkp3+GJj7rYnlAcmspa7mnTu0xU7P33KRdkeh3g6qOhhqH+SZkanwfG
	c=
X-Gm-Gg: ASbGncvzMlCUgOxuaikR/Xx+Q1zNX6LKJKq2fFJLwBOe6Ld/HUw4Mg0wzWKJhVl27gf
	BDrLf3WtgFw4coO1/5MtT8EtkyuFev46ySqcjJYDm3spWQAA5DPKtDU8tARu64olcxm+1SL2tBS
	PQwr+RsYif/MIANKwVNHkRHbDwAHtqu1qWCEuyQmMcp5+73MeQVhXqlP961ShfMJyXFhV/6RPTf
	dwyXSJciJHwgdU4L9WEAfz3aSEMIuva4JVaSaa8BmGXqdCeSTUFnbatiCazD17kOZS4tob8HjYv
	tjbjeZP+lXSOSV2BM27BIiKmR9lFwfjBRmJXlLaC9ckIaWaeytqUAym0ovrnLtW0sa31KEw5xA8
	=
X-Received: by 2002:a05:620a:240b:b0:7d3:9042:1092 with SMTP id af79cd13be357-7d390421272mr906609385a.40.1749472911547;
        Mon, 09 Jun 2025 05:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNgYZ/3CizvC9kMbujPb3JLe/UwcdAD4e5NZpxhvnGIPY44cJ/jZIFCJw+2xLOIYUG/cE+A==
X-Received: by 2002:a05:620a:240b:b0:7d3:9042:1092 with SMTP id af79cd13be357-7d390421272mr906605085a.40.1749472911098;
        Mon, 09 Jun 2025 05:41:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d0e36sm1133557e87.1.2025.06.09.05.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:41:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:41:48 +0300
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
Subject: Re: [PATCH v2 01/38] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts and drop panel drm_edid
Message-ID: <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: GyTzP5Ovhbgs29PW9rAJ-aNLzJMu_ctA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX+W/M9liTlGtK
 MZ/SHRUduWZzYVRVaCnQ4d84HVvEQdEek+qyZL7f0l06NmX2driHmb92p8Tnw6npKyfxOk7FWqs
 r3d3xOCKUYUhIHCWEmziKFS+En3S/Vs06u6rMDVJ/k9iMwv1yVXyY11k4fPvkWpSNWFY0q4mQqQ
 KAWkpiS8tH3jNv7i70K2aIntwwk5FfLmQwMJSv5G4/PmAHIxAVh3cayx4TutW7hyDIIGdrtMD+2
 VGTR04NWaixE1/iNi5Yhu9ET7OhyqUWZiHD8DbC7TRyPuBLGukrIeT/ZluWAsS9/zyFCKBttGwr
 CXXt5xJhZw1d2mv+fMjy1l+dQyp8ecCXbUpav1VbOgXev5vc0YFPiJ1iObLF95lhnNiDlIVPbbE
 PwJ0oCgdBhjCGOWd4W4BRTgrYUq/h39JRChEvf6Ll9EQ/02xOeZsYlLb34hXy0HwVLR5s4rn
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846d690 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=HhoKpUjQ_SR5QyaspAAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GyTzP5Ovhbgs29PW9rAJ-aNLzJMu_ctA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090094

On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In preparation of DP MST where link caps are read for the
> immediate downstream device and the edid is read through

EDID, not edid. Please review all your patches for up/down case.

> sideband messaging, split the msm_dp_panel_read_sink_caps() into
> two parts which read the link parameters and the edid parts
> respectively. Also drop the panel drm_edid cached as we actually
> don't need it.

Also => separate change. 

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 55 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
>  3 files changed, 40 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -389,7 +389,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>  
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = msm_dp_panel_read_link_caps(dp->panel);
> +	if (rc)
> +		goto end;
> +
> +	rc = msm_dp_panel_read_edid(dp->panel, connector);
>  	if (rc)
>  		goto end;
>  
> @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>  {
>  	msm_dp_audio_put(dp->audio);
> -	msm_dp_panel_put(dp->panel);
>  	msm_dp_aux_put(dp->aux);
>  }
>  
> @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		rc = PTR_ERR(dp->ctrl);
>  		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>  		dp->ctrl = NULL;
> -		goto error_ctrl;
> +		goto error_link;
>  	}
>  
>  	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
> @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		rc = PTR_ERR(dp->audio);
>  		pr_err("failed to initialize audio, rc = %d\n", rc);
>  		dp->audio = NULL;
> -		goto error_ctrl;
> +		goto error_link;
>  	}
>  
>  	return rc;
>  
> -error_ctrl:
> -	msm_dp_panel_put(dp->panel);
>  error_link:
>  	msm_dp_aux_put(dp->aux);
>  error:
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -118,14 +118,13 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>  	return min_supported_bpp;
>  }
>  
> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> -	struct drm_connector *connector)
> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
>  {
>  	int rc, bw_code;
>  	int count;
>  	struct msm_dp_panel_private *panel;
>  
> -	if (!msm_dp_panel || !connector) {
> +	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
>  		return -EINVAL;
>  	}
> @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  
>  	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
>  					 msm_dp_panel->downstream_ports);
> -	if (rc)
> -		return rc;
> +	return rc;
> +}
>  
> -	drm_edid_free(msm_dp_panel->drm_edid);
> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
> +{
> +	struct msm_dp_panel_private *panel;
> +	const struct drm_edid *drm_edid;
> +
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  
> -	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>  
> -	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
> +	drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!msm_dp_panel->drm_edid) {
> +	if (!drm_edid) {
>  		DRM_ERROR("panel edid read failed\n");
>  		/* check edid read fail is due to unplug */
>  		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
> -			rc = -ETIMEDOUT;
> -			goto end;
> +			return -ETIMEDOUT;
>  		}
>  	}
>  
> -end:
> -	return rc;
> +	return 0;
>  }
>  
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
> @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>  int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  	struct drm_connector *connector)
>  {
> +	struct msm_dp_panel_private *panel;
> +	const struct drm_edid *drm_edid;
> +
>  	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
>  		return -EINVAL;
>  	}
>  
> -	if (msm_dp_panel->drm_edid)
> -		return drm_edid_connector_add_modes(connector);
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> +
> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> +	drm_edid_connector_update(connector, drm_edid);

If EDID has been read and processed after HPD high event, why do we need
to re-read it again? Are we expecting that EDID will change?

>  
> -	return 0;
> +	return drm_edid_connector_add_modes(connector);
>  }
>  
>  static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
> @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>  void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_panel_private *panel;
> +	const struct drm_edid *drm_edid;
>  
>  	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
> @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>  	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  
>  	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> +		drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, &panel->aux->ddc);

And again....

> +
> +		if (!drm_edid)
> +			return;
> +
>  		/* FIXME: get rid of drm_edid_raw() */
> -		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
> +		const struct edid *edid = drm_edid_raw(drm_edid);
>  		u8 checksum;
>  
>  		if (edid)
> @@ -515,11 +528,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
>  
>  	return msm_dp_panel;
>  }
> -
> -void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
> -{
> -	if (!msm_dp_panel)
> -		return;
> -
> -	drm_edid_free(msm_dp_panel->drm_edid);
> -}

Too many changes to be stuffed under the hood of "Also perform foo"

> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 4906f4f09f2451cfed3c1007f38b4db7dfdb1d90..7f139478e1012d5b8f1f745f0de5fc3943745428 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -32,7 +32,6 @@ struct msm_dp_panel {
>  	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
>  
>  	struct msm_dp_link_info link_info;
> -	const struct drm_edid *drm_edid;
>  	struct drm_connector *connector;
>  	struct msm_dp_display_mode msm_dp_mode;
>  	struct msm_dp_panel_psr psr_cap;
> @@ -51,7 +50,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
> -			u32 mode_pclk_khz);
> +			      u32 mode_pclk_khz);
> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *dp_panel);
> +int msm_dp_panel_read_edid(struct msm_dp_panel *dp_panel, struct drm_connector *connector);
>  int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
> @@ -86,5 +87,4 @@ static inline bool is_lane_count_valid(u32 lane_count)
>  
>  struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>  			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
> -void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
>  #endif /* _DP_PANEL_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
