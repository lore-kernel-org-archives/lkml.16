Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0431E485
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652065; cv=none; b=G3/SouCtKrOqrfDdMh5Nz8jyunp0vAfXtt8P8Eb9l6XhDgw3X/EL+NuXnf0vu45d8AtO3AHQT56LkW4+8fxktMCRtMRaaeaBctedUcu7ub8cRZgZJkkYyAv9JzDftrntA3OQ1Hw+pR5wZQNqU49GQqIEdYYcTyrXTXrDeym4KU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652065; c=relaxed/simple;
	bh=6ag6QPAuv0gxj6+YuIerN6tgZMpuVTJrd2/H66/Orkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8WwnF/8YnavjeQIcdhZWCLRpc5C3a13y7pQPOFeMCyPXKcbu84hOzQB4aB9/cxJj2EFy6on1Rl+Dm2y8DjswuOclpegtNzc+XJGmlTkja8c1+kZyy5c4U7kwuDANw2wTQ60SRSoyHnJB8uGgRAPBMST6qUwyDOBrEBJQJNjIss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzoBFIU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzoBFIU6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DE2h026020
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LFx0onLCtDmLV4IyYKdPplU0X7zYDQbGPz4AqT9+Ds=; b=nzoBFIU6U47wf2XP
	kyDz3bcNi1aFxtXyL7+kUzcJNv3KA91QKr4Np188VLE8nEAsGw9isqFpDd4NHo8S
	BejJ42FFuCqlierP1oYYawWg2RT4uMTHuo1MfH+wbllA0x3JFO+gBkucnYIflu6x
	XRprus2SlUaEpV3/zs8nkTiDGtwAw8zVLgIPBw4usVuA7zlPiRDmzT9LIcD0tWt3
	EWV/lstevpMR5OXgStJZcIJhEllgSDSoq9FuPi9ISUsPVsMhi3H5hBpEnNdQHmZi
	1kqTzoxYuAK5BAUJSIaPq6YwZuPpyaRrWX2gdHz4sCUQItTs1P82OAxo61GStk5B
	ESL0yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y833t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:27:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d15c975968so1172155785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652061; x=1750256861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LFx0onLCtDmLV4IyYKdPplU0X7zYDQbGPz4AqT9+Ds=;
        b=t8BrhQ8VrzJM/rTLgj2p1X3fHYeIoWaW8Mr1T+qZGmYcKnGqyVE1vJFRrlVbQ9ABq4
         M02WUwkxZeoBWzwxrlGhjw0B+kl8wfKyR5uErbjVhLscZN3dHjykOtvBIU7QYxNpLbiz
         e95AcYUO797seIhHZc+EKlcdyZOtYRzFT48rtUNGOyxHjqjfSktTNbI/9wh/0BUT8xqv
         3OhredIlYXsN4b49NNtGXhxyPU8qCXNStQz3TLWZvzD/e54/miRQpFdHBpnlzJSBjqiA
         1AP8KNyDNOGW5nYpAEX2c9e6AJXRBUe3nSYWEGTjceqmSfaeALkrRlyMmlrJRQ1kDedK
         nizQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpVERUmYcUT+bo9x39FW9qUN5jx3y4qubxzDvsDExkimMqN9eIr/rBWrUk/vlNwiSzDFO61aYWbeIHJYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfXBoRrUz/DWq/EGr0r/X2/Y7hW2vdHdidn7ynwVek3rWZfYSv
	ZvgmtA6iyIyHUm02b6uFUJzOXmBr51ZQZnToLFZAuFWPR4PFAlmESDSVYF+5vikQZhHJFNE2fF2
	VLCNw81C/JDWnM8FMhihc0hBuQdfjKcw94rOiZ/aTc13c7LvY8J5KOmJgo1SxiZdLx/rJaUe7Gl
	fTmW7l
