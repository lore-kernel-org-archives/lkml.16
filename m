Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F25267F4A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476235; cv=none; b=p7o7omZZXkw2GJX8Thk1l6lonj946M+AfgrbwJgdIpqjGinvx5uuipwHH7Tv4xXnU+GdjiNmM3PTr+TKIO442op3LfOh5sp25XoGrrHXf5cD/7fUQwWqeDPb7kA/GXm8Wm2XrLtHsaVbp86xmhgRShmiCten2WxYSzKXYEybuPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476235; c=relaxed/simple;
	bh=0AHyHyohxwn+qcZhGVkucd48/8tBoUQSIWfA7awmNGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ubMNoL5piBaA9+pQoeYWbJJ02EDl3w0ix2/aFjRUeOnA042Q3BHsUpoVKGbLjaZDcP4Q85oT0wZbSI68HdJPrLOaf2chRgI+nryh5awMYRutX9igAtm+ckUxjnEWkpW+tqpaDvJ23yLfL91S30xeqEA0VqF1jmLtjpIt70bWjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2rU3MTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2rU3MTU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFgL6x028888
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5u11z5U0s0I
	5pIIJ/z7Xsel85qCBft1VpJjujWQBTFo=; b=c2rU3MTUWem23DBlttFr080UV9p
	KlpTqlYO9+eiUvQOvY/KRtZ36M+thIj4PhT/msgHbAikX5ld+XrCF4MOeCWpjL15
	TtVhRDnkEpWTiVOcz0dUJTrCFszb6THzsIJ2NvnqLp9s2NXiVWEJe7P7Av5lG3FE
	+tZxRn1qWfZxRkXaGEDJJZA1nENrb19a8WTRwz5tXzFbTkDwFZpAeIymSnJ3IZrU
	B8DMW+/60pLnhiNTUxFCqXKu5hK2p72MdS5eshr4GjF3+k7fU2ODuUfOb9y/gsAZ
	XFUlY9x3eLTxhcbe3odO2KVYYzLgRKdK3cSELLDBDElmFFb6ep8y83dzaXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf48a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234d7c0524cso3946115ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476232; x=1749081032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5u11z5U0s0I5pIIJ/z7Xsel85qCBft1VpJjujWQBTFo=;
        b=rLUaK6qtQ39qIUH4fQ5Kd3V8xOYe2KHk4bUz3uDexzVG2H+QhklHvUnxdc0YQ94Apf
         uzDRqipocgeopp3jrO+aeFmqLWkBuHb+Ae+/8PxhUUWRPR+fBf9iozp0v2vPCXddPc9Z
         iFJyOz48hpwCSGc9zKS3bWZt5wsBSL0f5nPzl6TZ86Y15JYKBXHbeJknW9a4rIvSYtNi
         1wxf7/+a98ZbGcA86t1wZt5djzNtGPKaYhzU+h9b5Uhm0Nct22sv8KfEFjNpab88wdVq
         E86bKq7NicKN9EYvYm/xvq8mey8toi+5ZnA7ksT5WwD/pLXDR9jlCJ0+WKIGL2NrqqKS
         GVLw==
X-Forwarded-Encrypted: i=1; AJvYcCXGMOe1zX1iLsTumYND8ZYtXNyx/lBB9ZLuXfLkHwrcXQPbPnWwf4TXg0WYmKxKO5p1U6w+G4VqBrSt0D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIC6VuG8I1ao5glu1+794WztMYRR1ldT84xe0geWywtYsDqKTG
	NkhSchkqR+KwqlJ/AaGc05uB8vOiQS2f+p5SrBmkx+KATbX7BcOQY2S4agNJlFCnOEPDeNoAvg8
	IdiRne7HoC1QhoXNckaJ2aSLS8s8Hf2tqR5M3Vw62T5IIX+KRu8qBsRjrya83qORJOto=
X-Gm-Gg: ASbGncsVZfWAql7SGRIV77JQEWG9REkOlosTAZIKqijnf3SfkTiD+x2Ds9vZp7rU9GL
	p96bx39z2p5RQb1W/gEZpZGFbHDuO31cLNtsyMoQ1fb1spvu1kYd4E00U5PnlkKQeQfVJkXqd6t
	HysIONcrzpJWzqNkQ4U19w25a3lZn5KalXjmO2DpSOiQdNZdKyGjm1eXzObAbyDeIiOpPW0bhBT
	+2dEn9MbOP/lcy2+0EDGeXXbnxU8evWXhfKklvp+601D2Z28CEsk9or4agof0mnORvcKIF97CPc
	9Lubtmxlm6pT4gElCu0YsOg07GSu7sIBBC3Xd81doz6om14wxHxI7S1LZjPiWUw/oGqKgrNnqF4
	=
X-Received: by 2002:a17:903:2449:b0:234:b12b:a2e3 with SMTP id d9443c01a7336-234b12ba39amr113413415ad.29.1748476232027;
        Wed, 28 May 2025 16:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFypc5iNLbJfnZmVxjeQ0tUU9PRJrbdNBewDEkD+glqxD26DEE7HsaM5jVisppgQXlxqaNQ4A==
