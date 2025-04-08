Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFFF1B4F09
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120471; cv=none; b=sJf19ZNUH8l7x3i1/rMFc+JA1QDYPtSHg58Awii3rkNnhvm3psY7pqdd290hn5//Mt13x0Bm8aLc71amNa+kQxSyPTYnOvoxmUU1uZmpAxtUIttQzE1A6w1DBb6AZ6xBGs1/WVlHwSO4gIBqD+4DR20B7TJ6HoBKeLVj21I4Ksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120471; c=relaxed/simple;
	bh=xsWGBJl8SLI8+M9O3/9jyj/1Cn/0TZ1NdGVYYXEzM7c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=guPd5y9lwyAzWmdpzIT+g8/hU1TEndiXPkBXMPhyl6nOUgr0Y9ft3D21D5evRADwy+V6Y1jTTjlQzUT/03XmlgZQ0eYpqo5M+V7BFIi+wpmYMb6wfkyJ3UUtuPe6iBfMPgyoU8n+OYr18BJKN5cBs9na7sY5fSFwj3gxfTj5wfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMrvIdiX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMrvIdiX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B4qJH000832
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 13:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TyLBffc6+Zo9a+g3rn1MCD
	E5irMVpwaOybEI3TjyU48=; b=cMrvIdiX3EvQ4oF2tosKDwCY6xoVZesE/rTp0O
	PHT3kURTaTNnC0SpCaA9HX83yPFSH6bS+DHhzDRDN5tbDAmDOC1ODtBerIINO+fI
	OkCAQVNF6n39LGpAsTQpZf6ysgCzZ4xQCi9pGpBsYMbehjwNAfbZknpxlCenVhpY
	LznKXoAZmAFiQqHhbpXrQK5eHXt9RU8/5OvYeU6EMj+hURdcXCM1f0yo2rUJGXrw
	RvRm+pVeIMbWgYlefnfiUe9YJbEtKfjF4ha6C4aSOqu0e6J/LydTd61MnjBMO7HK
	EOCItygwD8+7O9Z3LW4KTXIlaj1b7Vu9/6wEJrz0ULdYuosw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe80pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:54:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a8aff693so126448241cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120467; x=1744725267;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyLBffc6+Zo9a+g3rn1MCDE5irMVpwaOybEI3TjyU48=;
        b=X2WKCuTxZwkCfXCvWMTgnXkZlVyJhY+72fNSWUHvHPch7lYe9uNbfE1SyPb03uYbdu
         8UsQO78AIbXMJjgQUVQiV9cAPRubVkYGgu4XuhThMuVXccU8v548Zwh6Fpe+YaqBSu1o
         J2BYO4PeqUmjj/ToIdpdBEt0w62Qm+Mi9+UclvfTTgemUdpnjJBYJCc/bJM3nFMlYRWm
         uSes5EJK2nJ91awqSbBXaq/gz1egLIEK39aP9foIyRsOKEI3ElaGNVsHe0MbNP/9y9RH
         3kl5h1U6pGJGLBEn0u5ueJ8dhehlta5Cp5tXG0DDMp2V+qEx65+b++LGX2v5cTiOS/nV
         1R6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/FsWHV09AHXRxLVrx03qUArSzNr5UtGoskg4D2uGdKS9rH9Bjk4BqKqHPJqAcq6eh483IkWGLZKp6Oug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG6tW/03calSKsufGarmL1MaGGJGnhyg1nuzbfaCJ3hreL7Hdg
	PNEfWbrBxm5L7wn/sPDybG8/Fbh6ZNPzzTWBwac+0Gqp5rOXLgDw6n1zg7ac9rGLBy78Zn5wwYR
	4U1farTL80KtbINyp2xXd+DPmINSz+9ae8n9IK4Dz+MGCocIUQeq0CCAllMn8IMg=
