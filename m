Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC5170826
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447193; cv=none; b=Cl5Gds5Fk6OJYL3XyXuLtsMTqh4YTkX9oD96qSt8kACJQG1k40flDFPxYylIk4CmR18wpFpP8euSAKAuuoZoTfPWcOziqfsFAXYYPnQoUxgY5jXOVAyQW0viW9khMYG/PUr2aEBZTZJtyrBo+/1sknIEoglAjytxJ8TFRFb9KBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447193; c=relaxed/simple;
	bh=xsPFZuAoy5Xx+HAHSFTO3CpJ9ZWa79t8iv7KrGNnsVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxzNVZnIdb9/7uaUGhLLmtd/lY5Hhxd1n+EmJy5F8a4cI7ceu8z6azud0pkHR+oNf5Q9F0vZASPWnTtUYpEknTFKVFt275e6tV4cYho7qKhsa9U9whyl8Q31bJprTy8bIdxArVA8kTlN/ZWhg4MHjwxgJ0jrpKWdIO5b5N1HTiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzlF3ON8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzlF3ON8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H0imH1027487
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KyyWakxU/Z7DnyDzppFomci4qtOg/Wp/7gLP5SesAjI=; b=FzlF3ON8IURSYoRR
	5gPeKKOsUxVtsVNEHeaWuYJib4avDnhR2l3fQChF9Cpu0iF4jcVdDKtO0cM/LdTg
	BON8iVlwydjWFP+ULHEO/vY57t2NLRi0vgKBcGsGtPYV0ShvjWXFrt+oYmQ/+/55
	3ZCyJ4OWA891aECmw29d+fUT3ZOt5UgNFzTJUFotUdcW3cfMko0PSM1rDFwl6BlL
	9Q3jiHkt7eTAXGsVOKQ22IJs9wNbPH8WWUjjQeMmq7z/i20aGtfIRGHD2RChwDTt
	kpM+sL/aVCYBvVfvEEVQM0PM6dsy6tbKtiF+VJV6ntZq98yxKbGXQSdzc7214kY9
	IEvyjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pg5hr30r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6ef385d1bso30983566d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447188; x=1748051988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyyWakxU/Z7DnyDzppFomci4qtOg/Wp/7gLP5SesAjI=;
        b=LGqLAwtPuUWRcTswx08nNWIjG8py1C6hqeI5pKm1Aj2nmMhQoCkmoGPIF8NctO6+s7
         2Zj6yCVIpPBqepLKCeTpGdYGZr742jFGEMSEPpMzrHb/QLdF1KSX/+0R0v3Z3FRacmVU
         W0F0OZ4GyJSSLWLGkoyFkJ9rIdLys6EIplNR3FF8ontaFx6BIsTLViAaMHwSnoZkdkc/
         scn6FR6/wMkVPuvTRVx3TkfUG+ieWl+7hDYPD5nXW8JKriZPg+F7Lyhvi/Y33YbpUbqO
         O+3ZCS3pPZ3uRFon/dltEHAKh2ZdEANelAW9wBtawemnWqS4y88CF7wUpC7iY3rE7R6k
         EWBw==
X-Forwarded-Encrypted: i=1; AJvYcCU70zq0qA/wOl+2tb9qDK1jrtdWyaymp6YvYMtl4rwVKMgJ1TsFAz4T5Ta+XyiqZCNm4XxNM5gyg8+zlJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzztfv20d5P6wbPVdMh9Owl+JO7MXxIU5sh2/L/LVpwCDURI6qW
	/qIEQ1tkspBzlUjg0xS5c2Xm2c9e/DzoqnY59NcaMNB394rRn+yfJERUT6nuSoteStObSUFTEXd
	f2CBdNL+ZSsAKmF8XC9ODgn1rxsD07yXsWW6Vy6Fpi4pNrWRSP+oPjvydlYbHnRKpjjUWA1m7TS
	o=
