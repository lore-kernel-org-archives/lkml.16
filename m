Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977C63D544
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484275; cv=none; b=RBJ6Lw6YYlpK/s4HoGTdKNKVRxc48akP/3EbP7bwRt2uknPC9igGmV2BQwareFD1mz3cgDU+Tbh+s7VQ/gaJ8t+Jx+iX45xMDdwg/2xSmL0BEM9BZMywvJbzanIJCgXB5vjIGI8xjbyih/Ngoo+6/BCngEHkm5g5LadVE7ZCW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484275; c=relaxed/simple;
	bh=XcnysmDGWQ8SMFXmEv3YzKpufjaFYWlqPdE9ZRih4FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQCShz0gcgVP2eh6AUPNZmtSCXQMzZbbiiUPuLiNxUVjwqeMv9JDsLLLuYvxGjNvD+byr6vyl6WqOSZ6ZIGh6ER6y6z9GX2SypEDapOV3dUaKaVf4Q54sun4iwenvsGbdhrJe4fdBT6+Q9FxsnBDZUg7wx18dmHv4H+JRlnCi5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8DfLomd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8DfLomd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559ADqjW012672
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 15:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+GJtEmFeWWV7acoRA4FQCe7
	suMJMwpWj1BE28bV0Ww=; b=a8DfLomddNxsdSt1oNauMa1WiRDQR41rKMnCrldL
	mMbZS+/IXuFye+VD9bJ5A3IPH0PIk9ZQHS2pl/42durVPDVZ/+Slzt0/1CgxMQNz
	ZE56kus+FBFoFT0dtvQfc1fqdoKOohjkHS0Dp/N3XVkir9lTVPCCIQBN1XhG6Qi7
	0ZRCMWQuFPXeLhfBn3/5iu3r9ybN6c7566IQQH+4FMAIXLBzwDiZOMSfFbuXgvev
	HxJKMfB5c/08YpfcvkEbyOGViDnCJtNHpikWGLb0dVihNutLnZmd8YBDa/pVPQcG
	n0XufbzxXfYwKdep1aENBv997oPpLuuIi/vcS3U89Q0Xcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6esx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:51:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d2107d6b30so585514285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484271; x=1750089071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+GJtEmFeWWV7acoRA4FQCe7suMJMwpWj1BE28bV0Ww=;
        b=lyRIPrRZ9njzI4kLObBTiUm8vSalP39V/wnkBHh9wF9Jf722FAB3StYMXsSGgJP91d
         a1c1u8tpIa1gDFXUdd6c4IXn2PBRKWxaaWwwZDN/xvtFdaXXV4PCOEBnyNjupK8flmSh
         SbvZFz9Y4p5LMblBY/vSr/KbYhK3ljw71+yjU/QdmzW+fFZuxfmwxizpU0Q/irZMCvEm
         Z0MwWKDe16pwYWW7GlWlbYmi/nsH7UpyURgUU+w+gxyAtgVxa1NPkzBRla8vXDOzcKnt
         6tTdXG53B33lcHhTsIVsCkv44pTMta14W/mBNluJ5Mvv0ewAI8eawsq2O5m2KUB3pdNM
         nQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsZZP9t4H2Ll2wXNPj0vHwWIhSWUmT8Uz++RKoCF7OzwrCSwFAjEuSsm1d/OMC6QtaLe+VAwPqkhmxNpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+lYZAKC0QhWISwG2tYS5S1dUeWG5o29yEfcEE7DgNkwHVw/d
	Bf6O0d132r7sqQXa+Q8kWidSAV5mpNQAP5ikKLBFo7oTPxiac3hsO1h7aoH0rKxh/JiY9AfuUUo
	RJgU3sckK1z8maTJXXWedH21UWwzo0nRg64NSwVPwWZuXYciuXS13xxSXHinwUvoOlpw=
