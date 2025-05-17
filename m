Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D72C13C82E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447188; cv=none; b=qKQK5u3yWKTjfEBc+mIivCiqCzb9Ixawm7+o/qIpocNZomPrPEzViRd149ITlM20rqgnSJ8OUA9305/JpSclHq1iJ9tExnDWgOa+L2+nD9bYO9qhAgpCL3A29CIRj551Ze+K1Y3fU0e8Y4if4+Xd5tLF6aNKMc3S9JMYM02qFZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447188; c=relaxed/simple;
	bh=oaS6Po7R+cg+gJ6q7cqgSpb16Fo8ijum1OmXH8rf4TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PS1z98KbmX7yXNs88Ls3dCc9gNKM1VXAcTRmQwRH8AGvIif7H0U06NEHnjNixxTimSoGVxKINk0TPnzIl15ufeGYWt01Zt5Ge1Mw8yF4ygVSMsDQMLILA6SVEDdD0H/FDaVA7Zwh4H/Tq/ugBqXqDUqqn1RcTz4j4P3fFfJ7+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/tXbJAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/tXbJAK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H1mJsH018755
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dg8MLoyMdO4bnciC488h9CAEdYdwBoAJfBSIFF1DXs=; b=l/tXbJAKmMwBGBae
	UZiTp/xxTak/vhq9m/TLxsvgo7LAuIddfdunQ7qtuTEXU0KzSPXTVtzLwDnRlRxd
	VJ0hddy6O35SathHmq8oaJAYsVSw3CXs2MB4SbPw8a6CbLbbtfMe5KFGjPEWc6yY
	tWLbm9vlKg0w4od0wFP43zfusnaaqK+knQDlCWY+vGZhRnykVTsCjVMP0UrP1uXU
	bdfnQ7mU5ijAmtQNkH4NcqVivhA9MrG+1YSdB1XvM3M4mWpI1ZfQAkjL6KxOr/OE
	P3ShUPDAa9HYhLOcla8vvdg2Kj3P6d43R5ujhVsS2DyfonMsmszo1tXkrS8f386u
	6OCusA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnugud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f89b75a8c6so53862966d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447183; x=1748051983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dg8MLoyMdO4bnciC488h9CAEdYdwBoAJfBSIFF1DXs=;
        b=Knm+uQBphTcuc13apWhY3rE0WHVE2L4IRbpcqvyOxCd/zCjPfrUOB9b1Ui8cqo5TRP
         WUzb252GPeHaTw405TDv6WoGxnffImq1YtSxvAXtd1B02m9wShKgvS3+aPFDkvZhWhAI
         J0FzhisC70Xyr5uTVuYHMNz9hfyiZDUPCFqR4qPZWXFH+ezlc36idHEIj5VFSKw2jCuj
         8ongEEnJnEM12toYinpBDGo4kPwT/WNBs9jdb2FhtlCkOA3hHZ/b/NQwQYbbGGZ27vV9
         MrM2kWT0o9QpeHLqNF0FxlZdhvQsHKGqJ+aaWqIt4Dv+jfAbl437pJAaXyxzQNRmOHHt
         qv0A==
X-Forwarded-Encrypted: i=1; AJvYcCVj5NwpEbahN7DxEa6wRFRFUGEt3VMYc8wjRq7yAjExp+BZmxv3+nSuc6LJmWA/A4mU6VM2oy085VfujLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Bu+25D2EPVlAq/y3UPDKScdFTk1CrlcyVN4KKPC0hfxHsz4F
	am0qm8eiYSliC0CXGNQuJ/UOF2Ev1DxnekKkOiofeY0IhJNNpYjolUjvCgdjPpilELqs8eU9OfQ
	jbFgTIjdTjQ7eW14dYuUKMP41uW/b0jNpAkBNpgSG5jChzasdlC7Cx8XkothK85G5xIp2RUEC/4
	Y=
X-Gm-Gg: ASbGncslhaoOTkM6X7xrzw2ZtFOVMPJf+uO3FcSNOgopwplPIMJQapXs5a1jrP4z5UG
	QBUADZRYiYAyMvIevFqZmScNtKZHPSsLKIsFUty6tpf2lLr9syIhSPszgdfcgS+CYh3shxDIlX0
	P1jxX34g/g12SwenIpg1wJVaqvaGD3hDLh48nClBpAdPNlK7mGv73NAX7Zg5v7DIY3nqV2MUYm3
	7agIqkucuQrXL8WXf3aq4dxB4ueGGvytANWMWihef5gnf1nBZPKG8VuWnFr1GUqSa9yRUwFFCzu
	km1/WuWt5sfzkTx7XoPOA9tF2xOiRzR967oSqR6i5T0TvppgrfkcRpD7NpJjx5HeC9iX/0uKPnf
	HBnQt6J+cm/orma8w0ZbfT4u8
