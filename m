Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26622F775
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476233; cv=none; b=QdVQkZ0DEtN8ktLbCaITE+QDZKjLCspjIk2V/LY1ofUPW+j66K5EJPONOHH8G43CTk/pmctvj9lh2wcyKdy+hUxQFJvn6gYH3tUrtfTACjVMQpCXtqeCn1mLpZcgdLQxQqhxiy4hXkbHCanu6O3ZAFAYsh7l0RE+wizwcC2PV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476233; c=relaxed/simple;
	bh=PAVEaTNuIFwn6uxuzqc4IGyQxSym92XjfRwGxkI5LBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HSCMv+oIe7bENJFgPqRD0IlFXnTpt5QtlI3xw30tMrePB6hRSRzh+C5lZzkBnUT79uwtkq3onhznMG+POAJj0A02veffq4qjXAF9UFtYiQNA7xJngbeJtw61eAcHGrhXTbpZ6FHUnF4rs/1zinw6qPVuehzQ8G/AMNEM0P0QXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzsLzZvc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzsLzZvc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SKEWNu010205
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=76OYDegfiux
	sYYakcQ1hn1ucR5+j5q4iTlRVv5GuZVY=; b=UzsLzZvcrIsuw8FAUyBEIrXvUDV
	IoaHdTGLYJablVBla/GFTbmcidMnV2HYfZOsREuJ+KD8SONG1Qgk9iFAmy67+fZo
	DFjaWtZXg/YWt1xpbxDn56lt57leXTXE/LVXpy+kfv0BDO8HRFVvNm8ayahfa8BJ
	lyhc1Tx7HqBj1ml+pfjb/Sd4f/y4qcfwOF2TngYspDxDVtEsbiYu6qzAuu3i2O8i
	qb4JINtoJfoW2piBLZp6sb4Zl+Qf9d11rIgLMCvn+3F74hIy/SoiyGNHw7ASLSjm
	Rby4DrhLMOrrAjFIOgcDW+c8onFBxlcA8hQa9A5zX4hQRzSbReguPYfay1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkwpea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2326a6d667eso3327585ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476230; x=1749081030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76OYDegfiuxsYYakcQ1hn1ucR5+j5q4iTlRVv5GuZVY=;
        b=UD4OQAjYsOQqBtRWxZqYl8EOBCK9vcLZBk3ka+jwgjWKDILWFFzJ5cAwq8J3LhNScN
         Psd0x7b734qvmOaGGfTwAcZzbS32AamzYcx6Opt4bLj+PluOaCi9RFHmRggKBKEUP4JJ
         eFgWhio7EJkVpVevO6GyERtkqvhKI2iMuew30D0wKf3JbAPa6I1wTYlYmL3OQaMDxQKa
         1xjPxjfnjwXAGzbXeHx4DXgsSXVgITbkygY0pyOoFWHbdmwW0qgG8CmwGGFsjg/NAvIN
         ld2a0KNRJRzYxut9GQee4LGAKLMzmulhCj3EOyhGS24HJQMn9+IHHnzhjLfP4xAF69YU
         hTcA==
X-Forwarded-Encrypted: i=1; AJvYcCW0DpwMGEIr8ZbzabdLg4e0767Sejfcy+/pfzcPWief9/mL4ERa8Mj3mqqwvlkrbtUEHqm9wAldshxJKFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6Y7HezIi6AFNonIJt+U5WNKVaG/g0rW4qtPHzuV0GI4O/vxf
	DvQ0y/RuJYOC3CWxJlur9COYxByYaLmsvcfd6CLvzGE+zE3Nqg/48wyYg1PYe+3Hmb8/qxG4emO
	xcT6FTIH72vQyEnicSVwqBz3PGaGopaElLL0sA0Xv8OtI9p6PPWP0jTxSAQ7YL5GMPlo=
X-Gm-Gg: ASbGncsJQv+lN2F8G3S3B7GVGQc5pwESGavIOYQvBKqY1CLAZ9OqAoNp1czVaffuBYm
	Z6Enhk8IO+4JFbqkbDl3xSheqVfwofBcq4woPMx6HX5770apQtle35xw0QNIhZGDkCCTS9Z/+Zb
	PmTYQsDF30uT5NGe5DhsX3hABwrAj9n1OO1S/qIQOhg5GSpL5bDsIsVHB+rO7fNxTIgjL20DLjg
	hIrI3XXhqge3OccUsZv09LsK/pQ/pUkG7vWbTquPNGNRL/XpUbghnoy6/x/9QuquJ+CbpwdDoby
	F9H63pDaMUHqSP5Kjmb2LJjJNeJSzHArhDG/Uelo2AhlwFvuErMs3niuUKKsXarvlrvhANAAzQY
	=
