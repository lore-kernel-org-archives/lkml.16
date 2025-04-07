Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FADE1FBCA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038678; cv=none; b=l6nX70zJ7o9H+qHOG+7gD6w8lC8zpO3Mud9UqflvkkPHubFtvoQZgXpnXqR2Tydzgk+1UF46IvV0AFWhDLE2do7I32q8gzTR0Fx7V1KJ4Q5myxp1Pl22EDHGUz1II8Cq5WlSxZi4nY6lY/xeN6Ece6yZSCJIr6LXNRZKdnh8hCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038678; c=relaxed/simple;
	bh=rpC4/Fp1Jm1yKyuARzvQoHZlvtt/ApP11arkSl2v3Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3EfK+ZW4UCamqS7o3CzbbSClNu/mM4BsXiFvbuwUfnoCqLWN9xugEk79tHuB7KpppW6DNtQRmRml7CKw7XYhMEp8eTjmKjyh6xQbSnLCkG+DG/5gMs+ptHhYrBTwDSIL7ergNw5yhSvldxDHJSHUDT5fPIfxRmyXiHE8LX3lQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/6QJy9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/6QJy9q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doBT017420
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 15:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=; b=m/6QJy9qiIX94tCy
	chZPqrUcLTSgIPyP9rj4v20xQKxxAFcP/8wfVjqhAJzXzusJIxHOeAXEvj8S4gQP
	G3y1dO/FigF3JkxJ+/YeOeP6izkD7L4KCcAnFcKkAwaTTxMKPBBwJnv7pjtH51xu
	RUps2wY1ut/UbHvugVl+nCQ0nZHM6LwqV2S0KxNtDT7dHqHNcnFoVjc6m3oBp63P
	B2JNtVS6QUHOaSjzYXzFDLgeoyiC8tUrcO9K1+ivgPQbOFCMfH51h2nB1wcCtz6C
	8FFXndyau1Q+2GRCVibM4i1YsDiej4SGkXvlmeUsP2LxLSa6LC9IIMZcfIVGos+u
	q7IvnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3ckn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 15:11:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c579d37eeeso720777285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038675; x=1744643475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=;
        b=qz9bJaQbP5YJaPZ3trzYasNFdcncnpW0RG5rlHAuw8GMWmMIHworEcAHRqdl1yzOAk
         3Aq7756qXzXZf/+ITluM/C8QzmQ+Rve1/dS1GohTMAx5Elgl9pYNtmPMel0fB3bM0+yk
         RYwWRj894zl/DakpTitvy4VtZYRoXkRmpA/3wGgtRR3wO5Dd+biIRXA1UfmnB0/gKzd1
         K0083l7As9DXc8HB6WCCdbhR65QHVyycKYGsw4hgWLUb7KrRIgwjEtXp9yCZdMrrBK1D
         3ABIEdiy90HO56dQiGuupMLOUdvxO9Hj8wWzIPO4c1QCv52jHLJ2uKqDBdklJBPYRTvF
         ACnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlTG9rmd19PsZwZzo/1FKSBke53Ldwpjm1PiEoo8IknjxxY3Zl1P3auto+DXT1vqlC9/QT4QPT85lIpMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdnYxoKgYfDSIvRKiiFQF9c51ROu/ISntkOH+JGO3z1uS5MK0z
	4KCjE7ba9tJ7bD8qTNAL86DGiUOa6j3luJLsC0+8H03hxZpaGa781XCvv2K37GiKzDYfD+lI0FC
	B9BKTqNIyQBMnvzUHtKP2eM/mX/oDxB+jc0VpAshaeuonrb4P57UjP7JcaXh5U7M=
X-Gm-Gg: ASbGncvcX6lgsg7+desPafZPJY+/TjkKmsrDyU8zxb3l6kJerBTNMMpMRY6Ga8qKqCy
	cU2SPAah0mOXOCYgwERtvmBC3blS1QhUufyd5bu6tDy8QxWjyjaql4S3/B5WCMTRaLzYvOQTbhx
	gmxfGanvDUQFZjk8EUpr3v9/3ni3lr1JYvpfr1s7DuxivzInBmyCwlerofvfLwLSmHe7cf8bRiN
	TB6/O6gP+1erZqncYXTlTYaP7fxFJaAoSjAVD1DFBA7ivnRLrw7e3KtbP4QC/HA4Q6iZI5TqL1/
	/stYEY+GCdtfEk/44f0Kp/6g0ZiI8WcmXtzxOmMovyUcAXIj67L6c9ts4tMo23QuT/TiSWIp3LT
	FfSC/9TRLUbnc1lO5sI8iZ2D3SNIl
X-Received: by 2002:a05:620a:46a1:b0:7c5:55be:7bf8 with SMTP id af79cd13be357-7c774dd6ae6mr1889859085a.38.1744038675358;
        Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7VhmZeiPqWQSFERVB9I6M4nMOVsDerXUI75MhUVSnlkhzTCnVuqwhozj7Eenae1YuM6/Pgw==
X-Received: by 2002:a05:620a:46a1:b0:7c5:55be:7bf8 with SMTP id af79cd13be357-7c774dd6ae6mr1889854785a.38.1744038675026;
        Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:11:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:04 +0300
Subject: [PATCH v5 07/11] drm/display: hdmi-state-helper: handle CEC
 physical address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-7-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rpC4/Fp1Jm1yKyuARzvQoHZlvtt/ApP11arkSl2v3Xg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sExhDhW6OQi6i/U6Ig8nmUGUTQb0EUoQJDh
 Znh+wSYs2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrBAAKCRCLPIo+Aiko
 1ZHkB/9qYGTNRAzZMq+scTKGh9veyvBnT8RzcuRdK3pnwONnhtgz68KF2uGcxdLTtixRjs/5eXn
 BR9LgdgdQqm+bxHAvbZ4RKuWF6BvyY2juw4hHXv8pMjbwMBLHUxp3NYXA4+sUwZxkh30KyzMcOr
 /AfKBESf4zMF5vu8rzQXXRDmOTt18cg3jjZisl/Wv0KV9C+gs3lJDjvE8q1C/+aolT8JBljpMlc
 v6DmPmNLljFvHLjdfJbj7KJddoQ8j/Ky3daADjrMea5LAJdzMn+/DuOrACp2qdAmZQIREQ/q/qe
 LBEw5q21x/fISaBYyLvKUpCsc54CxcAdWhO1hA4hVzjB+XA6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KJ4VoK2xqW3TIaccqwHKZr8kI0wLAav9
X-Proofpoint-ORIG-GUID: KJ4VoK2xqW3TIaccqwHKZr8kI0wLAav9
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3eb14 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xYQKfNBhK_rbaXl_Bc8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106

Call HDMI CEC helpers in order to update physical address of the
adapter.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d9d9948b29e9d5ef9bc9cc9108b3ace4aca2e3ae..bae7aa624f7db61cc7d5ff7a86a413938963543f 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -1081,9 +1082,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
 		drm_edid_connector_update(connector, NULL);
+		drm_connector_cec_phys_addr_invalidate(connector);
 		return;
 	}
 
@@ -1097,8 +1099,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		// TODO: also handle scramber, HDMI sink is now connected.
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
+		drm_connector_cec_phys_addr_set(connector);
 	}
 }
 

-- 
2.39.5