X-Received: by 2002:a17:903:2449:b0:234:b12b:a2e3 with SMTP id d9443c01a7336-234b12ba39amr113413075ad.29.1748476231624;
        Wed, 28 May 2025 16:50:31 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm1403445ad.156.2025.05.28.16.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:50:30 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 2/5] thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype
Date: Wed, 28 May 2025 16:50:23 -0700
Message-Id: <20250528235026.4171109-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6837a148 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=YOepGyM1JLL-9Drl-x0A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9Z6deOX91hS6qo9q_Tq6nGHUYH20p6wG
X-Proofpoint-GUID: 9Z6deOX91hS6qo9q_Tq6nGHUYH20p6wG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDIxMCBTYWx0ZWRfX7Dg3BDwNOe2s
 /Ws7XIM/m6kIRk29AeGNSaIMgthZwZxKaqdtXOcJJuSFcVUDOLYuUQIVYlSulcrnwweMh9ierDS
 wohpU5Huh6BRulm5cDmKLHkLMGk/HNLzRckm7JMFZWaeT8THcG8ArQ3MBffut64sTlIBstDYf74
 KpcIQ5HwNZU41BbHiOzidBiLKK7aKpoIUh4FtsLBiVdbhw4Cwne+UCJENF/oICCXyvQDKo3IYJR
 pSzyOIsj1g8JYa7F9NsH4fladtYLGbWVfG23mZ2bjJI5EOStPcoF0dnXxjeKBGg/NB52f2qMMR4
 G8YCabPrRagEUd7zpqSpKwgY2GTloo1Naso1H+KhcoKQ0eoET7UxBMmX5Ffykh6TLDbbz/o0snp
 WJ96rM+9JtQ1aKfroZQWoM98hZxnSe1j4/DdT3JtPRrWlWkpvaIufhp1VroEtll8XW4chKHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280210

Currently multiple if/else statements are used in functions to decipher
between SPMI temp alarm Gen 1, Gen 2 and Gen 2 Rev 1 functionality. Instead
refactor the driver so that SPMI temp alarm chips will have reference to a
spmi_temp_alarm_data struct which defines data and function callbacks
based on the HW subtype.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 106 +++++++++++++-------
 1 file changed, 69 insertions(+), 37 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 47248a843591..0d8bbc5b7af6 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -4,6 +4,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -31,7 +32,6 @@
 
 #define STATUS_GEN1_STAGE_MASK		GENMASK(1, 0)
 #define STATUS_GEN2_STATE_MASK		GENMASK(6, 4)
-#define STATUS_GEN2_STATE_SHIFT		4
 
 #define SHUTDOWN_CTRL1_OVERRIDE_S2	BIT(6)
 #define SHUTDOWN_CTRL1_THRESHOLD_MASK	GENMASK(1, 0)
@@ -68,10 +68,18 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
 #define DEFAULT_TEMP			37000
 
+struct qpnp_tm_chip;
+
+struct spmi_temp_alarm_data {
+	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
+	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
+};
+
 struct qpnp_tm_chip {
 	struct regmap			*map;
 	struct device			*dev;
 	struct thermal_zone_device	*tz_dev;
+	const struct spmi_temp_alarm_data *data;
 	unsigned int			subtype;
 	long				temp;
 	unsigned int			thresh;
@@ -81,9 +89,9 @@ struct qpnp_tm_chip {
 	struct mutex			lock;
 	bool				initialized;
 	bool				require_s2_shutdown;
+	long				temp_thresh_map[STAGE_COUNT];
 
 	struct iio_channel		*adc;
-	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
 };
 
 /* This array maps from GEN2 alarm state to GEN1 alarm stage */
@@ -117,20 +125,19 @@ static int qpnp_tm_write(struct qpnp_tm_chip *chip, u16 addr, u8 data)
  */
 static long qpnp_tm_decode_temp(struct qpnp_tm_chip *chip, unsigned int stage)
 {
-	if (!chip->temp_map || chip->thresh >= THRESH_COUNT || stage == 0 ||
-	    stage > STAGE_COUNT)
+	if (stage == 0 || stage > STAGE_COUNT)
 		return 0;
 
-	return (*chip->temp_map)[chip->thresh][stage - 1];
+	return chip->temp_thresh_map[stage - 1];
 }
 
 /**
- * qpnp_tm_get_temp_stage() - return over-temperature stage
+ * qpnp_tm_gen1_get_temp_stage() - return over-temperature stage
  * @chip:		Pointer to the qpnp_tm chip
  *
- * Return: stage (GEN1) or state (GEN2) on success, or errno on failure.
+ * Return: stage on success, or errno on failure.
  */
-static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
+static int qpnp_tm_gen1_get_temp_stage(struct qpnp_tm_chip *chip)
 {
 	int ret;
 	u8 reg = 0;
@@ -139,12 +146,27 @@ static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	if (chip->subtype == QPNP_TM_SUBTYPE_GEN1)
-		ret = reg & STATUS_GEN1_STAGE_MASK;
-	else
-		ret = (reg & STATUS_GEN2_STATE_MASK) >> STATUS_GEN2_STATE_SHIFT;
+	return FIELD_GET(STATUS_GEN1_STAGE_MASK, reg);
+}
 
-	return ret;
+/**
+ * qpnp_tm_gen2_get_temp_stage() - return over-temperature stage
+ * @chip:		Pointer to the qpnp_tm chip
+ *
+ * Return: stage on success, or errno on failure.
+ */
+static int qpnp_tm_gen2_get_temp_stage(struct qpnp_tm_chip *chip)
+{
+	u8 reg = 0;
+	int ret;
+
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_STATUS, &reg);
+	if (ret < 0)
+		return ret;
+
+	ret = FIELD_GET(STATUS_GEN2_STATE_MASK, reg);
+
+	return alarm_state_map[ret];
 }
 
 /*
@@ -153,23 +175,16 @@ static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
  */
 static int qpnp_tm_update_temp_no_adc(struct qpnp_tm_chip *chip)
 {
-	unsigned int stage, stage_new, stage_old;
+	unsigned int stage_new, stage_old;
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&chip->lock));
 
