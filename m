Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191C21FF27
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882220; cv=none; b=fJodXm+YmU01UCXxG/qu/pEh4VLgB/FHNjKS6FuqDKavWZxAMe637z6LucXFu9Wz7JJv5KlTowTY29/Xr9PwHb8w1iBHixBwZjLtpBxVF4MDOaL0HCUDNcENkVAj/XJPtuSUiE2VWOB+imT2RmYQYP+lN3MUbN4QIpOZqJrwtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882220; c=relaxed/simple;
	bh=18YR99uXCyEZk77ThDFqutW4vFM4pTkYue+/FBulMLg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fY4QZvf6OWb+61F/pbdazskxSx32DK0mwFSE1lZ9TLhfrS8MH2GDRPtLEUd3/VPoYnCGWClyO2juWwX7H0X9RHlNBv0aVwMzhgcGdOd0j08RhpAW5AkEOlahwGTIzchWsNOW/kIgcvX3GdAWKlccrHbnyfsS2jnzueXAT1g3fx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipRjMHMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipRjMHMh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679neso013448
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 09:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EOkscAPglu6pNYZf/TxA87OL
	ergxaMCP9y55D8Mo79k=; b=ipRjMHMh7ptxXvwLj+25db+3re9z/kUJtcwn/MPk
	aYGp3b3xrQ63+vhrZLEwf3AsBL4rj8XyPdLEwwZHrqw+Zj1Nd3ifkdt2eY5HfVwj
	lwHSZYHMBo43JaYucfkXmYvz08yrKF3u3EHr131mXd7aiiEL74mHpsHEEO9dLs6z
	zvQhpWIQUbuiXI8OX1/g5aV+PTkIzMrIs2j+S3pjsPX1S10Y6yyTApV7TQSLDH7u
	YPg2CLgFalLCQN+PIhwjxS7kWScnrkmi+teHgVNKnPusKfdhnLSndUDIDCYacjuE
	OXBa88jBSmLh76xpiLjv5kETArloapFNAVPIdEz8XpKa1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkbnd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 09:56:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so394800985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882217; x=1752487017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOkscAPglu6pNYZf/TxA87OLergxaMCP9y55D8Mo79k=;
        b=eGciYlUIW+8IDdGWo4MXmDIJ6CbclLP69kb5E/pwyGWzXaqEVx+3P6ePXZ7QOBghzh
         hNop/3Lys0FCHyt6nqcOtrPNWy/89CcIt7skY7xMyzphm+ilBGAIRl64D8cQevKUcXs9
         BLmrSvgxYobbsnK1OrNVm/t6NzpOVT9piIqFT3i2G3sLYTiW7Fslp2d8+LwufWgHKhmm
         eszl28gXG0KGZtFQuvxTn6oOkZcOWX+VeICuEFuW/YnnVRL4L2o2hl4c7tURS7tmr2P2
         0HMoGHNNRph292JSeKguwaqr4+PuEZ8/p85A1Isok8A7w1xIsPaASuDzZLyUmB1Nnoz8
         xNjw==
X-Forwarded-Encrypted: i=1; AJvYcCWU1zkMCDfqQC7qeYhROhaV7tTzNYT+IKRb2iYIlLPDi+DS5BZRQPoUpmWw9PT0veEoBt+UIBD9MlrAZvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZnUcxUQPWzOa7HjRP1WTbNXUKnfg363mBX05I/GcPdAo2CDp
	eHAn3VDgjxskvHVBxGVp2G9CHM3ZICnyF1L2yCvmK8wzAYvB8f/mtIMTziFScz5aXM5eEl/RoRM
	cB7uW2/z3uUcD+4W6RrUYgQ3GnF2eYYFhN8WiXERe2D8aY5NHCKBTMO46ktlr+Pc7Sfo=
X-Gm-Gg: ASbGncuxmBkQCc3gCaQukWlOpVg9aKioRUeMEyayqB2ciXuqQdXYKK9DTD1T6JGZpg1
	8fjbNMqn6ulcjSyupSxu/G+uh3UKQSavrJ27Fjo1DT8RnQ0t4qnpwmmzGHMxoWZGI2O0W8hSg2L
	B3jTa9tyOWsonytVvV1ys5nCzTAD8mLamdtjHe61V+Z0y8S7dAbkaMVTvs/vsi9sv/DUsRLZ85M
	l0hPhzZNjvBaiMXLDxb1cwy22XFZO4DiHPeH3bZgD8TShuhx9EUce6LOAefriHdzTIYWrpo65q/
	agk2rOC9MGdyk6+dBvwvXnZVhRAuOZf1g7tOSoQWUc9L0Aj3rb6DAm4=
X-Received: by 2002:a05:620a:8083:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d5f20b7efamr1156797185a.53.1751882217021;
        Mon, 07 Jul 2025 02:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8HJEkPslMRBZD2ONOEBO+PEUNCALtoyCPDK0CyJ4VcqyQXuJqvMV6aeF1c958pDPXhcvw3g==
X-Received: by 2002:a05:620a:8083:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d5f20b7efamr1156794685a.53.1751882216608;
        Mon, 07 Jul 2025 02:56:56 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16288b5sm108476705e9.9.2025.07.07.02.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:56:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:56:54 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