X-Received: by 2002:a17:903:3ba3:b0:234:986c:66bf with SMTP id d9443c01a7336-23507fda8e1mr687105ad.11.1748476230567;
        Wed, 28 May 2025 16:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXJ2CH253RcCjsEbKAglqaviACnPHSjcPxqaSjGqZk/+EVCV8EtG5Q2YOsePh+6HsjQ9HZIQ==
X-Received: by 2002:a17:903:3ba3:b0:234:986c:66bf with SMTP id d9443c01a7336-23507fda8e1mr686765ad.11.1748476230187;
        Wed, 28 May 2025 16:50:30 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm1403445ad.156.2025.05.28.16.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:50:29 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required
Date: Wed, 28 May 2025 16:50:22 -0700
Message-Id: <20250528235026.4171109-2-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-GUID: e2FZ8WgoK3Wp1vgA3FFHEp6IqdWdGCmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDIxMCBTYWx0ZWRfXxS3gH2Xhmmtx
 hH4U2d0iprr69SvvxpBXuUjRbTazWrjXkRRha8umsUhs4VnM4pDNWWHp0CQuZEomxXsNsBb33ko
 9bV67Cat1qwQDPVhU6Y0PIp2bck9PJ+6vHXWBHbs91CJIuf0TiX84mWcfXEAE+nH3ctpyj8T02c
 guPpt7GLQO6UhSWj3/tpeo6E6+IHNkqgUAYjvs4OMhf0XqxfjWnQw2MJ6w6KVFk4M1cfccZMs+E
 T2uqOPq2qmnuUm3aww71vhrqDjMErlG+wYGqDBlAcklOBaa7kivpdBG9LMy5B1X9CQ+mznieuZp
 dg5dlaXNhTE7rk3c9LSOFqEj2GF5+VCFy/MlJ7u8Q/MdKmT63OiTe5ykGiuRzNN7gRaf9kPlB8h
 aE0wd20p+NHMzmdsNxK762l6yJj6+R8fTdVIiameZEA4ub0IYxzJaakcGZTsIuGjTUCtMviV
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6837a147 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=e8SBnR8fKgZMydxn7aMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: e2FZ8WgoK3Wp1vgA3FFHEp6IqdWdGCmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280210

From: David Collins <david.collins@oss.qualcomm.com>

Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
stage 2 automatic PMIC partial shutdown to be enabled in order to
avoid repeated faults in the event of reaching over-temperature
stage 3.  Modify the stage 2 shutdown control logic to ensure that
stage 2 shutdown is enabled on all affected PMICs.  Read the
digital major and minor revision registers to identify these
PMICs.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index a81e7d6e865f..47248a843591 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/bitops.h>
@@ -16,6 +17,7 @@
 
 #include "../thermal_hwmon.h"
 
+#define QPNP_TM_REG_DIG_MINOR		0x00
 #define QPNP_TM_REG_DIG_MAJOR		0x01
 #define QPNP_TM_REG_TYPE		0x04
 #define QPNP_TM_REG_SUBTYPE		0x05
@@ -78,6 +80,7 @@ struct qpnp_tm_chip {
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
+	bool				require_s2_shutdown;
 
 	struct iio_channel		*adc;
 	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
@@ -255,7 +258,7 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 
 skip:
 	reg |= chip->thresh;
-	if (disable_s2_shutdown)
+	if (disable_s2_shutdown && !chip->require_s2_shutdown)
 		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
 
 	return qpnp_tm_write(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, reg);
@@ -350,8 +353,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 {
 	struct qpnp_tm_chip *chip;
 	struct device_node *node;
-	u8 type, subtype, dig_major;
-	u32 res;
+	u8 type, subtype, dig_major, dig_minor;
+	u32 res, dig_revision;
 	int ret, irq;
 
 	node = pdev->dev.of_node;
@@ -402,6 +405,12 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "could not read dig_major\n");
 
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MINOR, &dig_minor);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "could not read dig_minor\n");
+		return ret;
+	}
+
 	if (type != QPNP_TM_TYPE || (subtype != QPNP_TM_SUBTYPE_GEN1
 				     && subtype != QPNP_TM_SUBTYPE_GEN2)) {
 		dev_err(&pdev->dev, "invalid type 0x%02x or subtype 0x%02x\n",
@@ -415,6 +424,23 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	else
 		chip->temp_map = &temp_map_gen1;
 
+	if (chip->subtype == QPNP_TM_SUBTYPE_GEN2) {
+		dig_revision = (dig_major << 8) | dig_minor;
+		/*
+		 * Check if stage 2 automatic partial shutdown must remain
+		 * enabled to avoid potential repeated faults upon reaching
+		 * over-temperature stage 3.
+		 */
+		switch (dig_revision) {
+		case 0x0001:
+		case 0x0002:
+		case 0x0100:
+		case 0x0101:
+			chip->require_s2_shutdown = true;
+			break;
+		}
+	}
+
 	/*
 	 * Register the sensor before initializing the hardware to be able to
 	 * read the trip points. get_temp() returns the default temperature
-- 
2.34.1

