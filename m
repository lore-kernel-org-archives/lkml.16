Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C2A23DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447186; cv=none; b=P8KgNjDDv87UTFniq1xP3TWb0XQxJftlH0bO31W4nhwtk++SI0Qaus72+4+CrGMWwovZ3K28qxyPSEppFilEF8xoazZ9yA3cReZRwO0SbhOWhFTvKrwQgv21Nuuaz4fY4Md/Lx+YxUt81B9UuOikSkKqd98yjgI+qLvT9HdZO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447186; c=relaxed/simple;
	bh=hjFdZEvl37wQhL9LcL8NZ5b+ROX0vh00ZSwY5lXDjpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tp2PyzgJQIO0N7lLnlVl/3ofGKXpfNFoEc98xKywivSMiEhl9+ZdSBZeViBuF0iGlO3pMbvGe4ZoyxYJ+YSH3yt0KJcyqYt5zA239W73OVeNMyPwZGcA2cFCXzYAdv8bSjvJjI4e+KOdB/tXYimooSh1Wt0NqhmllNqWZp65coE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1q6phCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1q6phCQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBunt5026134
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qGWiMePQgV6L4yTAdBmFNw
	MO2iLQuv57rmtFIgCbF/E=; b=F1q6phCQDYnAdxZae9pCWHkC3iAr+0XU0MB7cQ
	1bL2GutQi0t+vyiMI4rBJwZpfqUIKThV3rVKuB113ga92Mnqf6ovOiNMMix2RRBy
	2ElIPKBglJ8PlTOZkgTw61HVHNq7AmOXKArpjLp0fAUPP5Ivu1IWs5kVpT3j5in9
	E8usU7CdC6mwfaJW2J6NrERvF850k+l+sIoVKOjhlNps6h7DaRqFQ9bgWL6Fh3b4
	cmUHADppu2KLZuJ7VQxJo6SAjMKW++XVXaOJ2xyq80yR8lsSn/iYKts0iGPVZRAO
	61bf5t8pMcioUgpKiCcYqDk4ep+hz7NsnYCbael/V/j5D8MQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyutcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f6e57ffb40so62601516d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447182; x=1748051982;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGWiMePQgV6L4yTAdBmFNwMO2iLQuv57rmtFIgCbF/E=;
        b=N6rVxZccPpgN+GoRsr/6o3YkGdxPxoWA3UnvDbWYoFWByu7m6awgA5ZKrkaEq1cwfT
         neOLenAuMwF9gakTtkJilOKLrSpuVXP7mAI5uHTBkRw4I1uWqDXKB5nqlg9/UT5xSEZ/
         8tv3ICbT+FyFNcVTQU+d1MfQuBLijCDLF1GS7Q0+RK62eiQDtlk81FMXMomf1ZWUXA2F
         2+Qgnon7dP4KPFFTWdovcsXnFjlQA08YPRoovagXC9Gj0RdLA9QKFN4Vhi1HxOC2RZ3F
         JnvCe/KOEsXdq6IUqR2qbthDlwuGkHQKmKQhWQLtyW+Firdt3mvhcp3KAKrd+DVPcJdp
         gb5A==
X-Forwarded-Encrypted: i=1; AJvYcCWwkhKEC1m/9BfRoiF5bP4fPcXS6JzF5Cl10mviKKIoepn6iCIK/kl05iee/noXMaG2XqHtC9Zrpuarf3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4CxOJ+W1WFe4W6vbJQVlRGa0SK+9o5u1Ou8S6uCXSHtVhjQB0
	LeoP5vVpBTGbXZ4GE+G+ueKWougGe4NIgNqnINjUk2eqNL8yrteq9FsMGI1Wz5R7Pks12zPUukv
	vSRwUOPtQaZW4UBOmhuvqpuwHSgiJGw1MgdeBTYNlDugSF7jyVl7NH0e1bpezWN4AiQ3KRQiSKy
	U=
X-Gm-Gg: ASbGncub6jJ0WppL22fLFiKD1ND/gSW4d4AMuKT/Tc6CizODwb+wNqxGl5SG4ugTjz9
	OGM6Uis66E0lvwKTUp29gqHhiAZTjsxai98J32SzjYOxQH693pxgLpYf5p4DhzyCvSWfJP+/nqS
	kF0hf9dd44M4rtvEaNLdd4HgxNUjhjPdEWzyXUinfgg1E/2JUmYQ3FFhL1aRVU5F5s2+ie2O4Ui
	UcVyW9JcJy+OMvcXqpcuIWCE/Ds5P56M8w6Z3CgpN+gtAo8GgeL5fTI15Rjk1ZZYpupb6eH3ctR
	H9b0v2VVwtyyRFl+5XCNHX378bwPRmKO3c7Vjgfxajzl8EH/14FdKoX2V5ySFbvY5uW9F3SyC05
	hK76gtnCaS2oAUBBOEVKvVm75
