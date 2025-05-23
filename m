Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD51FBEA6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748033694; cv=none; b=actqZxgB4vOOTXgAk3iDfqJIdm9d/oIblfELsiK2KoHv9cRNI7DvgtvqU8qAk8ZmK7azDkGe4/CXpNksLEbj3ms7cCO/tgGEOgCDUcS4YSyqe3Zjwvzx7e5aiBVNFpRj+sMTD2I9pvCTGe8Akpcz8kBd3DKZ19nd5T3W1RK6Lqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748033694; c=relaxed/simple;
	bh=DM+Qp4g4npekAEtZLgdgilF9qPcJL3teRaFrdHybiaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oY3rGaBR6zwaptwaEnhA8LsVpiaZU/IehMwjS0BZu083KIsaaOulpw/OvrAQEXmhuq0vnFEofocdl2dtoe5T2qtl5sLMakGeNqIsD+8SdGfks3njt9nXVE5y/r4s596iOEafUJCfWIGtzyD6ZXdeo/9Vu8JOlArLIbXFkQq6LqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzaHnvd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzaHnvd8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NE0MPv021071
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xGsTmYa/MTrDvtxH7cGdAy2E
	ZY9Znbq6eFuOlZmfNV4=; b=HzaHnvd8WifaHr4q4pYESqG8VAsbPZmNHGlCS9K4
	HEiVOY06K6obNCQ0yNNfcT62vS4K+OoJJYMf/okPOdehINvpK9PeofMTfouULT3i
	0PYiRqMr/j8yVtCrgh6VeBdjueMpLWVg4k9T/EkHIHO4NnQ0Z/f40ADo1UAjbiwO
	53gdfeciJ3nyTfKfICGMpWf3Tc5/PZhvcoR7nUlG6BQWqgH6TQr3a7a14I7DsZQd
	oOGtN83AUpvgRDfir5BtY7yAlxHtFaSzrlmOez2aKw3r2YAnnybe3e51nsz8wVqf
	ZP4C8461iTRJZA9zNVA6pDpv/76dXBgQM+Ej7KwNbUIUAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa37xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:54:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e3cfc144so1971735ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748033690; x=1748638490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGsTmYa/MTrDvtxH7cGdAy2EZY9Znbq6eFuOlZmfNV4=;
        b=shDq2i4c+Z6tBSIYlJYAtAuKtR50a6/KYSePFrGv1/U60pV9p6ghvJiqI+hIessxBK
         0kp3u4IPGEJL9eaET7kxOyEjSPcbajivAZVO/Px0yV5fzqB39AeYQ9YK6fZ+UF/pi9go
         SDBxmCP08+fb7pzZeFxMVkSoujhY3QhLisgp/pGSdC7ZgvuDO2nOqHKDiA+QF7zTW1aR
         y0HfSiuSgq9OmpsBw/1m2HJ3OYAV80JFBQlvbD2wZYpduNK2JyKdgQ3VC+fyZaySrqdx
         CPyD6d0ejWeLaZoblt6xi3VnWzpNMTCbMUL9b4r+l4Da1DFmK6u5bJjhFFb+SPnIfRcM
         xFPA==
X-Forwarded-Encrypted: i=1; AJvYcCVQnpZLw9+pSmyYIVjr0/NFiagbGcwTulzCaxOJ0JdBpG+WEZDsAQm+Ob2yxvVU2CHjjv3GqpkMVpSQ2oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQsd4NSR2+rGawt3P6DovZGh5lacPfBQ+4xirOxacTLj6Q2ONk
	/V+cRjvAngTF05PbrgBjwaqEAz9AVu/cOoETD0vjN+8l5Bk3soaVtejJeEIp2dRkP7GFzsyB+Ci
	joutJGcZP6r7An9npcGGhaB9FjZRFRSAX2DtqR5IWl9NG6v7RO+CQKD8Y1Z9Q0X5f+bYw8F742n
	jqpra7Dqljdf4TA/u0A0d5lya77FFHrxRXItO/nfFZ1LdAkhfG/tcW
X-Gm-Gg: ASbGncsQuvBsP5lkMZcRNRqoDZ1LJ0k1uO2J0tSDYTjniKTSLLaNBMgvKfQh98pK+0o
	pbNDucj8k9WrOXmGj+U4bGRmAMd88zVfYcwA63tWrQxqI0xcZdX59Um3xFtSZXQH8og7l
X-Received: by 2002:a17:903:1a45:b0:21f:4649:fd49 with SMTP id d9443c01a7336-23414fd2b6emr12006005ad.49.1748033689761;
        Fri, 23 May 2025 13:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2+djcdWZZOUY45CK8hFq1ljQL9Ck+pLYoQLwnHIMvO9Lzc/dxUORmL7LuCsi7OvchWKdssRk2mjPcYXHyEa0=
X-Received: by 2002:a17:903:1a45:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-23414fd2b6emr12005815ad.49.1748033689354; Fri, 23 May 2025
 13:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
 <aDB8bD6cF7qiSpKd@tom-desktop> <aDCDMdhJIFa-4qVX@tom-desktop>
