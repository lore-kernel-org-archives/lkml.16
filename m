Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F861F7911
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038674; cv=none; b=cwY3tNqfAjsLGQJ3jjS3tI1bV124tUZHbCRAvVuaNpYk7qrtJqDqzkuMWgmSWeYqOe/S0wKLRoDU1WWvsWipVnUcV/J5DSsPoTFYAe4CkNPDBfjxaoKAP79aImsWJ3qU/kaR8LXhVQIUMlQ0Rri4Efr1LfO8yDjvv3UqnOvykrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038674; c=relaxed/simple;
	bh=ONC/5Y479NWKSaB1acKzuC/TwEyDJ/U0yuK43qNfKZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kS+wt1gOrxzydM0BEQmPyt55zUQGMDalQTbjzr8VbutrFoGwpnnnBUwW6lq36zPyjQOs0/SSbhr7dLBHZeTE9vytpbXQxZ4LfhobHQD9/1h36dXbTrZfbRO9+kk79pUgUojz72PvKE4VuM5hu/IsIBFvF2hTi/yF5NjfilVsTNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtYKFlaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtYKFlaJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dnRB010472
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 15:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xflavmtVh4q8rGYItZ9o3me1DVh4JFCOvPJG7ZB1LlE=; b=JtYKFlaJCYl92nms
	E2iKJnx7+leySBG6WUwB3yN2lvYn/uKlXmRag3byOgYkST73BVxZHRCaVYffiwwW
	/6BLqdbcT68LHAv8mVF5DSJ8eTtjSuDQcYGEu0+UKrcHyHdYxXfylcH4L1W4rIte
	cinW5jlLYIjsv/kqgDMKZP1xK+jaC++1hdHWZ4mKCnpKui+s/08vfm5vaeNLkGFs
	tiyGb5EEkogEZrc+f10D/Is/V6yS/2HqQiMSpAUzbHoKVlmE5TvTKKvjPmrgk6CM
	BpeAh12P1AQ0cQ4dS/6ADCSkjLGGUbTK5AB0zLcTpzucQWm2ggxIbW9pp3VjBrv4
	XgGN7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2mne3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 15:11:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so101826685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038670; x=1744643470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xflavmtVh4q8rGYItZ9o3me1DVh4JFCOvPJG7ZB1LlE=;
        b=GK1Q5dsuiMl8jxdtuI+aF2cJr/Y1pJ9B9NSA/WdFmSfoVpqz8D0itfnvY0I1LEXLYe
         FKQqP6zKFNecCPJVKbayvM+5uu4ao9PgTTXEWyLRY2/1WrqIGhj309qtQnJ8gb+X9J7E
         bmXuTZHxj8eNocKYltZUB4f2LwTVmcFULaUo31sGPXqgupdCd3qJAgcO4RvFvck4icXD
         cJ+AuXaSEsMbx4V5+YcKquKrz82FjWOrm6lMLx8YlqxUzTPK0a8qdmB/KuYYWRvS/1KK
         rfMjtq1b9IviItm9+AAqGTApj4srwuho1uxxn+asyDiJDbeDTRXRRt7vNEYg11z2l4Xs
         dYYw==
X-Forwarded-Encrypted: i=1; AJvYcCVz7g3De4/g7vYPQm1GXs+fFVGTO/TOGEWotKWqJZFjHptrNEETmwGMepP1ajyLzzVGvdTXwftnWEL79Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZp/Nf5ZHVlo4c65WxemV/sQFmLD6osM5PM2kX6IFXGzm7XSR
	Ylc8GThqTFscpKxQXDXfvHXUZKF/NTSUdgyWRdduCgHDTPfdYMAIHaMmywTC79BGNwCZ2sHG682
	X7DDGXHmFsNHFl/ElRyT81CGznpAPyAkBb6WJGUGHioXT4s8lSqMVsxW1Y7L50Yc=
X-Gm-Gg: ASbGnct9RZRCSL+s1iJvWKtCMMe6Q7yciJVtVJzOpkWqKyKNsmhP2VYGNfMA8huMlHM
	v67pW8MkhCsPp/+yZyU5nsKcejS9HJNgU6nidhSVYpwt1HreHrz6pZBAYAIcXYGgIkUjOphd86F
	WJlDio/mXqNDuQrCk2WIcamshjXYcHADgq/tWehHODgrkPTfIXispbTQNpD68ilm1t9iTVMuRgh
	rwC9SPPJj1oN66axKY9DfXyNCetHto3aCn43XqZaj5DiOQx4fgmat4XeFBQBxtEzEMBkt6iQrCm
	V+FS0U0uMjTutB6VSMEWA5NJ7RqNka4QUUwzt0cNJKiLbcAic9phzQ9kGJSVXHsDhiKqTZGbRUg
	PHL9cCuSoCGKpsFavi0A/duI/9Lwq
X-Received: by 2002:a05:620a:4489:b0:7c0:b350:820 with SMTP id af79cd13be357-7c76c96d72emr2137863485a.5.1744038670470;
        Mon, 07 Apr 2025 08:11:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWwUJ4yecmQ9EvwHXO3wW07fXUXE+gbgkrQ7ZnvxLVeLA7hqG9gL2UbfaTh9CyoYRsZpabsw==
X-Received: by 2002:a05:620a:4489:b0:7c0:b350:820 with SMTP id af79cd13be357-7c76c96d72emr2137858685a.5.1744038670068;
        Mon, 07 Apr 2025 08:11:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:11:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:02 +0300
Subject: [PATCH v5 05/11] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-5-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ONC/5Y479NWKSaB1acKzuC/TwEyDJ/U0yuK43qNfKZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sEXuFsQN2Yuy1KNOOXDo3ZnP4YKJIznS5Zz
 +/jhPH8bjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrBAAKCRCLPIo+Aiko
 1TMICACkvHMmUsBQjhiKIRjsBOO//olRxyT3ErBNt+XzQN0Yu7ADZ0AdqWGNt+AqpDwlWF3kRJZ
 raQOHgIEuC6QLVaa0ebAFvN+diJd3bP047ElJMnEFBm5sUyDhwT0FMQvee3qH6BqI3w6/MTD5Vh
 nd58wz4nrYtE4jmC3P48NsFtfoPVtVPi147YqCUGaMVjsPpIsY3NrA0Fthpt/jLy7fGFYVWkOud
 +EGwLhDzr2enw9ZYOmR4tL0XtHn+G3sh4/hCWe+Myi2GEQfM3RVotp0L4ajecRWA+dDCZmjtDQE
 /w5EzydMxHtwDSb7tsDS4sLGJMLO3JihZrgxu36uhI+jXC93
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6oO2pvygprBiojmBSn9virJ8R53Y-LF6
X-Proofpoint-GUID: 6oO2pvygprBiojmBSn9virJ8R53Y-LF6
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f3eb0f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7OZCfA99JoLngDASymAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106

THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
toggles whether DP_AUX_CEC support should be built into the
drm_display_helper (which can be eithera module or built-in into the
kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
selected to be built as a module. Move CEC_CORE selection to the latter
symbol in order to allow it to be built as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8d22b7627d41f7bc015decf24ae02a05bc00f055..3666e791d6d6eba58f095d7fb691de1fd0b95ed3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,6 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
 	help
 	  DRM helpers for display adapters.
 
@@ -23,7 +24,6 @@ config DRM_BRIDGE_CONNECTOR
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
-	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
 	  DisplayPort/USB-C to HDMI adapters.

-- 
2.39.5

