Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF024395C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574729; cv=none; b=WBe36NmGg0lT5GjgrlRCXMFvlGDZi9fCs0QrO/i3BxXc69g5bVqUrhzGZKG2jy5y5VLQW4EbS4cB12KGhKdqHVNmmRUAKo0SbhbkXk7z3QuAjCdUucio14n7rPQHLNf3GUzCHJVVcJNRJmvVVcADEy5lSOulgAspJOSu/CGOHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574729; c=relaxed/simple;
	bh=VPdSvEDPiP5nJqqimsvsHJ3lJjjDFvVrzXMRBy049zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5/GGqst3CbQjgW81FVKDruX7ZV0nPINj5ssVnasQt07NvuIaM8W6JBI7o7W9v7g7ZfCflNFXqHp40bvxPGoRbcEMyBTZDftDmtYOhU1KlmqekBZJCupYjuIluhfhoX+KKVW7OYIylbrpHFDnpsrmZuZFSD/gpieC5MXno11mg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/vqPwgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/vqPwgp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T9OZ025088
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViRsjns1v8Jro2gFleFt5r8weaEEOv6Mpy9ydokco3c=; b=i/vqPwgpSUlhVzrp
	bL0NIDzAcykLSIAA0KhJpA7nIZlBF1U0mj864gs+xAomimCbDsyBYG4038Vv7WfL
	YK5sg5hW5qd2HxIluNNtHS3fAhch8SyMmssCszQNVyZY/iqP/lwEuoWwaOfXW7TG
	8WFtVYGilE9ACORLbiQRFtsQaFCwPdecB5W/KJzquQT0BahzZeA7wFlfZusYdgac
	LKOzxz1CcdFM+Iw8135ASNxEDD9LmHaD5HZwrYisBd8qOzf/mUq8JvtJik37+se2
	elLs2wqVOo7Y2HgzW8nWIMHdcVWAao7YErPYBBod/6DZNzEkKTeaYYMS1dj7RH3E
	BldwpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3rg2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9255d5e8cso360974685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574726; x=1746179526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViRsjns1v8Jro2gFleFt5r8weaEEOv6Mpy9ydokco3c=;
        b=fIeriQRC5RXiIXNbFxix2VcKXaTXxlyyvCjjfDYWk+niFf/0oQFtBWsjnDBazld3m/
         ZMCE0sVvqN0I2g2k5MUCJi7lp4Lf8anj51cvsHzFzY03ZQV/3GxJRUaj1MYDaQuF9nZN
         Hvj/r+9hoZbN1eUlUU+JeguE+Zu1IcUTsQIk4b7pwj1MwtLOo3Yp20k8fKdsDZd1elgj
         LjXlpWnY101PKGD6m8hauNj/PvT01RrptJbyM7qj+5oOY7YI93b8kmuV12uaBKA8U0MR
         bvoNO6GQdpQeQoyEiO4b3iIu2ZaGc74X52eH+bfzm6A6GKRxA0VD6HxzTYsJZsUKmy8a
         U/nw==
X-Forwarded-Encrypted: i=1; AJvYcCUAO3sChwzztuZGtX3rjVgng95L9/ml+1Od3fey9hFgYovovCszxON6ZadW0b3pWNHixk/4/iG21zVyZ2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/Cjp6rTI2Vc74CtYEuiHmrBE4u9928HMI9Aib6cvMqgfph5x
	RhTwLs5YWyNoK9lmTpRiDXReAqfZSXDvW0wRpaC+h+k4MZEJTfP9821geXXvneE2OMyfnH2luUr
	J77MD8jBk28cYrmLar0kCO60LQmk485WGVZH1EXC5GJ0jVNq1+xSUl+GjXQKPlH0=