X-Received: by 2002:a05:6214:252c:b0:6f8:ae32:39a5 with SMTP id 6a1803df08f44-6f8b2c57bd1mr84368546d6.10.1747447182041;
        Fri, 16 May 2025 18:59:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdRJsYEsxk0BEmeVebS2Cx8g0s90b9cPEntoWzF2SPmhijU54V83iK564eilKYSjqBg9QfZw==
X-Received: by 2002:a05:6214:252c:b0:6f8:ae32:39a5 with SMTP id 6a1803df08f44-6f8b2c57bd1mr84368366d6.10.1747447181644;
        Fri, 16 May 2025 18:59:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Date: Sat, 17 May 2025 04:59:36 +0300
Message-Id: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjtJ2gC/3XR3YrDIBAF4FcJXq/ZcfxJ0qu+x9ILo7YRGrPVN
 HQpefc16ZYulNwMjnA+D3gnyUXvEtkVdxLd5JMfQl7UR0FMp8PJUW/zThBQMERObexpZ3tPzRC
 CM+MQqXGGctEAGleLqq1IDn9Hd/S3Ff46PPboLtfsj49L0urkMtL3ftwVi9r7ZD6fBxrcbSRLs
 vMpP/KzNpzYGv0rI7fKTIwCbWvgNRhVIbL92Qcdh3KIp9Wc8OlIYAw2HcxOA6oy9ZELpfibw/8
 5qDYdnh3ZyhataKSy+s0RLyePTUdkR1dMIWgprIQ3R74cAdWmI7MDooamZWAR1H5Iqbxc9Xn5j
 zIPcpjn+RdCS4gxHQIAAA==
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjFdZEvl37wQhL9LcL8NZ5b+ROX0vh00ZSwY5lXDjpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2KUDbjYoJj8Abd+H6zHWTqOwnTDahSEoqfH
 luBDg+KnueJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftigAKCRCLPIo+Aiko
 1VxKB/0RJvE8XVan9SHutV1bRQYB+BzFsOnAMD/RvNccIxwixPSBYXedOy05FCajXEwy79xHKfF
 eNvoiofGQjNXxfcH5FQYCspQJj7y50VO6KrsP37m2BeObFI/agRJXbjrsSjJVK72wcGiAqJWBuG
 PxmuLBA7Qt0ZncgEpHc9uQnOX8GTItd6ueMsar19fFJG7K05K17YZzVHBaoFjTERrrBMnbeOCwv
 sZ8wdQkuOC84wjk3BfbdnjuY71WdJg02k1oLlixkaD3qNphGJdOF3JwyeeIqxaT9JglBYcEGYDe
 fI2ZPX5Med9OTxIHpEhjMEWUMjTCESUFjcusVB3bib52QjV+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7p98yStVUHlmv8909SglDJdsdj_MjexU
X-Proofpoint-ORIG-GUID: 7p98yStVUHlmv8909SglDJdsdj_MjexU
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6827ed8f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=71nJb1rnCRvFoa6Wa_EA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX8jfi0pUot8tU
 FSizxSgfhGmdx550UYIYZVSGmyn7cRCmNK0lPtiL55AAKo59k3gF61IKfOpoh7G9uiLQRS5VVEO
 +6rFS+aS6Dqu6IrAOV3irDQquPcrtGeK15sRAKY1Gq4xN5IZWftfHIl/LpBRPGorunqGpeWgJbk
 HXpc+xcmF4Hcbkpy9KjaWVkEWI1oPHelX1BPCO88mirNnnObNr0djJvd2vdAiDvFAapfMqf0zcy
 nxxu7nbFZ/Y0c/XFJAkTkkyvcTBBEVKPbIImrHvoz528JEKkuTHWazrAczX1WhXKGEL6o2CQ4Tw
 2j7/Rv3K1ZZjtbOY1Um2DWxeL2ZRvKGzsW6/TWn26vjklvclhfBh2a6EQcYmq+thSFjHpi2VWXK
 0Igm2PAyFKS6Sar0ktQ7+O7dQyvcW8otKoAiPf4q1QpNcXvRDmvntAgwijiZi4p5Ttfi/siX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017

