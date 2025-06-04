Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0228F508
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042724; cv=none; b=t9Juea+sj/ZORVg17ArDjwOiXSH4oo77twyM7atHh7ZotzT4DgJCd62Veg+7C5mCZyOeClZFnW6nTIxe1jujr81pP9icrth6S4+9r7D2QoSVZCVTKD/j0mWzzKr4QfzeYuFqT88yJhw94XAo1rC70tPnL1OTFvZIJ3FonRjJDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042724; c=relaxed/simple;
	bh=8OC04Uig/NIlrSakrm1nnPTay9KqXWpG36eTaAqGLm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU8ff/lcKoPLwVpUEQfeiFkx2j1jik9t1ElmTR5IBMK3woXax88zgsMdxiAjZ41BopDIak5TZrFIfmBnx2oxIXo8GQjZFE7N3MqUUFRc2Bsz0VncpgoMd22gELjUdSxQnemTGLQSoxlR5jo9abOZDwkbzXSc34Ia2MyrH7lKsIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY0q+1IQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY0q+1IQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548Eove023754
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 13:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XQvsxDPGz+N4nZmV7ksKBXsD
	n1FjHMoRZnCtDTtfld8=; b=LY0q+1IQAxk4WK8T0Neho23c3g1xaCJAGYo2Ma0D
	ZuBYCbNpeTYdqVof2VF1lmWc+EpctiqGqg2g/J6udDys6cdvvuVXSscc3aM6HOJn
	0gwlcwzKjf6dVeDq45YHDv9l8WYWlYc9Mcz8MspkCkDSy7OP6nPSSn+ZM0NZx0DJ
	rFgiOteNADm/K6KoQSItmwi0SDrLwPlEMeMQcchC8uknQvUE4bzTx0KmeJfQAfAK
	JH09+Hjc+dz+Gq+9HgkEbp04gGFxPtCYjAkOdzzy/ghOz8ctWuZGZvvnxLC25Au7
	Zd0kV2tbCEZRCx8dPKR5SCqJNpwlLt/wvj1bbL0h0ojK3g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rx5uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:12:01 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72bc3351885so6382111a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042720; x=1749647520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQvsxDPGz+N4nZmV7ksKBXsDn1FjHMoRZnCtDTtfld8=;
        b=bWtvd3p1F0kYSG3ahE1CKJSOUAlcKampUFEqptiAWqvQ/UBBcatUtcOS+YtLj4Sz30
         AOvYyOmbRHCb3LoDAIFUsvItXL4sIpCrgKMpofRM1XkPoxal3SKG3GxGPVu4dQuTdBdL
         SfhQr+cfFY80exKfUoqmpCw/k21JLvTng5pl50k91GVYY/ftoKlCwpdaN7niVUPUsfJa
         tvL2oNFqg6ZaR2ojH5KSf3nbg5AzIFU2MpVlMm+/B62VGpFaU+w2MN1pj3o8SQh91pYk
         XxW79YhnWX308kykrrxv5fWVNYn1+5uc9Zakesxl65rmC0uE42J/oxMIBSyRThOtd3Ud
         Torw==
X-Forwarded-Encrypted: i=1; AJvYcCWot7EHsdHFXuhrBnqetYriVcSU6Q8lupA2Fa23NSkNsl0uazDKvXVm6PSznqFLob5oblV7r1YaEiqtp6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1dDC0Yc0ODEqqz3d6/lQvWIe6cRLcGfLYRx9I4SodsOnYfOl
	ZyiuF1t+vYMx3DgHLFu4RVIct6fs+li1GygjEEP9kSrCQ1jNkrLmr+34bp+OfDcVBl3hen3/S41
	Nuks1Q5hf+gFX0ra9eyT/bMwnw8tFoPwA/vDxVN7UHX/yeJ6GBr1XCBwl4E1tIU+UG5a3VGbnVw
	/gFw==
X-Gm-Gg: ASbGncu+gCWKKp/DdBNg30HEBaDxEybtOKsiIiuWpIXCC9E8KtzV9kY0xxVfJpmiGNM
	E2nZ+SSXzvwfAAVqJTOEJM0aP8o6Xq4IHefyUWRxIiHqLr4wJNgDPQsHv+juN+y8zZvT0coTlwe
	1Oq7rolh6O5vnoF2zhv52HF2vvlxzb1vGOON/5/IbYQU9jUn6XXGkwSFQ3ZDON3Wms+hmA4cs14
	Ci2adYfjJsnPPkK9xwWNSuPpY5P7CnEiPesMZ2wuIs7aMdLbHW71t3im1kutbsYwQ30BLlmc5/C
	7dvBzt6zfzXxepFhOomeZFbEE3X5aP06ZxjY1TNgsHVbpnnlpb2Wo0BMsF2mamwRQURtHMpkZn8
	=
X-Received: by 2002:a05:622a:1f9a:b0:476:a03b:96ec with SMTP id d75a77b69052e-4a5a585f492mr49419881cf.32.1749042709710;
        Wed, 04 Jun 2025 06:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTQa9wd7fIpEVhtGaVsz15AkiRD0CT3Fr8ffve1pc6iUT2fQdSSm5Tp2fkdgwlgyGIAfpLLw==
