Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3C20322
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378770; cv=none; b=R7PvsM0vATcvUJNRxqIigjqUlXLLuVHx3u6S7+QozZl1Q0WxZPBTcMF5ip7ceBy2aGAahNvZDjp+cDK+GvtoxX0TF8XnOPsComnDXc0uk1Hp4XImpnFjLowjkIt3CAHCaFmxoLCv+Z4YtqvSELqsQl7+Ghy/24qVIrrDJsx6m50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378770; c=relaxed/simple;
	bh=pzdo6tQoIHPimPo2tPRlSVpfJ/45dsevy0rACzrOEKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nCpdC4MFWhqpxYLCmHtoauBPThbDcxovLtOLjikmc8eR7V6GiF1hz8Y+qp4/xlRJSy5Zs8QDG86iRtv/kibK+a+7FVJPyFkECuWWGjzPYdVqxuyipz2wF2SvdrUuYFtsWXfywbr8/jRotQXeHLczIo75HPg3frZzsovwRSGg7x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1x418cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1x418cz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JBuuSn006020
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z6SbEMNz1or
	fQ/MzmtK0pbCD/N4EvDE2FmiULlhYxsU=; b=B1x418czm8QQhQhrghBaqg2T9H2
	SkOZO4KVDHyif8ZHNzRcjfjsufffYhC/sBG5XFmPKHCGbhFFSa0/ePxUVhhFAWP2
	l3Sto44tRX13qcllE/2Xs4RRCZ1Uv5v7ludq3gx4GW6RjQ/F2268SIW+Zy5vUSxL
	5y66Phwsb09kmuzIzTtHBgKzlJCW2wZF9PNgkzO7wKsvOlZru7xhKivg2CEGX6QP
	0O1dR/KtmKQdWnsdMLKU1ktQ1bfddducRzjr5/zHDuf740zdRbrD6zuhpB5fRRQr
	v/G+q3MV0Rmuv6lL2n3RggN5u/4uR96IjSJhWWz5Kr2LVFSVnXrALPVgRwQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvmq3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:19:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748f13ef248so1115457b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378766; x=1750983566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6SbEMNz1orfQ/MzmtK0pbCD/N4EvDE2FmiULlhYxsU=;
        b=etDvfTC1iFCzypZS4OCQbEXXzaZG/vmh4M7+vZucP7eLyz+6xKvFLNDNWT37tcmMlC
         EhuCAHNjw+wZEycVfWt0SjkRaWZRiFl8ZwQMq3isY96QyoBdwOSwrncCIhAE7PPyD78M
         FCcjNkhLDGtxm1zOI96CxH+1GeY+O2VsJF89zMzhelcM1KTrx9PezzinMeCoITWymQJ8
         jS6kLtF5b5DMTPmXfL2HdZt9DiEK73MN+Zkcb5SASoc617FHiMB5v54Y+ESHAsMxz/tL
         LgBVgZMmFbYc38D4AKGgAe3NtXZ+VU2LcZiAe9DWs5bhIRwZUlLZFcb2ofu1X4LuM5oL
         8V5g==
X-Forwarded-Encrypted: i=1; AJvYcCVfZB3iYz0CKMAoaYgogZPdM3GqxHE7tVpYwxsGbanMfz5VP91T9Nb9bJklHNwKIJcJ7FBz1keUFQKkmvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnbf6z7M2P52xIuH8YalDwA4pDOyN2JfegPH/isrlXyInfgklQ
	DufiE64zOfQL2BaoOzT05U3Hw0MUFXUhZktyin4tRQlfuofY37i0AZu4OMjysvbt0Z5mMadmU7O
	F/0Qsq2AkBJoljuhS82JU3iOQgrcGVtfRTOoBHyjkP6zDfTfupDKxLNqR6jwflR1+zoI=
X-Gm-Gg: ASbGncvWBs/ZJH0Q5HFTcTMEtxh/Il9eEqiLIGt3G/a/XrfgWRj6Gv1u1oN33NVKQLN
	Mm6ci6nK+Z1q2rTszJFeSbbQ16PQxM79dpfuyb8GeLyasi01cEuu9uZflf4nhqEfUS2FjmPiCzZ
	/0OIhkDLdA51tn+QniY+FRofDjJOG2UZ/aqS22/4HhjT8Z5XeI66A3Lzb9ZOiBFeUG2S8x0w4vH
	qmo/hdz2Q7spEJln8yoCfTSoXoQwNFtsFNgyCzbMU099Q9vKQCUuoWY5E/iTyiWyjopyTAK9woj
	4NJxiQ+BBgBwq9QRj6KJOWKtCH7TtlE0u63Eh40gCegNqoQvKqLKPvxCinQP/M/0bzjv6qw+lxK
	m2TW1xZXWzA==