X-Gm-Gg: ASbGnctWaROj0YxHMXaPEZBfjA+FAuI059y3/haxMQtuVRO1+8u0RTDTpjx/DaJkeH7
	XsuRuuaiwRPnCLXW1evRNxqGwXw+xZcd+T8Te8ES3FUryH5h0ShcoU4FoPXzdkbe6E6Yz6r8vlP
	vCJ6M7QHe3sBl9Xq+Ap0Jps4uCxZjvtOjSa3W8qL6STltT6527mtwoaU18KB0ck1LJ684ZEwb0c
	tZiSlGgiSt0PH99KT6dN0DwncHY4o3vpYsAlTubS5Y30MMVYZgos4LdKRZ0lssB+bdpIdMHs9Eq
	doyuhEkzDJV4ZiQqJ3TSM1kEJ70KGlJweKy5mp/qDYl+6YqWT6cPdxL8rapDLYocM1bSVWc45xf
	fKoswXvdSedk94vTu0EcCJuWiITm4chal4cU=
X-Received: by 2002:a05:620a:4554:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d3a87e19femr481288885a.17.1749652060841;
        Wed, 11 Jun 2025 07:27:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFipL4XWVgX+2i6cBK5BybPEJehFTQ79KWXBYKs2i0YQEEZfsRo09AeUDbaPAnpRbaNBW0a7A==
X-Received: by 2002:a05:620a:400e:b0:7cd:31ca:d81 with SMTP id af79cd13be357-7d3a883eea9mr550646985a.27.1749652049544;
        Wed, 11 Jun 2025 07:27:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d01debsm17792071fa.103.2025.06.11.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:27:28 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:27:27 +0300
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
Subject: Re: [PATCH v2 28/38] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
Message-ID: <pqetckvpjjd2k2zzogco5erqwwzk22odw3sxf4qy2jazsp7gfn@gqdlfovejqgh>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-28-a54d8902a23d@quicinc.com>
 <s433wb4q2jyppdnrqgplonos5m6ummee4vancr55nnjdnogvda@xi72bcq5adnx>
 <07f3a522-0b38-45bd-bb93-a5dc7c622d12@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07f3a522-0b38-45bd-bb93-a5dc7c622d12@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMCBTYWx0ZWRfXyrEioTWUdF6m
 f8EIvaA4mOtk3tGjCTsz7vDpLP1IJsx1yi5IOhMfEgGpAJgoTvNoq7ovaC7f57dX5/SdiMxxs7E
 zLXWXB5quQQmqmeWiTEcjWnDCvjqj5uLswxtWw2rYb1HXRfI0R92x7mi9yfpcgcbILipq6aWeOE
 /Gv7mHoMYaf5yw7QLzs/i+1H1SXnRWqD7Vj3J/bsleIko4vpg60pIkEnyIoZnup6DdU4YuRVmFV
 XEEQz6yd5Pr+10TJWlt2R2i9EaPqfYFDg4GMYCFzq2RYSguI1l2MJri0JGTYC1TXTzQLlA5A7M3
 WlG//aX1ERUuGLwLz5X0sxc8pbXsb5K8eAMKgKnw7Ilfp+znRmxmykfdX9iIfkq0caW/Q+6MyjW
 dyubZzNE1KA49Q2v2lR0B82OzQMrpavN3uuCOXVPJTZ4phV/o9Q2x+YelmiItFnLKIj+AW7W
X-Proofpoint-GUID: EvFi1DhNQzYn5xL4LcV9si1UuKvsPMjQ
X-Proofpoint-ORIG-GUID: EvFi1DhNQzYn5xL4LcV9si1UuKvsPMjQ
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6849925e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=iecAaJf7ihGwC5gxNNEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110120

