Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C99190678
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404115; cv=none; b=MRnTk8ml5/ZrKYIhahZR+B1ReX7AH8nB0PHo2j1/Gm3nwrhuheNBnHYpXPvc2nWOt4TgmomKPC8pXvmP4jZIcHYvPxgZ1vrVfblrYDNzinhYKnZs9nUlT0AC2EC4A9nczWA1ofNpbSG7ywc3sEm2R4ZVM9cvLudSTkDimh0N8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404115; c=relaxed/simple;
	bh=CGyDFoTKkmhzrRAoyipkeuEsWsTrarBvvUqR5tzX1OU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuukZBmsO/nUN48HUSeBVzOhRDnkHJzsUyyfehdBpPgnowVbt08E+xZSlT7wH8DpSAsUqPmNBqqK5bVysHBMEh+Nv/tb40LUQlz5VtlvdGtTV02CweeS8WdE82PLzrUmbPAV9fBDloEuGTnZj72e7Ir63YzNTTSgPWOvV0afjTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb5g2JOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb5g2JOd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NQK1e015626
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lC8ZDdX8r3ZBs5Iye6AaJxnm/2rcpDHoom4/ujGR3LE=; b=bb5g2JOdB16+G+Jl
	L2sb3h8jwYKQ2So5K+BTiykiy7u3KcLH9oGaICikOZlAVBZEPWM3s8A+bx6M+eK5
	ohjfHvxXwAvFJ7R+k1iKD7TCJVOTycjUmb9N4uwHHUduxOSunjsWqYRt+CLGpJFC
	tZ+cltes5k/RFD1LWzmiZUWi7upCfYcvPWT2CVsW1GxWdUw+FjkHY4wN47C/3AAY
	oUN1vbdKz3PzJwciIGS3NMOE8ctHIRzCm+qvaK0qfBmWux6R52q8Ca82lV2K7jC+
	dO/n7pmkabGA+9zLZPJUgcDgeJXbVniZdjxI6kn0yQd+nOyVbJ0ppTE9oIobIUac
	vL0p9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c92425a8b1so708179485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404112; x=1747008912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC8ZDdX8r3ZBs5Iye6AaJxnm/2rcpDHoom4/ujGR3LE=;
        b=p3wgq3r6mDeHe8iaGbSgYTH+/mUuUje93KylD12GkNSfGrrmIfY8rshE/SvhGmo/Gd
         S6A82o/vNldMylvrhxIQ5NacTQfa//9IlaoxA4CQai0CNhlfmvyzybHXTomwjGpZ5BFr
         pJjA4xY7IREFCO9cGB6+JYtrMX9psXQ5eLFNPLPsSnfB0AtBG1dFNs103T+vQDiSiUCV
         S6X4Rbhc1MWPyipwGAnxsC99djJgMTozWjMqq12voz8wuJbbNgJw0C/+y1E1UKywGNzw
         lO0nOrbTnaVNpNcT0aOBOYfcMqL7KwxWL9DWtBqnQ+vxfFh+7FQjwTBd8QhFae/CWm0G
         DiIw==
X-Forwarded-Encrypted: i=1; AJvYcCX6zHvq6O321exlOgl0r++PE0/agtuPc7ppmEd747P5FCzmuHyi93s5vl3y/CTpNkePyTGkk45lJx0qfd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5rlMf76WyXzo+mQqD+S3ckx1rf/ikMvhuvT44psBivZqaoEB
	c2rUSE4sNLfVeYa53ie8QgTSn89s59izkJCv/aVp/xI6bZJFRQA53rg+1NGg5RKUzUnILwDDZDB
	hQOi1DflbAYQIU8H/ly3uOT/VAmnOloLu8Rr+AqH6JZI9WCaOCBj37xkUyysqgj8=
X-Gm-Gg: ASbGncuQdPETgkjFQMPHftPH0V4nBsugBcX2zDJvnoTyFjsF2KLe/edLtbd0LC/5Vrz
	gnfaCFdtBkce7mNMjFqsvKUhrWtZ8yCtINh5QLYqqg+NN3fpm8R+qHmezfzQDaWbWlCfUa1Kt71
	raYQgy04W1VlmL5ebuLfpkSfeQZyCJ+Hq9tIvHYf6dIGDs4muWx/r7gW2BXSNKMfZGIaB4vlItv
	RMt3mamd0R2m6/7rpAVBWwfh5IS40JkHdHHeiru8XswhlR8OP576mCX0icj67Y9uj6XDb92IVFq
	7TBvlKYRekCwSN5tctUUyMVO7rPjsD3B7HbLShGguTXuzJ53UoabhYfzzXIBC7W9LFOKWxV/JSz
	zz/sQj0mQVcl7Fwc1jy6KnYww
