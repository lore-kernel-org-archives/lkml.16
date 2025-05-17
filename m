Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B881957FF
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447197; cv=none; b=WMwMWDW5JUuPy4IBZD+u637yCd+73nniUhJSAYhCQ/qt82jMO9BJaeDmRiQ4eiGcB3aRVX/XGj/lf8RaFY/lOB499jg0AqA5qkhVUno0OlbyFzy30FZLuGp2bY+fdfWSwpD7i6+vsPDm/byQIfeGDsqJ0rGiEjgssf5y9lpdUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447197; c=relaxed/simple;
	bh=rpC4/Fp1Jm1yKyuARzvQoHZlvtt/ApP11arkSl2v3Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smJ8qObMXy0gE6IQqU9P7Nh2fEk+8bM7XQ/LmsZ5v1l4KkHMQgiWYNkd6SzC+EW+ZW32eNds0k0lPXEQQf8cg4ZSKGIMtFh3LvQgnfQWGmLfbi6qtAhxXVYJJ8QMSsB8+NnGQ+93lqWidRdYDza24y0cJXFSPS5XsND5tH4AGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxfy041P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxfy041P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H1UirN007940
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=; b=bxfy041P5CpxGH9X
	Bv4LastnoPZGJTjFgJ+g3LyEp0mZApbuWOqfkIHrfsEYcxL9wtWbM8za5NxoNZg4
	tLYfxjz3MURGrHBcfKnpkrTLZF9ZobLD0oVyCN4mAr6xjabkVgH0FkdmwpjvNazl
	W6OlsVTtmmOJCeEh1e2BNce4g0Wd/NF2yNb57ISWj6XlZI3Ls94NIHeNMYRnY4gv
	vQl5UmNdfrrbzsmJSVcIzKTge16CfzGzImxPFAIhxOD6IVTdvWHtxY6KcJ/aQB5M
	eNdyDtGnbSwTqXPfPAw6QQGRldPa9HQJAOpiQLmfinVYQfog8QAXGegIkPa8i5ll
	vMjh5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq3j8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so779574185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447193; x=1748051993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=;
        b=mKU3l1KEFE6YM1zFOiIZ1bbE5EahlQZtYy/6PKU1nQUEyLUgNx9ls3HjIN2CZbNpkA
         qwLxp9DEGPB7oqzReBBDcE585GO0U+Lz9NzS6ZL65awJbsgrkLcVvypINandflXoEwYs
         HPwawmUyceVFlagS4YuN2+QQfL0sL8S15x8umB2jTLFGi8mSpRbJmXklQQNLvS8Ps4fa
         wLDhkcmwLX+B/02b+f0yIg6gR2qR6mGk8E/flPMEP9PpVExaXoSkQNVn29JVTxQQQGxt
         J6NMeKwoZsdzrNdakvOTjzKTN15Wropdd/eoUDj1FNdiCZFWK/WcIL3nhYaeRszbQ/Jf
         wQUg==
X-Forwarded-Encrypted: i=1; AJvYcCXe2XK/gXQ6IRfdTlZobWzGgvr+cA840qV0mBbJaMi6pXsQ59sMdPmYP9lAyi1310YOY/Bj1BwMT/EUYNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrVXo+Q+/GPXAc77v1p8dvofACG3iBS6WuyKMfo5kgelynKZB
	m2r06CNzIvBIvaCojyofKf/2VhhdsJGLJipsbL1ADzdcDeM3TRxDt1f0G5CrqQMxncGOv6kYNEx
	lVWS78E6NU+y5jOxZTCsb+kYg7X1y7TXQxfa92qczGJokjXcnee0QVdK439/BcS1KiLVcqcxy+r
	0=
