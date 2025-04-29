Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DE24113A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945227; cv=none; b=qSpIqWsElRynJlE/mDU7t9QlqXvOMAqPsTO+KzUOObZTux8U7gthsHWgvuIeLRTzALp0DKe7EgnpL8YbYN34Dvkr1dSListArEM5QUL/EtUAzLyN4SzuIE4Ea+a4qp3yuyvhAjo2cU5XA8ur4eT0UlSH1gvPRoUxKYwAknEeZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945227; c=relaxed/simple;
	bh=phFsES7DGYT5NlSy8kp4sZHS+AjPmyZPv5TZteJlgo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaK/Wfr7j7ErlBJLLv7vQB4/tqVGtD5WQdIiu8NaAwNev2LCNK3JibEpdVgAf9P7JIDj+EywCvImbmHtu45gII3LzaFzCgjuWkngOg1oT2KFyGFQis4ze746Sv/xdOz5RWHUata10USYmTjxr6NRywo7G6jDBFerqt1ohH+bS5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AyYz4jb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyYz4jb7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA9Gs0015867
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eqNoyHjkcctYSQrn1Iq6iSEJ
	8th9hbx8RpiDsByijRQ=; b=AyYz4jb7SvaLjVztP+lerILQhDnC+Xtb4d0Xah/O
	UNRYO9TFWaAEAeAz2YcbU7ozf6e4y0io2N+xwhVq60ZYmSEsRkJBBXaMvz7hM2WW
	lQCQ1i6zwYRU8s6DcEpRaVjTzfiYko0+N5hxXEFeFvwKT0D35wPvDvreSERoF2xb
	5uxwxH2E5jF2gS5rKD18c+N+dOo28Spub+qS5fPoeQa5yB5OcnZpg54J336RwMsV
	0LLR3LXnTli+k0Ju1cgvHvP4S/V6cvul8a+jtCZhb6OVs81jIfTfdXW+Drl3RypC
	uxnrVG9bP/zGVw1r0o6hN4Pxq8UTvoTliHeNVrsoqfevPg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hv50d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:47:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3085f5855c4so5471004a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745945224; x=1746550024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqNoyHjkcctYSQrn1Iq6iSEJ8th9hbx8RpiDsByijRQ=;
        b=H/6+iyh3ubl5GOTH2f61gz40KJF+rXKXYq++q63q8GtlZOh7Ds8qZW8DZxw9j6vYWk
         qnHGF6ibEr6DcrJmDPAC/uczhF7XZjI/uwkZmb/v0728fqvsJCtjNoFbrkp6CzoMnXv0
         rbU0f9aTWcLsGinVf16QS3oW8iepkZSLhQ51pe9Lo3M4stNpK41tvoC6BDQDWBWn8Z32
         U+tU4CJqve9zbfdTNdm7IAkH3tAmhcAi5O9B5VnL7+s6KL0Ao7Zl/oi6oI6ZbuYquw5K
         gK5G+c2whBaS3qS5VQqEtgMN3sWBC/mkTEikZ4rJoiXCXojnGd0ojvr88mvkhY7zZXNE
         eoMA==
X-Forwarded-Encrypted: i=1; AJvYcCWKApPpz33ASBev9iPbQOMOPKtYAXT/I6KnuZ0j2jeRjlYTAQ7InsEKF9HS+VrrSCYkzocRzKsZugxjjOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHVJc+FIHPc2dwYi8dUO0moi3YyWroL72lbrl1PKvtkcoEp7K
	Cedl0UmKfDJikXgRhXpTYv9B++Dp3pheu3mXK4gWFu0NJ0cmJFW7UUQH3R8rG2TX8uOhTP7FYKo
	/WpWq3/E32B7+UX8yJsCd5re6zODkXKHNYNAO1dOYeN0azzZ5UApvtrxY9tBBg6a4Qyh/ZbEl4G
	co9D0vDD5vyyf/ZjgV+AluwuQgSBfeUL+8bFMN6Q==
X-Gm-Gg: ASbGnctS4yug5z8iIJZWbr+O14c7FSXtdOICAYG64rQzTWRzHZTq9yukwMMuTeOGrvh
	g3dpplAHNiY0lFg3145JzGASEKRhw35gy1T7mF/NA8V6XURe1HR+msEXZsADnEVURDA==
