Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899A221A444
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567307; cv=none; b=Vq4BnqoYnZuYasECJKFvSF+QZXjwvCwt4cGbniDXV1YI2HlU3ZRQ9Fc8AJ4S/OIy0q22pAVmnJrCIjp3sv+Pgz+vm67pxzYpYIogvDLr4IeZ/u0Oh2qxqcPMdR2hGDZkPKVI0/jT9I8fNvMh6QDdGbTESwJevSXnn+JeBTVvO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567307; c=relaxed/simple;
	bh=o89jvTXWsBQe3mxYOfZNmfZPFRj+srNNnegV+rGxe20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D65dMU1FXt8J+cyV0n6DM0b3IgBjjxHV1ywgrTX2POXjjKAdK0+q8YotwRZt+FRnnJ6qgT+V2f+Untrcl9dLVV8pKrAwhJt1BI4Z8EGzdX6em7ktWD2unmTNOYvIJ95y9cuF+naWdTxquUo13/DfIZcf+a92eJ7eXQm0zylkmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTgAYCLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTgAYCLl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IB3qmr007669
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seN4YYKwjaMssJPoiSSAk/UJINq71z4OK7vTWwlIhfk=; b=TTgAYCLlz/kO/wwe
	Nk8QxwWduSD8FtVPhADU3xKw+PeGjNMfFAc16tNogkkv1MVi0lZeMdnGBLbhlgtW
	Za22ro4hKMkUVB53Xn4zTmRUlrQPm07/tQEpo6ukqKbLoesKz9Xt8YWcnf4C8dae
	YysG3kizyf5BQdGeeubxyc8vqRYfn86MyXDVVgqDazxU+0BRwqJ5Zj+XF8rePVo6
	zQ5y2pxjswkkah1xgPNpupC8H9jNEhBKMnuwrPJwSXpTUpxJZ6U8FRgfOFJzhddH
	ZBalYLs0om9a5ZQqu5GIyC/5KAwV9Wp2pniC6i1TB1rjULVHnjMgWIDI5FjTc+MS
	eXBLJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9tvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so70275336d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567303; x=1748172103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seN4YYKwjaMssJPoiSSAk/UJINq71z4OK7vTWwlIhfk=;
        b=ctnvCBi7cO5932/gNX9+IDm5J84F5bv8nl/mDOP0WGU1bP6+krpGqLcCYhq/sMc+A7
         t4mEUSuEyR9/g3OA3PvpjkOj9jsCF7orLrbCiFYBrvG+XIQLDirAUo66mj/6k+S8L3bq
         RRfBKKfR4xLjDuA5LOuvz3j9rqIvK6s5lhacJrRnxAS8Fl+5io0FRY26Jvx1uIgbXM2Q
         zVa70dBR53AdscPlEs8+W+AhqB/WcLBgA7rTB+e7IlkDRzenpTmgA2T0bt7/ilAZghni
         ifrrNhx6heOO33Wbdoy+kfhy7Ltje0rM5PgTIphz6yhL0hdFOXdxqVl2K8TiICwXTVo+
         mtDw==
X-Forwarded-Encrypted: i=1; AJvYcCWuOoQ0RaAZcXRKZ2sSG3KGTdVzm9C7nsnxHZutORP8hKaDoEztLzLWdtRVVNXTFmevLrHZFijB6MeBF6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcX1Ml7mpwJiVFeZcb42Y6Awaehdxd4TD4txnRy9kYXQ0t/Ey
	zv5dtMSDbsDSvZ1K12U4BK4It7IMIR47ydiAmZpbiJvVaaHPUwVSdo0MsOSO+lqFsaKbuCTtiVt
	iqJIdOyOIkBsuEZ5dBt2CFDHkyX2melb4C4Zpgfw4UlwbAW2FvstQj1zx/+C33t8J5xM=
X-Gm-Gg: ASbGncv1GIXK5IUFaB9rISMf+K/TAIaFFDJFELkpwRU/KTNjICXy6X3sr+5mh/v9qKQ
	1Tev33gpTsH2yUXfSD8eujqEVD4HCDYbV9sucRN/wEP+uGWLsJ4fO/XLXnf1f461SJZ4VOzU4jw
	iY5XR1tHpR9dbv7XQSDu2Sl9+TsffSD/ZIek7Sok6fXbwa+Vs9Cj5he7kSyeNxl1RDrsGPM9DAY
	F3CFS0CmVsoYTjbk0LtL3SrBhxc+MHrffEHNFCwh8ANe1FFC5P1zfCAwGBkuIQM4i745I0fFxlT
	oBlz8VumrS9y+AfxxT6iwYNpFBH9NjQR/p+s3BVJWjjnZxM12kvCAAOp29pU8yZR5cCl1haIVOw
	L6TPLzm8Ai2lrGpeRFXyujmzJ