X-Received: by 2002:a05:620a:3710:b0:7cd:31ca:d81 with SMTP id af79cd13be357-7d2198e92cdmr491537685a.27.1749042697421;
        Wed, 04 Jun 2025 06:11:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2a5dsm21439851fa.103.2025.06.04.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:11:36 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:11:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
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
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <ifj3ipdlxxv6dnste76q2wwmy4dcvshnfkqekdndg674rgsrdw@vgj2aahqqsdx>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
 <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
 <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
X-Proofpoint-ORIG-GUID: BXEsQVwDXY-7FuA_04jnVjg7dSAqSCeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMCBTYWx0ZWRfXzWIRn78SfLde
 0qFr9q4qCURULoVKwcsJ7x/Ri645AzGMUG8ZgTU8r/Et4HSjcF/QOp1t1YNXcJahjIp/pm+4ebt
 dXRQFTKM4BEPSeN3wKnL/LV2TADw9SK1LK27w4Fza27zSajOu7yWJAHuFKX7Sy54WV+zRUxe31Y
 Q1fvEfE/FfoMDryY6UhmWvhoHmp83/34FapRG0POYy9+PhW7o+bDMt4g4qqcZQvZ4Uaon7zZFYj
 TJIOCsxMC6tYu6Wnh6aupVD08N4WLkR620FpTAtLVN0XdnJPWZSVijHKCdcUhYqriuTqcFrslFq
 B9Jk/UhK/fLLvslmPG9BsAvNMgNBlBPhI3rr45w8l0R25AtwjhZJ1AWWZO6aCxrDBa1jlBNXgvY
 rCTRaRVa2wCyDsBMs9m3Yn6SEJPLkFH8bqpI8V5TEDcLw1aOnQjCw8Uy/ZcTC6jwtrMK9OY5
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=68404621 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=pUtLPF_adMnqGKIR7MYA:9 a=CjuIK1q_8ugA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BXEsQVwDXY-7FuA_04jnVjg7dSAqSCeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040100

On Tue, Jun 03, 2025 at 10:16:14PM +0800, Xilin Wu wrote:
> On 2025/6/3 22:06:36, Dmitry Baryshkov wrote:
> > On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
> > > On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <lumag@kernel.org>
> > > > 
> > > > The MSM DisplayPort driver implements several HDMI codec functions
> > > > in the driver, e.g. it manually manages HDMI codec device registration,
> > > > returning ELD and plugged_cb support. In order to reduce code
> > > > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > > > integration.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > > > support. Present DRM HDMI Audio support has been written with the HDMI
> > > > and in particular DRM HDMI Connector framework support, however those
> > > > audio helpers can be easily reused for DisplayPort drivers too.
> > > > 
> > > > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > > > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > > > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > > > has to manually (and correctly) implement the get_eld() and plugged_cb
> > > > support.
> > > > 
> > > > Implement necessary integration in drm_bridge_connector and provide an
> > > > example implementation in the msm/dp driver.
> > > > ---
> > > > Changes in v7:
> > > > - Dropped applied patches
> > > > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > > > 
> > > > Changes in v6:
> > > > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> > > >     callbacks to the drm_bridge interface (Maxime)
> > > > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > > > 
> > > > Changes in v5:
> > > > - Rebased on top of linux-next, also handling HDMI audio piece of the
> > > >     MSM HDMI driver.
> > > > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > > > 
> > > > Changes in v4:
> > > > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> > > >     HDMI driver.
> > > > - Drop outdated comment regarding subconnector from the commit message.
> > > > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > > > 
> > > > Changes in v3:
> > > > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> > > >     (Laurent, Maxime)
> > > > - Dropped the subconnector patch (again)
> > > > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > > > 
> > > > Changes in v2:
> > > > - Added drm_connector_attach_dp_subconnector_property() patches
> > > > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > > > ---
> > > >    drivers/gpu/drm/msm/Kconfig         |   1 +
> > > >    drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> > > >    drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> > > >    drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> > > >    drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> > > >    drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> > > >    6 files changed, 31 insertions(+), 170 deletions(-)
> > > > 
> > > 
> > > This change breaks DP audio on the qcs6490 platform, tested on kernel
> > > next-20250528.
> > 
> > I can not confirm this issue here (though I tested it on a different
> > hardware). Do you have any patches on top of linux-next?
> > 
> 
> I have this patch series applied, but I don't think it could be relevant:
> 
> [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
> https://lore.kernel.org/all/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/
> 
> > > 
> > > [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
> > > [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > dai_count 0
> > > [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > Missing hw_params
> > > [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > Invalid parameters
> > > [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
> > > hdmi-audio-codec failed with error -22
> > > [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
> > > on minor 0
> > > 
> > > Manually reverting this change solves the problem.
> > 
> > It is suspicious, since dai_count can not be 0. We set
> > hdmi_audio_max_i2s_playback_channels to 8, which in turn should set the
> > hdmi_codec_pdata.i2s to 1.
> > 
> 
> It suddenly comes to my mind that I'm using a kernel with everything
> compiled as builtin. Could that be a possible issue?

What kernel args are you using? Do you have any kernel debug options
enabled in the .config? I've tested the kernel on RB3 Gen2 and I still
can not confirm the issue (I'm also using an all-in kernel)

I've verified that on a running system I'm getting three HDMI audio
codecs (one from LT9611UXC and two from DP controllers). Each of them
binds immediately to the driver with no issues observed.

-- 
With best wishes
Dmitry