X-Received: by 2002:a17:90b:524c:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30a23e269c2mr4781100a91.27.1745945223839;
        Tue, 29 Apr 2025 09:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi0o3xU62JdXQTxksmJklqUnRMCVyekdyOrSul4P6znsNkMxxaFaRD1beymYiPrXnqc3Ot9cGFwXcfdi/gQBQ=
X-Received: by 2002:a17:90b:524c:b0:2ff:4e90:3c55 with SMTP id
 98e67ed59e1d1-30a23e269c2mr4781067a91.27.1745945223422; Tue, 29 Apr 2025
 09:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
 <20250414-hissing-auspicious-goldfish-78b9dc@houat> <f59c0ab6-2391-4712-a3d5-18e67f538d4f@oss.qualcomm.com>
 <20250429-whimsical-thankful-chowchow-dfaa5f@houat>
In-Reply-To: <20250429-whimsical-thankful-chowchow-dfaa5f@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 19:46:52 +0300
X-Gm-Features: ATxdqUEub77egclVnE1kar8iYgamQU1KG3_a4GxVycxIOSNztFH1uWmeGtYRIOY
Message-ID: <CAO9ioeUwDVKh5ELE-ces58eLFrsm1ML8ii8=xhXbpfZOmCjHig@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 3adyD3glPr-ZvtYSrPmNZLfO-RXpzarm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEyNCBTYWx0ZWRfX4QhzUjdKjkIc zo0HYRIxWoiwfAe/YgX88dpAHtlnYbJVpKi2qElJYSIS5XlTA3XujUNLAKsE0Y4BCerHPFQXQDv 531lJJQd6EgCMuxv9L/6oD8cY0/BCvMDr7F65rZR2k092kylKYf9StKVyfi0W4OeHao/wh0G2j3
 Y5winCUq0ZZndAfet23F3OcdUOTxz/fcQa7INJm2ODRWs5tzB2mLZaLj5itu4g7DiT6ZqcfuqPf vrQrD+Qvk3iXK1h0Rro0rpN+reRMAXQCT54CvUtXo8Nn4Ajc3XMVYCHtWB3kR/hlIeSezCV2kAk Ds9QsLLjj4gpbj9oj3euKkWsniiw9g6Fd9ahLqb519qb1NlA+0PmwFZacWCLCi46Lc7b5YJ2qzM
 b1Lvn3u9w1dxTJAmBtYkokogzW+1GEZG5q5MYjF6CtQQHvrlGg+LbyRQvNk2P/F8Y5zZfR3h
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=68110288 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=V8rqUTlK7HnvwxUfKq4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3adyD3glPr-ZvtYSrPmNZLfO-RXpzarm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290124

On Tue, 29 Apr 2025 at 18:35, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Apr 15, 2025 at 12:03:23PM +0300, Dmitry Baryshkov wrote:
> > On 14/04/2025 17:47, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
> > > > In order to make sure that CEC adapters or notifiers are unregistered
> > > > and CEC-related data is properly destroyed make drm_connector_cleanup()
> > > > call CEC's unregister() callback.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_connector.c | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c2824683ece37cfbcd3300 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
> > > >   }
> > > >   EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
> > > > +static void drm_connector_cec_unregister(struct drm_connector *connector)
> > > > +{
> > > > + if (connector->cec.funcs &&
> > > > +     connector->cec.funcs->unregister)
> > > > +         connector->cec.funcs->unregister(connector);
> > > > +}
> > > > +
> > > >   /**
> > > >    * drm_connector_cleanup - cleans up an initialised connector
> > > >    * @connector: connector to cleanup
> > > > @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> > > >           platform_device_unregister(connector->hdmi_audio.codec_pdev);
> > > > + drm_connector_cec_unregister(connector);
> > > > +
> > >
> > > Actually, since we know that the HDMI connector is drm-managed, why
> > > can't we make the call to connector->cec.funcs->unregister a drm-managed
> > > action registered by drm_connector_hdmi_cec_register?
> >
> > I haven't settled yet in my mind whether we can/should also use this
> > infrastructure for drm_dp_cec management. So, at this point, I'd prefer to
> > keep a non-managed unregister function. Once we settle on something for
> > drm_dp_cec, we can switch to drmm.
>
> I'd rather do the opposite. Let's go for drmm for now, and if we need to
> change it for DP, we can always change it.
>
> "Nothing is so permanent as a temporary solution", so I'd rather have
> the natural and consistent one for now :)

Ack, I'll change that for the next version.

-- 
With best wishes
Dmitry
