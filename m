Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D254228C86C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455373; cv=none; b=oewhvtcochnIbGEbDxuZwhyIbAWawhawA1MxPzf25QMIoAxKaD3XAuQ46amiQ4w2TB9UxbThof/YpVE4fBKkvsa1B6/6KlcnJPWGv8K+VsXMM7AvBiZgCdMVFOap37IvVnnso6+P+L0KyExMe52KrDbTFeKciEIHNqPu33cApxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455373; c=relaxed/simple;
	bh=gxUDH75Bxi5SvxKp09Z5LhGrAVF3n2fLET8soCrnXhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpgTkH8ecZsj+zwRbKRKTCrcbmq4lN3sHES3ym8tyKyDF3HgRJy3bxVNGe1a3HMg2C9B2TU+0sTSYRtueJ99BIEsh05CSAZ+qBjvJotXkpO3p28UEp49iK2CWbemQgQgj1yo0xXuyX/CGGl6VNn/SXm0H2wogtqZgcj26Ke9Vn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaeStp27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaeStp27"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDpSZd029130
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mt94scoMpGBlHkRfDjr/0ZaH4cqB4nVNpigo9K1BPzI=; b=MaeStp27orB5w35D
	QO0Llp38kkYe1PnLLuvWzuBuw66WDoKqFgD55Yq/aekHqZHhYWfzcRQ6lYA9X2cg
	AxRvFj12qWO8JB0OpQgqkjemz3G1CA3UUmn7g0juiro4iGYjy9Q3l+snjC3avDUW
	9dPLzjqaiYu1nIMS43JD+YhbKTHIa4DYlta/S2f2vp2SA6XLK5TYQeFSkcuisWnL
	6XLBHR5V98f6WW29lGtZLQ7zdfPshXgnsYco86XnAtO+kYhGBUzR775ofwpz3rA0
	NBsr/wFAA/FP6ltO8JhyJgGAAprGF2r/EVg5YP+eixt1vU0U2CINetYK+CfQeGA7
	R/w9Hg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992n6mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:02:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e591aa8801so728104137.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455369; x=1749060169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt94scoMpGBlHkRfDjr/0ZaH4cqB4nVNpigo9K1BPzI=;
        b=DjtijEiWnD5JGnTLGUncYTcaKQPt0GxxU2arauIMw0gaGXs4F5FUpE29bHT7TCvHu2
         cs3XschMuzc7TFMBf8EnZZLOfDatG6z7ZDnNWWSLXdHL5B9LYgEttccClIqP02SLHPRs
         tUEDXpo6ErCQt6gp8MQhPXUX6df2pHqCr8nF+b+K4SwhVbZU6SQ6UvjQF077JwpDQc9V
         Rf4esVuMSZO7X8mhJa2EXnxwTW+qoiVG/8Q3GSmstp6tXSi1vsFLY19XcaWhJhNwxKqX
         CnRZ5fMGBeYbFZTrrzJ/rvstF/4hcukMdJExRimsrOPShBNdZhmdaNPiWunzt3HzWTBD
         0pOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc0Ap72OkFPyAl6XDfHLB0Z77FK+s9/jCSsPt6ahKdkv/QmQx1hXylvUssqJNE+By4tTSsqODnze0wj8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrdmAGvW3x2S/+ujVzMCKki/bv+0OzpJDPqWYf0fWVPFGI4+wD
	JbFWu90zvJXn6gIYyu7/dCo2rllKG3kpnofk0XDpbbjwS/plVe7Hz0WV4vrw3qLbj+0Vx4xIu7m
	iGK1BjeXeGurcsdilKXHmdS7o1OA3m5WTNDur4yGCleOxjt2dTutlfYjrAJaO3Ht8tAGlJQnvv2
	g=
