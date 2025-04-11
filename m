Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55C20C02A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384197; cv=none; b=Wjc8S5Aj+15ZoDXsKBKkC3Rl8mMUeN3+IdOIdA3hLc9lExbsmqDi+YIoHN/oLvFOS21yQBd9EHWGtRQ1LsXUp0A5iwPP7Gkaa/l86ZZp5eDoIklUiLItyPz7ciBmh/OFECwRwyOc0+OT3PBYCZ6KZMRIocSKaTJBlNWz9wUjhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384197; c=relaxed/simple;
	bh=MxiJCcho0/Rr64MZ6DIED2AkTMAEhF6oxTq+w6kONKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ASM4SK+K4tUxnuRq0nj3bVi6npCjitEFPMJSb18OwLry4A5FAUB+0bC5U6rnC/hbV8l/2R3IG3ctJoUmEbMyp6/7A74zMNkuX81aFZVXC9SGZPU0C/2ySQTfhmFKjb2NOkBFX9InQ+jkqsRZJVHfEqlOlDX0vbit/Gf/CK+8TkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoUEpqai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoUEpqai"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5LDVR019650
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qCx474zg+gRG9r0QQhmy48
	y4oCjrPMkNnKl2QPq/ypQ=; b=YoUEpqaiVUscDy05vNnl/aVzS7yqwkhAyY+Kyr
	ev+xSZSAFpAlbRYa7+lySu/vLHCkvAcbs+6x8D7azKjhheES8YW+1vMB8TLupnAQ
	u+BmZf1Subsw4encFjskDpF+xY0w+iuH+ifuAbuzSzV5zfjEj/stboc7xcbSUBwh
	uFDUwdacv2u+DEmHpSMb3KaYhUXAxkDhUMppV3L8VPS/VwUfWpk/scdrk5tR03Ma
	3d6+ZTyjUKqeoGRlzv91MuDmqHyrDupK4whm4/TPRQuvC4vCECnuy/n/jiA/xwSf
	UHy2NxId0BmgEVGC5MjnmS6k+G5piuf31NzIBThkGGnWOE6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrtx5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:09:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so333029985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744384192; x=1744988992;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCx474zg+gRG9r0QQhmy48y4oCjrPMkNnKl2QPq/ypQ=;
        b=tLndaNtXA4/KxqtYe5l49Wu3k7sqrA5WLu3ajaAswYfxHZQkFasy7U37Xx1mH49Q8H
         Qx0tNzRVuNS4BWmo8NeXQ8/mkQ0aYXFoN5fvIsqddSVA0M/30Z1mqX3AzsgB38gp2+fK
         I50wpwX9p1h9k40wd5jtidtihiqs+u1i6qKhDttPpsFYk/8cU+G4w65/GPJUH2xHjQJ9
         ZfYtkWjmqSmCO+L5RmOmka/i79GpTh/PkJHWsOkIOAsFShDLu30g7cgS5Kp4fbPapDRq
         oIwtviqkvqImC4oTqmsu31BbDXzKagaTynDVbGoyM2chHR+Yv4jn8B4WxoLBQy4findC
         j0HA==
X-Forwarded-Encrypted: i=1; AJvYcCXr5gyu9J2MW1N/93uJtGoOKSTrKnYnjdarrT9JciRenEp3JeyMuD/BmJim5+QSCErwJLZmu0lRY5/tBks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9xXtuXN34o+zu7pGCg6yYEUwCOtfDPfv3LqyTeWC3Nktzg0P
	aUqV49ywL2abEDaqqIKWRZLN+GElzbnolRKtEzossGN5pIe8+hrhgUE9U7AvIEBANkToU1EIVJr
	N3FD9Zc5OKoSycvsX7FoVaC/yMpmwOC/Loz+NkeEv3XzKb1hlZDtel3JzfWqC6vQ=
X-Gm-Gg: ASbGncvia8wNf0cFm0SKciSgIxjJKQ3ZHnzoI8kB2UbqHJ4X1Vuts9enCwSC5tHPU5G
	SISQqnLRUQJyWmQziWb0JI01X0qH4NkHM7sVAOLCRXV8V6+qCQh+ath0jVZ6sQzBL4lAFBOUEFj
	+wRHI0LYE8+XUwHsPXNwmJjk6OCUJ4xY2ABte+1DTvuJUD6EI7MeiXrBpncXxkNeHfuCaMFoLyE
	HiEzyWLwbXAZKgIpH8kPsoWAOBIj/atTbbbQeREqAueuT39UW0NgXwNDcSOQw2Zi7k23xUDNrpT
	8BUIDAxyCr/bfIGGQQp9EWDlOec8sB9hIxUbapGhGNh/quZKPNJDdXwSwt5B7dKf/Lll0vOcq9z
	Pz5t7R2f4NtkDCJ9wz2v2+FN+
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr461743785a.11.1744384191878;
        Fri, 11 Apr 2025 08:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuuSqQiZ2wA9yFVtwoe+Beqyb/amFT8pvES/rx5a6aUv6g++Zs3c65GUZuFUfPy2KUBMvWBQ==
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr461740185a.11.1744384191556;
        Fri, 11 Apr 2025 08:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d668sm8500671fa.1.2025.04.11.08.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:09:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 18:09:40 +0300
Subject: [PATCH] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALMw+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3cTSCt3i1JzU5BLd7NxiXQMLMzNDiyRLoxSzVCWgpoKi1LTMCrC
 B0bG1tQB4NeKtYAAAAA==
X-Change-ID: 20250411-aux-select-kms-086618b92d6e
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MxiJCcho0/Rr64MZ6DIED2AkTMAEhF6oxTq+w6kONKw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+TC+zljhucnUZhCHWmFzeF5ZLcZz7p4wojJlz
 Bg3R6x+rdeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/kwvgAKCRCLPIo+Aiko
 1aORCACE4R7SDi7c+RvBx+ZjEja8TKtuorDMUrvQn3n2VB6F7rbnyBAnAvLhIS0OhtvqMgqAGQs
 j/6DQcFhc8HakhtAfV81iID0yC7blr+ugU4OgnoqtdEYgK9qpoO8UP9RTKAZxBXp81/q+Y5JsLq
 xpNfLnB9/UUPpwf9Qo5D2x1PorNwsxyj8Bdz8a5ervdbhWxbIzJMzYE0bnADdXtOaKqnUXJtOwr
 xFbBWDdPTD6DNgUFpH2oXlR5Q8Zao2O0c66ruIEso0Fnb8tiXbUVmR6nJ6enWXXay0UtAVYd6uu
 Npx57xEz5cFQZ/qTxnt14n+EbJUWukUc3diS/YWXjNZ6HP+b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nDBmrbReQ8PHnE6D9QCrWYHRI48iCGR2
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f930c1 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=rdcceDu8vI1PwB8RAZkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nDBmrbReQ8PHnE6D9QCrWYHRI48iCGR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=837 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110095

The aux bridge uses devm_drm_of_get_bridge() from the panel bridge (and
correctly selects DRM_PANEL_BRIDGE). However panel bridge is not a
separate module, it is compiled into the drm_kms_helper.o. Select
DRM_KMS_HELPER too to express this dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 09a1be234f7173bdf88e385507bbe5e5c6d583a6..b9e0ca85226a603a24f90c6879d1499f824060cb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -16,6 +16,7 @@ config DRM_AUX_BRIDGE
 	tristate
 	depends on DRM_BRIDGE && OF
 	select AUXILIARY_BUS
+	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
 	  Simple transparent bridge that is used by several non-DRM drivers to

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250411-aux-select-kms-086618b92d6e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