X-Gm-Gg: ASbGncvmvDMyYx+sev8PWMPv2XtKEOldcz5DmkhEk71cRApoWZPI+l3KHD2SJP3IpSd
	P6gKLdasVcMdBiW66hTmaBRww4Lz1wpz1bkcsF9kWIRpem5spwb5tLxrfQx/z5dVg1/Kcwqk1VV
	fpTdqULeXbNA8f8Jc7WyIHUjBoVPKJzIPgdDs8+oOCGttilVjhHe4WH9sr9JN2kqSigy/hD3vf7
	Hzd+iN62OVJj0xetCuKD1rEycCJ8qb9VcknQkvnSO8SOWpRP2NRrNLiJmb5bYsNQIGHDgqi2KE3
	FhrSvXQLXkGOhayxYZgbTKYdynrnJplcSbEI6sP9KUJm5YlJ09fW575evjYw8G6Cr5jvGBFaft0
	BaATwOAHeOExtvDThdUoDzxjCubor
X-Received: by 2002:ad4:5c8f:0:b0:6e8:e8dd:30d1 with SMTP id 6a1803df08f44-6f0584b88ebmr238679936d6.22.1744120467501;
        Tue, 08 Apr 2025 06:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfoTd+9pfqW+ErYCeqPWeMLcCY/0R1//lWUB1/CyCJ8Yk1+OfEXowetQ/OcPL/wroNcfq8g==
X-Received: by 2002:ad4:5c8f:0:b0:6e8:e8dd:30d1 with SMTP id 6a1803df08f44-6f0584b88ebmr238679396d6.22.1744120467061;
        Tue, 08 Apr 2025 06:54:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:54:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/display: hdmi: provide common code to get Audio
 Clock Recovery params
Date: Tue, 08 Apr 2025 16:54:24 +0300
Message-Id: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAq9WcC/1XMQQrCMBCF4auUWTuSxIrWlfeQLpJO0gzYRiZSl
 JK7GwsuXP4P3rdC9sI+w6VZQfzCmdNcw+waGKKdR49MtcEoc1QHdUaSCSNNjHYQPFnSQZHShgL
 Uy0N84NfG3frakfMzyXvTF/1df1D3Dy0aFTrXDaY1oaXWXe88W0n7JCP0pZQPf5TImakAAAA=
X-Change-ID: 20250308-drm-hdmi-acr-7ad1f0d012df
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xsWGBJl8SLI8+M9O3/9jyj/1Cn/0TZ1NdGVYYXEzM7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRPfqX7xAPkR8Vmyj6YhBnUQjd1EtJetVwi
 N7z9QsIuYqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1SFxCACvwWCoVqXlqEYSfKXGeSI4vuwcBPWduErCQ3Tqww1D+5gMAePZdnisD6o+fedPih0W5vB
 WJDC6SvpNy1BeJhmSY2r3zfQLgwM7TOIBk+HwCogQnvPPdiUFUV1q46m5kclh9okJCy0whNcLZ2
 yTjxf4I4HbvG+sswym0zIRQUlBerGMC7MZNR1SrJObRDj9ibzBEyWR8OBaOFM7zLhDxWGPhLmEf
 L0XLQHcQqea72NUCNY8okKvAHO67rguEN6mWZySsVWxcpMU5cODcXkk8AtQLeH+yJsqmHea80eT
 YbDWDISq2PVsfG/QUhCHeTiXfTucDtCHqDzOYjqe3mq9SWcZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vyWe4kDdZxftTTHRFfO1Oo1TyV3P0sxf
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f52a94 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mWnm1Bu5f2UsoqAo_2UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vyWe4kDdZxftTTHRFfO1Oo1TyV3P0sxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=952 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080098

HDMI standards define a recommended set of values to be used for Audio
Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
implements its own way to determine those values. Implement a common
helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
only) drivers.

Note, this helper simply implements the database for these values (HDMI
Section 7.2). The question of selecting supported formats and rates
should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
is handled by sound/pci/hda/patch_hdmi.c).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added missing EXPORT_SYMBOL(drm_hdmi_acr_get_n_cts) (LKP)
- Extended documentation to explicitly mention L-PCM (Maxime)
- Dropped VC4 and rockchip patchets as I'm not able to test them.
- Link to v1: https://lore.kernel.org/r/20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: hdmi: provide central data authority for ACR params
      drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      drm/msm/hdmi: use new helper for ACR tables

 drivers/gpu/drm/display/drm_hdmi_helper.c | 168 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c     | 107 ++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    |   8 +-
 include/drm/display/drm_hdmi_helper.h     |   6 ++
 4 files changed, 186 insertions(+), 103 deletions(-)
---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250308-drm-hdmi-acr-7ad1f0d012df

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

