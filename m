Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A97079C4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378769; cv=none; b=OG13tGx4kEDPtwx68p70AIpZax0Zt7IVvyjBZgRPb3IreXFV/epPTFM6xh6n00EkynT3vEAdOQc231NgfAb3U4Gc77kzTZ1v1O+qDPwVzDgE9nMF/2gB9JAit9grK6kwzRyReub7zlV97Yq0VThZXNJtsneXDo/EWqKRwbzKr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378769; c=relaxed/simple;
	bh=+8OY4JoTHqGyG6xiUsqBMtWQ8oXuUcdTUK2QrI1nLas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hR2aHuxw1IBGZepTvH9XfUdyjci77XCy+4B1HoPcMTow0pa/GPr3XAfDo2r999FSImyTTm7ku/8sJeYc/++wZWw9f2PRM7/W50J2k1bYzQPxcGa8FolyIV3iwv/+ghNMCObCTRECnaUdiUyg4pJXeJzcyfdvEzR7H8wq717+YEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKt6/DxS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKt6/DxS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFmmi5025998
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jah2XjONJNu
	kYJbz0qo+k7o+HZ8jA3wmQBqbppH0WT4=; b=RKt6/DxSLzXSkyRK89r0qPIp7B1
	9+ZKUsaLRnCx1/dvEfsApGlXPkI0Iab0wkOjI2r5hUF2B+b0giL/h4zpIPEs0J71
	wsjF2Gly4GeioP3OnjpavABoOYY7Nk6AEl5zKcspsje/SGF90g0DclFbGYMxp+xB
	gZvEoeqhUuO6A5+v1sTOKUVcnWKmiuwJmaqh59N8LzEBS9YkZFLH2AcMTdKFW1vq
	oOuANsCh8ayt1TaYQh6zcIOAhGSAOLJuW+/aNH3r86NcCWCKD8Dxl/0Gz3gziY7f
	MMw02J2UJy2BDg1eKqsV3aHRcMlTWnDLetn6CHthAmeVkzSElfFTm0lTLxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9hfrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b115383fcecso854614a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378765; x=1750983565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jah2XjONJNukYJbz0qo+k7o+HZ8jA3wmQBqbppH0WT4=;
        b=VNWJ4J2G506DbOtoiTpKXv+TQYZ36ZHHoc7PbNGIbU64i2gAklIfoD6xQEU4tBf3eD
         vY24Ij0l+Uz01f4xgiOeSfm1PZr7B5zIniumvRZcoMzdyE1BfI57l0pHkk6CTQyhiyMM
         /RUMKfOV+ztO2IoUpAn12BAjeZR4+khdixC5tWFHkgH1sWQ4aAef6HaxqneXltd+YXmf
         zgxKbs/KDZUrbPu/Z4CzptP/83+4xQdXQlSUTVTRbLUQK2kJ1zjMyuhkTiYoHFxqO36i
         LsWWysuZzvAN0PfzB/VccEjQO35A4Zraj1Yeub4/IpZFzIovkHbdHOLOv7JPxP28o31G
         8UQw==
X-Forwarded-Encrypted: i=1; AJvYcCV4MzeqWxeUiWDPE/9kPwNZ2/tqqF+q+nqAHnmyPJSYJaTyQsye2w1imYOGqm9imrtannz+9eWXdcJ0EB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY49RbCW8n54QQBh/0Jpcm4Af3fKNZfe2d2Jv5S/Jhh1G1HaOt
	nmRRQMFCsLh9vtovG++syqigmyMoEQnxXfI7sTOuPqe2kToHJZ4OJiFF4d9FLJa5MGcE0Dk0jhs
	aj8Uj0Y+FYUDf4KBuXcQpQH4iONRe2vLcQ/RpYMi6bhfM8k4NEzEXfYKMyimtkaEDSPE=
