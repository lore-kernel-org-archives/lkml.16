Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D281624CE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488272; cv=none; b=HSEYUq5+JRJ1U0irV87bSVwmN2o0l8o8rtowbSquFiV2Q71haIrdV9mqUtl1uRYgF99hl+VpEmUHvksK2GsEJhm7d7YtQqjdFjhh7LFcRbb6mUYHdqwQJHi2WydSoyva7fFCWjFwLvl60lXURLQJo/EwTzWMl3IqSWOwndUFdVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488272; c=relaxed/simple;
	bh=wFhvKEBWIqO5IKku5lHysI0mVP3bbqSWwLIRHX4cfWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJVHOvknssxNQPX1pNakcvhs/71LW5D0HGyuLJpsBpnjj4+MebV25dJEsAJEuvtyh4SHqGLj2T+yhHn9A7bWqlww3c2Fkd2DB9rvNnOkOeXv4RrQkPrfmedXvJY9tMWZnDyK3NR1o/jcGpsiX0TCSX1kCvBpb8YuoL09mvOeGMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnLzrSlp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnLzrSlp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55998stG009809
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 16:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vneP2DX18iJ+KlTNZiKjmC22
	4Mk3kkmH8LnYKiLpD4c=; b=PnLzrSlpWgGn4uruN4Gpc2LZhF8KsmPGcVymGks1
	xKRsHdWZRLBuWMBvATa7UTqxFATFi2PGrQeMlxt80yZZvGPvh69RugIP7dYyyRwO
	AwRYd8KsHtxy9Lb0Ib9OFZOoYG7vHtG5n147TrG+ydyPpIlbmNJK0cBdLCRnPdIR
	3DOhjOJvP1wF876YeZntF/APoJ7nxe6/xSKsLTphH51uOK5isjvoXx/OY8V86ntj
	cVQTnahE4FkA82ooYxckRqXazBBAxqlWUhvOTJBFkq5ZU6nb0py6BfcVYVOALiAZ
	kjBea3DlXG3+nHi0IK1B2qAOSXtzjCpxPMWdl3p8oozpVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcegre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 16:57:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cf6c53390eso423609085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488268; x=1750093068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vneP2DX18iJ+KlTNZiKjmC224Mk3kkmH8LnYKiLpD4c=;
        b=nGr6J7kYM+Hp18lEb7v1IU3PTFubaXhR7/r8S3jpeoy6vjwmjLkP9WY821PBDybbUi
         wg5EuqSf9QK4g/VqVMlUsa7KPy7UNdwkLhwoKwtBf6hR7IbSC/wSwHhy4UaI0yQk7Ewl
         oFUHBkV9Cn5f4mHBqbxATJQNLYDNB4Ewe/ATdF4Zzav2lrqipd0odwpQvDrsF/BID9Hw
         8f48zpSbp8M2nIgrTwq1AAMQmvIt06AZdDcBMnme4Gd9vGRD4y03IwM1e0p8a7YsAo3L
         RafppRznmt0LB0yKFArW5Cfd4n8k768FDdnZOIYHxOQ5tY8JmpRdRaR7bk8fWKl6W8lg
         AEvw==
X-Forwarded-Encrypted: i=1; AJvYcCWbbbAntQrl1aC/gxQZZ4t4rj+Qp0c4fSY/+Me3hrJRbaomHXXQAaeuNVwYVN6u9A4LpN3LTpbA95+2Kik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsylbKiS+m7LdHxiJdkhnW0ilx40OFht92nOROwwJK09cpysZl
	PyR+0NIeB6dL9J4Uq+9lfSLgehDVnuahqBplfZO+qho2aCbhsfA+VZUq3MQ8hhCkfMztDr+0Xrz
	GcWGB/7x0Y7uw8KeSWBJEsFcB66DwDGWJDsCN3IwZNLIR+K9gVtXNJi3bmkWeApwYwTk=
X-Gm-Gg: ASbGncvszfMc7uVqteBgkIyNyDq6OXFcspSb/vcwQm2pxy/WwYqg20WKnapHpKeZxin
	euKsod1Mzxq02dCzyhcek2mge4HuzDurZE2Be8mbWWvdbkGSGVKyPY2LuiSIqnyHZ/QhhmLCu50
	z+XpIHD9D32CBm+FWHCcCLWbGuwmw3UEVZXcdRumHn2Gu7UdA2d2FSM/yuW/YGNzhockrqPHkuC
	ysmcI5SCV0W5a3RVds7mYQ4v0ZKRCwj7eSrWreg5ziNs4TEZ9l4J4/bNlrdyAh4PcrSGo4y5CpE
	MOzUlDF6LF3pmmJXd3RachAcPyH3GBCi3fzVb+6rBI5SvldmkTFm4xmEoyA29lSFbRbOj7fv3FY
	=