X-Gm-Gg: ASbGncuAPE3/8XYg13yEbHOgQQrWOH31gQ2DEMKuJVwPcGvbUc5Fvh6gvMwINkxwm9p
	hXLF6+IAhV4lgyUrUIzRLAekQnwm0MGgyB0xF1m83Sx67FfCDfdXNlLOLp9owYnv8ae8rSGJyNv
	NGh6L/OZc5uFP97WtAlkCaX/AfblwN91qjqezQCy6gIihojMzaU3MqsWyiQEUdUnPHMh8bdA6qg
	7qRu0FsDIXzftO4bMCTeA/eUeZJBaH4zHoy6gaxGPU/7Y5xIxJ+QJLbrNeyX7Bbc6o9vO7U5A3X
	wj4B7iZDWhp7RflS70Yviv8rSWub2aj2GfGZZplO+0BeBNdPfgNvTGkS/AQLMy8ig5exs5EGy0F
	Wl6QF4B0rCg==
X-Received: by 2002:a05:620a:2694:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7d22985b912mr1886684985a.10.1749484271298;
        Mon, 09 Jun 2025 08:51:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkgTWv8MC/AitIaS/DA4ob4l3D99JLGsatSu5WEducw95bQhwsH7AW9Oj21iwH8CSCiLhHEg==
X-Received: by 2002:a05:620a:2694:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7d22985b912mr1886681885a.10.1749484270922;
        Mon, 09 Jun 2025 08:51:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a817sm1205198e87.171.2025.06.09.08.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:51:10 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:51:08 +0300
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
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
X-Proofpoint-ORIG-GUID: vHx0w3vcaNH92iBqqVjesV5vl2ojvxzE
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684702f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=BF5CnLKeIFxmMbDrz1YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vHx0w3vcaNH92iBqqVjesV5vl2ojvxzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExNyBTYWx0ZWRfX55X57I4krorg
 Ao9H8fLknKxVyAHY93ak8mUsnwvc2Uy5neebYR7dJkSQjvSLrAEhvoPNSO0wc0cJ+1nGAoPAXTT
 +E30hwNRfeDcA6EhoZl+ZhgUOzTdx3jXqcgBfrYruQ651ZAp+FVuUWHZF0lF6xaPtDwIKBjXlB7
 wnNZd0/G/Vn8QjvRW83oMIAoZ6w5ls+Pu8UIHhbOkQA0wY4baSDK5uyt0DhEdVkBJeMijfCfzfY
 CBMmax8tDudAPEQWUkW32Mul88W8adx0eMU+DdbPbI+RGOzaajRBwp+J/AIntIuKcsai+67Cx18
 26VLChYTvfq+EPhpsv29pA1ZYE3rg8xqdCyKB0TMTmmWzmxjZES8rMMDvTVFztBZn4gJGBMkY6F
 fswv7ARM3GUYKW5YNeFmfBF5f8GqCRViMoo5+WLuxeltzdht0NvtOBorMocZwmKFX1Gs4zMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090117

On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>  2 files changed, 518 insertions(+)

> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    const struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp *dp_display;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst *mst;
> +	u16 full_pbn, required_pbn;
> +	int available_slots, required_slots;
> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> +	int i, slots_in_use = 0, active_enc_cnt = 0;
> +	const u32 tot_slots = 63;
> +
> +	if (drm_connector_is_unregistered(connector))
> +		return 0;
> +
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	dp_display = mst_conn->msm_dp;
> +	mst = dp_display->msm_dp_mst;
> +	mst_port = mst_conn->mst_port;
> +	dp_panel = mst_conn->dp_panel;
> +
> +	if (!dp_panel || !mst_port)
> +		return MODE_ERROR;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
> +		if (dp_bridge_state->connector &&
> +		    dp_bridge_state->connector != connector) {
> +			active_enc_cnt++;
> +			slots_in_use += dp_bridge_state->num_slots;
> +		}
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX) {
> +		full_pbn = mst_port->full_pbn;
> +		available_slots = tot_slots - slots_in_use;
> +	} else {
> +		DRM_ERROR("all mst streams are active\n");
> +		return MODE_BAD;
> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> +
> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> +
> +	if (required_pbn > full_pbn || required_slots > available_slots) {
> +		drm_dbg_dp(dp_display->drm_dev,
> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn,
> +			   required_slots, available_slots);
> +		return MODE_BAD;
> +	}

I almost missed this. Could you please point me, do other drivers
perform mode_valid() check based on the current slots available or not?
Could you please point me to the relevant code in other drivers? Because
it doesn't look correct to me. The mode on the screen remains valid no
matter if I plug or unplug other devices. The atomic_check() should fail
if we don't have enough resources (which includes slots).

> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> +}
> +

-- 
With best wishes
Dmitry