On Wed, Jun 11, 2025 at 07:39:24PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 23:57, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:47PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add a new file dp_mst_drm to manage the DP MST bridge operations
> > > similar to the dp_drm file which manages the SST bridge operations.
> > > Each MST encoder creates one bridge and each bridge is bound to its
> > > own dp_panel abstraction to manage the operations of its pipeline.
> > 
> > I don't see this patch being improved from v1. Please follow the
> > feedback or provide a _good_ reason to ignore it.
> > 
> Sorry for that, will explain one by one later..
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/Makefile        |   3 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.h |   3 +
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 501 ++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h | 100 +++++++
> > >   4 files changed, 606 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > > index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..d317e5ecda28dfd708ccdc5d3d27d4cf0b78b9d5 100644
> > > --- a/drivers/gpu/drm/msm/Makefile
> > > +++ b/drivers/gpu/drm/msm/Makefile
> > > @@ -142,7 +142,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> > >   	dp/dp_link.o \
> > >   	dp/dp_panel.o \
> > >   	dp/dp_audio.o \
> > > -	dp/dp_utils.o
> > > +	dp/dp_utils.o \
> > > +	dp/dp_mst_drm.o
> > >   msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index 85eaa55fdcb7d9d8713849ec64a2cc9b08924425..9ca045ed2b4f1a9bc3254b733d1ce5332ebaba96 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -7,6 +7,7 @@
> > >   #define _DP_DISPLAY_H_
> > >   #include "dp_panel.h"
> > > +#include "dp_mst_drm.h"
> > >   #include "disp/msm_disp_snapshot.h"
> > >   #define DP_MAX_PIXEL_CLK_KHZ	675000
> > > @@ -24,6 +25,8 @@ struct msm_dp {
> > >   	bool is_edp;
> > >   	bool internal_hpd;
> > > +	struct msm_dp_mst *msm_dp_mst;
> > > +
> > >   	struct msm_dp_audio *msm_dp_audio;
> > >   	bool psr_supported;
> > >   };
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a3ea34ae63511db0ac920cbeebe30c4e2320b8c4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> > > @@ -0,0 +1,501 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +/*
> > > + * Copyright © 2014 Red Hat.
> > > + *
> > > + * Permission to use, copy, modify, distribute, and sell this software and its
> > > + * documentation for any purpose is hereby granted without fee, provided that
> > > + * the above copyright notice appear in all copies and that both that copyright
> > > + * notice and this permission notice appear in supporting documentation, and
> > > + * that the name of the copyright holders not be used in advertising or
> > > + * publicity pertaining to distribution of the software without specific,
> > > + * written prior permission.  The copyright holders make no representations
> > > + * about the suitability of this software for any purpose.  It is provided "as
> > > + * is" without express or implied warranty.
> > > + *
> > > + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> > > + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> > > + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> > > + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> > > + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> > > + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> > > + * OF THIS SOFTWARE.
> > > + */
> > > +
> > > +#include "dp_mst_drm.h"
> > > +
> > > +static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> > > +{
> > > +	struct msm_dp_mst_bridge_state *state;
> > > +
> > > +	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
> > > +	if (!state)
> > > +		return NULL;
> > > +
> > > +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> > > +
> > > +	return &state->base;
> > > +}
> > > +
> > > +static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
> > > +					    struct drm_private_state *state)
> > > +{
> > > +	struct msm_dp_mst_bridge_state *priv_state =
> > > +		to_msm_dp_mst_bridge_priv_state(state);
> > > +
> > > +	kfree(priv_state);
> > > +}
> > > +
> > > +static const struct drm_private_state_funcs msm_dp_mst_bridge_state_funcs = {
> > > +	.atomic_duplicate_state = msm_dp_mst_duplicate_bridge_state,
> > > +	.atomic_destroy_state = msm_dp_mst_destroy_bridge_state,
> > > +};
> > > +
> > > +/**
> > > + * dp_mst_find_vcpi_slots() - Find VCPI slots for this PBN value
> > > + * @mgr: manager to use
> > > + * @pbn: payload bandwidth to convert into slots.
> > > + *
> > > + * Calculate the number of VCPI slots that will be required for the given PBN
> > > + * value.
> > > + *
> > > + * RETURNS:
> > > + * The total slots required for this port, or error.
> > > + */
> > > +static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int pbn)
> > > +{
> > > +	int num_slots;
> > > +	struct drm_dp_mst_topology_state *state;
> > > +
> > > +	state = to_drm_dp_mst_topology_state(mgr->base.state);
> > > +	num_slots = DIV_ROUND_UP(pbn, dfixed_trunc(state->pbn_div));
> > > +
> > > +	/* max. time slots - one slot for MTP header */
> > > +	if (num_slots > 63)
> > > +		return -ENOSPC;
> > > +	return num_slots;
> > > +}
> > > +
> > > +static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
> > > +					 struct msm_dp_mst_bridge *mst_bridge,
> > > +					 struct drm_dp_mst_port *port)
> > 
> > As I wrote:
> > 
> > drm_dp_atomic_find_time_slots() should be called from atomic_check(),
> > this function must be dropped.
> > 
> This func not call drm_dp_atomic_find_time_slots().
> drm_dp_atomic_find_time_slots() called in msm_dp_mst_compute_config in the
> previous one patch. msm_dp_mst_compute_config is in atomic_check().

