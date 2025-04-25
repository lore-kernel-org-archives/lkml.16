Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2912B73
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608249; cv=none; b=ZZTxCxXCsy3F3K/qgpsEfSKZQ10L27mnAG//qivPq1h5xm8zeGGdF8qfSvEzc25IwRcujEVWFCcX1dcd7Hy9RwlwJyHiLAriEfWRlAQRjZ047OxbmIOlp8dMPdfD8EaMg4zTRriLyb68TTrkpmiKbJSgcsCZ4MBBGQ/DXBgBRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608249; c=relaxed/simple;
	bh=a4rBarla8/hOO7uy6LRhAvTU7DW8bfODgiliMWDQ8Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhvP4Q/gHLWj9QTXUou0CHZM4Bglx9dUQnGhCIhvGxvgEFQw3raBV32yxQTsiFFjdVlcty4/nxH3af0pS79zTkBCcPYVqPl4tQ2pQ6FAsizss0UmmNN3tnYV4N36j9amlWTnN/4WtW+VKRzvJa7mDwUunhsIAMr/7kMLOqBC2So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVRulpmP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVRulpmP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvHp024828
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SK52ISjMMPAwyYoKNjOnDdT8
	tXPIN0birzElu7YYr84=; b=VVRulpmPP9Rz357ZIYahGqWXDWnoImjedTsJaoL3
	guwDpfGCAY28V5D95reMgP7bnrJpO98xH/XBtzQQoSQVX7bgea6NUjedHo5xDrV0
	cDXbOcmQvJR2SEkWlviPbJZhZMyb0XgaPc+oWF2fFplpMmo+FkMLAygPtMPFifa7
	cxPfx+evQc7xgDbIIY2vhI7px8H4N3wMrfwrrTQY+g9GjzFucn2MaU7MMuia7mL7
	65rhdQzeyqDogaYLmhbjfKap6Yr8IzLuCOCodhn4mrVnzxSZzX2yYLdn3/81f6HJ
	fxBr651m7bAAWHkIadXn/xvwPBV18tD+OPpL0dGsCJGh0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0sxn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:10:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so468548685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608237; x=1746213037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK52ISjMMPAwyYoKNjOnDdT8tXPIN0birzElu7YYr84=;
        b=lqGGRvmhXkjWBUelBOtLYijG6e8Os2sSa9hSxH54eNRjs1gP/bB/T+cERg5IiiyKAn
         ECFZjm65vOVgWJL/VbU/a1qGnW//S+P/4L0QUorHS2gK+Pq8xXDgFm5Qemm7+uLe7vj8
         TiR+JF8EjuVohiUKFQJj7N3jsfQfHJ5rVKp0Ev1WFVVz6h2LAUsAPtWFEs0+OEHRJsaX
         6lGo0dIe8IJ94V0jX8VxrOyLnHXaNV821BRcPQaEIakMMhcX8isLhStFp/vS2Z9gOKvG
         hJ6HDfZtKzEoCom3SHoauDMTgRSW6pHHfY85S2taWu8BPO5XqPqW7cojnJbpHfwv1j/E
         0gMw==
X-Forwarded-Encrypted: i=1; AJvYcCXKaoFGG81llQBLuc+TWJOgDQXMP+cH+ELj3A9IbOVaJJ38AypJuKsUC02zzwZR+pjWdTCuhyArXmfFR7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIkcfguhegCkCj8zM/wbttV356GulwwcWA3O848XHDuGGexo63
	b+2SH6oR80x+OrCS85/jA01fcGkNzxXI7eP+rez1+wQLRmljV90l0cfxspc7f+0aWZugPUVoAJy
	Izlhz7udiOi7oze5TZRzHJqZMVSUGs8KdgH+eUPygYDLIOV/pRpLjt5caLNkaANc=
