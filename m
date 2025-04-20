Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E11C07C3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745189785; cv=none; b=NKTwGq5MgOljRSexqo9s58L3EhaknjoAiVBBoYuES5NNoL0qT0wsB9yAWFzs8lbMzadpMHh+fBmW1bg+8rwN926szU4uUww+vYcrdNNF/wcYTZgDzXyQDSlScbV0lI/XrA6Tro/AECqMT0ogljTfqvCSjMEUxlcYTo+mvbme0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745189785; c=relaxed/simple;
	bh=IK7OiF08p1YZesUXi9Zowv13mhlCNtLX0nm7Zf41h/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GISKXSDtfjsbeM5u5FbKSpDTWGqxUOJiK6QkAHddcleXEwGAoqt43M4chYd9iU9Vg7ca/AHYWOdrL691BgFGtasj//lglJy9EcVAdexDaf3UKA0utuOnvuEi9B/yavsNa+vEF3l91pe23bgB3aSt/Sx4LV6/uWWx0JIbEZ5qeNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSEymIiQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSEymIiQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KLbHXB022552
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xvn+40VSMfKHw9Atpx6GI08HqlWsAWGLqMxnAItzGRw=; b=BSEymIiQ8U8vArr6
	PqR3V49zLVY0ra5VQINsF37QoBq9acBK7YH/Rvb6opHudyuhQ6qRiiL2JDQjVgeF
	tJF7KHLN+UI/0BGXnB30s9kxFLvHC5gflgkRYcYPW8UmNCWg/Rj1N5nsbGQ5ZhiC
	wTxdxHZqVJGu/Ioo01HeLZWbf1CyQRMZeenzstYViFXy6Zub9vDzUD7/kZsYHQcJ
	EWpL+wsvu6qH5T/N93KrG5EH9Qf6XheBQnLtprZEo7dUFQJABn4zL3r07rj2/emP
	tEJm8LFIwf2Y5co6kfpI3DizRyJ1mt5+TETWTXTiuM1NvhNEZQblGMXH3Wd+NoY2
	SiRH1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jajbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:56:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b3e4c176so74829626d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 15:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745189781; x=1745794581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvn+40VSMfKHw9Atpx6GI08HqlWsAWGLqMxnAItzGRw=;
        b=oufkHTEohnLTT4Ms0FICtymJXFSx3YT99Jvi8eg2drNw3sWz/W2cT0yit3y8KFU1eR
         o97HEnv3Uzv+S5af3S6T5iUP5k+JdpnSNNYNO7Nb8CtyCNx01ZV62d8iTkJllx+Aatck
         Dqp8YHqoJ+vhMPrt1CwEKTbyM/zpdnT2sR2jqSvjkt+jUjMgDbSsre8eQnTYQRsmrWvv
         G4uY7nLcVZH1K+xTAg8VeixMMkEtGiN+o+A1EROnloDz4vzgx5vSDuNPo/DvpJCn10Ly
         BYSfXCXCOCByuLlcoARoTtc5vSkOEFaSJPt09BdrgvjsX018olVS4vQF9EldyZnTYFON
         CGGg==
X-Forwarded-Encrypted: i=1; AJvYcCVlv/YmF63NWapSW8GnNbRReMoBvLF2dtkSvEzUQXLcay3Brv4tBEmMV5ae+YSqLZec599+z1Vq0t9AXd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgMbdDNsR9pvbcHvx53HmVKgphgGzim0g+KLAAyRO5T2jI7yP2
	Il2hW8U5kcHSMBn4xAn3gmK3KD16gdPnq2xxgL2EkfVJcKP/LLDTR9+1yg4WQiZcdSf2zfo04Ol
	ha93OrFbedgAOPMGhg+/R50LKcIU6Yy1kJw1U2VSCrR7ka4f8xMKk5Z4vpNFXDT0=
X-Gm-Gg: ASbGncupHkezJ2yrwQaMZcsrTLqWKVRi7M8UkJP9Sww/yZYUIPjJxMujvZmk59rR7+u
	zuuFoylKIcWpUDzIqL6c3TT5NjrPPevIOawUlw2Aqw1YuHzBNtyaP07lbb+NHnY27m6EB5xlKUE
	qYcWjpcs9I/njNJGSwr6JP8suWQXXlxbkK8oytALWMpH7CsnRdQhSbmrsONX3icjl5JhEUpam60
	w125gXGfCxyJ+Tu3uWePlLhtvSHhqlUEKrN5w+vlrULguEJzzwWj02WemSQM03dP6jxSWlvFypU
	kO8LSCpg+wy9c4JDXeOspgT1hSKl94REyzJO8D79x+IKKitXquiUcVbc5MRG3ZtC5w5F+jwp7lU
	=