X-Received: by 2002:a05:620a:25d1:b0:7c5:6a40:6a7a with SMTP id af79cd13be357-7cace96e8f6mr2088729085a.6.1746404112287;
        Sun, 04 May 2025 17:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvNGkmAp+rxz3SE+ZfwFuR/iGSBPHH9E6ffeZtwrAcxALVaQZ1RkFPFE+vyWxNBp/1C1a25w==
X-Received: by 2002:a05:620a:25d1:b0:7c5:6a40:6a7a with SMTP id af79cd13be357-7cace96e8f6mr2088723685a.6.1746404111831;
        Sun, 04 May 2025 17:15:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:50 +0300
Subject: [PATCH v5 06/13] drm/msm/hdmi: switch to clk_bulk API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-6-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cNUywERI8hGQBw9l50SO0xvsuUis2RpMcSyOPQXrk1Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL8Ff/ghUad7hDlMm0gOBS5v6Nsc98AilCUL
 zHv2mb15caJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1SIcB/4gGV8loPoCtbdrusFh6IGwRUKH/Sb5NvGDf3zyWHQKwsgp77/X6b6c9UBLyj4D2A/gylP
 zhy90TSoPZQoB+HBJyvopBsZVrEFUkiMWlHSO76LXttNXcFELN73lfgR/4/E9ROPWK4kYYLItoO
 0mV/0yo5uVDK2Zy1KciXDUnGi6vLh41/MeFwxM3mGaluvD1BT5onejUSzcocLx31OzxGnMf0f3e
 7aUcZH6IP2Qh1Pgd/7pmjfIF4i1nTEqEIPSUmrRw+arYkZltAKGxQBVxbFb4EsR29i0RGWGdDmX
 E9kYu7hrHOcQC4S1I+0LZdQ0Lu6tbnDrw2fQAmRerUVQ9Fvt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Gtq1TQUlmDT6QlSKEYCpsgY1Kj_dFFnv
X-Proofpoint-GUID: Gtq1TQUlmDT6QlSKEYCpsgY1Kj_dFFnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX35+naInHV+m1
 LKYnOvrsvZlt6d9os/WMsLwKRFeHOiPVq2j6oCbQrIEaj4ADkefOXYZ4V04kYiGbIDpCTs5xzjC
 6HKpKUQ7IMGuK/KAIFIVYuDuUi7sOHQd+eK9KARn42b2d80kibjBMoRPETrga02dEzsfwjqniwV
 iisvhfhOa6uvOlitNIGdBfSFbGDTpeAFI+BaxtDWZgjjrOfKTtEr3q2SDvYpHgOf7BYmpPsDmew
 htAVe+WJJ4yb9opoPHPF9e4wS8dK5YijGWfBRRUAk5/9ZNP9fHgQXx2UdaBMPmW9FcIi2Dm59YA
 WwxntKzZvG4LFu2Ddnq4XeC8+W244NzOqN6lIJJvosfjqSdHq0zL3Kam9rLlz02muPcZqDeu5Rm
 VwItW4E802tXbfetkKiKZKm9hcNquMp4cl3wJu+urg6CZItCzQ12YqrJ/C8DLLRUr58nWUjX
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68180311 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=crT2GVGf2cMoZBaL-JsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6f09920c58190a9c195de0407e4c2dcc3d58b30f..69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,17 +353,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!hdmi->hpd_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
+	for (i = 0; i < config->hpd_clk_cnt; i++)
+		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
 
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get hpd clk: %s\n",
-					     config->hpd_clk_names[i]);
-
-		hdmi->hpd_clks[i] = clk;
-	}
+	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		return ret;
 
 	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e93d49d9e86936cb6c1f852a958398de2e134ad4..3f87535bcf43e20f0618d3016307fe1642d7baf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953f0ee6deea8a216bfa9d3616b09af..e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct device *dev = &hdmi->pdev->dev;
-	int i, ret;
-
-	if (enable) {
-		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
-			if (ret) {
-				DRM_DEV_ERROR(dev,
-					"failed to enable hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			}
-		}
-	} else {
-		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
-			clk_disable_unprepare(hdmi->hpd_clks[i]);
-	}
-}
-
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
 
 	ret = pinctrl_pm_select_sleep_state(dev);
@@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	uint32_t hpd_int_status;
+	const struct hdmi_platform_config *config = hdmi->config;
+	u32 hpd_int_status = 0;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto out;
 
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?

-- 
2.39.5

