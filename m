Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFEE1FDD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745532868; cv=none; b=M4kMqAT2nd5wpD7M5mIvc5QVYu7c9B47wXAErRnUsWP5JDEHZub5u37xaIr3h/ibCOQtsJw8PQAAjoFPBTnOTv7JM/wyDJaZxKOcN8y3Zcv7AGJv4fBGL/sHSv7rYh/RHMDd9b9C3lvZ85fZ6xrr6M93GN+tcqjoPyvAwk7BdFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745532868; c=relaxed/simple;
	bh=sNqbIfVVS0v7/OcKITy+qOzPnbY7oTqGeF2iUw3Czzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrR9yWWOWlYEL2Fmnn8JTc0Flk/iKBGPlAm5OYW1Dq/8wwItR6LC+tDjuCvJA7CNCkjLop4Ys2HKfzW/vmEXU0M23CezBU+8djdBZG8NaXsmHgOfH3onOeP685LGxS/g5Bv06jqKsxFH0nT5Nna9QYZlC0v/czLmSWcz+Zr33QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWFw95oT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWFw95oT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmq3j007060
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGFxOl9tb1uWwBTzomkNAaRI9BVKWxW/VCzFDUKeLqA=; b=dWFw95oTzT5pTLuV
	Nm8I+C9BefWBvfFCumpW0sZjIX5x/QCZSlyQmUKgoNP9z9IqOAx14cvyohA55P7q
	SLVKT9WhOj2Pz/WkXAedTU44mO3mi6Izxli9iUVwJseBv2cgQ6mAicsFexC2NYgp
	DLHS3u5/wM5FrrZNoDDaxLlt3fvDmehlwX/mC8KsWU5RuE1HAy6o8LukPoYm5rX5
	kv5aogmm8IVkPfT+G1ILE6kS5ls4XEj8/U4lyE434KYRqAY7lWmOdLU8clmDzJIK
	KQADJq+5jv5KsbgL3zZI80BHw/YxB4Hu0t48AKWMYQkNbDn0ZUkuRjg8ZQ0IkxcH
	AjTyXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2f325-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:14:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso255533985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745532864; x=1746137664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGFxOl9tb1uWwBTzomkNAaRI9BVKWxW/VCzFDUKeLqA=;
        b=WqR4vh+TDxaVINuBJ6xZkGI97JdLRo05Sm7ixwij0FVFI6vFWz+3+GoPy1iQST2D3q
         H46YWLczny+2TJb0k6PCkomJCbUlWkBnkLhx/ljB3xyxqOTUzH3zo1gDBM6XOYm8Qbjx
         47ADIlNv+I0dfN0iQdyaCGrEYWuvrbUgUuu+B7fR1kTA4JWJ/fhLnJWnw66DicSp8roS
         wAyzo1xtF0xsd2e93Trbz6XoZPr/y6ij2A9e3oZ+BYUJfevHZ5qpTNxaYX1mP/GlbO4Z
         r6VPmOjTYSfwARvxxddY8KmIZWvixxV/O14bV7IJQ0UA7ckD+53AW0jqPGBGhl0qYllN
         BWGg==
X-Forwarded-Encrypted: i=1; AJvYcCXe3eCiQHvGEoTWraU4IJ/kHxrt/J/P0vZ4kw8SI2JPrc0lpHmACj7s/APfAojfAbOtLm72mySW8EpjbYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/IB7K0rK0o0TvC49ppW+oQFTFRYcbELKm0DuPvIvJNECygTM
	BVWYX3YVrnhK867ATImdaaSx1WsGuapszNPbeQ/4tIcKJNFpV7pFTXSJoAlM33aHW2FyN6Kgnw6
	5bhSxXplh60QGXZvUij9KlIJ67oP3yBsG6d1QzrDo40/JBzYNKN+f1ku6y5cHdkI=
