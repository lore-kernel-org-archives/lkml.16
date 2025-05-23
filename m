Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A214A627
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747982256; cv=none; b=I+rj3WrBvzl7TQzRAKhedECz/pwPnG45tm3Smdb5vWB2f2bJaxF7/ALBleu4TS4Pv+bEJ8JJBlrpwqunYVzQv2MG1H/7nQAwW8hXvxYjzhsaAtlxQNP1dEY6rAuQEJ5Mg230gbr3t1yYPYJJT1LSZ9t2GEh0pRLQhdMw+ILo13s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747982256; c=relaxed/simple;
	bh=DuDDTcoTLQLxYq8NvtdqagUTfCPePdcdDQuo4GzHLN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYzvQw2F/nPJCYMQIcOUD2sEvNE5STp2AVBkrDM6t9hz2VH1qu5tvhVFDf0jHPKCsqMOKzZDLtX+YHkh8dKkBSr6Xoct4vMnOIS+GP3FizPedGwIhY4ChtV+AUDQITAH7vi6QjAsLGXUKAe/1vgtqmSK1ZFMhw828Tfl/K0D+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTnRr9dw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTnRr9dw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N2Pb4i000805
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7zz9ji5cIOjQX4hOArDwk738
	7kW3RHiO0O55xfpG6Is=; b=CTnRr9dwe2M1uplDPARZQcexO+uO9BvrWd79mhEd
	/8SyRruLPI2+aUB1/LEbGGyYbGX9sb/0p5WJuJvcHy0awqqYEUOYHccDZf404un8
	2KDOK3mHDTJyO4Tasn9TgZbqp3ZanwzuZm+eGcaihD6sk9b+XKgz++auX1P2fSMl
	n0FhI6tbKqa4gX4pQ+gaBGyduCv1SPMXzHPoJ7PYknu5fGEXmTtn8frDEynvibxi
	NwxwfITftgnVN3Wcr+13m8bLPggSYb0u5MUBzonZ8tu3YF6LowVxtHlqlBTM+0HQ
	jjLBeLtBJImWo+T0LqA+vKwawUt+l8XY61qBEFrqtV+5sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tqbjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:37:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23222fdb4f2so93663265ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747982251; x=1748587051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zz9ji5cIOjQX4hOArDwk7387kW3RHiO0O55xfpG6Is=;
        b=hfXO5RVN6NVJr6aWBzR8nx0Be9+40G1Wv4nuAwI8g/FhhW1YRzKVNCUudkTCYfuJTT
         tzpexw71Wnalccy/L4ITHlbC+vWEoEIGSVhyEbVanXZ5AjPYisfM5hYZqpwHVAuVYSXs
         DePmLoqaB1jp8LqFTGJOuk02qlPvjC2cDR9ZhBsU5lKlR94nyZ1Tk6Y+QExaFYla8tIA
         gjKQGK+l7442miKgFLk4B/9ljWharBNfrg+xQEWhdARDuLZ8rwIUX1m//RZJqnabNRrA
         McfzJ1jXO1S8xL/KcY8HkjowzkCrARAEubdhoU7NLZNrNH7d+79TMMsUeqPkh0ZbiSjn
         wcLg==
X-Forwarded-Encrypted: i=1; AJvYcCXSWu2hvzr+BXAbANQ4uwOyB5B0Sanno3naKWRjfTHgOWljJ54N9iO4QSzQRVy3ZxDp3KFyCxZOxdNyat8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzezzs4U6IOzCahzQzEy1u39EDDAiCEh9km1b5h75ug3xQloBkf
	FWdjneQosuUD/L40MuAwg2HX/EntrBtte9aO8wxKe2E9JuHEYkvjbzKQba4UTIM/LA8C6XT4dMb
	+EIsM9Mt1UCCm8FG4X29u5bagJ7fkz1zqx2tVNXyE110/DZ+n7cbMANhSeIaU/eaROdnTLuyG5c
	Po5yHdJpEyp53CGp988PFPX3ArkXidxCdy0rm0rajrkA==
X-Gm-Gg: ASbGncv9iqxuoSZist1HhznzbKpnH+Mb/2L6Zr/3uRqUMaMYafdV5cfQHl3gpwGSi47
	jyiAdgZvFshg0OqSMkwwRRJJli68SDm6FhA2GfTgPYW5mYP26oHfn+JImEYkpkQxEanXOheZ26+
	KFW0loRT8=