X-Received: by 2002:a05:6a21:7a82:b0:21f:ff2d:aa03 with SMTP id adf61e73a8af0-22026ef77a8mr1040011637.33.1750378766235;
        Thu, 19 Jun 2025 17:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfUUVjcJunIMPoNK0f+0az63DmOL1dGnN+uT5q0XzPCZjt5cp5a+9gyAuS+rD66equPP0egg==
X-Received: by 2002:a05:6a21:7a82:b0:21f:ff2d:aa03 with SMTP id adf61e73a8af0-22026ef77a8mr1039970637.33.1750378765779;
        Thu, 19 Jun 2025 17:19:25 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:25 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 4/5] thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC peripherals
Date: Thu, 19 Jun 2025 17:19:17 -0700
Message-Id: <20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMCBTYWx0ZWRfX91qsQMY7x/FB
 3w/bWVMLD8P40BZc4yHf0XyTPskDjlS6kK1qvUvszpcm2rzjY0xW2LDvcmMV9Nwyitehzd+h1kd
 Dn7dHP0KdBO9l7KkvIMi0ayRqeUIdizszlkKg9Gp3rqUWkdtVeqGe4TXNXhgB7wWR1VwILvXyoo
 uvHyRK/D3gd+AEbHlN9XmATiB5fj8/ewjs5vqvbod1vQgdK0JGZGBbZ5/uG7iZRFcCsxDolw1bO
 w74NAEBdW5mD5Z6O+PX83XqqDw+GW3XZhAlHGCjmX23HnSCi85n41hROvWLwZy/Q1h77UKWI3DY
 xtsQXPSMBKkPa58gCsMk2IDYjKyoXzIx9oLND+EnQvnLRRSX1BdZ0+mCzb0eJanij3si1qN6y91
 GbFRz4MPJ3/BC0PpJuP3ZuuRPjzI+NOYr9cD6TwTAiLpujV/ifnacM/1RWIxP5+aVgYq29DX
X-Proofpoint-GUID: XKN_JZDlt7dztZYAwhDo7s_pyCo2jNhR
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=6854a90f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=N9IR0GguogMVy2wE49AA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XKN_JZDlt7dztZYAwhDo7s_pyCo2jNhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200000

Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
revision 2.  This revision utilizes individual temp DAC registers
to set the threshold temperature for over-temperature stages 1 (warning),
2 (system shutdown), and 3 (emergency shutdown) instead of a single
register to specify a set of thresholds.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 5991067d3484..0e0b0a8b2367 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -26,6 +26,11 @@
 #define QPNP_TM_REG_SHUTDOWN_CTRL1	0x40
 #define QPNP_TM_REG_ALARM_CTRL		0x46
 
+/* TEMP_DAC_STGx registers are only present for TEMP_GEN2 v2.0 */
+#define QPNP_TM_REG_TEMP_DAC_STG1	0x47
+#define QPNP_TM_REG_TEMP_DAC_STG2	0x48
+#define QPNP_TM_REG_TEMP_DAC_STG3	0x49
+
 #define QPNP_TM_TYPE			0x09
 #define QPNP_TM_SUBTYPE_GEN1		0x08
 #define QPNP_TM_SUBTYPE_GEN2		0x09
@@ -65,6 +70,25 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 
 #define TEMP_STAGE_HYSTERESIS		2000
 
+/*
+ * For TEMP_GEN2 v2.0, TEMP_DAC_STG1/2/3 registers are used to set the threshold
+ * for each stage independently.
+ * TEMP_DAC_STG* = 0 --> 80 C
+ * Each 8 step increase in TEMP_DAC_STG* value corresponds to 5 C (5000 mC).
+ */
+#define TEMP_DAC_MIN			80000
+#define TEMP_DAC_SCALE_NUM		8
+#define TEMP_DAC_SCALE_DEN		5000
+
+#define TEMP_DAC_TEMP_TO_REG(temp) \
+	(((temp) - TEMP_DAC_MIN) * TEMP_DAC_SCALE_NUM / TEMP_DAC_SCALE_DEN)
+#define TEMP_DAC_REG_TO_TEMP(reg) \
+	(TEMP_DAC_MIN + (reg) * TEMP_DAC_SCALE_DEN / TEMP_DAC_SCALE_NUM)
+
+static const long temp_dac_max[STAGE_COUNT] = {
+	119375, 159375, 159375
+};
+
 /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
 #define DEFAULT_TEMP			37000
 