Message-ID: <aGuZ5h7LpPu5Pbnr@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
 <bac6a881-90b6-4f33-d9a8-61aa8daea330@quicinc.com>
 <aGuPpzU0VCg45Plg@trex>
 <db7fbfb8-b0fe-58e2-4564-f24d6a551232@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db7fbfb8-b0fe-58e2-4564-f24d6a551232@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NyBTYWx0ZWRfXwGFn2ah8xXVb
 MEe0ulVfkapDolPa8rWuSt5REgFsSJDG+8ZAxARQ5RtMzBj+u9D7gaAtFssJil9CPArNi1Xikcu
 tDp8PG0yOmnNnxn/rSS02hSS0KnCXyvaZtUK/GRZu2cSwBofDJkCdtPIEXbIpINoTWl6rvsxf5n
 O+WBbstHDxHkyiyubkbbjmTlwT2jWKc7HA1P1LrzelpB/kf8xPQT54UTIz0iZeNaHOyViE3leZR
 GHllekR6WHKqSxmQqGwDtqermic25TC0HKETabSVAs4U+r8HtJFFwMDBh5z/kSoCMwrkwNeownq
 NSunmUGme7FI0nAw0vjn9Rxm2hR7eKO6ya6SpXviFfuUIRQCrIj9E69f+DGHtXEU3wU8LhVuJFk
 84CiRafsCRZeljmTlsCfLrdQviXiwnD3/jEoZcIugfYV/hDCO9g5caq5W2dARssxXpSxLT9n
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686b99ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=nYNRSA1dgNPy7Ku2h68A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: AQJ5-5RlP8n4HaSbbrqfyGgIxdrBTRI8
X-Proofpoint-GUID: AQJ5-5RlP8n4HaSbbrqfyGgIxdrBTRI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070057

On 07/07/25 14:59:05, Dikshita Agarwal wrote:
> 
> 
> On 7/7/2025 2:43 PM, Jorge Ramirez wrote:
> > On 27/06/25 19:02:13, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> Add hfi platform file with decoding capabilities for hfi v6_lite.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/Makefile    |   2 +-
> >>>  .../media/platform/qcom/venus/hfi_platform.c  |   2 +
> >>>  .../media/platform/qcom/venus/hfi_platform.h  |   1 +
> >>>  .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
> >>>  4 files changed, 152 insertions(+), 1 deletion(-)
> >>>  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> >>> index 91ee6be10292..4a6a942db58b 100644
> >>> --- a/drivers/media/platform/qcom/venus/Makefile
> >>> +++ b/drivers/media/platform/qcom/venus/Makefile
> >>> @@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
> >>>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
> >>>  		   hfi_parser.o pm_helpers.o dbgfs.o \
> >>>  		   hfi_platform.o hfi_platform_v4.o \
> >>> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> >>> +		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
> >> s/hfi_platform_v6_lite/hfi_platform_v4_lite
> > 
> > will remove, will use platform_v4 instead
> > 
> >>>  
> >>>  venus-dec-objs += vdec.o vdec_ctrls.o
> >>>  venus-enc-objs += venc.o venc_ctrls.o
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> >>> index 643e5aa138f5..f56b8f9946d7 100644
> >>> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> >>> @@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
> >>>  		return &hfi_plat_v4;
> >>>  	case HFI_VERSION_6XX:
> >>>  		return &hfi_plat_v6;
> >>> +	case HFI_VERSION_6XX_LITE:
> >>> +		return &hfi_plat_v6_lite;
> >> update here as well.
> > 
> > yes, this function wont get changed
> > 
> >>>  	default:
> >>>  		break;
> >>>  	}
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> >>> index ec89a90a8129..6356e4bd0de2 100644
> >>> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> >>> @@ -58,6 +58,7 @@ struct hfi_platform {
> >>>  
> >>>  extern const struct hfi_platform hfi_plat_v4;
> >>>  extern const struct hfi_platform hfi_plat_v6;
> >>> +extern const struct hfi_platform hfi_plat_v6_lite;
> >> ditto
> > 
> > neither this one
> > 
> >>>  
> >>>  const struct hfi_platform *hfi_platform_get(enum hfi_version version);
> >>>  unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> >>> new file mode 100644
> >>> index 000000000000..41958a3e353b
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> >>> @@ -0,0 +1,148 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> >>> + */
> >>> +#include "hfi_platform.h"
> >>> +
> >>> +static const struct hfi_plat_caps caps[] = {
> >>> +{
> >>> +	.codec = HFI_VIDEO_CODEC_H264,
> >>> +	.domain = VIDC_SESSION_TYPE_DEC,
> >>> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> >>> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> >>> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> >>> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> >>> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> >>> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> >>> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> >>> +	.num_caps = 7,
> >>> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
> >>> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
> >>> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> >>> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
> >>> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
> >> what is the reference for these values?
> > 
> > what do you mean? what should be the reference? I didnt see a downstream
> > equivalente to base on so based on the 4XX settings these seem
> > consistent.
> > 
> My question was regarding the profile and level mapping.
> The profiles added are consistent with 4xx, I agree. But the value of
> levels mapped with each profile is not matching with [1], hence the
> question about the reference used for this mapping.
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/media/platform/qcom/venus/hfi_platform_v4.c#L23


ah right, AR50_LITE does not support 52 (the highest is 5).
I see your point - you are right of course.
I was doing a quite a bit of testing with fluster and I left the wrong values. My fault.
will fix.

thanks!