-	ret = qpnp_tm_get_temp_stage(chip);
+	ret = chip->data->get_temp_stage(chip);
 	if (ret < 0)
 		return ret;
-	stage = ret;
-
-	if (chip->subtype == QPNP_TM_SUBTYPE_GEN1) {
-		stage_new = stage;
-		stage_old = chip->stage;
-	} else {
-		stage_new = alarm_state_map[stage];
-		stage_old = alarm_state_map[chip->stage];
-	}
+	stage_new = ret;
+	stage_old = chip->stage;
 
 	if (stage_new > stage_old) {
 		/* increasing stage, use lower bound */
@@ -181,7 +196,7 @@ static int qpnp_tm_update_temp_no_adc(struct qpnp_tm_chip *chip)
 				- TEMP_STAGE_HYSTERESIS;
 	}
 
-	chip->stage = stage;
+	chip->stage = stage_new;
 
 	return 0;
 }
@@ -221,8 +236,8 @@ static int qpnp_tm_get_temp(struct thermal_zone_device *tz, int *temp)
 static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 					     int temp)
 {
-	long stage2_threshold_min = (*chip->temp_map)[THRESH_MIN][1];
-	long stage2_threshold_max = (*chip->temp_map)[THRESH_MAX][1];
+	long stage2_threshold_min = (*chip->data->temp_map)[THRESH_MIN][1];
+	long stage2_threshold_max = (*chip->data->temp_map)[THRESH_MAX][1];
 	bool disable_s2_shutdown = false;
 	u8 reg;
 
@@ -257,6 +272,8 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 	}
 
 skip:
+	memcpy(chip->temp_thresh_map, chip->data->temp_map[chip->thresh],
+		sizeof(chip->temp_thresh_map));
 	reg |= chip->thresh;
 	if (disable_s2_shutdown && !chip->require_s2_shutdown)
 		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
@@ -294,6 +311,21 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
+	.temp_map = &temp_map_gen1,
+	.get_temp_stage = qpnp_tm_gen1_get_temp_stage,
+};
+
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_data = {
+	.temp_map = &temp_map_gen1,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
+	.temp_map = &temp_map_gen2_v1,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
 /*
  * This function initializes the internal temp value based on only the
  * current thermal stage and threshold. Setup threshold control and
@@ -301,7 +333,6 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
  */
 static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 {
-	unsigned int stage;
 	int ret;
 	u8 reg = 0;
 	int crit_temp;
@@ -315,16 +346,13 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 	chip->thresh = reg & SHUTDOWN_CTRL1_THRESHOLD_MASK;
 	chip->temp = DEFAULT_TEMP;
 
-	ret = qpnp_tm_get_temp_stage(chip);
+	ret = chip->data->get_temp_stage(chip);
 	if (ret < 0)
 		goto out;
 	chip->stage = ret;
 
-	stage = chip->subtype == QPNP_TM_SUBTYPE_GEN1
-		? chip->stage : alarm_state_map[chip->stage];
-
-	if (stage)
-		chip->temp = qpnp_tm_decode_temp(chip, stage);
+	if (chip->stage)
+		chip->temp = qpnp_tm_decode_temp(chip, chip->stage);
 
 	mutex_unlock(&chip->lock);
 
@@ -419,10 +447,14 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	}
 
 	chip->subtype = subtype;
-	if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
-		chip->temp_map = &temp_map_gen2_v1;
+	if (subtype == QPNP_TM_SUBTYPE_GEN1)
+		chip->data = &spmi_temp_alarm_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
+		chip->data = &spmi_temp_alarm_gen2_rev1_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
+		chip->data = &spmi_temp_alarm_gen2_data;
 	else
-		chip->temp_map = &temp_map_gen1;
+		return -ENODEV;
 
 	if (chip->subtype == QPNP_TM_SUBTYPE_GEN2) {
 		dig_revision = (dig_major << 8) | dig_minor;
-- 
2.34.1

