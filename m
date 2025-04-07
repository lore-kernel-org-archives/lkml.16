Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BEB1F63E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038672; cv=none; b=MWPGecJsOnAiUg76zjPF2hE5J3yGFinCthcx8eomcCt01QK7Ne57v+NIVTxqPenvLb5dLpxx85MisoP7FQdZqO+3RMl2P47aIHxn2mE/Q97A4LDzpkUotTpZcAW5IaFNyXuT07J3CjkU8HLpjCtpQcUrEwchO6QYcNCmFf47ZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038672; c=relaxed/simple;
	bh=2HC3NGdHCaGCBoj08jwevVV5qTrdss1SpN/q+vSUpqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c7CtXob6/2/Z1GGYb6VQz1njMlo8LfVT+UWDPa1kSFRTvtYbEzr3RETQ8kSlmjst/y5TPTKhnOstKlhSv1GVsoI/fDwaYNb/1X/B0RPpkKxu6Dz6TZqVHMfILbH00q2u+1Xolo1ezKa6LMW9a8sy5PSX4dw1CxOAVaMDZ9e07kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXLojROZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXLojROZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doBR017420
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 15:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SVDbcgBLEx3IAtDvcLYlqV
	A6wLLi1mRZSIJcN/Uo00o=; b=VXLojROZ8C3q0C85JMNsMqBkr5NEYNQDGGdMGJ
	tUA3zWdPKiwr8sdBz+sW6CB3+o88RQME6auIUiCW8OUbvhIEtLyhoha6ArAxCYPs
	dZljmSjuuX0kd0vm5Mo7FIr/WlieXBI0vtDKg6LmChvrlnYymN1hZR8Wj5uzTwWw
	n25OHqkyAr3H5KUmQtOIFIvm6VGmJMGVdnbgbXa+GwFj2Hhia89sskfXhUpXH8B3
	KHGbUXwAF9DKLa4pjmN0N5tdTPJpNJTyfPvqRl2dwu4tSNeQFaw5EEgfq4L5Yu8Z
	ZlUISBQyjyBFzZ6DKvINYKSyHnNbJfG9UmNnY59ZmeaLIMtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3ckkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 15:11:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so6517785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038663; x=1744643463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVDbcgBLEx3IAtDvcLYlqVA6wLLi1mRZSIJcN/Uo00o=;
        b=KqWpV2yeZy8JVC0mmku4auDp5vwIZgeg560CzHaau8fLRyuhWF3W4FZdJMDPNhvbvJ
         mYHkMbQgTAUuJrbE3GSVP2U1+3AnOcaMs+eeJbxoPbqCxbOV4j9hnLQJedJybks+m8eE
         7gaBq45W4NTVbXO+sa57DSN1qkbMuULUcmCuV96OuGwECq8/9H7VXrPouYDr0+D1Rcjs
         6kXNO7qUpZo1mCHV2Jg0TlIt33RGITjpsoU+1R+FA1ORQXKy2J7jYl9Deju6SIGkoEaN
         pDvnN8MmyADWSLuePudnqemc2QPbpa33hFTwm1uwrbv7rJTyxxrlV+q1dOH+qcPS9WkC
         xx8A==
X-Forwarded-Encrypted: i=1; AJvYcCUbzLg0zryRzVqaTQyGdQ6RV+0Tzt2pYBbDx6My18/KZXMXrH1l1HrEUL+GilfKkvR/vvQelNigx13FvcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDkdwp/8Ato31k7cRLdyscfWHXMUNqLDwdL0wevk76V5GtF8Q
	qrYA3S6HHhcpERQIibDLx567DCC408kO1+rLDoNv+4Z/WpE1owBdgTctBFrKy0tzjOCprNoNV80
	YA/pIKK50C/HAoWbYwEeeiFEREfNspAs2QSkmDiRqe5l3VbzdBv7+zJ8zk9rJWso=