I'm sorry for not being explicit enough. It copies data from the state
into the msm_dp_bridge. There should be no need to do that. Use the
payload / MST state directly.

> > > +{
> > > +	int i;
> > > +	struct msm_dp_mst_bridge *msm_dp_bridge;
> > > +	struct drm_dp_mst_topology_state *mst_state;
> > > +	struct drm_dp_mst_atomic_payload *payload;
> > > +	int prev_start = 0;
> > > +	int prev_slots = 0;
> > > +
> > > +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> > > +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> > > +
> > > +	if (!payload) {
> > > +		DRM_ERROR("mst bridge [%d] update_timeslots failed, null payload\n",
> > > +			  mst_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	for (i = 0; i < mst->max_streams; i++) {
> > > +		msm_dp_bridge = &mst->mst_bridge[i];
> > > +		if (mst_bridge == msm_dp_bridge) {
> > > +			/*
> > > +			 * When a payload was removed make sure to move any payloads after it
> > > +			 * to the left so all payloads are aligned to the left.
> > > +			 */
> > 
> > :-(
> > 
> Emm,  will get back to this part later.
> > > +			if (payload->vc_start_slot < 0) {
> > > +				// cache the payload
> > > +				prev_start = msm_dp_bridge->start_slot;
> > > +				prev_slots = msm_dp_bridge->num_slots;
> > > +				msm_dp_bridge->pbn = 0;
> > > +				msm_dp_bridge->start_slot = 1;
> > > +				msm_dp_bridge->num_slots = 0;
> > > +				msm_dp_bridge->vcpi = 0;
> > > +			} else { //add payload
> > > +				msm_dp_bridge->pbn = payload->pbn;
> > > +				msm_dp_bridge->start_slot = payload->vc_start_slot;
> > > +				msm_dp_bridge->num_slots = payload->time_slots;
> > > +				msm_dp_bridge->vcpi = payload->vcpi;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	// Now commit all the updated payloads
> > > +	for (i = 0; i < mst->max_streams; i++) {
> > > +		msm_dp_bridge = &mst->mst_bridge[i];
> > > +
> > > +		//Shift payloads to the left if there was a removed payload.
> > > +		if (payload->vc_start_slot < 0 && msm_dp_bridge->start_slot > prev_start)
> > > +			msm_dp_bridge->start_slot -= prev_slots;
> > > +
> > > +		msm_dp_display_set_stream_info(mst->msm_dp, msm_dp_bridge->msm_dp_panel,
> > > +					       msm_dp_bridge->id, msm_dp_bridge->start_slot,
> > > +					       msm_dp_bridge->num_slots,
> > > +					       msm_dp_bridge->pbn, msm_dp_bridge->vcpi);
> > > +		drm_dbg_dp(mst->msm_dp->drm_dev,
> > > +			   "conn:%d vcpi:%d start_slot:%d num_slots:%d, pbn:%d\n",
> > > +			   DP_MST_CONN_ID(msm_dp_bridge), msm_dp_bridge->vcpi,
> > > +			   msm_dp_bridge->start_slot,
> > > +			   msm_dp_bridge->num_slots, msm_dp_bridge->pbn);
> > > +	}
> > > +}
> > > +
> > > +static int _msm_dp_mst_bridge_pre_enable_part1(struct msm_dp_mst_bridge *dp_bridge,
> > > +					       struct drm_atomic_state *state)
> > > +{
> > > +	struct msm_dp *msm_dp = dp_bridge->display;
> > > +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> > > +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> > > +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> > > +	struct drm_dp_mst_topology_state *mst_state;
> > > +	struct drm_dp_mst_atomic_payload *payload;
> > > +	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
> > > +	int pbn, slots;
> > > +	int rc = 0;
> > > +
> > > +	mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
> > > +
> > > +	pbn = drm_dp_calc_pbn_mode(dp_panel->msm_dp_mode.drm_mode.clock,
> > > +				   (mst_conn->connector.display_info.bpc * 3) << 4);
> > > +
> > > +	slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, pbn);
> > > +
> > > +	drm_dbg_dp(msm_dp->drm_dev, "conn:%d pbn:%d, slots:%d\n", DP_MST_CONN_ID(dp_bridge),
> > > +		   pbn, slots);
> > > +
> > > +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> > > +	if (!payload || payload->time_slots <= 0) {
> > > +		DRM_ERROR("time slots not allocated for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
> > > +		rc = -EINVAL;
> > > +		return rc;
> > > +	}
> > > +
> > > +	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
> > > +
> > > +	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
> > > +	if (rc) {
> > > +		DRM_ERROR("payload allocation failure for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
> > > +		return rc;
> > > +	}
> > > +
> > > +	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
> > > +
> > > +	return rc;
> > > +}
> > > +
> > > +static void _msm_dp_mst_bridge_pre_enable_part2(struct msm_dp_mst_bridge *dp_bridge,
> > > +						struct drm_atomic_state *state)
> > > +{
> > > +	struct msm_dp *msm_dp = dp_bridge->display;
> > > +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> > > +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> > > +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> > > +	struct drm_dp_mst_topology_state *mst_state;
> > > +	struct drm_dp_mst_atomic_payload *payload;
> > > +
> > > +	drm_dp_check_act_status(&mst->mst_mgr);
> > > +
> > > +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> > > +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> > > +
> > > +	if (!payload) {
> > > +		DRM_ERROR("mst bridge [%d] null payload\n", dp_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	if (!payload->port) {
> > > +		DRM_ERROR("mst bridge [%d] null port\n", dp_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	if (!payload->port->connector) {
> > > +		DRM_ERROR("mst bridge [%d] part-2 failed, null connector\n",
> > > +			  dp_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	if (payload->vc_start_slot == -1) {
> > > +		DRM_ERROR("mst bridge [%d] part-2 failed, payload alloc part 1 failed\n",
> > > +			  dp_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
> > > +
> > > +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre enable part-2 complete\n",
> > > +		   dp_bridge->id);
> > > +}
> > > +
> > > +static void _msm_dp_mst_bridge_pre_disable_part1(struct msm_dp_mst_bridge *dp_bridge,
> > > +						 struct drm_atomic_state *state)
> > > +{
> > > +	struct msm_dp *msm_dp = dp_bridge->display;
> > > +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> > > +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> > > +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> > > +	struct drm_dp_mst_topology_state *old_mst_state;
> > > +	struct drm_dp_mst_topology_state *new_mst_state;
> > > +	const struct drm_dp_mst_atomic_payload *old_payload;
> > > +	struct drm_dp_mst_atomic_payload *new_payload;
> > > +
> > > +	old_mst_state = drm_atomic_get_old_mst_topology_state(state, &mst->mst_mgr);
> > > +
> > > +	new_mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
> > > +
> > > +	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, port);
> > > +	new_payload = drm_atomic_get_mst_payload_state(new_mst_state, port);
> > > +
> > > +	if (!old_payload || !new_payload) {
> > > +		DRM_ERROR("mst bridge [%d] _pre disable part-1 failed, null payload\n",
> > > +			  dp_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
> > > +	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
> > > +
> > > +	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
> > > +
> > > +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-1 complete\n",
> > > +		   dp_bridge->id);
> > > +}
> > > +
> > > +static void _msm_dp_mst_bridge_pre_disable_part2(struct msm_dp_mst_bridge *dp_bridge)
> > > +{
> > > +	struct msm_dp *msm_dp = dp_bridge->display;
> > > +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> > > +
> > > +	drm_dp_check_act_status(&mst->mst_mgr);
> > > +
> > > +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-2 complete\n",
> > > +		   dp_bridge->id);
> > > +}
> > > +
> > > +static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
> > > +						struct drm_atomic_state *state)
> > > +{
> > > +	int rc = 0;
> > > +	struct msm_dp_mst_bridge *bridge;
> > > +	struct msm_dp *dp;
> > > +	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
> > > +	struct msm_dp_mst *dp_mst;
> > > +
> > > +	if (!drm_bridge) {
> > > +		DRM_ERROR("Invalid params\n");
> > > +		return;
> > > +	}
> > > +
> > > +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> > > +	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
> > > +	dp = bridge->display;
> > > +	dp_mst = dp->msm_dp_mst;
> > > +
> > > +	/* to cover cases of bridge_disable/bridge_enable without modeset */
> > > +	bridge->connector = msm_dp_bridge_state->connector;
> > > +	bridge->msm_dp_panel = msm_dp_bridge_state->msm_dp_panel;
> > > +
> > > +	if (!bridge->connector) {
> > > +		DRM_ERROR("Invalid connector\n");
> > > +		return;
> > > +	}
> > > +
> > > +	mutex_lock(&dp_mst->mst_lock);
> > > +	msm_dp_display_atomic_prepare(dp);
> > > +
> > > +	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, state);
> > > +	if (rc) {
> > > +		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
> > > +		msm_dp_display_unprepare(dp);
> > > +		mutex_unlock(&dp_mst->mst_lock);
> > > +		return;
> > > +	}
> > > +
> > > +	msm_dp_display_enable_helper(dp, bridge->msm_dp_panel);
> > > +
> > > +	_msm_dp_mst_bridge_pre_enable_part2(bridge, state);
> > > +
> > > +	mutex_unlock(&dp_mst->mst_lock);
> > > +
> > > +	drm_dbg_dp(dp->drm_dev, "conn:%d mode:%s fps:%d vcpi:%d slots:%d to %d\n",
> > > +		   DP_MST_CONN_ID(bridge), bridge->drm_mode.name,
> > > +		   drm_mode_vrefresh(&bridge->drm_mode),
> > > +		   bridge->vcpi, bridge->start_slot,
> > > +		   bridge->start_slot + bridge->num_slots);
> > > +}
> > > +
> > > +static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> > > +					     struct drm_atomic_state *state)
> > > +{
> > > +	struct msm_dp_mst_bridge *bridge;
> > > +	struct msm_dp *dp;
> > > +	struct msm_dp_mst *mst;
> > > +
> > > +	if (!drm_bridge) {
> > > +		DRM_ERROR("Invalid params\n");
> > > +		return;
> > > +	}
> > > +
> > > +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> > > +	if (!bridge->connector) {
> > > +		DRM_ERROR("Invalid connector\n");
> > > +		return;
> > > +	}
> > > +
> > > +	dp = bridge->display;
> > > +	mst = dp->msm_dp_mst;
> > > +
> > > +	mutex_lock(&mst->mst_lock);
> > > +
> > > +	_msm_dp_mst_bridge_pre_disable_part1(bridge, state);
> > > +
> > > +	msm_dp_display_disable_helper(dp, bridge->msm_dp_panel);
> > > +
> > > +	_msm_dp_mst_bridge_pre_disable_part2(bridge);
> > > +
> > > +	mutex_unlock(&mst->mst_lock);
> > > +
> > > +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
> > > +		   DP_MST_CONN_ID(bridge));
> > > +}
> > > +
> > > +static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> > > +						  struct drm_atomic_state *state)
> > > +{
> > > +	int conn = 0;
> > > +	struct msm_dp_mst_bridge *bridge;
> > > +	struct msm_dp *dp;
> > > +	struct msm_dp_mst *mst;
> > > +
> > > +	if (!drm_bridge) {
> > > +		DRM_ERROR("Invalid params\n");
> > > +		return;
> > > +	}
> > > +
> > > +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> > > +	if (!bridge->connector) {
> > > +		DRM_ERROR("Invalid connector\n");
> > > +		return;
> > > +	}
> > > +
> > > +	conn = DP_MST_CONN_ID(bridge);
> > > +
> > > +	dp = bridge->display;
> > > +	mst = dp->msm_dp_mst;
> > > +
> > > +	mutex_lock(&mst->mst_lock);
> > > +
> > > +	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
> > > +
> > > +	if (!dp->mst_active)
> > > +		msm_dp_display_unprepare(dp);
> > > +
> > > +	bridge->connector = NULL;
> > > +	bridge->msm_dp_panel =  NULL;
> > > +
> > > +	mutex_unlock(&mst->mst_lock);
> > > +
> > > +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
> > > +		   bridge->id, conn);
> > > +}
> > > +
> > > +static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
> > > +				       const struct drm_display_mode *mode,
> > > +				       const struct drm_display_mode *adjusted_mode)
> > > +{
> > > +	struct msm_dp_mst_bridge *bridge;
> > > +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> > > +	struct msm_dp *dp;
> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +
> > > +	if (!drm_bridge || !mode || !adjusted_mode) {
> > > +		DRM_ERROR("Invalid params\n");
> > > +		return;
> > > +	}
> > > +
> > > +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> > > +
> > > +	dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
> > > +	bridge->connector = dp_bridge_state->connector;
> > > +	bridge->msm_dp_panel = dp_bridge_state->msm_dp_panel;
> > > +
> > > +	msm_dp_panel = bridge->msm_dp_panel;
> > > +	dp = bridge->display;
> > > +
> > > +	memcpy(&bridge->drm_mode, adjusted_mode, sizeof(bridge->drm_mode));
> > > +	msm_dp_display_mode_set_helper(dp, mode, adjusted_mode, bridge->msm_dp_panel);
> > > +	msm_dp_panel->pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
> > > +							  (msm_dp_panel->msm_dp_mode.bpp << 4));
> > > +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d mode set complete %s\n", bridge->id,
> > > +		   DP_MST_CONN_ID(bridge), mode->name);
> > > +}
> > > +
> > > +/* DP MST Bridge APIs */
> > > +static const struct drm_bridge_funcs msm_dp_mst_bridge_ops = {
> > > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > +	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> > > +	.atomic_reset           = drm_atomic_helper_bridge_reset,
> > > +	.atomic_pre_enable   = msm_dp_mst_bridge_atomic_pre_enable,
> > > +	.atomic_disable      = msm_dp_mst_bridge_atomic_disable,
> > > +	.atomic_post_disable = msm_dp_mst_bridge_atomic_post_disable,
> > > +	.mode_set     = msm_dp_mst_bridge_mode_set,
> > > +};
> > > +

-- 
With best wishes
Dmitry