X-Received: by 2002:a17:902:ecd2:b0:220:c178:b2e with SMTP id d9443c01a7336-231de35f33amr364720665ad.17.1747982251287;
        Thu, 22 May 2025 23:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuaiuV0G9QRGb5Hnq6IbqmN3mBTTf5yONFPPCpe95iMPXazI01z8NelzftlSRDOYxi7XzKHqGchw3ayhEjyjY=
X-Received: by 2002:a17:902:ecd2:b0:220:c178:b2e with SMTP id
 d9443c01a7336-231de35f33amr364720215ad.17.1747982250907; Thu, 22 May 2025
 23:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com> <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 May 2025 09:37:19 +0300
X-Gm-Features: AX0GCFs98FdOCY-yZ7IKpHyVKbDhhDl08gc-loWfxbzIQ7gAa6-h1r4-ygftWGg
Message-ID: <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=683017ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=yC-0_ovQAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AFwX74By9Q62wxIGxlYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9rDSmLnA8n3CFGFLWCCb_D7mU2JUZxox
X-Proofpoint-GUID: 9rDSmLnA8n3CFGFLWCCb_D7mU2JUZxox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1OSBTYWx0ZWRfX80M3ZLHY+MMy
 rgOZ2ic4gUU9j5jgJtTE2D7sOk/GrlOrqU3UVAKffEHRNeM80Q0zi4KXS1SsN2N9L+uuUqDKcJw
 zMz+mUcNHljzrK3skKZFgh4gDjw1fxrcKsUMfTyLbF2I4KeI7tmyynnzYpdTdkGCmCEzfNZpHZv
 3yGNWlmPXqYvBX+CMI8h2J2hW7XEYS7WLIKPQpa1i1+vLJwEYgcneK4syrkcHos5aK7ahcQ10XA
 2FiGtJDAefIU+/gp8lG4XLib8WropwXGZ8+2h0Bj8ZtqpP1ZP25mqPUkOIxFMAfCgdhOaotzxk8
 VtoC9dr+ym26lXv5z9r6sSDgQs/FTgRt9O7K2Ygv3+cvGWPmC34vo+4pFI3ySS1G0PpK2WOZK1e
 XJzmpA3wNTieqlrQA0N17XkVEiGZcChlEQgfiI/SYo/3pmc9BnTD+unZkFwwY1j8sCkersYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230059

Hi Biju

On Fri, 23 May 2025 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Dmitry Baryshkov,
>
> Thanks for the series.
>
> Looks like, After this patch, when I change resolution using modetest it is not working.
> Monitor is showing out of range/No signal on RZ/V2L SMARC EVK connected to ADV7535.
>
> Not sure, I am the only one facing this issue?

I have been testing the series on db410c / adv7533, but something
might have changed between the testing time and the present time. I
will try checking it next week.

In the meantime, you can probably try comparing what gets programmed
in adv7511_mode_set().

>
> Modetest works fine with 6.15.0-rc6-next-20250516, where this patch series is
> not present.
>
> Cheers,
> Biju
>
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dmitry Baryshkov
> > Sent: 20 May 2025 23:40
> > Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
> >
> >
> > On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> > > Currently it is next to impossible to implement CEC handling for the
> > > setup using drm_bridges and drm_bridge_connector: bridges don't have a
> > > hold of the connector at the proper time to be able to route CEC events.
> > >
> > > At the same time it not very easy and obvious to get the CEC physical
> > > address handling correctly. Drivers handle it at various places,
> > > ending up with the slight differences in behaviour.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [01/10] drm/bridge: move private data to the end of the struct
> >         commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
> > [02/10] drm/bridge: allow limiting I2S formats
> >         commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
> > [03/10] drm/connector: add CEC-related fields
> >         commit: e72cd597c35012146bfe77b736a30fee3e77e61e
> > [04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
> >         commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
> > [05/10] drm/display: add CEC helpers code
> >         commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
> > [06/10] drm/display: hdmi-state-helper: handle CEC physical address
> >         commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
> > [08/10] drm/display: bridge-connector: hook in CEC notifier support
> >         commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
> > [09/10] drm/display: bridge-connector: handle CEC adapters
> >         commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
> > [10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
> >         commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>


-- 
With best wishes
Dmitry
