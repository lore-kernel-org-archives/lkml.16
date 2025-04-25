Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A71DB127
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573290; cv=none; b=A/0FMul14Xh0CJi5dByoBTPr32nmZHOfQEej4d1Lv5g7LWMcaNY7xT/L9YGoLwt47Si5yDNBJVf3c82kf5zHPHgTD/os13iKVcUE/za8RdBB67ZhKZtenaP9MIwLarP0m8mlOGuDWmieG2nhxzDcuaS3FbzOAvF437fOWceuVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573290; c=relaxed/simple;
	bh=iQcxKLBtmBqHnu1nzKcXDSmV+Me+GwDK1oPblgbSRTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGUUxEYUisX2p5V4NCCOuJCxfR2h5ryhHlAyu1CaoHdc5u0jcddcUxzjV0nxKe5/u4y9LOsjj2Ue9MF6LcSsRFlKDOXU5Vk8Emgv7AeqePfGo4MDhV6yCQbkLAmehI93EkA1Rz9v8tG5nLUFixrWsaT48f7rtpJJJ91TePGLxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQfJItrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQfJItrK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T92Z023852
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xt2jjx4txmL59hNW/slqoBCJ
	/oGYSTNA7mQ8pWiEl4c=; b=mQfJItrKW7QKh1CevTs4eVfDZpk+xBmfsJ8ePfyr
	MgXxxMg3u2dgrr9RSzxFr9XbRswUPTH+hxBv7oQDcYv2Teli2ugzwXsX+l3hABqN
	aoQfN66dTCS+BqsgAinm9a3y3KMtVtU5oMaFdOh2iBBJiQQmCYBnc+dMC7bVJLeo
	I0g80pPZkllaFWAomLm5UI81/VsbNyJJvWCeALOkng4plnQj4JF6cVM17Spkd6jq
	od8pEIWi0ifYu/hkQ90atrmCfFyZCBoNPD1dDmfjC8MBH2Z0FWYibU4UiX3JCcEO
	DJEP1Ur5hWgMXAoy6BY0iH5ey4ypHT7Hk+VTBGaz7aFz8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1rg7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:28:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242ce15cc3so18790615ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573287; x=1746178087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt2jjx4txmL59hNW/slqoBCJ/oGYSTNA7mQ8pWiEl4c=;
        b=W8zalresdBnsdUNH9uuGk5u0c5z9Cl56uYFYkxfG01TfXNgoFp3/c5nT6f0ylrqeqZ
         fOhxcCo5Xd/F4b9wVq6p1hIvZzzhX/PLtvRBeAIZ4rIV8S/MryqXJEGpiCMOStAK9gjx
         gq9wjTWo7phhxvO/dpD6kEP6+bYwykhoJuHX2O1Lo2EcL50omT4pckqGUBqvkE13algB
         HPnxix3l7htBQYkzhikJvDiOgrB/cY+lbIX9QKyM6QI1J4dbrS+rJUuwsp8aapP8MXp/
         GULdf+eWYPkFPjur3lJ0Md2Nq5iyHGD58ctCWG41BVOFWLNC2iOaK73942wbfm9C02W2
         rqIg==
X-Forwarded-Encrypted: i=1; AJvYcCV9B/S8INH0nE3k7iFAP2tAmJz5HeTK45p+jycT811Ud2bYn6EVZuu99ZwTnkj9YmsbAPD10tI+rRf1nLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuODIEYMFcGLcL69Fu/+ZX7AtVh+bNVXSB2CiPepKyNJIR7tG
	/uDb4VB9rp+eDIuzFRiO3nTCPoCId5Y0DDAiMQydewDKGzU9tPUS2ts1CBcuUMLTFkwewSdGIa4
	QLne/vI5JNjOUIuzA9EldFdWfNCAQnsr9Vjo1VE9Qf8ETh25ASryh7pjw2UnTBkUYGoNiVkN4G7
	3yqm7vShCrQSm7RLX1QgpR5/piFu3C0cEITTW8fg==
X-Gm-Gg: ASbGnctRmFX+eqDcUtyz6NKDb38ufcL5RScaI1ikuyU9bicg5+pjgL5XkP/4sEM2yX7
	79rYiVN5XIaWOFRtIQEzKxz/q6gUzrFPub2Dp/Pkspe14AuzCaznrlzZuB1ABKDxr+T4fjMoyry
	5Z7We657g=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22dbf5ee6c8mr22878875ad.21.1745573286934;
        Fri, 25 Apr 2025 02:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7sY9pNe21FkhpOVYLUJOVzPn9xf8OZzxysQbok+sCqT4QpEP41QTCap95a4a+qxhM7yJVJ2G9ynG4MaRKCCk=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id
 d9443c01a7336-22dbf5ee6c8mr22878495ad.21.1745573286549; Fri, 25 Apr 2025
 02:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org> <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r> <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