X-Gm-Gg: ASbGncsam90fstS9k5iXDuZtZ1cMWnqrorbLa/ggb4W6VwXYfM0huzoRlEYV+Cx8lPZ
	EQPyQrCvc0CGBaE2AyR8JwT4FmNrfVIZSpujCqNlsE+D0P0iZJgvz/coVdm3aqTCBsiZ4aCOPJ0
	sY+iV8qgvWjXuJ0Qv4fcq/hLWJOPqqNkDFmrEf51q5vG8DWm6664a7ADOeSygZnkWbQGresrqf4
	TmnK078rXOZqQFq+YWq3VyotjsaDBG8jdujP31kqyecBuSWB6QHOGDlGhZBdxDmDxhP2Yx3lweX
	a4/0u9cdhC6RNda643NqBAxhOAofnsgsFACkwTc2tS8ZAybjz4hxInT/MgOVytAiptVNguon3C4
	=
X-Received: by 2002:a05:620a:d89:b0:7c9:222a:d858 with SMTP id af79cd13be357-7c9585c43a9mr1080781385a.10.1745608237552;
        Fri, 25 Apr 2025 12:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7y2gVQYWKUcd3rSgI4jl/cjj7VjTLLTsX7uyEAt1iz8D5sKZWsC2LPXaLmIw0Vpqi8vjwLA==
X-Received: by 2002:a05:620a:d89:b0:7c9:222a:d858 with SMTP id af79cd13be357-7c9585c43a9mr1080777785a.10.1745608237194;
        Fri, 25 Apr 2025 12:10:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e921sm706334e87.152.2025.04.25.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:10:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:10:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <4isbdbp5z2kr4pnkp5gstridtwv2pyceqfea6lhkxaa7s3epvw@7s3qtp7m6ovl>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
X-Proofpoint-ORIG-GUID: vgIbL9tohCzXxU9iPTT1vSbMbt0j3Yin
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bde36 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=M9OHNA7gU70stU2frQkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vgIbL9tohCzXxU9iPTT1vSbMbt0j3Yin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX6yvdSji27L4k vnUASbn9DHLJZdSDnp1H8zDOcf9eQRCbdy0REf3bgvZMfePAfoqlVY6VBa1OZLTcvLwYJx3fc+W hGiEXXE367PZrtSz9cIxaYt1cP0HjPy5PhjvSDjLHDZan8Vo5PnKKeVNsoWjof97Zzd/cl1K7NV
 dppD1hypZRoT/j1Q/ZyOGTrm6K7fSHMIjVB8rdgELp6xB6+n/04rkYfK551Oaw1ksENpllSP+vZ wrgYXhiBkapOP+3xtYXV/CaF9QlhNiGbZMtDkgMMCWf9dvp6ZTlea2nkGaS4WzJ90pHRUp2KMLN PFCTpSJlfwrWHjv082t4LzyBcAk/RzMXQiLjjXBwpWhtScUDaDC7shMnDzvDHGn6LzLFwKXgiVO
 KLOQBBSIByI5S0ZYJ2c/3tGg+vuWeQdaRq+tXEBmStAom0+KrcrEP3RKe0hkuyRmS2QQ0qP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=664 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137

On Thu, Apr 24, 2025 at 06:55:50PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/23/2025 10:52 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > support. Present DRM HDMI Audio support has been written with the HDMI
> > and in particular DRM HDMI Connector framework support, however those
> > audio helpers can be easily reused for DisplayPort drivers too.
> > 
> > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > has to manually (and correctly) implement the get_eld() and plugged_cb
> > support.
> > 
> > Implement necessary integration in drm_bridge_connector and provide an
> > example implementation in the msm/dp driver.
> > ---
> > Changes in v7:
> > - Dropped applied patches
> > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > 
> > Changes in v6:
> > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> >    callbacks to the drm_bridge interface (Maxime)
> > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > 
> > Changes in v5:
> > - Rebased on top of linux-next, also handling HDMI audio piece of the
> >    MSM HDMI driver.
> > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > 
> > Changes in v4:
> > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> >    HDMI driver.
> > - Drop outdated comment regarding subconnector from the commit message.
> > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > 
> > Changes in v3:
> > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> >    (Laurent, Maxime)
> > - Dropped the subconnector patch (again)
> > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > 
> > Changes in v2:
> > - Added drm_connector_attach_dp_subconnector_property() patches
> > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > ---
> >   drivers/gpu/drm/msm/Kconfig         |   1 +
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >   6 files changed, 31 insertions(+), 170 deletions(-)
> > 
> 
> Looks fine to me, just one question, please confirm if DP audio was
> re-verified after this change.

Yes

-- 
With best wishes
Dmitry
