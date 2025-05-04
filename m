Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69391EB1AE
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375228; cv=none; b=MwmBlXYieWplq351AZyQ+fTptOxDuP1uAGe7piSt0bC0Lm5g7VTBy0oQgN81DdBikm3nc3Ex3nCq8derUUwDcwAbPt4h/c40e1iWYVc4HaHylHZBtNku/jPMmLQarN7Q1+3BiU9yhun5yl9iRBPlVXgK7XXntqYiyz2yTOzsxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375228; c=relaxed/simple;
	bh=laU7zJS3YV56vTABXTYYyCyaK7vtQP0nr2IhS/ljwl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NH+nsz82Nrb9Hh0MV5lXiOor48701U5A4leJTCXUDIeR5r0IHvSeVm/2NSLCbQAVmd+LD7nbEb3MWt3PhEYiTbAJYntRMCrSoYZRPOaCKRDQ/p/3r1z8xkFq+7Kop1wNwJ3qZfuNnJIDNEltiR81aEMbKCN38HSm7VR7OFHBTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGGVODzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGGVODzD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544AswXg017345
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=WGGVODzDyzMk5G2S
	mkY59L1kxpwBZ2j3zGyB9hlsatxZhWI3y17xKjPbWLyvMHBlQc81X1NlLMkSSEUk
	GPS47xc0CSyz/Lx+Kv75VOFA33okDO9YmWQL3xzwLLfDAE3B5ZyyvJsECkPC332M
	CgO0cO90tYitEJvzcWiyh+k0kfNFfJEhQBuWVKwke9chjD0xOosEhCFUvbIg+lgG
	QbxGMQ/veayEzFGVS9EK62iZRHxOzlxsovoh0KeIkbulhNyTuDljYEkGiPfAdEPH
	LxW+gq+Xr7YNfNj0OvrwKo5hDqVxG/yssC70FUd6SyffRTrOV+kzHdo+zuajr0D0
	XrmCOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsrpxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767e6b4596so66654471cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375224; x=1746980024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
        b=v82zUM1d3hOdVgLIjjT4o+G81KtPG8dEbtGk9s6vZYoAASiDHoS24yyFWnlvBhLMEH
         wcX8UH8tulzA0CeAhiRa8MeNgGpOoai7rkiT2u/RsZ4uJdMha/ojjwYoHoe9wOd/4hd+
         UjyyuPwLl3yhB9bV8TQlAO6h23zDAygSPHm+vDfet00J3ogclNEbg0IGSuvDEsvID64g
         tEeQQTeSo3Qh+oaOKj++v376ljjEzYo6xTs+0Fb3GfLNvQicCHrU/wg7TBMrXMJWczsq
         ftpHlt2GN+YqYVxf3v/xgSwUEm9ya7M3WSpeb7eMAFuU/kiL3nLnxf2lJUQ3QK9fIT86
         4/8A==
X-Forwarded-Encrypted: i=1; AJvYcCV3POi8tDz3kKWox+3GGAilED012f0WEZXKXe34gzlf8G5Msat8V9SNiaP/JC3IcpRO1XGQUcsAUIx2Il8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdBCw3sv8RsHQcCyMyWnUDNniY8plitDN4QOl2Q3NSwCcCC481
	vBBXQ5dOosXZ/DAuh/NG0TVT0fNrRf0MUGiXhQr3eBVE7hjC18dLUqMrr+dRBBeczMPm6kd321d
	oloTGMpuGOPJDn/EHpYw4sf2RUBNUAKtXSOjdu0tUzao7sCyybji03KsHXwvKjnaWvZlDLJ4=
X-Gm-Gg: ASbGncsMFqh+lp6ufkHC+NUayWJiWf19qjrywqxxbjL2+6qveczSuBWoaUJCgwVFkLJ
	yECjrp6AzSAY8/DhbfYBC98K+e3Cf6gks57IlLtEr3VS/j5hj4ZflhiEryndNjlHls70+tj9Pnd
	NQbCSynmaNpEbqOKZu4p7GfJkPuZiJPQ+w01NQ5eqUJMLC3fcglGyQ6UQUiFYAzoxEr/DHVw4Qk
	tK1CjLZAcaADMUoBB4e/F3hAKI3dgrjTZhab2WxAtYjSfiuEZJQpKNw3E7gr4EE1Koxrl/+6OjC
	8fEyt/IUA3qyMhUW2K9kO2d69utEFQFf8C/JeXA0MJ6Z2d2tbAsFk9Z0CuPC6W958rCKZK8VlxP
	44up2TPo6XVl+NEONlUi6r3qX
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id d75a77b69052e-48e0183cb3bmr54064721cf.51.1746375224157;
        Sun, 04 May 2025 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71qwpN6e0AWx4hQF0CPbGvBpbvyols0nzZVR9KjxAriV0LNGtW7IHLvJUL4f75onAKh328Q==
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id d75a77b69052e-48e0183cb3bmr54064441cf.51.1746375223770;
        Sun, 04 May 2025 09:13:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Date: Sun,  4 May 2025 19:13:25 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WXDdZ0jOWIDbgpMNlN52EdyP22UCzhvR
X-Proofpoint-ORIG-GUID: WXDdZ0jOWIDbgpMNlN52EdyP22UCzhvR
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68179239 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX2Wrw4MggsQIy
 eg0F00GqhlAMbT9Jus+POjSaBzdYhghHVPgWncV+qA57pTJ777DfLf9KTJGkBeYQ1E+vmc0sjUk
 xfLVkM2ILavs0bCEOtCXjazhAC9m5Q6q2xoEelH8EXCAHmiBVjUwZl1fwS7Ue4vMQ1/77Vy01Je
 tr3CCTemNVOsVB26H3zi91elRuHQ9Fneq+OQ4wf42Y5FFzmuheEkvqYjQbtU0edtMD/DftkTN6z
 wPMCOjgP9zAcSTocj+Dh99bybngKtGNYZZcUcUf6oNXhTtIZP2WMPpzNQTiIIrGo65qx+GZ/Sce
 /o1ujK2IDTnkg4Bd8yAD6QlfV6Ko7bDnUSVcWVIag2wirK5TWmfYbNaYLg38c2NRwkt7CHUT4Oe
 AGR+N5n4Rb0a3oKJeY+7vp8FmMZhL8V5Zs024FsYrA8BCgY3D8CIj3Uw0enWL+5VyDo0lgSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=876 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Wed, 23 Apr 2025 20:52:45 +0300, Dmitry Baryshkov wrote:
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: reuse generic HDMI codec implementation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98a8920e7b07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
