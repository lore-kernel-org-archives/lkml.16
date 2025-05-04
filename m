Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995A1E5208
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375224; cv=none; b=WWCuyu0xk/EPC7yA7QK4fqzUQM9fXzHaJslR1xeGDpGY8Ax7Tvn0umax5mJF9lJleAkx1hvV9Yor0eC1DN/nI1IS6Asv4icOQgcsPelHDTcOEYFeTL4uuQHgGi7ZqqZnuTDwgohDw0GAQZwlSTTVUwhuX7pIYc4hbnOv65qBJrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375224; c=relaxed/simple;
	bh=k+dXzlqMIg75u0mEM2Z8oVwbF0JGO6yHXhkMZsH6N+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IaXw/7Wbcb2y3+jqGiHBaILpCzCTfgeVnUOm6DBGrZQ7miO7G46hZxYg16KYD5ANGazse5luaJMrOAMDZcTn0Tq+zSDi6CddJepvvk8xNkbSruW4gUikYDMVApqMvT9k7/3J7wa9TDCinJ43z8BupioYDeBZA2SU24Fd+dTn0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PceyglrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PceyglrV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Bwequ027577
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=PceyglrV3PU7GHzr
	LuuP7Q12afGV8PbCfYTHmKQsTBtZtuXymMNqsu2dmixChR6erxqUWCPzVtzIT7Gk
	D72ayXTs04CvX8pg1yjiO3EBXBRqHRXpUYRYHBe8A6pSpkmCkApdh0vt9qhFEL2e
	qYe4qDZc0K7MXrbAPan9x/gNIgAWkQxxja4dziSbeCovgizl9DF6pVz8ML6UH7Aq
	eoxo9YtwQQTIU4OTEl7CSA938rcpLUBnFBZNRFns2Jrvjh5BT0+s8qlapBpu3x8R
	Fy23vk+CeM5ssAffU0ROjuC+FH8tK4rnDQixqbzSyXB0ON2tFzzgZIDrvggqZKg6
	mZKNhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a2u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so337524985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375221; x=1746980021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
        b=aZhKZc4baNyLXRSgVa1MP6LENwRleTEMB9Mfti8kyAAHmwxvJ0LsAfwTgcPYzpbVe/
         H4WbpgapLdxO+UOKX9Nf7qZR2ukDPat2kRDHsK6I1rSM2Yd6PGek1KWAqUCbwmRGQavq
         eFYKj1qqFVjLKvvcbw3wGOm50PjZwoWbskJrHPfuyqJqkTXZHJQD55YhrIXfLYYQ3Jl6
         kV5T9w7hZjxQUu4IvUtIMt+wSxfEcv/nobw3q0eModFi42bOuOgazMWUycTcZv+VJSZ2
         wwV3LULfJM0J4489kdxhge/zXFKngwMcX9TYhGniT+xfIdZm88vUbvaYJXi3z8FDjXNV
         fgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDsQtivljw/rCRbLrANhGS/FTN9ki4SE43zmha8UfT0rD3vYxIqZQdzQG6mwWSXwqCAVHi2T5WErY+I+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPxm5HGw3b+unqaUdjHRGUF0wGxIxxhDlYh/2lBAM5ynmaKyf
	mFScD5izJDDia0KZuVd7PuHtbMIYpN/4Jf6HsPbO7iPVQiDVWCHnuOMgfuqJj7wrKZ0M502ds1V
	o31dw65MBF1bU0oWOtUcaziGWb8lOssEe5z1DPGd/Wc0INofjytFFfcyJhD8kTgA=
X-Gm-Gg: ASbGncueQinFtvKN6CtVAotSZqHSIMTsJkKodhurWPyxr1Ir0gTHyRW0ABC7VRC9DGy
	f/SdZCdc/yGrMruZiJetl2NdblIogld7KC88Zdwnn0g2ZWrR8ZC9wlt9y2faYOyjUyaiwaTs2s2
	PkpqoRgR2LF7nZCtr8f/rZWY2GQCm25zbUPck4IGQGSu7qGZ6wg13GJYVmCF5CY9FFJDn0q7Qkd
	BEF6tFlqT60rhyOOVR963PK517C9TtT4dlktFD5vWXuv+rctwG/fXnCFUiw0l/J2vHAwAG414wP
	QQGWi1tgLLZTGPsZgrBdiAcvMlSpj5CYChNttJTWg9TQwM4v39hGOrFt9akmkCP9N2/C3C3T3Pd
	S4vmZ9Lyn6M439VKi0ww+39Oy
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7cae3a5a077mr572043885a.3.1746375220875;
        Sun, 04 May 2025 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc6F2gMWEMC/eQyOndUIwlivpCZSW5Hk2df4PpYxa0HMFQ0EsGz/WEeqpDE8GrC8oyTI9p4A==
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7cae3a5a077mr572039185a.3.1746375220519;
        Sun, 04 May 2025 09:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Sun,  4 May 2025 19:13:23 +0300
Message-Id: <174637445761.1385605.15776598312432418446.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXwMpOo5hIUula
 v0GjhFrHHc8W4oLiIXamNDmcdIKGKtvgftQZLzQ5yuCqmwDS6ALwdhsk/veWJH9SESJW41Ws8ZR
 EIvMYb0RrKkE2ybAJ1KTKePPpsJDDoOjyATHsL8vz250tVIKW6YW7NPrXQpqN3GFbSxAp2Qcefy
 iYTCBKRmqoxI2lmsvhUYGWSYBYk/jsiBA+UiV0Q65FuKCaOx5AiLjPvOYu7WZnERD3gX5XzRNAJ
 mJ3IZfCpd5febXuKTnZVTrkcuoiWGAczEcRoq2InE9fm7z1pD8kY+Jxnq28hqYqewRlwJqtoexC
 meaZgcfZpQhJb4Bv6j0U7BOWHUJjJnRDFZdFpIaiCULcj9GC5W8+bfhGs5CAoW2U2lNjwDoG4Pk
 fCpEDQMD66Tu7+fa0ZbQWLUmx2SlO9jZmDoAM7JBwXZVaL7RDaSYIHlEG2E+qBT3ZBYKr8An
X-Proofpoint-ORIG-GUID: nV0YIP4QZRFAPwM-77F4N_Y_QE_MkNoP
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68179236 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: nV0YIP4QZRFAPwM-77F4N_Y_QE_MkNoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=997 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Fri, 25 Apr 2025 12:51:50 +0300, Dmitry Baryshkov wrote:
> The LCDC controller uses pixel clock provided by the multimedia clock
> controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
> clocks properly, taking MMCC into account.
> 
> MDP4 uses custom code to handle LVDS panel. It predates handling
> EPROBE_DEFER, it tries to work when the panel device is not available,
> etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
> to follow contemporary DRM practices.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f1d131147aa
[2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6720d64d8eb
[3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9c2f63da6a70
[4/7] drm/msm/mdp4: use parent_data for LVDS PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b641bf534cf4
[5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f26b80359bc7
[6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b565edc44b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