X-Received: by 2002:a05:6214:1c09:b0:6e1:6c94:b5c5 with SMTP id 6a1803df08f44-6f8b080f75amr84862456d6.4.1747447183531;
        Fri, 16 May 2025 18:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQAgG5vba5Anxq4hWji3CXaFpanfuubON7sPnyca7B85R5YmyE4rhzwFfcM5Hv5DG7BZ1EHQ==
X-Received: by 2002:a05:6214:1c09:b0:6e1:6c94:b5c5 with SMTP id 6a1803df08f44-6f8b080f75amr84862286d6.4.1747447183223;
        Fri, 16 May 2025 18:59:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:37 +0300
Subject: [PATCH v6 01/10] drm/bridge: move private data to the end of the
 struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-1-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oaS6Po7R+cg+gJ6q7cqgSpb16Fo8ijum1OmXH8rf4TE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2KdDng4r3R+df/gbbZzgYEtUrjoAj55RAe6
 Tju1cwQ9eSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftigAKCRCLPIo+Aiko
 1b5jCACfbxzHh2FRczRcQ73bgtlKc0W6bfz2WeyoN0q6yDnFsoOBqU4OvOSACPa3Benc6vbrbDr
 X4YpvPcs/1qEJMFVAdLygr1kVjdET/0IkaLHLyJFCBZSi0yqi3qHNJeosCfqQ7B5KsOr8O/B4mc
 AwRnCBPBaz3E8Zwc0lkIB7VNFG5O9atLHlIPt9nyBMe2yjEKNbTJuMwnTHEmscXNzyEYmOJwc9p
 Z4fp3Sk4J7U2u3axp9Q3ehcz1F4UniVBm3Upbu+oxc3ik5Ni7lsNolPRidrI4NeaKaePLWIKOqU
 eiAOvS9xsypZIGp/eGEZiahVK03ZvzU/5HYCRLXjBzY4oSD1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NW0uoyvSvP8JK7dqjazUkszsBmt3MU6T
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6827ed90 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Am12PNO99IVxJwGJ:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=V95sz_wBBgzcx4ufKaUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NW0uoyvSvP8JK7dqjazUkszsBmt3MU6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX0AdVw52f6kn0
 a58IiiCfndBad7e0V07tYRZ8lzSKhLepT5/y4sK25VEn36PK88Y2eqaKBEyADMrAopq2e27XfX4
 Q1GHtFaeqxdsH/LY1JHoCpE8KBRy7qyHEusfyHuxXfC3IJA1dVhTe7ksrPPSgsdvScVe1OU0Bom
 lXik0evVYVXHPKKB7TdbmTZ5tezjQ5v3GVOnwX1Ry1pvoK0EdZ8vFmIV+ouKCfRhioOnhcPacaN
 L0V4lKeinnOUkP9tp0p27pd79RRmUy+Ir0QkEki2tFOESaSEJY2hzfKbRPBdjzNKT3uxBqx4JJO
 fQBPIc5uOlhkn7bFqQ0JEH6ZOLInTRdugeXRt6Cex+bx+uXYasYBpe8bVhlMXNrkaD/w4CQK1dF
 BqrvTZtPzRKqyMYmUign8n9n6kSlMA1CDasySaQH9HWAba52XezazDRsETzRag8hMtYiKTE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017

WHen adding HDMI fields I didn't notice the private: declaration for HPD
fields. Move private fields to the end of the struct drm_bride to have
clear distinction between private and public fields.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..286f6fb3fe2b80f237db85dc8459430dc82337e2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -977,21 +977,6 @@ struct drm_bridge {
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-	/** private: */
-	/**
-	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
-	 */
-	struct mutex hpd_mutex;
-	/**
-	 * @hpd_cb: Hot plug detection callback, registered with
-	 * drm_bridge_hpd_enable().
-	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
-	/**
-	 * @hpd_data: Private data passed to the Hot plug detection callback
-	 * @hpd_cb.
-	 */
-	void *hpd_data;
 
 	/**
 	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
@@ -1043,6 +1028,22 @@ struct drm_bridge {
 	 * not used.
 	 */
 	int hdmi_audio_dai_port;
+
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