X-Gm-Gg: ASbGnctOUFGfikuzeX1jO46fsFIMemyHAbZyBeKnCN+MVxIh+wHdRXIQqWaRbQLPBIC
	SExrKOusMXlvV0rBHdmQtyeIJlo+ByhCkZLt47IUp5SU6LPYbsALWG0iMXfWlUYl27HqWycCekQ
	QM2tMgLWyxicwvnCNjJFfO/bvBPl6Ib49sBoe2X3Q/QmNsvpkoW9d1yaP8UGeCwqNE2mQ1LSxyJ
	QFd5zvrDON/qu3SPaHWH7zaDMLll7nu43djM81ZRrOmD/KNbbI6FI3MyT6pSuVQJwJtOPhoW7lj
	BkpqCynAdjqqFYMmcsTQS392Z1SaC/LHGHY0S4cNiY20ifuwL+wBNMLrnDRVNdvuuxJa5JbPlas
	=
X-Received: by 2002:a05:620a:4492:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c96077f5e3mr30010985a.37.1745532864194;
        Thu, 24 Apr 2025 15:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8HUjpHWu1vfSTPhZe4k1ZaRnS080d806N1Oqj8kDA2MR5+f8rJBbCwkO61rR/i9VHSTnesA==
X-Received: by 2002:a05:620a:4492:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c96077f5e3mr30007085a.37.1745532863751;
        Thu, 24 Apr 2025 15:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9837dsm4294571fa.108.2025.04.24.15.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:14:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 01:14:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <n2wt3i3lrbz2spfxdmkwvq6xdjq4rwif3sul755h6prs4w4fj5@ishlqsc4qxr2>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <CAF6AEGs5Sw76kVS6_GaK6=VZ3jWPuqN9bc+7UvVU=jfaBBTLDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs5Sw76kVS6_GaK6=VZ3jWPuqN9bc+7UvVU=jfaBBTLDQ@mail.gmail.com>
X-Proofpoint-GUID: ecosTo-AeXI-Q5ekFuW3CnO2xNoiQhmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1NyBTYWx0ZWRfX+HNr14x6APZU /FlSdjoiUiJy7GMxxPd+e63x9992uhjcBHyK+oNOk0tkmwQ7cGH3EDUsb7dEwJ67+GVvNOTGo2m Rij4iMOybEYzd4LlpT+7vCxVNEkzUTsL7u0Cmcvo27fwrJUbwZ3/zTWMy3LFr3Om3BJyBAE2Fsh
 B2pbxceuplFt48PdKh3891ioxnVAVdNPTQKAEE9QJTn9V7MOwSXN3oeGUmjk+WYsTO4JK5c15J0 UmIzldSj3cyummbZj9LQweFbtCKmLhlbLMHnRYbi5DfxRnvFT6jQB2zpG+vannNNKCbq+NUKimt 4bqX9Lv8bRuewY5xxE95nX+RO7qpsZJ74JztVflmrcl3/9Cr5syDHDpPIrhnCcs50g8MeO9c9O0
 v3aACIzNJ/UXyb9XZxULoKMP4srpjDAsEyPeBJH4nr0TSZP4iOz8Q+wLnSRhYCLSXCeY67Bk
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680ab7c1 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=dNxstN5UYNHJ3myx06AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ecosTo-AeXI-Q5ekFuW3CnO2xNoiQhmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240157

