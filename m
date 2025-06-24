Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D42C25A320
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803933; cv=none; b=Vs5KjxKS5eHx7GLZoqg+rDn0yKqzIN34NPjnURp8XvoNp6WPcwveDj0tckcPyj01xij4gbdBCa7mlCbAy1Vg3xL1r89Xnh/Mbq3NEAZ6VWZ5m25KqhoA0inGMNorJ2tfDeEKE/nSMsyt3VojHUOfZog93i7zR3UAVQeIckncnS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803933; c=relaxed/simple;
	bh=Z4XuItg7n9KDaJ8PmvNjFVwG1pbRC7PaOp7xBiU51G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UW4U+tJp3Pfw4EDTPuxBs0sB1w12LnpQDs4vxg/bqI45VQEFok8ZNylxAJb4JwBwaQFbo2vMY4JLgCZ23Mc1/Bx6t2+BitGd2fLaR8lPpXC5r7r4s6/wp552o0i3f83gv73u3Q8/nXEQ2a1pRbRBSrUHpMLEfYiLq5SAzRrB8RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsukCSqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsukCSqq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OJqE1Q016970
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edaUDKUgQvnygzPp/PS/HdXpkUYt7JSXmWXEzbbbfIQ=; b=SsukCSqqLpu32Hz9
	Zf0WYnYAUsdgRGVgVHeBDS+Vt4cOuE+YPa/vPuaGAFvTTfpN/DIhkGm56K2tc2h8
	B0XMTamMiVSNOQ5u6sJfzCqguLBcpx40urMNWDwetimfWOQyv+UyCn1H85Chr1+O
	Ph1iamfB5wvgJSzlJ1gGI1UPAfUbA9g/abceuybTcNVs+iR8TsYD5GuC5drO1Vu1
	P1z3zIYquMu5rCyqACViyurk7raj4M7ER3IiNZyW5nTNqSnNs1MuBv4ON4latMBN
	GUEnbf77dgoUJaqmX8Z1b74Oqey7MoceMbg6wRCFPT8NqNn6fwUvclbardghvWGH
	P4O0MQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttw1b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:25:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so878204a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803917; x=1751408717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edaUDKUgQvnygzPp/PS/HdXpkUYt7JSXmWXEzbbbfIQ=;
        b=XNXW9/sLy1CTGvgwuuAS2uHf8yU9bnnU9T6omz5yf90l3WN5EDKykxQIBkORBAaALN
         OsIZHRikr+auQTBT2LYevojudzlCZlUVH4SrWt2XkfCjyh7uk2DcVyM47PLL7Vjpwpdw
         +PM/xNhKX4SgwIt5ja82PkYbNIzfwQkPPvIXHIkqF2PJIut39GYsmTKwm3DqRZKzT1y4
         xCSCG63/b/Np3Iy4eatIsiYGU2jNeLi+MI2GtkalZ2aQcOXBpg5jDLCEtEnmvJmveyP3
         hi0IW48Agvp22NH8bHeCsygMpu4NDnmjLJapHzo0HU5YwS05esRAZwCfIDxZg0ILIlOQ
         ieCw==
X-Forwarded-Encrypted: i=1; AJvYcCVV1PrUH8Yyidt6ScALA36gUUILUyJMj476vkyLs9uXmwCNVqs3Bp6JLRhSjN4i2WkZ+BzSa7DZw53fTSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0ZZmNCoQNxIp0fBFeW2s1VkfVOE546YfXsHGQaeQLcXRuKOe
	tAU5WNcLKCdHpAEo4ffySCDHqyKNTCnOvKnhPffdipcg/OcG5GGWG1dlWgMcYnS4dPGgo78FgZx
	FTrugstf/Z/MjNFkFR7dE9GuNhFaWO2gpcCqlrOcd2uFlteZJoOUs+/J8Vz7PnFiDS81DFIXnAn
	zyVdJAwcJKJWP+LHpuTqid6zJhyy/aTyJbC8N95X+mVg==
