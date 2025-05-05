Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AAD1ACED9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404124; cv=none; b=m2L7FKPvj8lzcPYa4E5ka0ct2LUUz3HwxYosFOCIlFcJCjPRYNEQ9SVC1OVcqST+Mdkh9RzQXTifeEEpvqgF9c4Y2R5pQeDQ3ArrzypyNGSygie2fUmepC5R+j0KrFypvu1WDw4viKhd7YyoH4Kl6aPOc/+8ek6eK0arTxSZJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404124; c=relaxed/simple;
	bh=JiwyaSew0NFtZ5o4cDod5F4IS9r3LnQFkGJ/FWeINsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRcBbqixIe+9oBYlnHLd39FHlrqHXDG7EzuKje+Tpb6pUzzer6rDLWDPgogEiSUGObvF8H+Tx0sGGFfUwlbXRvgqxblcm0BZ6diFzLLoQuSZ/JifFuY3zhE81xn/rdLuvlvmMb6R3hdGbHXrjT0xHe++zyEL8wIJHGbNeB8oPQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLkdtaUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLkdtaUf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Mrcsf023135
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mAZjRTa40l8e4BSdDDl0ubGwkl56NVIuzite4sqbHo=; b=MLkdtaUfVjbjqICO
	vwEtDcRhw4I4sX1D2HCRNt74rpbCq1yQekUobZR8umJwKCiUMyRQpfXllrU6eS70
	OlQPq4uS+rulAq2yjpIuu7ujear8gjz3/E4Nrw1s9IdlUQ+BZaLovq6OKgpuhG5+
	mdS0DLDmSfcY0CdmPyDRB75MPLffhdKIdiLR+TA+9jiqGhoJTt255keab7FlNMdn
	bSOovbhtLeds+sTtDDqFjr22Jyq+HsDnriX7ym9XVV3xJf8G+oKopjriu4eyqSh6
	noOt9pHp+e9vYe1PMLSbIIaN35v+kZzN8Uwiho7NN+xGlt6DPAZ5Bi1YmJNT1dxb
	ILpDWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e7922a1so837112285a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404119; x=1747008919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mAZjRTa40l8e4BSdDDl0ubGwkl56NVIuzite4sqbHo=;
        b=AE5EuJoSSWJ+lL4TXGWJxqFJEqUtZWyAaC2XakXRKbUOyH1ZnbyFYaafhMWomfvYG9
         Nyje3fkV+xdgf+2CkqpldiUuxmgts3QBTmwSj0UShrynJpeQRF3nEYlOzqo2LB60JZk0
         oLvhx2MtjD6YiERBez/LT1NV8mfZLmCSqfKI5meqzp0L89PHI05tjDT4Y5/AdjVjBKkN
         GiNBpnvt4rS50IYftrAldZOR7StkPUIgtSAmlj3u49A2HzilzlY1AlB2NezfLa72yh6K
         JbC6SZKKxGzPODnDKTBWylY/U/Bgcp8PcLn0DfwfVkdo9ORuG3+B4HeUDb4FzTC4gJeM
         9dLw==
X-Forwarded-Encrypted: i=1; AJvYcCWieAVK4Q0hRU1mgAu0xmQFuUkfhYIaNLGjiymTAwqv2oF6TJy4s7rNlc2TtY3pv6/EFHh9cn/FiAyxoV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNo65aPVFLi35BMpvBQRi8c8FVjQSISYhZXXB35hgryO5abKX
	BAIaxb8pIWO+3ppR1+XhnwLjyViLEG795fnymGLxBttH7nFcvMMWHZaudvBV6U0zPxnWa9cWFbk
	MOv0sZm8awXd7gys/9MckTXIr6zOLGhTe1hOEFQ1PapqNWpX7jlYw6UjWDcnZY+I=
