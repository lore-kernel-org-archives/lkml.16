Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9FD1494DB
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447190; cv=none; b=u+cVDFaT00lK9LCs2OPQ/feyfN00ZACnW9xkyzdoNsE6ZGUV0z5v3GnjHcTL/UUvXvyspIIPd5bqRY0Pe7IuZUKKzyv5ecrI9jj8k0nkAPcf8+hNUQVVlMXUfbpHMyZ7u0WGmReayEbV1MSfLNPEzcynBGIy6BgHPR7raecICFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447190; c=relaxed/simple;
	bh=ajaCqNSgbIA1IDZCd+vEJPLBT31lOSpLJmY8tw8WOjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cU8RDqWfzQzIbk1U6gqLczCVNW8OnC9qV+BahKx1Zz4GXHxs/CC+nPicef0A7RtudCXWCwAbyMlG9Eei+PZ4doOWkE4tMcWG6uqAlUW45pjEAI9zMjaYFSPEu350keZq3+TLLl4D2d0m7BXMxDpQa7y5KPpIMIdLvI3UFni4uXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsxSOMse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsxSOMse"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H1m2S9018727
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOtrynwNsxLQ/5vzpGhNJsN3NBvcPSFOhu9989Fyvnw=; b=fsxSOMseQL+R7TGC
	2yOlAY+bUVEHWcqotupdShY21/o70zqBj9qOAAQELoPyMOD5IaFjBU8v3ZdAO76+
	bnQH2tZ6qdK8PyH3zpZWLyUg0LLZMbUKSJQ+ayH+O4qzWSgQyTdiuE8fLT5xGXuL
	MZb1aKJ+imZpbZRVT6AIPA0nNVLt+P7KjciElbEzI0809su0RTnb0aN9HGdPn2Z2
	SkviealcrSSj2slUVB1At2nW1Cm9qA8MXnHD6NpCrUmzrucmsKtNvphqPkobHL7H
	T7XFm19ub1NyALaB6H/9Le22sz9D95ZSMVvkuPOW0tcF/sknNS/Osmp6zwtLjkJv
	60FTmQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuguj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so9296016d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447186; x=1748051986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOtrynwNsxLQ/5vzpGhNJsN3NBvcPSFOhu9989Fyvnw=;
        b=w/njUdCOJx22mloOafRdLn6t7wz2DBlhP06VuTCuQ+SdmY182ujsKwuymmrdstSSsq
         BmKTFCEaCqZEoOo8vmA4ODygK+LG8pWQ3WQwmyh//weaWzfqqP4JpMbaFaal5WEO7xci
         249QaHD8xm4z8i66ZO+v6j6dS8jnfiTpW9deb91komLcIs7EhUqlMrfGGfs5In4mcCia
         qJLynM+M3F5GVuFGsGyqnFNwmSI2AcWeefAPn2dW5NPUHNKGPr9FhbHmZpLw8625lyKT
         10vPbqeGXoEmxKHkF7Ns9qOYP8JEifZE8HMjME+By/QF5/6SztWs0txz3v7af+Pvtdy2
         CGSg==
X-Forwarded-Encrypted: i=1; AJvYcCVHktSsmgpMJOMe6+wfAcn5Clh2SjuBdFdp5AYAhG5vNkPNWvCUL9QP4aDcJi3Oux58KyCp84K6QLPlOnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ex/l6HCq/qkC4YR6AwgwEsI/r1298AYK3LakchUotfA7LUgg
	ftC2fd13stwUgq3WLRt7MPEci/9IS63ufavDiB2RWEk3KWyQPtt79kZyu+QbCs8Pqlh9HVPlTRP
	vQbjkPih7IXPazO9hVhYLvTa9MZ4nTqiBJ+rGARrXHD/6Mcm0uACoDesINdSyqp2VYm+ZC8ZtIe
	o=
X-Gm-Gg: ASbGncsA3bWUCN8XcyO4L9UL/culZZZi3XvG6Gzh1HKaK4/yVIEfmMhorB3qDpMBzHT
	Zi6R7q6XYRgu6Gvn7HBK/CLo4i3T5CN2QjsB6GvEY8u6OdRzHGl0v6Sf/bMA96KZ6lJdlflEnFM
	seh/u3QDq3VLpz87t0pnBYE5dwVxLfm33yB6pSrdBwFD7wHmRU/W/FZFFxYOupnpyV7naKS27cC
	Ni5bsl87BbkmpyTz9fTg2MgAOvG/EjPIsvSzqqCK7kPV1oqNhciZKYbfcM1C1ZxbHQutU4pBEfi
	pEC3QLW50syhQfnwpD/VksA+3XqU++3SCLTxUPqXUakPoVyLZucTqvaS+HWYCOPNfkDE07bDW1q
	WdpdFAXCUfxh/Vo+MJUukkUrm
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id 6a1803df08f44-6f8b2d27bf1mr79878866d6.20.1747447186633;
        Fri, 16 May 2025 18:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4xL9Easp4CTrvgavbYymdPdT+TCn8QDprrv+JKEbRlucHxgq6Y2vCLa0EOoapFr31HSsmAg==
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id 6a1803df08f44-6f8b2d27bf1mr79878606d6.20.1747447186248;
        Fri, 16 May 2025 18:59:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:39 +0300