X-Received: by 2002:a05:620a:29ca:b0:7d0:a119:23e7 with SMTP id af79cd13be357-7d229949d04mr1971226685a.1.1749488268309;
        Mon, 09 Jun 2025 09:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuOIyz1gO9+R/XbrlmeEb9VZkyxA2b4RUV8fYDjH0Cjb+6ZgMRfAyijb61tapQIW/wHY+KFQ==
X-Received: by 2002:a05:620a:29ca:b0:7d0:a119:23e7 with SMTP id af79cd13be357-7d229949d04mr1971221985a.1.1749488267763;
        Mon, 09 Jun 2025 09:57:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1ccf522sm11626591fa.92.2025.06.09.09.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:57:47 -0700 (PDT)
Date: Mon, 9 Jun 2025 19:57:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
Message-ID: <jq3tsnri2ehb37ueb66he5lwifxe4kq676jzcpa4fpk66sol6w@buxjhhwga73z>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-3-shiyongbang@huawei.com>
 <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
 <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyNyBTYWx0ZWRfX3iGxW+n1H6k2
 2d7JYzOGhyyfq0hHT2FGPOSZLIuaHfSizdzAfOMJhSd3JhVXYfd236PVIZhizVDoDYcRKmSih1f
 QL7W2N2XcUq9p3vM+FXNU7x8LxhHbfQuwE0DsuslJbZCcHqBqBm2lvAyDnFmWELovFObxxaQ7xH
 EtHGmvO9RWYDOCB+NMlTuz1T22nPhF3QSAwoe4CPx+lIZMGlhNyEmnN4e1NghlBF8trXzey7Buj
 gizX0+z9X34wRowNr3+c+NmFljnRKDaa2zosi/SqBKHcFSOiBQhG06P4ozMB16jvieZb2PpaQ+J
 1NreRqNX/y2NAvh6QAkbFyegM9N+dMrGtQsReS7pOtDXKaw8UgSE/5ohSUBZPT++Z2dnuXR3Fs/
 wGq3oWo+4pcXziSpW0PYRzdcmMQ0fNJ95Re689kiO7qcJG5UBuSdCw8LqcB0k6LSjibdxtAf
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6847128d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=mLV4-GXAN7EMi8kBQXcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rAAAXs7o6QvlQ2ze_UO89HgKRqD79Qrs
X-Proofpoint-ORIG-GUID: rAAAXs7o6QvlQ2ze_UO89HgKRqD79Qrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090127

On Mon, Jun 09, 2025 at 10:47:50PM +0800, Yongbang Shi wrote:
> 
> > On Fri, May 30, 2025 at 05:54:24PM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > The debouncing when HPD pulled out still remains sometimes, 200ms still can
> > > not ensure helper_detect() is correct. So add a flag to hold the sink
> > > status, and changed detect_ctx() functions by using flag to check status.
> > > 
> > > Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > ---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
> > >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
> > >   2 files changed, 28 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > index 665f5b166dfb..68867475508c 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > @@ -50,6 +50,7 @@ struct hibmc_dp {
> > >   	struct drm_dp_aux aux;
> > >   	struct hibmc_dp_cbar_cfg cfg;
> > >   	u32 irq_status;
> > > +	int hpd_status;
> > >   };
> > >   int hibmc_dp_hw_init(struct hibmc_dp *dp);
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > index d06832e62e96..191fb434baa7 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > @@ -13,7 +13,8 @@
> > >   #include "hibmc_drm_drv.h"
> > >   #include "dp/dp_hw.h"
> > > -#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> > > +#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> > > +#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
> > >   static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> > >   {
> > > @@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> > >   static int hibmc_dp_detect(struct drm_connector *connector,
> > >   			   struct drm_modeset_acquire_ctx *ctx, bool force)
> > >   {
> > > -	mdelay(200);
> > > +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> > > -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> > > +	if (dp->hpd_status)
> > > +		return connector_status_connected;
> > > +	else
> > > +		return connector_status_disconnected;
> > >   }
> > >   static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> > > @@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
> > >   {
> > >   	struct drm_device *dev = (struct drm_device *)arg;
> > >   	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> > > +	struct hibmc_dp *dp = &priv->dp;
> > >   	int idx;
> > >   	if (!drm_dev_enter(dev, &idx))
> > >   		return -ENODEV;
> > > -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
> > > -		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> > > -		hibmc_dp_hpd_cfg(&priv->dp);
> > > +	if (dp->hpd_status) { /* only check unplug int when the last status is HPD in */
> > I think this way you'll ignore HPD short pulses. Could you possibly
> > clarify whether it is the case or not?
> 
> We actually doesn't enable short HPD here, this feature just used in our electrical tests.

I don't think HPD pulse needs to be enabled specially. It is documented
as IRQ that Source needs to respond to by rereading DPCD Link / Sink
Status bits and acting accordingly.

-- 
With best wishes
Dmitry