X-Gm-Gg: ASbGncsHKcSwdjI51b3kQ1ytFYAxglP5edIydm46pzSJaPKFKCo3pchfWlps5XvSayR
	tvX1j+4yGwpIYLXrYA1AtjGy5CddZuiGed1yknhKJgKK8ACFUYDb/o6VvkCqaDJSOkyg8y2Rhoe
	fGrOW58CdPWYSx0N+LSNk0+TB6s+KeHcqwShKGxKkhti3Qs6/arsEjPQdrTcAY+YpNKOOH3okjy
	3t7mqyvTq18FZVNL88g5s0NIMhj/ErQ1zRl4oGkQKEc3mUwcgU6MkcdcZHz3DgR7LtFEx70wMkd
	wbxdmPZBRSR6OPcbZ/XbM4pdt1PHYbEHKIqyQxYWFYG1aSHDqGmXzGsG74+HrXRBuKpu+bqq3z+
	ByA4bHixxCo6Cz5pt4aW3gwKn
X-Received: by 2002:a05:620a:3705:b0:7c5:a2de:71d3 with SMTP id af79cd13be357-7cae3aa7dccmr710183585a.20.1746404118933;
        Sun, 04 May 2025 17:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJvT2qXEA+3qgUD9BONo0ieQGGIaGCVQ0ND5SLSFhAwExotlMLJ/1Dm1zx+Ha2IJcArypA1Q==
X-Received: by 2002:a05:620a:3705:b0:7c5:a2de:71d3 with SMTP id af79cd13be357-7cae3aa7dccmr710180085a.20.1746404118531;
        Sun, 04 May 2025 17:15:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:53 +0300
Subject: [PATCH v5 09/13] drm/msm/hdmi: implement proper runtime PM
 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-9-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9382;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=03nwODxsaeTmx63o5nvi9in7Q0eD5uMPd8cMRsyvZo0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL81CMtn0s/fUQMfCDvzbQVQPs5xvSHf1AaA
 lnsYs3+a6OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1UU1B/4mcG9UB2+HV1URSbHawbcWzIpOvWrp3klhn5IMEYsNXir5XoGy8ouhN/ojtuCT+hq8aZH
 +dtXh6kNGnHIgCLiz/kFvOSvG75ua7FQtkHeJDezXyoErUmzLCSJgqVcYsUUBkPv4FiWD/vXABR
 K0NCz4mILOu6A0uPmMTpzB0yvnmHdiPRQWpvamBwsatBWa6rfDkLYqCDeknfHtRzGQpdiT/OqOj
 kl49dtxohNwXLiD5L/1fdI7sye8Sda2anZ3jxwvLk6w/dbdI78fFriBT12I3HFzOX3K/Met+7PZ
 18/u+CTAy+mqoCfqsMvDYieoWMikHbF7+XRWHpxFl0DwVerX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qUy95TIEqBDoQ_YlDU4ewtFCc5g1mnkP
X-Proofpoint-GUID: qUy95TIEqBDoQ_YlDU4ewtFCc5g1mnkP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXziCbfzyHEVzU
 Y7B7VrRaLHkI9UVRxSnwMFZOyBFSKBzc6mc1c3Oco1O/jwjEbVCus4big0pW2sXUUHsyk69RS+j
 yAEtykFJYijfVYw3iGBZAWKdyUWHY5bI35nZ7gKTMesTGA2JoFoldWJIQJfu1oZy+yw06osLK89
 3zRWDT0nOKrQN6cO+Oe8WqzrvLMoMcDCaGXZnuCxClvcxRY9jmpMjvSby3H4LUAn6/rh6dtCtvT
 +KufJ2gyveivriZAC3vUtaczGpIqTn7H/D3ZpSwUOC9v6ygM9eMGA83nDoffAaHrwmvcEO3UmQI
 TcOc0otRyP4neUGeetVh+c3c11x2gIPGpbi4wTzwsL7mO9RnjD0mOyarEW4iFcdEbCY7KtDlKO0
 voPOojK7OfKXurNoFcemXmDbwSLT9WfkyFD8uzT9QuG4PvvmbmsOoS984uQzm8RnKyYrtPLI
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68180318 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=5f27SdGkVz2AZoGoeocA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
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

