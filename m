Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87770EEDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472350; cv=none; b=b5KNAQVJSjE0chTfQRp/w9gun/XE39EJHcFkLhPEtPfjw1pT3wlIKa4iZD0VUGT1Wwg587i+cftZui0Pw+dTv3L2Ux41VlArkjazE3PFdhp84+OKF78c0NKK7c3+VR9X/iuPKbS08fi0wvjIUO3rAewxym/f7fzaXvX51fLjgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472350; c=relaxed/simple;
	bh=zMnjRabBm+EBDaRJErWJR9/mmndaECogdzQ4qMX6pno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjZCyF1rgFgZ244RXh8BXSMOaSXJSRbn/Gbf5ALlArcY1NVhOgKfLx2NiAA6+p+xg6q9KyfFk9smMxjnrnLhQmaZ6uHL1ZWyiwh12x0cOSFj/Sso9bI0eD/5sQ3Sr3gaLDpBlIAkPUz/jS96cYoHlHyzwGOP6u5Me03Xt2e5hDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEX1ePXa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEX1ePXa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKGXi4008461
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 01:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KkmvufDkyFM8TbOcd8xfOYX+yJYpC83DnPb8liBX77k=; b=XEX1ePXavfZlFRPn
	b1mJ7V32PodL/X4wT1j1BfpSaEJfHeVviyfLuwnt/9A68l42cJl7h2bQyaar75Z5
	CYkjVypVPOk6/BVW4TL4F/MOXu0l8iagOxDLgxpwoR5yekCV4FT88sUBarF41BuZ
	SrsmU+lpeTaHtK3lQQ0EbV/Wf0bNfwsu1bGsENZB3c5cOWVBUIrKHZ/xfmsrjwJR
	PMw+Q8hWPvUcdywn/D2jpF1O99SF53ASc7SW4gdW1xjy6FCRXQXIevXKPwamaXNU
	pdmvvOc+cRFqo2CrZcRH+ojhZQv6KlTYAG67wiOQZLBwzL7lxoChIwcK1SFxDdtj
	dy1Uig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xngkc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:52:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ed78717eso83863756d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743472346; x=1744077146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkmvufDkyFM8TbOcd8xfOYX+yJYpC83DnPb8liBX77k=;
        b=PgVztNa+k8woa36iQyLKQEvtWTiT2GFC/QzyxmCtBMNxgzxgu4+h6TEfjVUrfWGtKf
         LM+jBFiUBc+h3JpMCLn0z+I/OWVp3RD50OslsB8vVMab9aPtKgYwbOVYSDj+O76g9r0/
         Nj8xLDBAkkbdsr5VT07EnC9e1fNMx8hmGRYlGBcV+U9FGKX4/P26Yvule0Ey4D4Paluf
         6vGz4azy5bcknhIf+oPpwlRNG1vBhcTHAQYKmx+htt69lJ7OerJbbDWMs99UQ3ZRXgnP
         evlMW3hkk7VPgLtXAq/JuRfWZ/WB1e/olqnK/B1+0ykkU4bUCMPp1g+Bu16fgVI9gkf5
         E0IA==
X-Forwarded-Encrypted: i=1; AJvYcCVkJ/kCIs2Mhh2ZBh4kQJBKIRrPzWA6rsooW+nvutOefjNulbyniGWNb4dqeoPw2MNTlATLW9mewLfp8vY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoF2vPofuD4N55U9LcAHsojSysM7vkGbP6vMZR4feegP2Y4xw5
	jsH5td20IWXV5iAjam5hkN1MaLxYqPZ+jHXeLZXx5qpkvXjgnVDeWj5BIXTJRhRc2YuDffp/81Y
	520I8hJyvNPd/XyR7ZTIWsTed8p23S88sJ1iJbD6Cmq/Gst9emzITzD8kbv7Y3Eg=