@@ -87,6 +111,7 @@ struct qpnp_tm_chip {
 	long				temp;
 	unsigned int			stage;
 	unsigned int			base;
+	unsigned int			ntrips;
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
@@ -304,6 +329,54 @@ static const struct thermal_zone_device_ops qpnp_tm_sensor_ops = {
 	.set_trip_temp = qpnp_tm_set_trip_temp,
 };
 
+static int qpnp_tm_gen2_rev2_set_temp_thresh(struct qpnp_tm_chip *chip, unsigned int trip, int temp)
+{
+	int ret, temp_cfg;
+	u8 reg;
+
+	WARN_ON(!mutex_is_locked(&chip->lock));
+
+	if (trip >= STAGE_COUNT) {
+		dev_err(chip->dev, "invalid TEMP_DAC trip = %d\n", trip);
+		return -EINVAL;
+	} else if (temp < TEMP_DAC_MIN || temp > temp_dac_max[trip]) {
+		dev_err(chip->dev, "invalid TEMP_DAC temp = %d\n", temp);
+		return -EINVAL;
+	}
+
+	reg = TEMP_DAC_TEMP_TO_REG(temp);
+	temp_cfg = TEMP_DAC_REG_TO_TEMP(reg);
+
+	ret = qpnp_tm_write(chip, QPNP_TM_REG_TEMP_DAC_STG1 + trip, reg);
+	if (ret < 0) {
+		dev_err(chip->dev, "TEMP_DAC_STG write failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	chip->temp_thresh_map[trip] = temp_cfg;
+
+	return 0;
+}
+
+static int qpnp_tm_gen2_rev2_set_trip_temp(struct thermal_zone_device *tz,
+					   const struct thermal_trip *trip, int temp)
+{
+	unsigned int trip_index = THERMAL_TRIP_PRIV_TO_INT(trip->priv);
+	struct qpnp_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, trip_index, temp);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static const struct thermal_zone_device_ops qpnp_tm_gen2_rev2_sensor_ops = {
+	.get_temp = qpnp_tm_get_temp,
+	.set_trip_temp = qpnp_tm_gen2_rev2_set_trip_temp,
+};
+
 static irqreturn_t qpnp_tm_isr(int irq, void *data)
 {
 	struct qpnp_tm_chip *chip = data;
@@ -345,6 +418,60 @@ static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
 	return ret;
 }
 
+/* Configure TEMP_DAC registers based on DT thermal_zone trips */
+static int qpnp_tm_gen2_rev2_configure_trip_temps_cb(struct thermal_trip *trip, void *data)
+{
+	struct qpnp_tm_chip *chip = data;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	trip->priv = THERMAL_INT_TO_TRIP_PRIV(chip->ntrips);
+	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, chip->ntrips, trip->temperature);
+	chip->ntrips++;
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static int qpnp_tm_gen2_rev2_configure_trip_temps(struct qpnp_tm_chip *chip)
+{
+	int ret, i;
+
+	ret = thermal_zone_for_each_trip(chip->tz_dev,
+					 qpnp_tm_gen2_rev2_configure_trip_temps_cb, chip);
+	if (ret < 0)
+		return ret;
+
+	/* Verify that trips are strictly increasing. */
+	for (i = 1; i < STAGE_COUNT; i++) {
+		if (chip->temp_thresh_map[i] <= chip->temp_thresh_map[i - 1]) {
+			dev_err(chip->dev, "Threshold %d=%ld <= threshold %d=%ld\n",
+				i, chip->temp_thresh_map[i], i - 1,
+				chip->temp_thresh_map[i - 1]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/* Read the hardware default TEMP_DAC stage threshold temperatures */
+static int qpnp_tm_gen2_rev2_sync_thresholds(struct qpnp_tm_chip *chip)
+{
+	int ret, i;
+	u8 reg = 0;
+
+	for (i = 0; i < STAGE_COUNT; i++) {
+		ret = qpnp_tm_read(chip, QPNP_TM_REG_TEMP_DAC_STG1 + i, &reg);
+		if (ret < 0)
+			return ret;
+
+		chip->temp_thresh_map[i] = TEMP_DAC_REG_TO_TEMP(reg);
+	}
+
+	return 0;
+}
+
 static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
 	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
@@ -369,6 +496,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev2_data = {
+	.ops = &qpnp_tm_gen2_rev2_sensor_ops,
+	.sync_thresholds = qpnp_tm_gen2_rev2_sync_thresholds,
+	.configure_trip_temps = qpnp_tm_gen2_rev2_configure_trip_temps,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
 /*
  * This function intializes the internal temp value based on only the
  * current thermal stage and threshold.
@@ -486,6 +620,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	chip->subtype = subtype;
 	if (subtype == QPNP_TM_SUBTYPE_GEN1)
 		chip->data = &spmi_temp_alarm_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
+		chip->data = &spmi_temp_alarm_gen2_rev2_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
 		chip->data = &spmi_temp_alarm_gen2_rev1_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
-- 
2.34.1

