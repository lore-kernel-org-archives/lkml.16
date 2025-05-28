Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCA728C011
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448561; cv=none; b=SKmu/hquBbH+xKFQK1RtkGUBDFZGerMzXdoetN9YNwv8r2vi2syqIUOSdokn4TiMfU+OCZaxcdRLYK0anBk+zNO6ibcnSemu6DJxKfhViw7r0boEiad5kZdggR4W1T2UUQtwzbG0g+zSdB48GEJ70UOY0ALCE6h6RF790US+lwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448561; c=relaxed/simple;
	bh=np8r8DuK6ohXYj94bzpiLLJFXyF2GOtaPunqIgAdjGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdovY5HV8ZM6G1q6txgaSr3urknZ0pHTxVsqhpvPThj/Y2WET5El1cEPvWcUD1SjlUyZg/Z57NH/e/U+pLxPDve+dfXutWFYjCcwA2N+mEPZX2NOwJT36hN1nZrePCiIM8FFlrljv+JAY+XpbO9y4zLKLi9I+T60A+4j7oHZkjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jATkvto2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jATkvto2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6qBiS021217
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ebk4FuXKBEehQnwIzWbtceY
	5Eq5Hvk7/WPMviultPQ=; b=jATkvto2sObAkLZQpbEMzNj94YJNvCCQ5aSCVBDh
	XTcWBQ2FjoLXpexqv68kpBzYdad4VozIQcq3xnzDnh6oCeqRE8Cx37JVopqaGCqO
	2e7+CzGS4hS53+T6kLKboYju65mFsKpiovPevzTkySJTgNlZNKvX8jHhUERZMyDU
	wlvDVWhnuJ5fzjf03HI1Q4z3j9BX8326ajLkaGaemlnbNYlpSHbXua0nIeutZnFq
	9/aamuWTykZFzcQRz+i0Cs067IbHC+doHuMPO34fglInHZ9aFUBEm5H7MQH+x7tB
	DOe0PnSFAaOqW9g/u3KXCnXVfQ0qYOolg1U13yusYooq+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcy8k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:09:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311e7d05931so881886a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448556; x=1749053356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ebk4FuXKBEehQnwIzWbtceY5Eq5Hvk7/WPMviultPQ=;
        b=Lm9Rq6o3M6H8gcG4MUZ69ovKz1teVi8H2WcT7ZPZDmh7SQNS7+O2N/VnRKn5kKUqtS
         ogV0MEp3IESWfMe1/Zs6CgOjPjwGwMzp4EAy0KINgaE0mogfO/ioA3bpqGDq+WIo2iJh
         o7ITJKETkZclGHu/Gr36bm0BULdJ7iY+R1Ysod+oM1D1sg1PiAz7t+sgP9ULEMyM5lr+
         DxdevPHSgS8vUs3Pm73EIY2ZuisXlMcRnBdQ/HjhO6rVvW9pgFGyKhmPbwP7xXZzYip2
         /CHEPhkHS8+kIZkurYoc6kUL+MalsZJdFOa8LVEK9m3e+8OzbXGvhOxtyhSWvZRPUljW
         U1RA==
X-Forwarded-Encrypted: i=1; AJvYcCXero8QKQWSuPgRH+4NMPY0I6f4CL7RJTI3PcmzotpNpcFTXWS6ou0DJovM8KDcfHQm29ngCqSsSt24pLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsl2jtrFYaabDvsqhxbenQJj0em3RBV62fSzxgoZJA7gBeizP
	9yOiEgmiFLcUwMNR6fJwq0zfvjElAu1rDf2tONDyNMSt6sfBQlfq5m+xwqnKxQDKA0irGwUhhEh
	EosvRLCWzyVt8TidhZBS2jzJJaUgRG51MTOFsUpuEuJGcSu0gMYgUd/eLK8D3vgY18OYY/5fCC5
	8t9Wcqy3CIF+uPcclEew5chU6vjky+qoXij3LGZAmB1A==
X-Gm-Gg: ASbGnct21pIUj7C2k2QfpAcs9pKsqJTfHXOYtyfXiBwJ1hr2HqO9qtSpIfpJtmjLN9s
	pODLEAwL/ySh1gDq94344H3/VxeLxaCB3k/BXcHDn5NjRMZFbvDEQhwrvbxibylnExhz0bPF6oB
	6lYfBU8AUfVO6q26wwb30zUZ0=
X-Received: by 2002:a17:90b:1fc8:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-311e8cc4409mr5694233a91.12.1748448556270;
        Wed, 28 May 2025 09:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEyU9Na6w19P6vBrFWsatyjVSIe0mXXTuG1XS0eEc1904ZaykvV6ov/DP09T7xW5vDmnuTXfgVmAxcYzfANhw=
X-Received: by 2002:a17:90b:1fc8:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-311e8cc4409mr5694169a91.12.1748448555821; Wed, 28 May 2025
 09:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527081447.304-1-kernel@airkyi.com> <e2dnvpbze4xuubggduqr3p5nnhg7huk3dnpdcb6tldxbrn2qtn@bfsewz5trfv3>
 <bc321a71-1934-4889-bd8e-3bb593c8feba@rock-chips.com>
