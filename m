Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F1F510
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743469272; cv=none; b=gUWAvFJ0Hezlegy7B6vT6VHIe/UKrSTNzmUzPz9fcFu4I5tKRiVoY+LKcRZcemcY4PqBDqiSu14DoLVTmZgV5yBcCLj0Yia4pegopzvIpY4c2D45n159Og/iJ8jglefwUeYBjDsRXpGM6d8njddqSYOZ1/iX4YVNx7oaPixWeOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743469272; c=relaxed/simple;
	bh=kgtwFWiRF/WyoE8qN63nnEDepxgZwpDn5wW0phubs2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfgJUiW8k+b2af3CXABmBN+832am7yj5cL19H9WpTWGC7bjA/L4EpIS2TbXSx0G4ZCpLgT47Kfji1XW95ENfMzylqPLSbvGs+RpTmYBlXXLqVTteiTXgRafAdcG/fnSqIL2KFOago7brdIgAsrh8GMMCDALyM3mWFSXmtuwBXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHmkyx4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHmkyx4r"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCqiS023479
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 01:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/9ibitgBcASDxr5q3RadXqeupQXnpmd/gKFHRDbLgw=; b=dHmkyx4rIRI5eVaS
	tPmHYtN4+eG3ExKFx64r121qqlR0uYMb1bG5zPffGw1QAzVJP+2eQK2l7YU7pk36
	Jybj9oQRy8SZmnGjYJV9EWLpxwFu9MD+qbt468kCtWIE+KV2S0Bv2qOEGL5BPNcA
	/C551EaK2M0QkVD4h/gi0rmzpKSVszqEsJDQGt7T+5t6B0Yw9fkS+G8jz92O8LXL
	XNscTLYXGbQYFvPJ9pfH+Mf13S3FIlpXJA4fHWjRVyn1EbE9c9ZrVxuzEhbrf/fP
	lE0QZeri8Yeqrn0b+iQ8aAS82CAVyOIKnKCQwfmJtsFp1MMXDFgfa4dNBfHNOI2n
	49wCvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8xve2hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:01:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ba3b91b1so462752385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743469269; x=1744074069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/9ibitgBcASDxr5q3RadXqeupQXnpmd/gKFHRDbLgw=;
        b=rWUW5Hm991Ei8rdXPSeZUMtXMoL01npt5gLOKvZbC6kchtXGJkfY/kv7QgG44lyF1Z
         7Wp+AbXDjTtXU/9ArOtHlb+6c53jvVWhVyKqFfTCSPRLeCntEZml7XfId2K6aMDRImhK
         XTmZfK/FlPMH8w0paEGdYa05pznHVoUZop3s2ySpz+xUEJwtjLJLAkUyM8EzfhgStBlh
         6lVOUW3g9R+2SzG5BwTnuQ2FbDo8q/dELMLTDw0kzvjQkwvdaxpx1AB9boTKq35hhrtv
         mOoHRlLy1DNwEmaGyE0UMKlBVlCgnx1LtduwjDu5+vnOk+NKpqmBLlrtYuNNs6YS58Gg
         2Eog==
X-Forwarded-Encrypted: i=1; AJvYcCWWQerQQgDU3teacoAafAxMJxIoW0abrZwi53QOf4A596yMYhR3aqfx49dShQzSNoEvwfbK+keoYLsfmBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeIdFUV4koerJgOKz/Gdn+5SIEtI0nF0UJ5efaDNYgocrU00mp
	WgusASCeKD3m2+qlP9yBpDygAJKvO7dDEup8sj2h0jBtoymzmiDtriuW2/WLxMukx45UHKeFwEN
	9Nh9vvp0cDF6UhU9vy1XoImjJZPBRAmyBRRNgbrZ95pJ2kBMkzvJ+iCFK84P7WfQ=
X-Gm-Gg: ASbGncv1HCkSVA/Akv92X/fN0zIReggdCMFxzojQhungznFXWsYD2Yc7Jb59XDUPQhX
	ulpq1rvSO8EfAPQGN3y7/UR3BSsw4f1K7LPZFmJis9Bq0njREvGU0yiBq0zrrMlTKrW5LjH9bHx
	i7YTDHiWGjhMMaLHvCBRIOHtRJBugHTApqRL3Oy1tq0JyN/N3U7n6HbTJSs0Hk3zpq/MQ1/Qhk+
	nzYu6o9i5bfPgXTg2w0e8tTlXmW3tnMOIa70/e4H/y+aICjo8FYH2zICY6SO+1XXwOmf5EKfJ4h
	8jostBvXziEVBYo9dmkhT7dWHqwyDcrz7wGPseRtLPGlfGm66eysw6etO7Voo8o1mlFtar4XZx2
	PPpE=
X-Received: by 2002:a05:620a:46ab:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7c5f9c2209cmr1931248685a.28.1743469268721;
        Mon, 31 Mar 2025 18:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmENAiYEDkbekPHoUcYX6zw/CtPDkreD8I08ld5E33xZhRkOLl3IINntmRyYzlmrrjlQVYFA==
X-Received: by 2002:a05:620a:46ab:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7c5f9c2209cmr1931245385a.28.1743469268287;
        Mon, 31 Mar 2025 18:01:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1a7asm1236328e87.86.2025.03.31.18.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:01:06 -0700 (PDT)
Date: Tue, 1 Apr 2025 04:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
 <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
X-Proofpoint-GUID: OEh7sJoR0U84A6Akt9LHO2tvkZ8jRHbV
X-Authority-Analysis: v=2.4 cv=PquTbxM3 c=1 sm=1 tr=0 ts=67eb3ad5 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=p7gRr0OnjJBAycR06awA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: OEh7sJoR0U84A6Akt9LHO2tvkZ8jRHbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010005

On Mon, Mar 31, 2025 at 03:40:27PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 31, 2025 at 1:28 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Sun, Mar 30, 2025 at 11:18 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > >
> > > > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
> > > >
> > > >         ret = boe_bf060y8m_aj0_on(boe);
> > > >         if (ret < 0) {
> > > > -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > > >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> > > >                 return ret;
> > >
> > > It's not new, but the error handling here looks wrong to me. Instead
> > > of just returning after setting the GPIO, this should be turning off
> > > the regulators, shouldn't it? That would mean adding a new error label
> > > for turning off "BF060Y8M_VREG_VCI" and then jumping to that.
> >
> > We should not be turning off the regulator in _prepare(), there will be
> > an unmatched regulator disable call happening in _unprepare(). Of course
> > it can be handled by adding a boolean, etc, but I think keeping them on
> > is a saner thing.
> 
> Hrmmmm.
> 
> The issue is that if we're returning an error from a function the
> caller should expect that the function undid anything that it did
> partially. It _has_ to work that way, right? Otherwise we've lost the
> context of exactly how far we got through the function so we don't
> know which things to later undo and which things to later not undo.

Kind of yes. I'd rather make drm_panel functions return void here, as
that matches panel bridge behaviour. The only driver that actually uses
return values of those functions is analogix_dp, see
analogix_dp_prepare_panel(). However most of invocations of that
function can go away. I'll send a patchset.

> 
> ...although I think you said that the DRM framework ignores errors
> from prepare() and still calls unprepare(). I guess this is in
> panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
> code is ignored?

Yes.

> This feels like a bug waiting to happen. Are you
> saying that boe_bf060y8m_aj0_unprepare() has to be written such that
> it doesn't hit regulator underflows no matter which fail path
> boe_bf060y8m_aj0_prepare() hit? That feels wrong.

Let me try to fix that.

-- 
With best wishes
Dmitry