X-Gm-Gg: ASbGncujzHV3CCD/oTLoiUSuto3HGmqMwmPuXzvXgwKUNhM8lklb+uy0jz1Ptzn2Zrw
	V8+1tH29VTsPlQvN2bEBVWDpu5KlQwPEOdUd5MdgqpPgtEZ2vRXuB9wi9AXopd7N8+iugdZQicd
	4xli/bCnozA/oD5RAjdDc+GFoYYxN+YvI2NzdcRd4EzWCAVwYMUTdwU+Y+iP8uv+oaC2EPUT5X7
	Zdwf6kNxdXP219O2PX4+yhGlGscNm51Aju0+0fOp9kJzulu7G+hCGFwxV+03m7owXei+9IGc8vz
	2UBl2SzWniP6TCeKekKuBx+8dA/lQoqNxlJkkxY3kQdLOoDHMPYf9r8TwPiKaAn+svtgzln7IAw
	ZhQwxgPrtMA==
X-Received: by 2002:a05:6a20:7f8a:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-22026e479cdmr1424573637.23.1750378764618;
        Thu, 19 Jun 2025 17:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAzfGf+Jh3u0unIl4HMJbDQqUuijAI+3iHof4/otrzhv6Y/3OKh17h4Zj6kml5UzCfd9Bv4g==
X-Received: by 2002:a05:6a20:7f8a:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-22026e479cdmr1424537637.23.1750378764215;
        Thu, 19 Jun 2025 17:19:24 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:23 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 3/5] thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes
Date: Thu, 19 Jun 2025 17:19:16 -0700
Message-Id: <20250620001918.4090853-4-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V7TcV5aI6A64_bx-Y1zHroL05a2pB4U9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMCBTYWx0ZWRfX3RZs1e9olLl/
 VpsM4jGDB1zwGrRDBY/BpIRL69KQsxCWOXw5VAuzbiX935TwOAoj4pjLqm7vwWSo2V8ltTPneU1
 5DbzmbHunLNVHVNev0uV58LVS4Gib3yebe9s0yF2GM6z7+xjsBcXyQckPbOxXnkXNAF7qbBKEd9
 prr0w8uFM5apzJRIQZHbWxaAlWSKV/w/qdgFl8HwqB5VH7hAspFcm0/LCFCfmB3Ma41j+FZVHSo
 pz4yp8+P9M/c1HlwkV4drbeaWc1Jd7AgNpk6TotZftiNwvzegxlU76XEXGYX57c3R5xGUFJmh48
 ySqJMBZzQ7KhPjskouyhmCSNFpQX3amXmib10L/wRlDvdE+je1glO4Ek+KOawADvmjaQ/MMcTAO
 naEx9WVjdbTf6mAzva4AdxXQeMk9K0QHIs6rXHjaQi/Gb3Yi0CxS4ISfRWr0Glr41L6PnUcH
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6854a90e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VcnGJyyLPHPoHGOjSs8A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: V7TcV5aI6A64_bx-Y1zHroL05a2pB4U9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200000