It is completely not obvious, but the so-called 'hpd' clocks and
regulators are required for the HDMI host to function properly. Merge
pwr and hpd regulators. Use regulators, clocks and pinctrl to implement
proper runtime PM callbacks.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 62 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 -------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 42 +----------------------
 4 files changed, 47 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f..ded20176aa805db98b0599e617eb6ea9bce122d8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -8,6 +8,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include <drm/drm_bridge_connector.h>
@@ -224,11 +225,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(hpd_reg, 8960),
+		HDMI_CFG(pwr_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
@@ -318,20 +319,6 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->irq < 0)
 		return hdmi->irq;
 
-	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
-				      config->hpd_reg_cnt,
-				      sizeof(hdmi->hpd_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < config->hpd_reg_cnt; i++)
-		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
-
 	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
 				      config->pwr_reg_cnt,
 				      sizeof(hdmi->pwr_regs[0]),
@@ -409,6 +396,48 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 	msm_hdmi_put_phy(hdmi);
 }
 
+static int msm_hdmi_runtime_suspend(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
+
+	return 0;
+}
+
+static int msm_hdmi_runtime_resume(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+	int ret;
+
+	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto fail;
+
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	pinctrl_pm_select_sleep_state(dev);
+
+	return ret;
+}
+
+DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
+
 static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
@@ -426,6 +455,7 @@ static struct platform_driver msm_hdmi_driver = {
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
+		.pm = &msm_hdmi_pm_ops,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3f87535bcf43e20f0618d3016307fe1642d7baf9..7e3c035cf913d713ed63379a843897fad96b23ab 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -47,7 +47,6 @@ struct hdmi {
 	void __iomem *qfprom_mmio;
 	phys_addr_t mmio_phy_addr;
 
-	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
@@ -83,10 +82,6 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	/* regulators that need to be on for hpd: */
-	const char * const *hpd_reg_names;
-	int hpd_reg_cnt;
-
 	/* regulators that need to be on for screen pwr: */
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 3ae305e868a5931a8982e261f518cd8134d559cc..665c5e1323d09513621429a6f184fb89bae0a37d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -18,15 +18,10 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
 	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
-	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
-
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
 		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
@@ -41,11 +36,8 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
-	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
@@ -55,10 +47,6 @@ static void power_off(struct drm_bridge *bridge)
 	if (hdmi->extp_clk)
 		clk_disable_unprepare(hdmi->extp_clk);
 
-	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
-
 	pm_runtime_put(&hdmi->pdev->dev);
 }
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d77c68914c5f525cf12971c1058b1abc33792b24..a42ed26a5b7c7d916d543aa2920754347903062a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -64,36 +64,17 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	uint32_t hpd_ctrl;
 	int ret;
 	unsigned long flags;
 
-	ret = regulator_bulk_enable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to enable hpd regulators: %d\n", ret);
-		goto fail;
-	}
-
-	ret = pinctrl_pm_select_default_state(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "pinctrl state chg failed: %d\n", ret);
-		goto fail;
-	}
-
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
-		goto fail;
-	}
-
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
-		goto fail;
+		return ret;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -119,32 +100,18 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
-	int ret;
 
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
-
-	ret = pinctrl_pm_select_sleep_state(dev);
-	if (ret)
-		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
-
-	ret = regulator_bulk_disable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		dev_warn(dev, "failed to disable hpd regulator: %d\n", ret);
 }
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
@@ -179,7 +146,6 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	u32 hpd_int_status = 0;
 	int ret;
 
@@ -187,14 +153,8 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	if (ret)
 		goto out;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
-	if (ret)
-		goto out;
-
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
-
 out:
 	pm_runtime_put(&hdmi->pdev->dev);
 

-- 
2.39.5