X-Received: by 2002:a05:6214:21e2:b0:6e8:98c0:e53d with SMTP id 6a1803df08f44-6f2c46a07dbmr151565336d6.45.1745189781074;
        Sun, 20 Apr 2025 15:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfLiS9Q2SZkjbwKgidL/WAe6f7m5zfoiOXLznuv9bCK+P7PXy93vNK3MPMChR2OHq4BZDfTQ==
X-Received: by 2002:a05:6214:21e2:b0:6e8:98c0:e53d with SMTP id 6a1803df08f44-6f2c46a07dbmr151565026d6.45.1745189780583;
        Sun, 20 Apr 2025 15:56:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e385sm10042561fa.17.2025.04.20.15.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 15:56:19 -0700 (PDT)
Date: Mon, 21 Apr 2025 01:56:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
        andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
        jernej.skrabec@gmail.com, jonas@kwiboo.se,
        linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, rfoss@kernel.org, simona@ffwll.ch,
        tzimmermann@suse.de
Subject: Re: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
Message-ID: <53fglsklfc62tlpcg6xcbnw5dssik6tntlabf6c34d4myzb444@f7oqsqhtpg4z>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
 <6b662c34-7a1d-4e07-aaa7-752bc0c7575f@rock-chips.com>
 <d0641e38-0d89-49ea-84c6-66707021406b@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0641e38-0d89-49ea-84c6-66707021406b@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68057b95 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8 a=1emaVgkjSvq9T-tW4EkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: lGJw0lp2puSYPmA5FSInWtj-hXc6fsSH
X-Proofpoint-ORIG-GUID: lGJw0lp2puSYPmA5FSInWtj-hXc6fsSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_10,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200190

On Mon, Apr 14, 2025 at 10:01:16AM +0800, Damon Ding wrote:
> On 2025/4/14 9:20, Damon Ding wrote:
> > Hi Dmitry,
> > 
> > On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> > > The analogix_dp_prepare_panel() returns immediately if there is no
> > > attached panel. Drop several calls to this function which are performed
> > > when dp->plat_data->panel is NULL.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22
> > > +---------------------
> > >   1 file changed, 1 insertion(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/
> > > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > @@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct
> > > drm_connector *connector)
> > >   {
> > >       struct analogix_dp_device *dp = to_dp(connector);
> > >       const struct drm_edid *drm_edid;
> > > -    int ret, num_modes = 0;
> > > +    int num_modes = 0;
> > >       if (dp->plat_data->panel) {
> > >           num_modes += drm_panel_get_modes(dp->plat_data->panel,
> > > connector);
> > >       } else {
> > > -        ret = analogix_dp_prepare_panel(dp, true, false);
> > > -        if (ret) {
> > > -            DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> > > -            return 0;
> > > -        }
> > > -
> > >           drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > >           drm_edid_connector_update(&dp->connector, drm_edid);
> > > @@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct
> > > drm_connector *connector)
> > >               num_modes += drm_edid_connector_add_modes(&dp->connector);
> > >               drm_edid_free(drm_edid);
> > >           }
> > > -
> > > -        ret = analogix_dp_prepare_panel(dp, false, false);
> > > -        if (ret)
> > > -            DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> > >       }
> > >       if (dp->plat_data->get_modes)
> > > @@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector
> > > *connector, bool force)
> > >       if (dp->plat_data->panel)
> > >           return connector_status_connected;
> > > -    ret = analogix_dp_prepare_panel(dp, true, false);
> > > -    if (ret) {
> > > -        DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> > > -        return connector_status_disconnected;
> > > -    }
> > > -
> > >       if (!analogix_dp_detect_hpd(dp))
> > >           status = connector_status_connected;
> > > -    ret = analogix_dp_prepare_panel(dp, false, false);
> > > -    if (ret)
> > > -        DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> > > -
> > >       return status;
> > >   }
> > > 
> > 
> > With the patch series:
> > https://patchwork.kernel.org/project/linux-rockchip/list/?series=942183
> > 
> > When I verify this patch, there will be a small warning:
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1075:6: warning:
> > unused variable 'ret' [-Wunused-variable]
> >          int ret;
> >              ^
> > 
> > It should be better to remove the unused 'ret'.

I can't reproduce the warning, so I'd like to push the series once patch
3/7 gets an R-B.

> > 
> > Best regards,
> > Damon
> > 
> > 
> > 
> 
> Tested-by: Damon Ding <damon.ding@rock-chips.com>
> 

-- 
With best wishes
Dmitry