In preparation to support newer temp alarm subtypes, add the "ops",
"sync_thresholds" and "configure_trip_temps" references to
spmi_temp_alarm_data. This will allow for each Temp Alarm subtype to define
its own thermal_zone_device_ops and properly initialize and configure
thermal trip temperature.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 96 ++++++++++++++-------
 1 file changed, 67 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index fdabde39a7e5..5991067d3484 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -71,8 +71,11 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 struct qpnp_tm_chip;
 
 struct spmi_temp_alarm_data {
+	const struct thermal_zone_device_ops *ops;
 	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
+	int (*sync_thresholds)(struct qpnp_tm_chip *chip);
 	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
+	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
 };
 
 struct qpnp_tm_chip {
@@ -310,64 +313,97 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* Read the hardware default stage threshold temperatures */
+static int qpnp_tm_sync_thresholds(struct qpnp_tm_chip *chip)
+{
+	u8 reg, threshold;
+	int ret;
+
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, &reg);
+	if (ret < 0)
+		return ret;
+
+	threshold = reg & SHUTDOWN_CTRL1_THRESHOLD_MASK;
+	memcpy(chip->temp_thresh_map, chip->data->temp_map[threshold],
+		sizeof(chip->temp_thresh_map));
+
+	return ret;
+}
+
+static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
+{
+	int crit_temp, ret;
+
+	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
+	if (ret)
+		crit_temp = THERMAL_TEMP_INVALID;
+
+	mutex_lock(&chip->lock);
+	ret = qpnp_tm_update_critical_trip_temp(chip, crit_temp);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
 static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
+	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
+	.sync_thresholds = qpnp_tm_sync_thresholds,
+	.configure_trip_temps = qpnp_tm_configure_trip_temp,
 	.get_temp_stage = qpnp_tm_gen1_get_temp_stage,
 };
 
 static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_data = {
+	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
+	.sync_thresholds = qpnp_tm_sync_thresholds,
+	.configure_trip_temps = qpnp_tm_configure_trip_temp,
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
 static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
+	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen2_v1,
+	.sync_thresholds = qpnp_tm_sync_thresholds,
+	.configure_trip_temps = qpnp_tm_configure_trip_temp,
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
 /*
- * This function initializes the internal temp value based on only the
- * current thermal stage and threshold. Setup threshold control and
- * disable shutdown override.
+ * This function intializes the internal temp value based on only the
+ * current thermal stage and threshold.
  */
-static int qpnp_tm_init(struct qpnp_tm_chip *chip)
+static int qpnp_tm_threshold_init(struct qpnp_tm_chip *chip)
 {
-	int crit_temp;
-	u8 threshold;
-	u8 reg = 0;
 	int ret;
 
-	mutex_lock(&chip->lock);
-
-	ret = qpnp_tm_read(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, &reg);
+	ret = chip->data->sync_thresholds(chip);
 	if (ret < 0)
-		goto out;
-
-	threshold = reg & SHUTDOWN_CTRL1_THRESHOLD_MASK;
-	memcpy(chip->temp_thresh_map, chip->data->temp_map[threshold],
-		sizeof(chip->temp_thresh_map));
-
-	chip->temp = DEFAULT_TEMP;
+		return ret;
 
 	ret = chip->data->get_temp_stage(chip);
 	if (ret < 0)
-		goto out;
+		return ret;
 	chip->stage = ret;
+	chip->temp = DEFAULT_TEMP;
 
 	if (chip->stage)
 		chip->temp = qpnp_tm_decode_temp(chip, chip->stage);
 
-	mutex_unlock(&chip->lock);
-
-	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
-	if (ret)
-		crit_temp = THERMAL_TEMP_INVALID;
+	return ret;
+}
 
-	mutex_lock(&chip->lock);
+/*
+ * This function intalizes threshold control and disables shutdown override.
+ */
+static int qpnp_tm_init(struct qpnp_tm_chip *chip)
+{
+	int ret;
+	u8 reg = 0;
 
-	ret = qpnp_tm_update_critical_trip_temp(chip, crit_temp);
+	ret = chip->data->configure_trip_temps(chip);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	/* Enable the thermal alarm PMIC module in always-on mode. */
 	reg = ALARM_CTRL_FORCE_ENABLE;
@@ -375,8 +411,6 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 
 	chip->initialized = true;
 
-out:
-	mutex_unlock(&chip->lock);
 	return ret;
 }
 
@@ -476,13 +510,17 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = qpnp_tm_threshold_init(chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "threshold init failed\n");
+
 	/*
 	 * Register the sensor before initializing the hardware to be able to
 	 * read the trip points. get_temp() returns the default temperature
 	 * before the hardware initialization is completed.
 	 */
 	chip->tz_dev = devm_thermal_of_zone_register(
-		&pdev->dev, 0, chip, &qpnp_tm_sensor_ops);
+		&pdev->dev, 0, chip, chip->data->ops);
 	if (IS_ERR(chip->tz_dev))
 		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
 				     "failed to register sensor\n");
-- 
2.34.1

