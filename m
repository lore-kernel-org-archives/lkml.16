Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0431DFD96
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375221; cv=none; b=H8goxEw0waO7GCDwGuNMsHE7wNIgIRITVOUYNOmCNObnWeO3wcHGxpaWnBK40Dp5gQqTqN/dfhH2DaE/dXE509A70l/2mf+5sZfZRX6GPD2XZhpDmjldOEV21Kqb8LJCwFUmYAwqFevVTx2uwPZ1/NzOlCm9sIgWXgeYoFeJFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375221; c=relaxed/simple;
	bh=zTK6qAcKQZuF4cfB2PwxVStTZEH+TOc7QDpxhzQeph8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tgm6rCoouGGomd6wAJsRVcfLAfMVTA5fFWK/9mVzpK65MsmDgnVx+yO0uadOfc7EzMDWkl0fSNzEljJT39ZxHBMMmxzvIP/htCdnS7C2K1Fe28xJ1c+B0jkReA5s2cfXFlZ1jUjUO8ChEHVwqJ6Tc0t7en0XL/4+q3T14YMEZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0bQyENw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0bQyENw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FtjtV031973
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=G0bQyENwGIhr0PVK
	ug3iJeV0Ooe8RkgrDJY8XiTfO+EmvDmYKm/xaClavI87LG9by3tiU7sE5gBwL4bQ
	u2YAfNjznGHiXMfTre2Onw3P/J2YHg2uL2TvS75dKYAiFms4lVZKorf6NixiUqLY
	4D3Amd7+FV7adT58Rb5w0J86GN8RJgg/FP6/1f3j38Q6C/aqZQeXT5wQpN0ufY9b
	hjUJpxzgzVwRSegiBytj72kJ+87BKLaqZ6RxNuT9s/YdVhd8GLeh5Vvi+oM45HEM
	c0R7IzAQ6sbEUgjBzfupiXKa89b0U1hDRuWJZtEoMe/FZxQLQSOqmn0Y9NmX79B6
	/v/imQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5a6dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so372294085a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375217; x=1746980017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
        b=YyYkO/Q6F2f4rwJmA+58gQlsiKlVxsBdMRH/Ewd4NREVjXbzCOz5Y5MUstgUirXJLj
         HTCOLaWYdtq9hNR0OwHlhMs7D37FqU/UM6qzSuh92pKqJM/9b0a/8zNKhk9Dc5/NI1Q/
         DYK0XRHpj7QVCNKYKE/wux+rnGHeHTTatyZJ/bguKPpwCqP2rbgUA0sSxjeTfj1DQ0EU
         U0r9Y+j+uuinrTZFS+2jyBVScuxOFuuiqLG0Gwe2ofa0kYYM7lNuWJeLfJnHBBvqFE9U
         x8f2c4KibuwyMH0agUmxhK139F5MnPBY3a9A77fWmEl8RFoNCAuyvemNx87QUUeEc//D
         rRHg==
X-Forwarded-Encrypted: i=1; AJvYcCWiR2JzE87y4o7fame2mQR2Ks/336G/TWpZdTwT88l6iOd6lh6Q1JpObEarbY893NYZDiZEDmsJdai7clY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn22iy1j9OccjPy/L5Jjc3s5WoMsV1/yoyZAakIXvwBADZ0vKj
	2GbQqkSVH4xccpY2LoFjM+51ZqIgJlqMW14X7PB4TyH0IqVVZxkJtgQMul+th7HBOkOjOUNo0ll
	evoUXecnJ3fvmoImOMw/8OYmfWRJALBv8hlgTKG/5CiXZyaFPNgoCQ5/4yXwRExw=
X-Gm-Gg: ASbGnctkstju3lGp9RfgG9B9RfN/adOXGVgJGSvZdMKErc4fZyDQEh+31hJ04ICyIAx
	esCKL/x40Y5Env2K/f+iUPIF3HV9Lm+qVc1UvjjRuGVswFgLb1O/reLv+RMBBYfrA/WYS/XX6VH
	TZDgY21UCgNYRB/pTv2vqfDDUvq9dOPJIkvA4Kc6FISzt/7MWJWSBDysFnpwVtEZ3YIqHsxYdtt
	oHguwF6i3GaHiBBkrqOQpbdwBMb74QekAo5BsGQYGRxmaKWJ+XkIO76QMdYW7qFfzkXEd+tvmKs
	ak8yJuii+fdMvZDdtZOD0fxA8eDjvRGZ4/aRolhW9f0Xg6Qrl5OouvIK/auIDGBAaVZ/S7aupUi
	OJJY7W3WfRQjP0tq3jhIkimhY
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cae3aa3a7cmr721242085a.27.1746375217698;
        Sun, 04 May 2025 09:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeiOTVT2ymuT82iRFejLq29xysyG8uAckrB2qV1iZnT3Z31gVfU5M2H+L7Io6knC2h1rUhaA==
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cae3aa3a7cmr721238785a.27.1746375217366;
        Sun, 04 May 2025 09:13:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/display: hdmi: provide common code to get Audio Clock Recovery params
Date: Sun,  4 May 2025 19:13:21 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oznZIWCo6EVUN4is_l5WGBGbzlVbAmAN
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68179232 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: oznZIWCo6EVUN4is_l5WGBGbzlVbAmAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX46c5s9gqQV93
 kErx/LxhS1ANqhDlcYR9YSg66EY0W6HxpEKp+2AXW4UX8n83k+94szR5+BndfpVl2B3/d9hQVG+
 NDA93Ez1lBdqsWFRhZtdrSC0EHrviac/TYrL83fKMsmURNiqtVVfxKm9/ozwCNb+NK6uexaPmIv
 C43/GuUcS3m1yl5pICWOgCbNULA7h/p2XY4WQa+OQN8bo1FHyFGXO4Crwl3M7gDcXMhCWe8RUw9
 dUiS7d6g+PRTTgNr0QWqRwd5Ai04ECFrHuolatpIuiU0V9Pd067nyBIGOLGHv0SFGsqwX4G4uxP
 7S3t29edcny/hcidysCMPU7zFKCrABO19J49Lkm2fue8rBC3eWzLsjKwPCW91Na7uC1oFAkzhQW
 4PN9H2ojRNB/vdB+UhhidyIAywwN1xLGZmxqBF1XVEtdACFkqCzYphep+29Vpd5zvTVpmHf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=880 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied, thanks!

[2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1735917ac44a
[3/3] drm/msm/hdmi: use new helper for ACR tables
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88321e3529f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
