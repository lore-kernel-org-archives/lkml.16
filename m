Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4548274650
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652334; cv=none; b=YnCaofVPIRRPr42OBVwZ9tIdk4PaKLZjq9nsxNux8E+8QuUi9PHk9vZw/rIl+C4PJ5FbeK0avBZ60SgiJ5lmNNUXJi6sNSsyvz4lQfUClZDRHSDbTsLy97G/9iIoY7FIaaulQPBZlNaz7OyKtcB9PM9YSFNP4BsSjw5KsU/o5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652334; c=relaxed/simple;
	bh=zTK6qAcKQZuF4cfB2PwxVStTZEH+TOc7QDpxhzQeph8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fpt7W8iVw8envav7YGa1WLiFlcg5wKexBQADjSqHf8+qkXaaZwylBm5NhKxYZqVHvQgkZqKYjzxw2lK21CDiRXOZRMoukLifXToHsxe0TOE0gle9mvFVtycgrI4PzaCvslr52FGsjRoZDjPSeDrhvzCSALA/Y2y9USZyQhBa6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6Hbi8mZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6Hbi8mZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9IUPt028604
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=V6Hbi8mZt8Q9rTxN
	i6e+4wxppdu9aIST4QWeF4pbhARFuuYr89ACDnyXrLkvQwzBouNcrRRoLBYlY38i
	Gz7J/rXd85S3MskSUm4C05jkjMpQudqpIsySh/BPWN6vB5KmIeMXr0NOvzN54gkp
	LzZYCLxXpRcDZF2p505v3QF0nTwcCMwwruW8lMwuF3ifBX0qmVHG7xVe1DaHBElI
	JbIdnpbwvy8Zh2tY2eQBrvjGfChY12yxytsktbaYLYsonwBikWVPZpChWeOppgHD
	NbG6BcLcMvoIPoKcIHlGHr9swhnHQMsorBygjnsPR9gHFapdR3SEPkM7/jk/2bSD
	azMOjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c2xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a528so1200272685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652324; x=1748257124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
        b=lbtEPxKuANdsuuhtbT6ubefapYL7y472Zb/R8bU49bHUxv6vrx5jBfJEWEhsVoIL4v
         DfwCcPxPCSHa9LHDyaquc4NFYYRgEQPRDdPFTrHZB6GYVRQP2HCEY/ABKOccOSyPB68w
         SxfzJYnCdonD3ZNz7ydxsCbeRWwPAmGIEIC25DQsMUQ8UhWTlf4fBEDC/wPuLeqS0kKm
         Wt1+Q3xjmKsIn4ICqvl2jR20d67nap+CqbViaHJcd8SetsW5bYBf5lmfM/ovR9WH9QLy
         GsZVFG4LP0Jz9jLSTxfThUhchf3HfFSnJBZrV0McD741IFzeOvef5pU63FlI9IszpTG5
         P4RA==
X-Forwarded-Encrypted: i=1; AJvYcCUspo6jeCPGbxSGaTcN49ut83SoLSlwwYgiF5iLKMRVpJrb4wK4d7F55e5XUefXhuZZkLSPaZWcmbeWrwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZvXq/FxCzW74bqMn9aPidOklU412792S7NIAmWLdighFVS6jy
	nLYTtqau/q5y/uKUZrjhqh285svwvgoQ+mvAe5qweP5pQWg32lU3d4QL6kYeX2ynbY5aD8Qo4O1
	c580UaXNfwgxQQsmWZy/u70F7/PnMYJFOiQgYSufZIjQ/02UpGC2YMQv9V4zz9C1mTk8=
X-Gm-Gg: ASbGncsq5M9cd9br2HIQnP3eLXNevpdjZ/QFH3ysGt9Y+5HxTgjS8icaZspBuePutdO
	qMg0zf7nL5/gK49JbaffH4M26QTZ8iFakJDc2tcOzfh3iRSUrdCKM1cC05n/XPS5nvzj0P2H7tI
	PsNo5E/TP4XxjjlOIggRXsfZdFs7wpHhw2po95Kz23c493N489DBPo8k+9j2kLsCQ1SYW3+xHOK
	93V4AZJvrU7YJZ3/2xbB63iIUxvOwpWDJf+56KCWagRV6xvprVu6fptTP0ZEskfY+veG14BMvgE
	SmWBC6dsgPTk302C6PVrmsy/P+G6iJCv7AnZofSWf8waPIPujcWHRqjyglaSk1HadSz9a+NN8CM
	O5oFGghfixKxAwdFh6pzeXeIl
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id af79cd13be357-7cebc7b288emr569707685a.38.1747652324673;
        Mon, 19 May 2025 03:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG38H3cHcZDLnYTmh+6whPIorhfzFE5GyS34FL7x9/2wg2Uv4PTcUIPRws98NMik6MAgAHrpA==
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id af79cd13be357-7cebc7b288emr569705485a.38.1747652324358;
        Mon, 19 May 2025 03:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:43 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:31 +0300
Message-ID: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0eeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 89Bc4XjpXcaoPGd-1Alvmcr5L1eSx5aL
X-Proofpoint-GUID: 89Bc4XjpXcaoPGd-1Alvmcr5L1eSx5aL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX+uWoL6Selvu2
 6OM2jXmMdXBlVe19Ow6qRwr0tHcJt5tDO1DJseAH0uTLsSNIvKis+zw8bREPMS3kwk21EGuNWmx
 6UKI4lh73FS0cj8xvoVTWEVOvSelaa+chbokClbqpCwIVbcn4QIoYrTiHsGwztk/AlZ956ic4Py
 QoswNiVA2O/h+WMJa5j2BBtkURwJ1OXbByks3nAUbq6YmHKXtF+DSO2riQziSj5avRGAHVrkikt
 7E8+2jDfPXWZbR9J8qbxH2v75UjqYCxQFheNaA+1aG2EL1VEL2xvpESQJVOMpU5LYDur3UuqocQ
 MI+Q/L7N0spqH7Msy3n82ETw1TdxeGu/m8Kmzo1NSutjEB6WvoJDaLpSXcwB7229HwXj1cLYUfp
 m0Yiq0NCmpTf0YsnB87hxgLZ/Vl43XJcqGCgD4d6VxsKhBKGHi5UaFGrrdR8YQChGx2KuvNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=882 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
Message-ID: <20250519105831.4OVJBxzNbRs268xzN25nzzNtZCfOPlB4pC02WL59aT8@z>


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