X-Gm-Gg: ASbGncsueVE/gFVqqHKVsljQ+bnR3/QVWNj2+RXQED8Jb24aGIOMkszIfl1qDNvH4Cq
	ywPS3u+UN/uLbvkYfGPW9uXKt2/eEC6WQrqpfy5NToRxoNMGAKauP8GednolaL9jFztm9aTYTcs
	64Ipf5MQwAoQ8Gf1IvaSKo2G9OP3zJoZPkEoKfB+Y/HjN2TwfdKpfdDE2Ur2P2ZnfTRnL/nzisk
	+IMYdxdc8dxQ7zrUrxKN219udpAbbri7eKSq6e8DJbEQ8O3y/nQD/mZXCXBrEVOaakPbXrApHTj
	0y9moInkRiKa74xuDZ7L5KVwUdin5mvlqpTnfQEkonD2DmBVl/JxjOvzW9WTZcoc2WXCklGJEQI
	WrlYUzYPpfFwuto/lWVMH11OrSnaR
X-Received: by 2002:a05:620a:4551:b0:7c5:96f6:c9e6 with SMTP id af79cd13be357-7c77dd8654amr1056712185a.15.1744038662776;
        Mon, 07 Apr 2025 08:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHqrH1lDF2eXoGEPRExQ109G40w2fdjUx4FVotD06yqW6Q1WmQlnNQa7YOvWmbUDuALQx1SQ==
X-Received: by 2002:a05:620a:4551:b0:7c5:96f6:c9e6 with SMTP id af79cd13be357-7c77dd8654amr1056706985a.15.1744038662292;
        Mon, 07 Apr 2025 08:11:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:11:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/11] drm/display: generic HDMI CEC helpers
Date: Mon, 07 Apr 2025 18:10:57 +0300
Message-Id: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHr82cC/3XOS27DIBQF0K1YjEsLj4/tjLqPKAM+LzFSDS24V
 qrIey9xGrVV5AniIt3DvZCCOWAhu+ZCMs6hhBRrUE8NcYOJJ6TB10yAgeQAgvo80sGPgboUI7o
 pZerQUSF7Bg472dqW1PJ7xmM4r/D+cMsZPz6rP90eiTUFKzKOYdo1V3UMxb3cLzTieSLX5hBK/
 eRrXTjztfozRm2NmTll1HZMdMzpFoC/voVocnpO+bSaM9wdxThnmw5Up2e6dd1RSK3FgyP+OKA
 3HVEdZZUFL3ulvXlw5K9Tj01HVse0XAMzSnrF/jnLsnwDIc6cAs8BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5829;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2HC3NGdHCaGCBoj08jwevVV5qTrdss1SpN/q+vSUpqo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sDnlTvPSEyzJGVoqtYsExh9DlqHGlpfKx99
 NmsQjYwBPiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1eI3B/9o8Kx88ua8FRheP/1jXqeqDm4rTCWWRXprVr4xuoKflnAFhlsFnHOi6WIlhosKtT0rllW
 GylsBx+qF3ppg3YShKfRbs7ALEVbgE8touVs2NxIhs2sFIppAqUwrPhXsNuV8uSUpFu0Fqwz0UC
 fjmzYJHfBGctulFJrYBtAZnGNrG5p+eFpLAIaHLo3/noCI9mHR+09kg9d77bwVyUCSqc1n3KoUy
 YNEMO0/RSwNw3W4xldVsqcUOzz84ShaK8yRuKiuR271wghQvmf7vO8JafhIjirjvGxlED8cItNh
 dNpp8NAR19mPdpebNswYP8alxBE+zzhdWadX8O6e7dugC23p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ycLbwqPy4k8wJxkq9QRzIY5jHEX_i9Rv
X-Proofpoint-ORIG-GUID: ycLbwqPy4k8wJxkq9QRzIY5jHEX_i9Rv
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3eb07 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mx_tZ-coFAQyRMgxpOMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106

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
Dmitry Baryshkov (11):
      drm/bridge: move private data to the end of the struct
      drm/bridge: allow limiting I2S formats
      drm/connector: add CEC-related fields
      drm/connector: unregister CEC data
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
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 175 +++++++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  60 ++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   7 +-
 drivers/gpu/drm/drm_connector.c                    |  51 +++
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 140 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   1 -
 include/drm/display/drm_hdmi_audio_helper.h        |   1 +
 include/drm/display/drm_hdmi_cec_helper.h          |  74 +++++
 include/drm/drm_bridge.h                           |  76 ++++-
 include/drm/drm_connector.h                        |  56 ++++
 21 files changed, 879 insertions(+), 431 deletions(-)
---
base-commit: 231adeda9f674ece664b09b75b68a4c023180fb4
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