Subject: [PATCH v6 03/10] drm/connector: add CEC-related fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-3-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4994;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ajaCqNSgbIA1IDZCd+vEJPLBT31lOSpLJmY8tw8WOjs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LjBQ9BlT78Q2KEMSM1T202uQB2O9I2lxqf
 FthWNAgFlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1aKKCACvak+7ezHPoV1R3z1HvU5a3my63VsT+ZeMakTHpFb/6Y8jqUrjDYefqAC+IH3oGpaeCyg
 ghc7OkyegC5JX47w5m6eb7a6teYdhAay76FKiddP93j4/eRANctu+GHrZvjpGt52yrUJvfEgktC
 lLprCBcl0fNOydTURXjgpMpCKfhhQROK/AgHJXFSTAZQIUI9RFLrAg33AY3/+K6T1dtIQeX/hdL
 702kDOBWOtqhbyFko4FfCamuaYOkWsJwp8dpihrDye/43/ZsCw9JmN/mOj8kjtwvcTLTJw2J1rg
 WXACVN7W4cujaU5xQvX0JoqyDlYu1L3s0F5/zp7eWL4IphUn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Kq2eAQQlusy_RHQSgKs9R3TFMYV-vBDc
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6827ed93 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gz6TB5zNMfFrGp8g0GgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Kq2eAQQlusy_RHQSgKs9R3TFMYV-vBDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfXz08AdsDbh1iZ
 1O9jHSKLU5zHJvlGyyUSjf35WF3ga9Nfp+KYHNgVWSHvWi5/tELS8Gkhwzs7+f08Sa1dObCziJ2
 oxaUTEO3QxXkcXgQ1hRcHtVn2ZOOk6/3VKA9Cp2BUgyjR0k6ayoX+3AbzhQggc5FyiBy2TVsBYC
 h35TA+BUDLJ6uKxAfgYYIcQNpQVfGyYrSdrfH9n1u3Mo4bgB4hg5oQ8thQfNuyaCld5OrKs2zS5
 QNAiOhw88fdYR0CTPNJyyxXotUQKL/kEAm4ZpHi27BM5cf9e6u11XjHVp4JMQwI68vXltYE7Dm+
 qjR6Md8O3EVsUAkn56XzoUda9fdtp/WZW/gkfdqEA72/PtEbP+pbVOCbsnCTj0WYgojSI64J2fS
 gsJWGfG2oyBMKS6gZ8qhxDY7J85t+zmb4d2k9y2fjqwLRRTghm3TI9EaaC271t8kX47Ifjak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017

As a preparation to adding HDMI CEC helper code, add CEC-related fields
to the struct drm_connector. The callbacks abstract CEC infrastructure
in order to support CEC adapters and CEC notifiers in a universal way.

CEC data is a void pointer as it allows us to make CEC data
helper-specific. For example, currently it will be either cec_notifier
or cec_adapter + drm_connector_hdmi_cec_funcs. Later cec-pin might store
platform callbacks here. DP CEC might need to store AUX pointer, etc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 42 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 48 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48b08c9611a7bc70e4d849ff33ecf1c9de3cf0ae..ba08fbd973829e49ea977251c4f0fb6d96ade631 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->cec.mutex);
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
@@ -701,6 +702,47 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+/**
+ * drm_connector_cec_phys_addr_invalidate - invalidate CEC physical address
+ * @connector: connector undergoing CEC operation
+ *
+ * Invalidated CEC physical address set for this DRM connector.
+ */
+void drm_connector_cec_phys_addr_invalidate(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs &&
+	    connector->cec.funcs->phys_addr_invalidate)
+		connector->cec.funcs->phys_addr_invalidate(connector);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_cec_phys_addr_invalidate);
+
+
+/**
+ * drm_connector_cec_phys_addr_set - propagate CEC physical address
+ * @connector: connector undergoing CEC operation
+ *
+ * Propagate CEC physical address from the display_info to this DRM connector.
+ */
+void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
+{
+	u16 addr;
+
+	mutex_lock(&connector->cec.mutex);
+
+	addr = connector->display_info.source_physical_address;
+
+	if (connector->cec.funcs &&
+	    connector->cec.funcs->phys_addr_set)
+		connector->cec.funcs->phys_addr_set(connector, addr);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30dc1b14c630ee00145256052ba56..73903c3c842f3803e26c34abe7b5f0416f013d4e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1191,6 +1191,29 @@ struct drm_connector_hdmi_audio_funcs {
 			   bool enable, int direction);
 };
 
+void drm_connector_cec_phys_addr_invalidate(struct drm_connector *connector);
+void drm_connector_cec_phys_addr_set(struct drm_connector *connector);
+
+/**
+ * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_cec_funcs {
+	/**
+	 * @phys_addr_invalidate: mark CEC physical address as invalid
+	 *
+	 * The callback to mark CEC physical address as invalid, abstracting
+	 * the operation.
+	 */
+	void (*phys_addr_invalidate)(struct drm_connector *connector);
+
+	/**
+	 * @phys_addr_set: set CEC physical address
+	 *
+	 * The callback to set CEC physical address, abstracting the operation.
+	 */
+	void (*phys_addr_set)(struct drm_connector *connector, u16 addr);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1832,6 +1855,26 @@ struct drm_connector_hdmi {
 	} infoframes;
 };
 
+/**
+ * struct drm_connector_cec - DRM Connector CEC-related structure
+ */
+struct drm_connector_cec {
+	/**
+	 * @mutex: protects all fields in this structure.
+	 */
+	struct mutex mutex;
+
+	/**
+	 * @funcs: CEC Control Functions
+	 */
+	const struct drm_connector_cec_funcs *funcs;
+
+	/**
+	 * @data: CEC implementation-specific data
+	 */
+	void *data;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2253,6 +2296,11 @@ struct drm_connector {
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.
 	 */
 	struct drm_connector_hdmi_audio hdmi_audio;
+
+	/**
+	 * @cec: CEC-related data.
+	 */
+	struct drm_connector_cec cec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
2.39.5

