Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74C1CB9F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120474; cv=none; b=l06mzQD4h963t6BO2AOkmlKqZ4zgEJmttD5gKFKc7w6s3vFJCcBbedL6I5FNDhvT8Wt6DF6vNCQ5DwPxN47ws1omFJpmKkYgUGirxhcs8FpkyubMVGKAjPpkwof3TJtcm7tuGitupC7tzdOuRMNfguXyBoTlmreCMQNtW36l4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120474; c=relaxed/simple;
	bh=5Dnaa5nU2/lgYjZ1nimtJqu9UVySqokolcJlX/EhafY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7hO9na8jR7Zn39aa1TjMNluXP+Um49V1eCveNogO3VrwQ4rI0XG1C94/yMUwtNK7g2wN5TSL6LUo33tNRTZ/49M+KHCGF+/N48RehakC3heoSpbQE4F35j5ZBEiCYNapDxKyuZ0IjBIkhpLOmdNKYnfuvs6F6fy97FnHdxhjyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1xJhHsw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1xJhHsw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BEVuk014995
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 13:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jtVHB+LSL7jwpKNp08BEBgDkCQoesKM3+hWFxnCDVk=; b=e1xJhHswOE4j6l6Q
	eyVWG9RNqdvggvyxUfHyYMcWyYG8eouF53oi6RQuzOm1EgVeHdmOABFXbIHsZ+d2
	MaCUoas4gMnvz9VVcnLSXX7fb4FISR4LcwxyRpMJmnuww4CnDUDGYUgBplegeibY
	qLXnWRSat7pXNcGzfmX603UqDOyuTpaY9XvF8iGnp3fhLRrkQhLu7ugP1YqAFCaT
	eTwb+XHrNaoNlrPRHrz31UpuIcJ5k26dGtO+Rcp3Pbgshjg3mbvEpCGtD5bXJ2FP
	DK/TgFgWvILOD3MX/Vt0PMBIrPgTpteKorJ2zfA2btHNE2AF1rmNDTQGP5YWouGk
	ba6e8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbug06e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:54:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eb1e240eddso100973736d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120471; x=1744725271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jtVHB+LSL7jwpKNp08BEBgDkCQoesKM3+hWFxnCDVk=;
        b=PYzCtjk192RUhf3pkgLPTSS1ubmGexsvD648dJLLcJJPW6eEvf0SWsvIrFy9KRM0BN
         YMcRlwijMjyc88S3XwpHa3HifNUR4S1+YxWS3JbO5nm7SoxGrvuGpRTMhvt6aVTorKXb
         8biYA4Ayf74bpjMhDwwnrFCxdULG7ThpxG5VZ/AJz3naq7/eW9a9vLIHkUyhT/YrNzoZ
         1wZobEhspS2GMKWMj2JZh4ryyWxjTZIRGadA5jojKPv3iWpSQJ0xRWaoeINHN8Mxbd+2
         5E8Zswd3cRdN74joaY3DazCGGFootOg8PqywFzo7kb0GsomT5zX+PJY1Qt1+vAPv2RtG
         P/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUIpO2705+oI7C6MjHb8Wj2vIPWuauOxK5c5Af05Yxk+ZJqnkNk0GFvfegUfA396jLMG2ZkbFV8aiFhaPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZE5abdo52BmZnTyU76CmX5LjJS6Thx6DTF2Rd0uRSWzP6NnW
	lnOvb8zH4HLGCsEryzVH5LAGA8C+abGVld89pJ2gtyE4f4fhxoYObLvE0aVir4xQsTd9LnZfjI7
	/+TnGyiLljIKUE8fwnyUVwZcIwA12MEWmEJDH/u/rNbYIuvxAMSEPSXye9iVLYk8=
X-Gm-Gg: ASbGncsL6kKHa/SPrdSxy660RBbdP9PTJ06TI3kDBtNjLWHP28yjnTIWVR5otVbriEo
	lpO2f5uopP8Mqt9siedDQKGeOZt5/JbsDLxBTF6rW0RgdLqO/gFEaEpDoBf/QB18aiHew/iawDd
	kT9t5D6kErTKcBc23boD4g/r76XE5QH7EpQN2sVV5BN+p43CejBbS4fjWcjxWj1delpoFGxxRaS
	NyIsGQQwoDXhQn6Wy5fRF3jVWPUbWy6JI/9hgABxo2LzE64yQhhvP5Eeh9ciVvtjoH3+8w9Wbrs
	iYmeqQk8oDp2nDBo6zJ1pViKZidA4Kfh17WL3C+x0yYLlBJ3I/mr8vO6gdjAHnmjftMn9hj3rlR
	qq16vQ6FxKGVo1R9I5YI2nMu7VQaK
X-Received: by 2002:a05:6214:29e3:b0:6e8:f60c:5879 with SMTP id 6a1803df08f44-6f01e7e9b8emr227190186d6.42.1744120471090;
        Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/mVxtxCHKg/wXvM0W6651vvlIK97AkhY/TbhIAFbIce/NERJC8FY9A2ZvMtOD4hLPH5vZSw==
X-Received: by 2002:a05:6214:29e3:b0:6e8:f60c:5879 with SMTP id 6a1803df08f44-6f01e7e9b8emr227189916d6.42.1744120470706;
        Tue, 08 Apr 2025 06:54:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:54:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:54:26 +0300
Subject: [PATCH v2 2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of
 msm_hdmi_set_timings()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Dnaa5nU2/lgYjZ1nimtJqu9UVySqokolcJlX/EhafY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRdA37uRn+R1KQbc2w0UaLXYPYJwEzzwBtO
 i0APoP8S+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1fCCB/0aE/Zr52AB9WQRb7/JZUkDvI+VrlMax3gl6oDlXBZl57/YmrlWjBrLJthR0kJSWE99L+k
 vHkJeMBMZ2OchATf4n8Gay6fqxBkWsrP7f7Us7OdenLsDUQvddq9ZAFs3PCez7wM5fkH4xQRjev
 aQWF1H1XZrusgshbp7SkAQyxqkMF+dGp2zIUiF3G849mTz5JDrK1VGeoYxWm2Nfkb5DbAxmd3by
 Y5of9TTXw9nqi2UPzunlNUJRf9loWdk9UxUsYPCBVE6UQpd0UZ0VqTzQ7aZyfEiy9Edwb3CTVHo
 ttmLC/Rwal5LET9cwrI6t6vwn2Wuf/arQZaEydmnSAcNAqNd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: n82I2JhTOnrzG5WADEJndiBP_RPkIPJk
X-Proofpoint-ORIG-GUID: n82I2JhTOnrzG5WADEJndiBP_RPkIPJk
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f52a98 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7vAEta9WQHVFImzO9-QA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=784 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080098

There is a duplication between msm_hdmi_audio_update() calls in
msm_hdmi_set_timings() and msm_hdmi_bridge_atomic_pre_enable(). Merge
those two calls to be performed unconditionally at
msm_hdmi_bridge_atomic_pre_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..d1218f2a6e9fd70c0e4e30a620daa69e84e12e9f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -324,10 +324,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (connector->display_info.is_hdmi)
-			msm_hdmi_audio_update(hdmi);
 	}
 
+	if (connector->display_info.is_hdmi)
+		msm_hdmi_audio_update(hdmi);
+
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
@@ -411,9 +412,6 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
-
-	if (hdmi->connector->display_info.is_hdmi)
-		msm_hdmi_audio_update(hdmi);
 }
 
 static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,

-- 
2.39.5