In-Reply-To: <aDCDMdhJIFa-4qVX@tom-desktop>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 May 2025 23:54:37 +0300
X-Gm-Features: AX0GCFteBc_L8q3e6jIHeV4yeCgO1fBrrsmwNcqRDkuC4xmE9RCdGZrb-qQ5ZHg
Message-ID: <CAO9ioeUBv-xBQFqqYrBLG3h1SGByMvN7mnfoiqvFXYTFrvuTYA@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830e09b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=yC-0_ovQAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t8ECiZ1qh8-ZNPQwj0wA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: MER46bCOvJaJ_vkkqz3xQwtswsgw1s4z
X-Proofpoint-GUID: MER46bCOvJaJ_vkkqz3xQwtswsgw1s4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5MSBTYWx0ZWRfX4zLPCk3vNjA7
 z8m54emNIJjjCZyREj2LzBb+H80y+/pJil1leantRTP/PhGTK+SzN9eJaoy83D7KeHbzbeLdx1I
 n6V2LvvIptZdxIHfOikzupjc5SK2cs0ro2qC4R7XynMI3cSwhF/utUEmOxzcNgc42ipWFchzc8k
 m5k4CcHRy8+9GCknigXiMT5GkdAQ1WE3VGe9L9cW46fgb31ZvqRH7QouPrkHhD8jF4laElzpYvj
 BOs4LSD46lZIkYLqqDXktvWrhtYfRVxaC/BrrQjHMTdbw26ivihFL+qDcXN6d7FJkkmwsIZCTGS
 eg6N+KQLbcxoePIqWT/sQ0A+54vKE+9TbksEifqzZYNaqEVSRkn7d8tKaSCH1cdKCBYS+Oehpwu
 rvKe/o6ciDZCj7wXu8eC8CTtv6kwPBEmhvPfKSThZNLKT0S693Y3QgPIPQhShW/E8lsGOzyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230191

On Fri, 23 May 2025 at 17:16, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Hi Biju, Dmitry,
>
> On Fri, May 23, 2025 at 03:47:24PM +0200, Tommaso Merciai wrote:
> > Hi Biju, Dmitry,
> > Thanks for your comments.
> >
> > On Fri, May 23, 2025 at 09:37:19AM +0300, Dmitry Baryshkov wrote:
> > > Hi Biju
> > >
> > > On Fri, 23 May 2025 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > >
> > > > Hi Dmitry Baryshkov,
> > > >
> > > > Thanks for the series.
> > > >
> > > > Looks like, After this patch, when I change resolution using modetest it is not working.
> > > > Monitor is showing out of range/No signal on RZ/V2L SMARC EVK connected to ADV7535.
> > > >
> > > > Not sure, I am the only one facing this issue?
> >
> > I have the same issue using RZ/G3E Smark EVK connected to ADV7535.
> > I found that switching back to the old:
> >
> >  - adv7511_mode_set()
> >  - Using also old .mode_set = adv7511_bridge_mode_set,
> >
> > Implementation fix the issue on my side.
>
> Diving a bit on this issue I'm seeing the following:
>
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>
> Same result but I think bad timing:
>
>  - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>  - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()
>
> What do you think? Thanks in advance.

It might be, we have had cases of such troubles with other bridges.
Please send a patch, I'll ack / merge it.
Please add a comment before adv7511_mode_set() that it should not be
merged to atomic_enable().

>
> Thanks & Regards,
> Tommaso
>
> >
> > Thanks & Regards,
> > Tommaso
> >
> > >
> > > I have been testing the series on db410c / adv7533, but something
> > > might have changed between the testing time and the present time. I
> > > will try checking it next week.
> > >
> > > In the meantime, you can probably try comparing what gets programmed
> > > in adv7511_mode_set().
> > >
> > > >
> > > > Modetest works fine with 6.15.0-rc6-next-20250516, where this patch series is
> > > > not present.
> > > >
> > > > Cheers,
> > > > Biju
> > > >
> > > > > -----Original Message-----
> > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dmitry Baryshkov
> > > > > Sent: 20 May 2025 23:40
> > > > > Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
> > > > >
> > > > >
> > > > > On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> > > > > > Currently it is next to impossible to implement CEC handling for the
> > > > > > setup using drm_bridges and drm_bridge_connector: bridges don't have a
> > > > > > hold of the connector at the proper time to be able to route CEC events.
> > > > > >
> > > > > > At the same time it not very easy and obvious to get the CEC physical
> > > > > > address handling correctly. Drivers handle it at various places,
> > > > > > ending up with the slight differences in behaviour.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [01/10] drm/bridge: move private data to the end of the struct
> > > > >         commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
> > > > > [02/10] drm/bridge: allow limiting I2S formats
> > > > >         commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
> > > > > [03/10] drm/connector: add CEC-related fields
> > > > >         commit: e72cd597c35012146bfe77b736a30fee3e77e61e
> > > > > [04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
> > > > >         commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
> > > > > [05/10] drm/display: add CEC helpers code
> > > > >         commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
> > > > > [06/10] drm/display: hdmi-state-helper: handle CEC physical address
> > > > >         commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
> > > > > [08/10] drm/display: bridge-connector: hook in CEC notifier support
> > > > >         commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
> > > > > [09/10] drm/display: bridge-connector: handle CEC adapters
> > > > >         commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
> > > > > [10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
> > > > >         commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >



-- 
With best wishes
Dmitry