X-Gm-Gg: ASbGncsdNN9dxNhFXmxJT6rouGKlyUoCPdvW+i0vyHwbJcNkLiiNfDr6zwidNJBLVrH
	9Unv1qlSZIkVi2kHe6uQLNDyIaxveP8HHcJbqLhSv7QmtqZ/nEY7UWwZhB/N/7hG9vUokIDvWhW
	6W9DAlP2xj/w8r4f7EUPrDtMRmgsPyxa7qeg8fLN59kSyBh7wevbyGtkpk7uzTE/NDMwzN8RHxo
	cJm63b6LE9Gy/9sdTW4hQmvJCFGnzmokAHlueU6uFsh/xfmWufVHp/t+CWiK5UV0+QMUlpy0r5Y
	BJsZIyrA9E5850+qZ/kTSEXFg0eGM6CaQi470qTxP2l5xNIvg7KvCcPsO9t8Fu+TbPmxq6vLb2g
	2cFIfkj8o3g==
X-Received: by 2002:a05:620a:2994:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7d098762690mr82814785a.3.1748455358440;
        Wed, 28 May 2025 11:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELc/vRTL5HOf4+VrKbUzHnWp0OBTAbQJHqlFy1eblVpmeIMAnJvUcYCEHijRPc3YXDAGhdqg==
X-Received: by 2002:a9d:6c98:0:b0:735:a98d:a4c9 with SMTP id 46e09a7af769-735acea2225mr244432a34.7.1748455347211;
        Wed, 28 May 2025 11:02:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f61ca28sm379055e87.50.2025.05.28.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:02:25 -0700 (PDT)
Date: Wed, 28 May 2025 21:02:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 31/45] drm/msm/dp: add dp_mst_drm to manage DP MST bridge
 operations
Message-ID: <n5g44odmls5yg4vwb6rfvdxeyy43d4ba4cahanwxe7f5scw7dv@btvb2crhjlbp>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
 <4unizv5vi7ve7qdpzmcxj6vvxwxrpcppg3y72csi7ga2jqwhrm@5eu74nuopyqf>
 <318ee4bc-b39a-43d3-abcb-22588a9a765c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <318ee4bc-b39a-43d3-abcb-22588a9a765c@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE1NyBTYWx0ZWRfXz6+p3gaZlptC
 jHoTV9ET5lWiIt97SDw9RdIJ/BgiPvtb3uG/A2FHB6sf2ACvbJFiAN2MMaw4JNoYk/R2UqILLeD
 Ib1a4reQDz7w9okkH+o+0RVMUiWCF6kB5ReQ32HbZKUnIQWfCYndAox5tEvvbvPbcHHGCzXQkCW
 qf89MyHWtH1XvrRcQFX2eViMO4r/777XI0XqA0WWsuNtC75/28sqaag0hbhZEfTN8B5Cq8RY5el
 l37blIghXamfTbEiVQIe0Z1BTdnQ21qp76ejfbxwnJVUdV9OrQi9Ir8+l6Q51Mro1boM/H0z51I
 PIbQyO12aNY3ZOrkUSqgNAEKS32JAFZAaBwNzG4idRjAhHXROUcp3s9h7A3Jb1MMAHBeDhlM0Oi
 0SkRFaNOMBYNRaQo4zBE6aYuAlOLMJzO4jacBXm5wx4aNpsaghcsnHZCJnm8qO6FZm7aQiXZ
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68374fca cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=AkxkYSyKjySzLiMMLVoA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AVmbRiY7LcCIpUKbmVE5nhSGqpynRjQn
X-Proofpoint-ORIG-GUID: AVmbRiY7LcCIpUKbmVE5nhSGqpynRjQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280157