Currently it is next to impossible to implement CEC handling for the
setup using drm_bridges and drm_bridge_connector: bridges don't have a
hold of the connector at the proper time to be able to route CEC events.

At the same time it not very easy and obvious to get the CEC physical
address handling correctly. Drivers handle it at various places, ending
up with the slight differences in behaviour.

Follow up the HDMI Connector and HDMI Audio series and implement generic
HDMI CEC set of helpers that link into the HDMI Connector and
drm_bridge_connector frameworks and provide a way to implement CEC
handling for HDMI bridges in an easy yet standard way.

Notes:
- the patchset was only compile-tested
- being an RFC some of the API functions and structures are left
  undocumented
- although the patchset provides drm_bridge / drm_bridge_connector API
  for working with CEC, there is no actual bridge that uses the API
  (yet)

- I'm pretty unhappy with the drm_bridge integration code, we end up
  duplicating wrappers for CEC functions instead of reusing the
  drm_connector wrapping functions. An easy way would be to map
  drm_bridge to the corresponding drm_connector, but that would
  either require a state or storing drm_connector inside a drm_bridge.
  Current code stores cec_adapter instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Fixed vc4 to build with changed API (Maxime)
- Reworked helpers to use drmm to unregister CEC implementations
  (Maxime)
- Expanded commit message to explain void *data design (Maxime)
- Dropped extra include of drm_connector.h from drm_hdmi_cec_helper.h
  (Jani)
- Link to v5: https://lore.kernel.org/r/20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com

Changes in v5:
- Fixed the check in adv7511_bridge_hdmi_tmds_char_rate_valid().
- Major rework of HDMI CEC to follow 'helpers' design. Implemented
  generic data structures that can be used for both CEC notifiers and
  CEC adapters (Maxime).
- Link to v4: https://lore.kernel.org/r/20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org

Changes in v4:
- Rebased on top of drm-misc-next + commit 78a5acf5433d ("drm/display:
  hdmi: Do not read EDID on disconnected connectors")
- Moved 'select DRM_DISPLAY_HDMI_CEC_HELPER' under the
  DRM_I2C_ADV7511_CEC symbol
- Fixed documentation for @hdmi_audio_i2s_formats to describe default
  behaviour.
- Split drm_connector_cleanup() patch from the patch adding CEC-related
  data structures (Maxime).
- Documented that CEC mutex protects all data fields in struct
  drm_connector_cec (Maxime).
- Improved drm_connector_cec_funcs.unregister() documentation.
- Documented struct drm_connector_hdmi_cec_adapter_ops fields. Added a
  note to the commit message on the difference between it and struct
  drm_connector_cec_funcs (Maxime).
- Fixed Kconfig dependencies.
- Link to v3: https://lore.kernel.org/r/20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org

Changes in v3:
- Moved default available_las setting to
  drm_connector_hdmi_cec_register(), allowing drivers to pass 0 instead
  of CEC_MAX_LOG_ADDRS.
- Reworked drm_bridge interface to store opaque pointer and interpret it
  as drm_connector in CEC helpers code.
- Fixed EINVAL checks in drm_connector_hdmi_cec_register().
- Added the adv7511 patch, demonstrating CEC helpers for the DRM
  bridges.
- Link to v2: https://lore.kernel.org/r/20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org

Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org

---
Dmitry Baryshkov (10):
      drm/bridge: move private data to the end of the struct
      drm/bridge: allow limiting I2S formats
      drm/connector: add CEC-related fields
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: adv7511: switch to the HDMI connector helpers

 drivers/gpu/drm/bridge/adv7511/Kconfig             |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  52 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  77 +----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  57 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 345 +++++++++------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   4 -
 drivers/gpu/drm/display/Kconfig                    |  13 +-
 drivers/gpu/drm/display/Makefile                   |   4 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 108 +++++++
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |   3 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 192 ++++++++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  64 ++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   7 +-
 drivers/gpu/drm/drm_connector.c                    |  42 +++
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 139 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   1 -
 include/drm/display/drm_hdmi_audio_helper.h        |   1 +
 include/drm/display/drm_hdmi_cec_helper.h          |  72 +++++
 include/drm/drm_bridge.h                           |  76 ++++-
 include/drm/drm_connector.h                        |  48 +++
 21 files changed, 880 insertions(+), 431 deletions(-)
---
base-commit: 3330b71caff6cdc387fdad68a895c9c81cc2f477
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