On Thu, Apr 24, 2025 at 02:12:15PM -0700, Rob Clark wrote:
> On Wed, Apr 16, 2025 at 7:13 PM Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
> >
> > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > to non-transparent mode to enable video output on X1E-based devices
> > that come with LTTPR on the motherboards. However, video would not work
> > if additional LTTPR(s) are present between sink and source, which is
> > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> >
> > First, take into account LTTPR capabilities when computing max link
> > rate, number of lanes. Take into account previous discussion on the
> > lists - exit early if reading DPCD caps failed. This also fixes
> > "*ERROR* panel edid read failed" on some monitors which seems to be
> > caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
> > initialized.
> >
> > Finally, implement link training per-segment. Pass lttpr_count to all
> > required helpers.
> > This seems to also partially improve UI (Wayland) hanging when
> > changing external display's link parameters (resolution, framerate):
> > * Prior to this series, via direct USB Type-C to display connection,
> >   attempt to change resolution or framerate hangs the UI, setting does
> >   not stick. Some back and forth replugging finally sets desired
> >   parameters.
> > * With this series, via direct USB Type-C to display connection,
> >   changing parameters works most of the time, without UI freezing. Via
> >   docking station/multiple LTTPRs the setting again does not stick.
> > * On Xorg changing link paramaters works in all combinations.
> >
> > These appear to be mainlink initialization related, as in all cases LT
> > passes successfully.
> >
> > Test matrix:
> > * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
> >         * Left USB Type-C, Right USB Type-C
> >         * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
> >           Type-C to HDMI dongle, USB Type-C to DP dongle
> >         * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
> >           monitor per USB Type-C connector)
> > * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
> >         * Left USB Type-C, Right USB Type-C
> >         * Direct monitor connection
> >         * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
> >           Thunderbolt/USB Type-C, probes with an LTTPR when in USB
> >           Type-C/DP Alt mode)
> > * Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland (Stefan Schmidt)
> >         * Left USB Type-C, Right USB Type-C
> >         * Dell WD15 Dock with DisplayPort connected
> >         * Dell HD22Q dock with HDMI connected
> >         * USB Type-C to HDMI dongle
> >         * Dell U3417W
> 
> For the series,
> 
> Tested-by: Rob Clark <robdclark@gmail.com>  # yoga slim 7x

Could you please send this as a response to one of the patches, so that
it's also recorded by the patchwork?

> 
> patch 4/4 had a number of conflicting hunks, you might need to rebase
> on msm-next
> 
> BR,
> -R
> 
> > In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
> > in UEFI to force universal Thunderbolt/USB Type-C devices to work in
> > DP Alt mode.
> > In both cases laptops had HBR3 patches applied [1], resulting in
> > maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
> > When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
> > and USB3.0 devices were working in parallel to video ouput.
> >
> > Known issues:
> > * As mentioned above, it appears that on Gnome+Wayland framerate and
> >   resolution parameter adjustment is not stable.
> >
> > Due to lack of access to the official DisplayPort specfication, changes
> > were primarily inspired by/reverse engineered from Intel's i915 driver.
> >
> > [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> >
> > ---
> >
> > Changes in v3:
> > - Split 1st patch into 3
> > - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> > - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
> >   are link related, not panel related)
> > - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> > - Droped Abel's R-b tags from 1st patch that got split due to high diff
> > - Fixed alignment issues, initialization of variables, debug prints
> > - Moved lttpr_count to avoid ugly pointer
> > - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/
> >
> > Changes in v2:
> > - Picked up Abel's R-b tags
> > - Fixed typo as per Abel, fixed readability as per Johan
> > - Updated cover and commit message on mailink issue which appears to be
> >   specific to Gnome+Wayland. No problems on Xorg.
> > - Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vinarskis@gmail.com/
> >
> > Aleksandrs Vinarskis (4):
> >   drm/msm/dp: Fix support of LTTPR initialization
> >   drm/msm/dp: Account for LTTPRs capabilities
> >   drm/msm/dp: Prepare for link training per-segment for LTTPRs
> >   drm/msm/dp: Introduce link training per-segment for LTTPRs
> >
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 126 ++++++++++++++++++++--------
> >  drivers/gpu/drm/msm/dp/dp_display.c |  27 ++++--
> >  drivers/gpu/drm/msm/dp/dp_link.h    |   4 +
> >  drivers/gpu/drm/msm/dp/dp_panel.c   |  12 ++-
> >  4 files changed, 122 insertions(+), 47 deletions(-)
> >
> > --
> > 2.45.2
> >

-- 
With best wishes
Dmitry