X-Gm-Gg: ASbGncvusZRHGDYeKCVW0yJDwgaHQKNWRrPTFzQ7PbjQd5jgnI7C597l++QqLG7xFaT
	mfyDh620GDLKW2sKVnI+MhUXXaTfaUd7ZG5/gE348WImVJHeqBSowqjDCFVC9jzIqzqQqQKCoDR
	ZQ/cm9Xhfszn7mp1BiIWV4Ogyk5Sgausq29krFDwLx09KNgHl8s0O1wd3bwnQSBqZ/Xct+E3K9i
	IN5+xdQwRgHc3Yoq7zzJrTx8+oeu1jf11rUlvgl2rkm3QFS/Oo5R8IYuIUoFz1We0K67km+OOcv
	gm9SbCasXk5fMQttLXRhzOIsaQ+F9tG0kMRc9uptIFj5jVzg7yG/d0CxOpNrmZkguRR1rWTj1Rg
	cFu+rjK8/eNd6GF3cycqAw5lg
X-Received: by 2002:a05:6214:493:b0:6e8:eabf:fd44 with SMTP id 6a1803df08f44-6f8b08ce997mr93637676d6.27.1747447188356;
        Fri, 16 May 2025 18:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGti7Q9QQCKk/7l7rAp+Eam0O6WFZak94cTVGNCFbJLA0IfRgtRHLyKBrW0oWYy40vY4RQRZw==
X-Received: by 2002:a05:6214:493:b0:6e8:eabf:fd44 with SMTP id 6a1803df08f44-6f8b08ce997mr93637566d6.27.1747447188002;
        Fri, 16 May 2025 18:59:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:40 +0300
Subject: [PATCH v6 04/10] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-4-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xsPFZuAoy5Xx+HAHSFTO3CpJ9ZWa79t8iv7KrGNnsVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LzlRiBFzeGKtLvzI9YxXgxpllhINoupjHY
 G0qcJIH93CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1ZsdCACJtMwWiDYiD732KactqUyG3QUjLbp5nnLNbYMMCsbW3offpf3dDM0La1046N+G7iVXcka
 Bx8JBhEy3wMP+Q9QyQn1cNHEzH/Z+ErD2Xe6pKShIsKcu+49zsFGdKObUUGgRcO2HnxgtVUFEIe
 Qg4VMtxkhcO6QhnNb1xtGHa00UQonJjuHS3GegPFbQ4WR18eB0cUxAvY6NDW/vCj5XsvZhYL8Ac
 RjvPVUCAuGK3JjuQLAOnQ1J+w/yfq763HC+hElG2bG+2tdHciWjBLHjR/a1fVfEHujgtGIFmm5P
 3Eq2L6c6GzFTYjgQce4FTZ0AGpzD676EQkExyIsJfjds4Spt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AqgqdlG5nLpebRJep6vAIPan28XETzCL
X-Proofpoint-ORIG-GUID: AqgqdlG5nLpebRJep6vAIPan28XETzCL
X-Authority-Analysis: v=2.4 cv=fbaty1QF c=1 sm=1 tr=0 ts=6827ed96 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7OZCfA99JoLngDASymAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX0zYrRZwaUw7P
 AX1wWQYMwYoBFm/6KSdIvsHc1pBQGKx97nc/BtFbFgmqKKsi4qKbRFpAJuxWIZMI1sJaWdvit90
 7ZG66Sm/Z6OdU164sWjZ5kzBc1Nb6FJO5quxgx+VqyHOuXR2oub5CNLKMahnMKDCWnUBGcDo/VZ
 kNBL7xcqOmYFTBc8Ks2ExLRLIYq2C3z4WFRpKAx8ECcV3sajJKjSMLmP3/D+U6LeAqFQimOWYO6
 8viQ+NEvRHTAoZ7Syg2hSQP7ssxoGYmgMa0i/w5wmP08LyfvGk2WvuYygxEYZ3q3qPxwZAO+mJO
 UMqIBBuEeRqyaWTHqRPeVhYSCbOVzIM5j661bUTeSvPdAAHX4gyH/uDzJ8xTkCEegKNW0ABAwU6
 OvI4Ef9Bs4rTXlPklSE9VhFqCeMzxTifKsW/NDUuWjLagUOvR2vJI0Xh/FK7ms48LBx2Dyh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017

THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
toggles whether DP_AUX_CEC support should be built into the
drm_display_helper (which can be eithera module or built-in into the
kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
selected to be built as a module. Move CEC_CORE selection to the latter
symbol in order to allow it to be built as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