In-Reply-To: <bc321a71-1934-4889-bd8e-3bb593c8feba@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 28 May 2025 19:09:04 +0300
X-Gm-Features: AX0GCFsUqNN07CMI1cNHp3U4iz8XhLlLFw-nWKQWlciyho8w9zoePiczSCHemug
Message-ID: <CAO9ioeXLSQyBFuedtt4=_OjEWZW6T9HaaYr8_NiNy2eh4yw-qg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 58mJwtDytTaUbJZ_gQkG0UH_n-9L1uiu
X-Proofpoint-GUID: 58mJwtDytTaUbJZ_gQkG0UH_n-9L1uiu
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6837352d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=s8YR1HE3AAAA:8 a=RRhK3aCThXU4g2SLoiEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=uGDpjx9DKq9E8W49yboe:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX7lkxnAUo4n1V
 PuMlGKh5k9tMVoC7eU/TXnEuSaEXA/1xfp8VpC/NCpOxKrJFKlU/zZAToL8LfXgCzcHjEM1uxTs
 bbhTVfZ4O1cbkE/F9RGXTl5BZGtr6x/rE3EIQCP9azxH3y29cvrMEA97Htgvj6Nn9zA234s2ns/
 l/XEPNOiJceRKvfXGt9TBmBegDkvOiRmVcIaDCRf+pQxSrIYOMIZKaZtXYOWfYwbSykmPcu5zQ0
 1/v/5FocDKrtIist/ZylRmRemicYoiwVbBuBCFveeSReBr9tzG7wtKdrM0DjicrVQdZjTT9upLE
 GLCr5jQ/Elqo7Vm4ewOnMF7VocdQ/TMqxA6YpbfA06ADfSEkkHBMPVRi8RNv/pYaLWDrl7fe6oH
 VpLzg93oPmg12BSjszg/2pfbOEHSUkCs7bmFf0+zaCsptQttxIptr3Peb8ML4B/Fd9aCpc/V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=966 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280141

On Wed, 28 May 2025 at 04:57, Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2025/5/28 4:25, Dmitry Baryshkov wrote:
> > On Tue, May 27, 2025 at 04:14:47PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> Convert it to drm bridge driver, it will be convenient for us to
> >> migrate the connector part to the display driver later.
> >> Considering that some code depend on the connector, the following
> >> changes have been made:
> >> - Only process edid in &drm_bridge_funcs.edid_read(), so no need to
> >> store additional edid info.
> >> - Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
> >> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> >> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> >> cdn_dp_bridge_atomic_enable().
> >> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.
> >>
> >> This patch also convert to use devm_drm_bridge_alloc() API.
> >>
> >> Tested with RK3399 EVB IND board.
> >>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Link to V2: https://lore.kernel.org/all/20250523011310.120-1-kernel@airkyi.com/
> >> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers
> >> - Remove the dependency for connector
> >> - Remove the extra stored edid
> >> - Code cleanup
> >>
> >> Changes in v2:
> >> - Link to V1: https://lore.kernel.org/all/20250507035148.415-1-kernel@airkyi.com/
> >> - Use drm_atomic_get_new_connector_for_encoder() to get connector
> >> - Convert to use devm_drm_bridge_alloc() API
> >> - Fix typo: cdn_dp_connector_edid_read -> cdn_dp_bridge_edid_read
> >>
> >>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 279 ++++++++++---------------
> >>   drivers/gpu/drm/rockchip/cdn-dp-core.h |   9 +-
> >>   2 files changed, 110 insertions(+), 178 deletions(-)
> >>
> >
> >> @@ -595,16 +546,41 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
> >>   static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
> >>                                             bool plugged)
> >>   {
> >> -    if (dp->codec_dev)
> >> -            dp->plugged_cb(dp->codec_dev, plugged);
> >> +    if (dp->sink_has_audio)
> >> +            drm_connector_hdmi_audio_plugged_notify(dp->connector, plugged);
> > I'd say, notify always and let userspace figure it out via the ELD. Then
> > you shouldn't need sink_has_audio. This would match the behaviour of
> > HDMI drivers.
>
> Oh, I find that there are similar usages in qcom msm driver. Is there
> any more progress?

For msm driver it is required as DSP requires HDMI to be plugged for
the audio path to work.

>
>
> >
> >>   }
> >>
> > [...]
> >
> >> @@ -705,8 +681,6 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
> >>
> >>   static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
> >>      .mode_set = cdn_dp_encoder_mode_set,
> >> -    .enable = cdn_dp_encoder_enable,
> >> -    .disable = cdn_dp_encoder_disable,
> >>      .atomic_check = cdn_dp_encoder_atomic_check,
> > Nit: for the future cleanup, it should probably be possible to get rid
> > of these encoder ops too by moving them to the bridge ops.
>
> Interesting, have these patches been submitted upstream yet?

Everything is already there, see drm_bridge_funcs::mode_set() and
drm_bridge_funcs::atomic_check().


-- 
With best wishes
Dmitry