X-Gm-Gg: ASbGnctiWgH1s+FD33JeJvspqYo59s6HX/ThLwwnv8RyxpquWd4J60Y746Y2wB+3FRi
	7y+KlE6ybbxJ+TzodxVC8VPlfAhGJHVt5o6U6BT5tKAz+CRT/Cwpg4EtvFCNykiCj1j3bzX6xK1
	03hZUB0w+R7KtdS/g7d8N6hTM9g1meL5rcXV2Ctg9/x52jLHTLbR1kkQTwaQZTPYsdKBII2kiX7
	nAH2qxcDhsJm00rHoZ3eqBhvcm0jO5H7wJfXyZ3KC2kHol6ZwujYHtwUVPcTZyDt8PcEwdx4qWI
	jlOnvoPpra8c+9blnAiPeaRBZbdnDPBtzXWmacMw6OtD0NNlTnR9Ev64733sXZNZT5TAeEu5RaE
	Z9b3eQHEYW+ft4UdcdcCpvNwu
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id af79cd13be357-7c9607b24e8mr256006585a.56.1745574725878;
        Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECepdx3M8voxwdgIotc4jExjaEsT/aNU+/NJvxWGcXVKGq8zZgS2csyHQXp7J1OZcAB7cxMg==
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id af79cd13be357-7c9607b24e8mr256004185a.56.1745574725551;
        Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:55 +0300
Subject: [PATCH v4 5/7] drm/msm/mdp4: move move_valid callback to
 lcdc_encoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-5-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4386;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6zDfbr+Ff50cCHiOONUZ29i4X43jN3/ObgolYfFGR7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5Y0P8ukyZ1hYkilVgrYffYkcTvLpslNl2w
 sJplHwF+wWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1TaXB/0VGI/G1ISEDOkZaFT9pqBVkHDfekywPNWp5O2H7Z4FvVhu+yHLnRliZHkqzPgLLvuHOnW
 51ZW3cJpWWXK1v688XqY6G7cLyH08XzUAy/8fiEeknzCOzhyeoie+VkN2QQ72nr8vVJjUCgy2Qy
 E5HgCku6uLjfA2r7J6gc0tV5Q6PIGTIRO++sSF7yYagJtC6o/mKWAS5ajyk9MPSEQhm4GKhH89K
 R9Z253sD2HKp/IA5NZkE2gciW5iiTMnqMhB9b+nJzwJfCEvz9mh1u4z/lqsxwB89WbEKKZXI7L/
 HmrAJYr82dKvzyuSCNuqq7tl28rWs2v6wJkffxGi+CxV2Uce
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jAkUQtm0oq0s5viPu0SEh9eC1wQKCgVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX61TpvpwPgGxL JM4n1TaKSx/wKzFb2EbS+qJrwlxVM5sPZDkjcVLmt2bTDqKC7HoAA0BC3wVNpd/FLovjErU5+R5 yp0Q5I3bQ2TQxRseaDd3xJrtqR36RF5AG4gQ1Gw0QHJw3Kc3auGbDSyMW7WUmu/mUpQI6p3VOX7
 WIIMFlni54TEvqBnXiiEjpQkm1i4SBY0JUW86Ha8QuJNpKfnaxQqNHc71bPGuXXufXRqaWUXiJY bzPQx+avEkiQcbE5ieztItejdObMZGVwi+IJBZpM/ycXuUsM1lVIdWvXaTsF8VNyzgLSRXyT4UL xYhuM9rnuEhhtbxa3IP5wP/40/Zag6JKB/pWW9ur49fecZXo/7cDCuGlxwOGrM8g39kF2aKEAAg
 OUhPwhs3PBlth5t/17Rq6e+zouY9Lw/7rh6kiB520R3G/9MBypHEqNUZBC+UROkX5BOXkE42
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b5b46 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=e5J9yQtEsebikEsHgo4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jAkUQtm0oq0s5viPu0SEh9eC1wQKCgVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 3d7ffd874e0d234f450f6170e623f87572456757..66f5009fdf8aebcc543b5539d1c2d03075171001 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8694e5d7d3f012070c72214df063a6488b2ef707..7f4e8005bc4ae0bc82ec5b87a1fea0530301b427 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static enum drm_mode_status
+mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 52e728181b523cc3380d7718b5956e7e2dbd4cad..4755eb13ef79f313d2be088145c8cd2e615226fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,26 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -87,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */

-- 
2.39.5