On Tue, May 27, 2025 at 06:29:49PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 18:12, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:32:02PM -0800, Abhinav Kumar wrote:
> > > Add a new file dp_mst_drm to manage the DP MST bridge operations
> > > similar to the dp_drm file which manages the SST bridge operations.
> > > Each MST encoder creates one bridge and each bridge is bound to its
> > > own dp_panel abstraction to manage the operations of its pipeline.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/Makefile        |   3 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.h |   2 +
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 490 ++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h | 102 ++++++++
> > >   4 files changed, 596 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > > index f274d9430cc311405f890074c1466ffe2ec45ac9..b1e01b3123d9afc4818f059c5d4e7ca70dca3754 100644
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
> > > index 6ab14e969bce0fd07b3a550bae17e99652479232..a5d4893f689c6afbbe622c9b7dfa98d23d754831 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -7,6 +7,7 @@
> > >   #define _DP_DISPLAY_H_
> > >   #include "dp_panel.h"
> > > +#include "dp_mst_drm.h"
> > >   #include <sound/hdmi-codec.h>
> > >   #include "disp/msm_disp_snapshot.h"
> > > @@ -26,6 +27,7 @@ struct msm_dp {
> > >   	bool is_edp;
> > >   	bool internal_hpd;
> > > +	struct msm_dp_mst *msm_dp_mst;
> > >   	hdmi_codec_plugged_cb plugged_cb;
> > >   	struct msm_dp_audio *msm_dp_audio;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e66bd1e565aeb4da3d636eb5f4aa75504d60fd40
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> > > @@ -0,0 +1,490 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
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
> > 
> > drm_dp_atomic_find_time_slots() uses slightly different maths here, with
> > the different precision. Can we use the data that is set by that function
> > instead (payload->time_slots)?
> > 
> Note that drm_dp_atomic_find_time_slots all call in atomic_check func, not
> in other place.So can we call this func in atomic_pre_enable? Also, amg
> driver also have similar usage pattern.

Well, granted that this function can return ENOSPC, it is an error to
call it in atomic_pre_enable(). Nothing in atomic_pre_enable() /
atomic_enable() is allowed to fail.

I think this answers my question: drm_dp_atomic_find_time_slots()
should be called from atomic_check(), this function must be dropped.

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
> > Please don't. drm_dp_remove_payload_part2() should take care of that for
> > us. What is the reason for caching the data if we have to manually
> > handle the cache?
> > 
> MST framework is managing the port's bandwidth, but we have a bridhge for
> each stream, so we need to keep track of the payload allcation status for
> each bridge, how much we used and how much we left. So maybe they are manage
> two different part.

Well, still no. MST topology master should handle all payload
allocation. If you need any data, enhance its API instead of duplicating
its functionality.

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

[...]

> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +
> > > +	int vcpi;
> > > +	int pbn;
> > > +	int num_slots;
> > > +	int start_slot;
> > 
> > Which of the fields (including in_use) are long-lived and which are a
> > part of the current state? Can we move all state ones to bridge's state?
> > 
> in_use only used in bridge_init, so it is long-lived. Looking at it together
> with the next patch, only num_slots changes during atomic_check, so it is in
> bridge_state. pbn/vcpi/start_slots only change during bridge enable/disable,
> so they are placed in the bridge.

Let's look how it will look after refactoring. I'd still push all
changing fields to state. It make a lot of things much easier.

> > > +};
> > > +
> > > +struct msm_dp_mst_bridge_state {
> > > +	struct drm_private_state base;
> > > +	struct drm_connector *connector;
> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +	int num_slots;
> > > +};
> > > +
> > > +struct msm_dp_mst {
> > > +	bool mst_initialized;
> > > +	struct drm_dp_mst_topology_mgr mst_mgr;
> > > +	struct msm_dp_mst_bridge *mst_bridge;
> > > +	struct msm_dp *msm_dp;
> > > +	bool mst_session_hpd_state;
> > > +	u32 max_streams;
> > > +};
> > > +
> > > +struct msm_dp_mst_connector {
> > > +	struct drm_connector connector;
> > > +	struct drm_dp_mst_port *mst_port;
> > > +	struct msm_dp *msm_dp;
> > > +	struct msm_dp_panel *dp_panel;
> > > +};
> > > +
> > > +#define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> > > +#define to_msm_dp_mst_bridge_priv(x) \
> > > +		container_of((x), struct msm_dp_mst_bridge, obj)
> > > +#define to_msm_dp_mst_bridge_priv_state(x) \
> > > +		container_of((x), struct msm_dp_mst_bridge_state, base)
> > > +#define to_msm_dp_mst_bridge_state(x) \
> > > +		to_msm_dp_mst_bridge_priv_state((x)->obj.state)
> > > +#define to_msm_dp_mst_connector(x) \
> > > +		container_of((x), struct msm_dp_mst_connector, connector)
> > > +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
> > > +
> > > +#endif /* _DP_MST_DRM_H_ */
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