In-Reply-To: <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:27:55 +0300
X-Gm-Features: ATxdqUHcGBSXlw8hFJp5C9Ri6LceneKkEY0gyZGnRt8lLgLrZ0UNEEiCOxxayBo
Message-ID: <CAO9ioeXhjrOyKz3N3oU6QxW+u6WUC4R5XXqWgb=7iF7Hk0Q_nQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: aZPY4c712aDJa0TiyRFJQIWIAvgOdVY4
X-Proofpoint-ORIG-GUID: aZPY4c712aDJa0TiyRFJQIWIAvgOdVY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX5n8ZKRvPPqxb hd2ej7H0jDE5mnIc0eFrPfx1R0UD98NFDLvOQ9pOhn6U5H1he17g2p0NGKWINPgvo7VxJueHASs zJXc48MbMQUvR4Xjj2fLeEb5H+QgpOPXrffZtfclIPk6jth1MwEha65aH+p9H1UsWDQU8pLER77
 Q4DvlD/8Sf4aHdhG8B1+3gT9MQJKBYbpG9XMl8u72SGoZAkx9bZe/FWIaMr8txMFSkwPIjj1Y9F m2/AjbATQ9ttn6dL6i5ne3vzAk209NYY/w4r15plgVoxk6QYSKWdk5czBVn+MFZzcjekE0va0XH Kr/WyIf3KJfQDp4S1wevDQIU0W5EBd+Dz/ZYtYNkGgpaozrGy//MhY4LZ109o4Okrss/dUWaPEn
 Nkj5CZyXeWF3+ZyI5JaG0J+qtq66HweRkR0CbCCIx0WgVv7kYRaiuphUNzktq6xjBV1jaciJ
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b55a8 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ZLr3lU9xobrfYbAAIvMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

On Fri, 25 Apr 2025 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> >>> LVDS support in MDP4 driver makes use of drm_connector directly. However
> >>> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> >>> them to use drm_panel_bridge/drm_bridge_connector. This allows using
> >>> standard interface for the drm_panel and also inserting additional
> >>> bridges between encoder and panel.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/Makefile                       |   1 -
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >>>    .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >>>    5 files changed, 28 insertions(+), 133 deletions(-)
> >>>
> >>> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >>>              * bail out early if there is no panel node (no need to
> >>>              * initialize LCDC encoder and LVDS connector)
> >>>              */
> >>> -           panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> >>> -           if (!panel_node)
> >>> -                   return 0;
> >>> +           next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> >>> +           if (IS_ERR(next_bridge)) {
> >>> +                   ret = PTR_ERR(next_bridge);
> >>> +                   if (ret == -ENODEV)
> >>> +                           return 0;
> >>> +                   return ret;
> >>> +           }
> >>> -           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> >>> +           encoder = mdp4_lcdc_encoder_init(dev);
> >>>             if (IS_ERR(encoder)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(encoder);
> >>>             }
> >>>             /* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >>>             encoder->possible_crtcs = 1 << DMA_P;
> >>> -           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> >>> +           ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>
> >> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> >> unable to find it. Just wanted to compare that against this while reviewing.
> >
> > It's the panel bridge, wrapping one of the LVDS panels.
> >
>
> Yes but what I wanted to check was which LVDS panel was being used so
> far. Looks like for arm32 the dts is missing? As I couldnt find the lvds
> out endpoint. So can you pls point me to the lvds panel you verified
> this with?

I used the AUO b101xtn01 panel connected to the LVDS connector on the
IFC6410. I'm not posting DT bits since the panel is not a part of the
kit.

>
>
> >>> +
> >>> +           connector = drm_bridge_connector_init(dev, encoder);
> >>>             if (IS_ERR(connector)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(connector);
> >>>             }
> >>> +           ret = drm_connector_attach_encoder(connector, encoder);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>> +
> >>>             break;
> >>>     case DRM_MODE_ENCODER_TMDS:
> >>>             encoder = mdp4_dtv_encoder_init(dev);
> >
>


-- 
With best wishes
Dmitry