X-Received: by 2002:a05:6214:248a:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6f8b2d15198mr130437706d6.30.1747567302886;
        Sun, 18 May 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHom7w+/F5VHLvfNBFeNm/lt02SI6nyFasMUbdwz0mFjeIJfWFMkSxTZc6WbCqk9JLZN2F5sg==
X-Received: by 2002:a05:6214:248a:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6f8b2d15198mr130437346d6.30.1747567302505;
        Sun, 18 May 2025 04:21:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:35 +0300
Subject: [PATCH v6 02/11] drm/msm/dp: read hw revision only once
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-2-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/Hs1HGodxey0UOVjoJO2Kl/jlINR9/hl6O
 1fkgwO0m2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1bqIB/0eR7M7/nrB8bKHxc+BHj/vguTWWbNuciMREsFKLdHnJ/NIus2916NlmOCHfEJPEvfVJar
 C/pV5dShhMJjpHX39OlauTv7EZQZ7UIm44O65CFA9sEC8B9JHHOhCvXlb0xlMeyPWLW8Wx66iRw
 apc6bhIUYJEHeGULbtNEjYYQosy9kByMe8om9Q5U301UhXL7T0Xs78xe803YpHUMNvPTfkNHqTe
 edgTO/2iqUEtZcKixGT8AhmZtvxHEjc0wpEUiKQDeDZ94KzhB4GvYTvJmtQAfnSOOsQEjhdSwkT
 EtlO3kZhj4hBiHirJscN9TtudorIJw5Zc0SEEnX2e/79S5Ak
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX/H843isk5OFK
 +BcZGaMZvMoHSe9271xV/8OxvYVJW4gM2nkNTw2lJuAC4Qnxal2TPz7ql4zoAGZMJQwpPgo1XXD
 GEIi+rZL6hclblnNyFAWbfFGGLSZMXXL3udv49V5kgWW1KGWu9+kVJU85a+A3i6mPXl7NLb+hFo
 P7luTrAn5BEydPuY7V2zcQ693OtnkAj0NQIAfXAK8Yd39dwqesdDQxWh6V7W8ApnpBkudFrhz6H
 jxlnsXkegHZbi4NjeeoY5ru63ZEsD37YLleNE50IMaaW3pDfhcOq7yIfZcky/+ekVQ5Gzb2R9tq
 XBfnnFmnhiHN40mS6dxD3C2hX9ff88Xl8T5RKhgq97wM5aDgLpkEY8saca70x2rRUU39CD0HneQ
 Go+pwL7iYRvjHQAXkfcNR0OXgL3CsOMsxCGThVwK9TcZDomAFI0HNuGBM8xoNDnuWH884vfK
X-Proofpoint-ORIG-GUID: L2wlVuY0zHIDjkRXcGdBPnVbwxIYL41I
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829c2c8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=pC6Btxr2GG0oDPZGBtIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: L2wlVuY0zHIDjkRXcGdBPnVbwxIYL41I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4f80eceb6ae19f542110d7379007f57c2ac16a8a..23f9fcb75123a58b3a4b69d3dad0598135108eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -414,14 +414,13 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
@@ -514,22 +513,6 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	return 0;
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
-}
-
 /**
  * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
@@ -556,6 +539,9 @@ void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!msm_dp_catalog->hw_revision)
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
@@ -895,9 +881,10 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 	u32 hw_revision;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+	hw_revision = msm_dp_catalog->hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+	if (hw_revision < DP_HW_VERSION_1_2 &&
+	    hw_revision >= DP_HW_VERSION_1_0) {
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 08bb42e91b779633875dbeb4130bc55a6571cfb1..379fa4fef9ceb63b20c4aec2fca1e09003dc738b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,6 +33,7 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+	u32 hw_revision;
 };
 
 /* Debug module */
@@ -61,7 +62,6 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);

-- 
2.39.5