X-Gm-Gg: ASbGncvWe0AB95NLmRFck6OQ+zoJqNg+JNyejbEqLJiB6mWS7ATkhKZT7hsvWsHyknF
	DRpXmQSFvO2TRPoKrWnnVveJcvnIf3bwqkygHH8LtuAWO7eIirjhIkk4iMgsJX/kVav+AYquWTc
	cAzrv251MLWcYOZJ35Ew==
X-Received: by 2002:a17:90a:e7cd:b0:312:639:a06a with SMTP id 98e67ed59e1d1-315f26a19f1mr625755a91.31.1750803917213;
        Tue, 24 Jun 2025 15:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnJYacbGygKmNc7/TEfsmJQ26aNfJyLjp214T8au+stbrq01Rv+OX3Ye4iYF2UhpPFpvURsWdwI0ZhDx83xEU=
X-Received: by 2002:a17:90a:e7cd:b0:312:639:a06a with SMTP id
 98e67ed59e1d1-315f26a19f1mr625722a91.31.1750803916579; Tue, 24 Jun 2025
 15:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com> <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
 <2ab43ae7-12b6-4d41-9ffd-dbea70e2a662@quicinc.com> <njz3apifgcv2k3kzlmti5rjgqpl43v5yvjqpu6qhpe2kw3bzlu@pqvnrh6ff2um>
 <35527541-30dc-44dd-a108-79f599ace831@quicinc.com> <bd0fba5c-9e38-4a40-adf9-cc70fa2d0f57@oss.qualcomm.com>
 <ad1db558-c33e-4788-9f25-cac6c21713f1@quicinc.com> <997c2a3a-44e7-4169-8664-7b600deaa618@oss.qualcomm.com>
 <69f0c53a-0ac3-4858-a644-373af0473ddd@quicinc.com>
In-Reply-To: <69f0c53a-0ac3-4858-a644-373af0473ddd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:25:05 +0300
X-Gm-Features: Ac12FXyvsFi_beIPF9O4FOutFpu-hhHQggNgbzkyumWeGmqoN9ZlAKqWxrqVmXo
Message-ID: <CAO9ioeXHqJ80y=07RyaRuPeWXu4OhjHKOznrWwunSu81EYGVEw@mail.gmail.com>
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685b25d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=N_YKmpcrgEzAbr5VYMoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kiQI8aumzZkTTIyCXw6C5p-zYazuaRX4
X-Proofpoint-GUID: kiQI8aumzZkTTIyCXw6C5p-zYazuaRX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3OSBTYWx0ZWRfX0SrMuQ0gCYdu
 Lc3wq73lL8st0cVl19kULhtFHGj546/8U4ZkXm3Y6kzODBp7Ad5ChEto/DKZIsXtIMcGM/THQLV
 fWixxZHTD0tFf94SVbGTexZDiIr/bpI4c+3yQBEPBSjBEKaiWG6wUAInuVBWnbPkzAoMQ8/J9ex
 4Z7YikMb7d7j3Wd6hxs8KT7yn70Lsyq/wLZdq1Vm1eQ5MLhBpbQBl3ECo2/lkwBK3XKvwfyFvPv
 w7pjkVg2Pwky4NNddvnG9LcNe/0483MZQOzcE0WydPqMK5K2qQFVePanPMo9+wuCiuvgv79THo5
 YPXIhnNjSRsrDPOV29BPPa590ZhZ5wYi2b3Hl6Pyt2gF+M1407LURyIAWd49lIcaLUPLr2EefNx
 25bf1578vHld/ZCIChZh60gXcd3fIK+ICImoDhpc/7Napeo/VKfSf93UAzeGfWMSPl3UEbkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240179