X-Gm-Gg: ASbGncvoohUtQYN/3UG7GnckNp5gY7benqUTeC2/58ENq8gKUiDDy74DQeHf9cuzsuT
	xM/7QimsZk77aIrFdSPdsrfKHwL0X77es2i2+A2WyqPFOwiXyOuUqZgg97ZVskFFi2Ikd7gr6Ai
	8/Y2Kjgmcy3A5p93mGVozay/DyCopurydQvszsdXPgNvzoOQWguexWEh5Ds9Mz9qYYjxFnMPG21
	j9X9vhq3BuIaNzU+A9koqJlge62+/fmBofA+dKR0g0lAMCINLqRuIPRYNsUkpEPxYVgqWWf2ny1
	RccETuEQvcFrtCPHpbEvjTYCPabL4ntOCwT9OVmdwtOWV6bT6e/m0JZPbRCC8ICz2zL0df0+fV3
	wKsg=
X-Received: by 2002:ad4:5ae7:0:b0:6ed:22ef:19b6 with SMTP id 6a1803df08f44-6eef5d9d0e0mr23303786d6.14.1743472346431;
        Mon, 31 Mar 2025 18:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdLHhF5AGVHH/2gDMMGVxACUr3BKovVYKx68WKwJC04elu+jzwzyQYLStuMh2K7a7bC5dbmA==
X-Received: by 2002:ad4:5ae7:0:b0:6ed:22ef:19b6 with SMTP id 6a1803df08f44-6eef5d9d0e0mr23303546d6.14.1743472346094;
        Mon, 31 Mar 2025 18:52:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b8f92dsm15560831fa.114.2025.03.31.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:52:23 -0700 (PDT)
Date: Tue, 1 Apr 2025 04:52:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <mz4axwltt6zhm2hykenerz2k6hp5qb4tqa3seui2vnztsldpoo@hejaeukdu2tg>
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
 <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
 <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
X-Proofpoint-GUID: WgulhC5QmINCtXW4-ZywYCw6VDBil9by
X-Proofpoint-ORIG-GUID: WgulhC5QmINCtXW4-ZywYCw6VDBil9by
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67eb46db cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=a_HvFp4BeVyG9yXqjdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010011

On Tue, Apr 01, 2025 at 04:01:03AM +0300, Dmitry Baryshkov wrote:
> On Mon, Mar 31, 2025 at 03:40:27PM -0700, Doug Anderson wrote:
> > Hi,
> > 
> > On Mon, Mar 31, 2025 at 1:28 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Sun, Mar 30, 2025 at 11:18 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > > >
> > > > > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
> > > > >
> > > > >         ret = boe_bf060y8m_aj0_on(boe);
> > > > >         if (ret < 0) {
> > > > > -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > > > >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> > > > >                 return ret;
> > > >
> > > > It's not new, but the error handling here looks wrong to me. Instead
> > > > of just returning after setting the GPIO, this should be turning off
> > > > the regulators, shouldn't it? That would mean adding a new error label
> > > > for turning off "BF060Y8M_VREG_VCI" and then jumping to that.
> > >
> > > We should not be turning off the regulator in _prepare(), there will be
> > > an unmatched regulator disable call happening in _unprepare(). Of course
> > > it can be handled by adding a boolean, etc, but I think keeping them on
> > > is a saner thing.
> > 
> > Hrmmmm.
> > 
> > The issue is that if we're returning an error from a function the
> > caller should expect that the function undid anything that it did
> > partially. It _has_ to work that way, right? Otherwise we've lost the
> > context of exactly how far we got through the function so we don't
> > know which things to later undo and which things to later not undo.
> 
> Kind of yes. I'd rather make drm_panel functions return void here, as
> that matches panel bridge behaviour. The only driver that actually uses
> return values of those functions is analogix_dp, see
> analogix_dp_prepare_panel(). However most of invocations of that
> function can go away. I'll send a patchset.
> 
> > 
> > ...although I think you said that the DRM framework ignores errors
> > from prepare() and still calls unprepare(). I guess this is in
> > panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
> > code is ignored?
> 

Hmm... Most of the drivers ignore the results of the drm_panel_prepare()
/ _unprepare() / _enable() / _disable(), but then the framework handles
error values of the callbacks and skips calling the corresponding
en/dis callback if the previous call has failed. Which means I was
incorrect here.

> 
> > This feels like a bug waiting to happen. Are you
> > saying that boe_bf060y8m_aj0_unprepare() has to be written such that
> > it doesn't hit regulator underflows no matter which fail path
> > boe_bf060y8m_aj0_prepare() hit? That feels wrong.
> 
> Let me try to fix that.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