X-Gm-Gg: ASbGnctmrQ47FOP5BJS0nh6WCrb1vNEUb4l4ao7pu1pVeT68mT0rDgZ1Qy4i98vDM/N
	YhnZq7m0GQ+YpLYUwntvrcvBVOvUAuwHwwt3jIUgpW7tyYY6Zw6hKodiyDnYZ39tGSc47DKlcfj
	wtvymCce8ADiCtYvpKU/ttimxIJvrCrEbgR5u7hcq+MJ4U+sEkHJc+aaGA7SiXoPxM7luRwJQZR
	Yj9F1Yf6uuZpfE5ym35FNXvCGX1SWBN12xoGWv00JjqLUMkR1EvuAteqb/MK55VJkLg4mI6Duys
	mLjR1MyH+sZiXHlPbhhN75v277cLLdq5utj/pKUwvUuRNa8rX/vpTElv25RTnuoy/gVMjhProPf
	4Usha6hub2dTPpaQ03djhtGm4
X-Received: by 2002:a05:620a:2989:b0:7c5:ad99:9e38 with SMTP id af79cd13be357-7cd47fb1ef8mr613004985a.43.1747447193275;
        Fri, 16 May 2025 18:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVRxbvmsaezHoPorAioz8tk37MPhQLozBhorB8+3KjD71P7UkiRrOmavX9pc6TUp2GZjXSrQ==
X-Received: by 2002:a05:620a:2989:b0:7c5:ad99:9e38 with SMTP id af79cd13be357-7cd47fb1ef8mr613001985a.43.1747447192929;
        Fri, 16 May 2025 18:59:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:42 +0300
Subject: [PATCH v6 06/10] drm/display: hdmi-state-helper: handle CEC
 physical address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-6-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LcN5UYS0GlUCtFMbbK+13kvgJBdUYbxpPt
 moiU+EvNBSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1eP9B/9yrrAqJmrcCxNQRqpNPsrz7qJpKM0CLmPCcvrDhUdEMgf1owKQ23/2bM2xOdQlTKWgCu0
 DGotpO5h9SLvA2Jvbcx5PxKZrEYR2owiXVu/DxmUbJdCFqF7fXpYpd8btVv0EEihZ8wJfn5vX/+
 OQFBEf/Sz5/u80ap/fS0XG4Zzr5CWqwd20zrVVlJaIvXqTZlmmn1gwZctElF2NsGZvA7Ht9zWF0
 G862X9APgAaCZO70M+uMK5lqF5BwvHQbLQkeWCSMWW7qU1l23H+bGBS5+sINWslB6FRBC7tYYM4
 Lgdm3e0tI3bBR4wis4j20M5LIv+oxtYggmhRCklX/Nwk8tag
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: e-zy8aA0pfNMUeIpRDVPDnCoHXE83Rzg
X-Proofpoint-ORIG-GUID: e-zy8aA0pfNMUeIpRDVPDnCoHXE83Rzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX42qByemhBc2s
 55pELNKYonY5ZXZmTaUs+D5b3oGQnAdBtHQEykujEkWdYLJ1NCpkbLV++8pXR6RDqKNpaT0bm8K
 cCDlBTd8l9mZMJnUK0BTTrfwJ7eNu20z4Vzv8YIZU/DAPVqCPwSgVXo+jt/RTQea6Z6kY/Ie/4a
 nHVsBXMdU0vbPVLf63ahlOx20ZxutuCJY4YFDRmMu8MGzw1IJZD0OTFFGI4uvQCjKurD/NZJwC5
 q4k3jVLCzgO+if1ONoZvtJS/UGV+pq0pMX+U/AK7ke5gbukyRjc/iNSH1fn0sYgH0pWPQvoiAwZ
 fIM3DMOXuE10GwcX8sQSty/pLqAANV2DOPExV9Vw+FHXK6JLqY90HIRRPHmoOfubyIxmecjPUz9
 MUpsinppqkd53xBsjfNhe+aEivCyD/9d5CuQ4TPBTgrdy0cy0HWh5UrVT/tH61wsQ+SqJupi
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6827ed9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xYQKfNBhK_rbaXl_Bc8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170017

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