On Tue, 24 Jun 2025 at 12:57, Yongxing Mou <quic_yongmou@quicinc.com> wrote=
:
>
>
>
> On 2025/6/19 19:33, Dmitry Baryshkov wrote:
> > [initially I responded off-list by mistake, sorry for the confusion and
> > possible duplicates]
> >
> > On 19/06/2025 12:26, Yongxing Mou wrote:
> >>
> >>
> >> On 2025/6/16 22:41, Dmitry Baryshkov wrote:
> >>> On 16/06/2025 17:09, Yongxing Mou wrote:
> >>>>
> >>>>
> >>>> On 2025/6/11 22:31, Dmitry Baryshkov wrote:
> >>>>> On Wed, Jun 11, 2025 at 08:06:28PM +0800, Yongxing Mou wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2025/6/9 23:44, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> >>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>>
> >>>>>>>> Add connector abstraction for the DP MST. Each MST encoder
> >>>>>>>> is connected through a DRM bridge to a MST connector and each
> >>>>>>>> MST connector has a DP panel abstraction attached to it.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 +++++++++++++++++++
> >>>>>>>> + + + ++++++++++++++
> >>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
> >>>>>>>>    2 files changed, 518 insertions(+)
> >>>>>>>
> >>>>>>> It generally feels liks 80% of this patch is a generic code. Plea=
se
> >>>>>>> extract generic DP MST connector and push it under drm/display.
> >>>>>>> Other DP
> >>>>>>> MST drivers should be able to use it.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/
> >>>>>>>> drm/ msm/dp/dp_mst_drm.c
> >>>>>>>> index
> >>>>>>>> a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f476=
9b2153fc5153c4cb41 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> >>>>>>>> @@ -25,8 +25,12 @@
> >>>>>>>>     * OF THIS SOFTWARE.
> >>>>>>>>     */
> >>>>>>>> +#include <drm/drm_edid.h>
> >>>>>>>> +#include <drm/drm_managed.h>
> >>>>>>>>    #include "dp_mst_drm.h"
> >>>>>>>> +#define MAX_DPCD_TRANSACTION_BYTES 16
> >>>>>>>> +
> >>>>>>>>    static struct drm_private_state
> >>>>>>>> *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> >>>>>>>>    {
> >>>>>>>>        struct msm_dp_mst_bridge_state *state;
> >>>>>>>> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct
> >>>>>>>> drm_dp_mst_topology_mgr *mgr, int p
> >>>>>>>>        return num_slots;
> >>>>>>>>    }
> >>>>>>>> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel
> >>>>>>>> *msm_dp_panel)
> >>>>>>>> +{
> >>>>>>>> +    struct msm_dp_link_info *link_info;
> >>>>>>>> +
> >>>>>>>> +    link_info =3D &msm_dp_panel->link_info;
> >>>>>>>> +
> >>>>>>>> +    return link_info->rate * link_info->num_lanes / 54000;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static int msm_dp_mst_compute_config(struct drm_atomic_state
> >>>>>>>> *state,
> >>>>>>>> +                      struct msm_dp_mst *mst, struct
> >>>>>>>> drm_connector *connector,
> >>>>>>>> +                      struct drm_display_mode *mode)
> >>>>>>>> +{
> >>>>>>>> +    int slots =3D 0, pbn;
> >>>>>>>> +    struct msm_dp_mst_connector *mst_conn =3D
> >>>>>>>> to_msm_dp_mst_connector(connector);
> >>>>>>>> +    int rc =3D 0;
> >>>>>>>> +    struct drm_dp_mst_topology_state *mst_state;
> >>>>>>>> +    int pbn_div;
> >>>>>>>> +    struct msm_dp *dp_display =3D mst->msm_dp;
> >>>>>>>> +    u32 bpp;
> >>>>>>>> +
> >>>>>>>> +    bpp =3D connector->display_info.bpc * 3;
> >>>>>>>> +
> >>>>>>>> +    pbn =3D drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
> >>>>>>>
> >>>>>>> Is this going to change if DSC is in place? Will it bring
> >>>>>>> fractional BPP
> >>>>>>> here?
> >>>>>>>
> >>>>>> Actually, in this patch series, MST not support DSC. So we just do=
n't
> >>>>>> consider this scenario.
> >>>>>
> >>>>> But you still can answer the question.
> >>>>>
> >>>>>
> >>>>> [...]
> >>>>>
> >>>> 1.Emm, for my current understanding, if DSC is enabled, the BPP
> >>>> should change and recaculated.
> >>>> Will it bring fractional BPP here?
> >>>
> >>> That's what I am asking
> >>>
> >>>>  >>>I'm not entirely sure about this answer. I checked how other
> >>>> drivers call this function, and they all use bpp << 4, so can we
> >>>> assume that this way of calling it is valid?
> >>>
> >>> It is valid. I'm trying to understand the implications and future
> >>> changes.
> >>>
> >>>>>>>> +
> >>>>>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display-
> >>>>>>>> >connector->display_info, mode);
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static struct drm_encoder *
> >>>>>>>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector,
> >>>>>>>> struct drm_atomic_state *state)
> >>>>>>>
> >>>>>>> Do we need this callback? Don't we have a fixed relationship betw=
een
> >>>>>>> connectors and encoders?
> >>>>>
> >>>>> This was left unanswered.
> >>>>>
> >>>> Sorry, I didn't mean to skip any questions =E2=80=94 I just planned =
to reply
> >>>> a bit later. Apologies for the confusion.
> >>>> For this question, yes , we don't have the fixed relationship
> >>>> between them. Under the current codes, the Connector selects the
> >>>> available encoder and bridge in order from index 0 to 4 (up to
> >>>> max_streams) when the connector's status changes to 'connected'.
> >>>
> >>> Why? Can we have 1:1 relationship as we do with other bridges?
> >>>
> >> Emm, It may be because the number of MST connectors is not fixed, but
> >> rather determined by the number of output ports on the dongle. For
> >> example, in a 2-MST case, there are 2 encoders, but there could be
> >> four MST connectors if the dongle has four DP output ports.
> >> add_connector() creates MST connectors based on the number of outputs
> >> on the dongle, rather than the actual number of connected devices.
> >
> > Ack, this should be a part of the commit message.
> >
> >>>>>>>
> >>>>>>>> +{
> >>>>>>>> +    struct msm_dp_mst_connector *mst_conn =3D
> >>>>>>>> to_msm_dp_mst_connector(connector);
> >>>>>>>> +    struct msm_dp *dp_display =3D mst_conn->msm_dp;
> >>>>>>>> +    struct msm_dp_mst *mst =3D dp_display->msm_dp_mst;
> >>>>>>>> +    struct drm_encoder *enc =3D NULL;
> >>>>>>>> +    struct msm_dp_mst_bridge_state *bridge_state;
> >>>>>>>> +    u32 i;
> >>>>>>>> +    struct drm_connector_state *conn_state =3D
> >>>>>>>> drm_atomic_get_new_connector_state(state,
> >>>>>>>> +                                            connector);
> >>>>>>>> +
> >>>>>>>
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> >>>>>>>> +        if (WARN_ON(!old_conn_state->best_encoder)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        drm_bridge =3D
> >>>>>>>> drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
> >>>>>>>
> >>>>>>> This really looks like this should be a bridge's callback.
> >>>>>
> >>>>> And this one
> >>>>>
> >>>> Emm, the bridge does not implement atomic_check(). All MST-related
> >>>> checks (such as drm_dp_atomic_release_time_slots,
> >>>> drm_dp_mst_atomic_check, or others) are performed in the connector's
> >>>> atomic_check function. I believe this is because both num_slots and
> >>>> pbn are stored in the bridge, and we call this to get the drm_bridge=
..
> >>>
> >>> So, please split them into connector and bridge checks, calling them
> >>> from corresponding hooks. It might be easier to migrate completely to
> >>> the bridge's atomic_check(). At least it will save us from this
> >>> clumsy code getting the bridge for the connector.
> >>>
> >> Maybe we don't need to move to bridge's atomic_check(). Connector's
> >> atomic_check() do 2 things: 1.Call drm_dp_atomic_release_time_slots
> >> when unplug, 2. Call drm_dp_atomic_find_time_slots and
> >> drm_dp_mst_atomic_check when plug in.
> >
> > Actually... I don't think you are calling it in a correct way. It shoul=
d
> > be called from the drm_mode_config.atomic_check, not from connector's
> > atomic_check(). See how nouveau driver does it. Even documentation
> > insists that it should be called _after_ checking the rest of the state=
.
> >
> In the documentation, drm_dp_atomic_find_time_slots should be placed in
> drm_encoder_helper_funcs.atomic_check(),

I'm not sure about this. Our encoders are implemented by the DPU
driver, so I'd rather not call MST functions from it.
You might call it from drm_bridge_funcs::atomic_check(), it is being
called at the same stage.

> drm_dp_atomic_release_time_slots in
> &drm_connector_helper_funcs.atomic_check(), and drm_dp_mst_atomic_check
> in &drm_mode_config_funcs.atomic_check(). So maybe we can move these
> atomic_check() calls back to their original positions as do, as
> recommended in the documenttation.

These two are fine. Please move them to proper places.

> >> 3 functions need drm_atomic_state, but it seems that
> >> drm_bridge_funcs.atomic_check() does not pass in drm_atomic_state.
> >
> > You can get drm_atomic_state from bridge_state->base.state, crtc_state-
> >  >state, connector_state->state, that's not really an issue.
> >
> >> Actually both 2 actions only occur when need modeset. Maybe we can
> >> optimize this function in the following ways: (1) reduce unnecessary
> >> references to drm_bridge, especially since bridge_state-  >num_slots
> >> can replace with payload->time_slots; (2)As your comments, split the
> >> function into smaller parts to better reflect the logic.
> >
> > Yes, please. Getting rid of bridge_state->num_slots is a good path forw=
ard.
> >
> Emm, even if we can drop bridge_state->num_slots, we still need to
> access bridge_state when clearing bridge_state->connector and
> bridge_state->msm_dp_panel, so it might not be possible to completely
> eliminate the use of bridge_state here.

This is fine. We should drop state-related data from
msm_dp_mst_bridge, the msm_dp_mst_bridge_state can stay.
I wanted to get rid of unnecessary slots management in the MSM DP
driver, the state is fine to exist.

> >>>
> >>>>>>>
> >>>>>>>> +        if (WARN_ON(!drm_bridge)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +        bridge =3D to_msm_dp_mst_bridge(drm_bridge);
> >>>>>>>> +
> >>>>>>>> +        bridge_state =3D msm_dp_mst_br_priv_state(state, bridge=
);
> >>>>>>>> +        if (IS_ERR(bridge_state)) {
> >>>>>>>> +            rc =3D PTR_ERR(bridge_state);
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        if (WARN_ON(bridge_state->connector !=3D connector)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        slots =3D bridge_state->num_slots;
> >>>>>>>> +        if (slots > 0) {
> >>>>>>>> +            rc =3D drm_dp_atomic_release_time_slots(state,
> >>>>>>>> +                                  &mst->mst_mgr,
> >>>>>>>> +                                  mst_conn->mst_port);
> >>>>>>>> +            if (rc) {
> >>>>>>>> +                DRM_ERROR("failed releasing %d vcpi slots
> >>>>>>>> %d\n", slots, rc);
> >>>>>>>> +                goto end;
> >>>>>>>> +            }
> >>>>>>>> +            vcpi_released =3D true;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        if (!new_conn_state->crtc) {
> >>>>>>>> +            /* for cases where crtc is not disabled the slots
> >>>>>>>> are not
> >>>>>>>> +             * freed by drm_dp_atomic_release_time_slots. this
> >>>>>>>> results
> >>>>>>>> +             * in subsequent atomic_check failing since
> >>>>>>>> internal slots
> >>>>>>>> +             * were freed but not the dp mst mgr's
> >>>>>>>> +             */
> >>>>>>>> +            bridge_state->num_slots =3D 0;
> >>>>>>>> +            bridge_state->connector =3D NULL;
> >>>>>>>> +            bridge_state->msm_dp_panel =3D NULL;
> >>>>>>>> +
> >>>>>>>> +            drm_dbg_dp(dp_display->drm_dev, "clear best
> >>>>>>>> encoder: %d\n", bridge->id);
> >>>>>>>> +        }
> >>>>>>>> +    }
> >>>>>>>
> >>>>>>> This looks like there are several functions fused together. Pleas=
e
> >>>>>>> unfuse those into small and neat code blocks.
> >>>>>
> >>>>> And this :-D
> >>>>>
> >>>> Got it.. this code only do one thing, check and try to release
> >>>> time_slots.. we can try to package it into small functions..
> >>>
> >>> I still don't understand, why do we need to release time_slots here
> >>> instead of using MST helpers.
> >>>
> >> Emm , just as above reply.. when we need modeset, call
> >> drm_dp_atomic_release_time_slots to release payload and then clear
> >> bridge_state cached ..
> >
> > I don't see other drivers limiting drm_dp_atomic_release_time_slots() t=
o
> > the modeset case. Any reason for MSM driver to deviate from that?
> >
> Actually, you are right. I think the drm_dp_atomic_release_time_slots
> function can handle the slots releases quite well by itself. This
> function can handle various changes in crtc_state quite well. These
> constraints are more about supporting the cleanup of
> bridge_state->connector and bridge_state->msm_dp_panel.

Can't we keep msm_dp_panel in the connector's state and access it by
getting the state by the connector?

> >
> >
> >>>>>>>
> >>>>>>>> +
> >>>>>>>> +mode_set:
> >>>>>>>> +    if (!new_conn_state->crtc)
> >>>>>>>> +        goto end;
> >>>>>>>> +
> >>>>>>>> +    crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >>>>>>>> new_conn_state->crtc);
> >>>>>>>> +
> >>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> >>>>>>>> crtc_state- >active) {
> >>>>>>>
> >>>>>>> Use of crtc_state->active doesn't look correct.
> >>>>>
> >>>>>
> >>>>> ...
> >>>>>
> >>>> Sorry, I'm still not quite sure where the issue is. Could you please
> >>>> help point it out? Thanks~~
> >>>
> >>>
> >>> Please refer to the documentation for drm_crtc_state::active. The
> >>> drivers are not supposed to use this field in checks.
> >>>
> >> Got it , so maybe drm_crtc_state::enable might more appropriate here..
> >
> > Well, why do you need it in the first place? This will determine a
> > correct set of conditions.
> >
> Got it. Let me look into whether this can be optimized.
> >
> >>>>>>>
> >>>>>>>> +        if (WARN_ON(!new_conn_state->best_encoder)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        drm_bridge =3D
> >>>>>>>> drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
> >>>>>>>> +        if (WARN_ON(!drm_bridge)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +        bridge =3D to_msm_dp_mst_bridge(drm_bridge);
> >>>>>>>> +
> >>>>>>>> +        bridge_state =3D msm_dp_mst_br_priv_state(state, bridge=
);
> >>>>>>>> +        if (IS_ERR(bridge_state)) {
> >>>>>>>> +            rc =3D PTR_ERR(bridge_state);
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        if (WARN_ON(bridge_state->connector !=3D connector)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>
> >>>>>>> Can all of this actually happen?
> >>>>>
> >>>>> ...
> >>>>>
> >>>> Actually not, I haven't encountered it yet. I'm not sure how to
> >>>> trigger it, but it might occur under race conditions? Or we just
> >>>> remove it untill some case it really happen..
> >>>
> >>> No. You actually think whether this condition can happen, then keep
> >>> it if it can (and drop it if it can not happen).
> >>>
> >> Got it. Let me test a few different cases to see if these scenarios
> >> occur.
> >
> > No. It's not about testing. It's about asserting if the scenario can
> > occur or not per your call stacks and per the design / contract.
> >
> Got it. Let me check this part again. I don't think these errors would
> occur under the current design. But if the system enters a  inconsistent
> error state, this code could help improve our stability.

Then please eliminate a way for the system to enter an 'inconsistent
error state'.

--=20
With best wishes
Dmitry
