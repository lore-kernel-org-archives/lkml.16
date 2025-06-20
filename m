Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8D2857CB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415446; cv=none; b=iPCXmtDkG0T8iORRHXtidp+NC8xSBZS+jxTsZyEPRUL3Z0Ck1sltHDOlXjcytiyNHEa/SkCr4kB59lmv62sQLAnZfF5/ltHsk3oF7ANBAXNnpHpY8i6sL5aXBY+yTJFqUv+oxk7wbIImp9W9RH9ZpyZYvpzUtsRXHQGb1VAhHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415446; c=relaxed/simple;
	bh=bbxaUsU/ka58nAhmBhenyOaPkSWvg3S0shWSJ/g+NV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FSvg2ZMvOlIwpI1wzwNEHQbbpmQPnvxALSSm0UjfHwx8rToAiL/kAogRInGO2GFdB6B+jPfDjXIyoWYcO0BhVNghDAK49ovwPzDEybjsfcLSQ7tduA4X9NOQJ2iqY8kFvmyyE1AKbJIzMJvunT0ISto3cRiR3ohO3WwnsRFjeW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm2UK1op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm2UK1op"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K5hiOR020800
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TU8mtSZU0G3
	e/vpytaHll2AVzRvf35xT6/rG2wBi1+U=; b=Xm2UK1opIwo2VuHAhy/7NgUMzok
	XIgk6n7VC60ycGcRim/Pjv/lJNhiH9yksLLb90NOxkYrWrMIlarp8nRbTZxB54YP
	AieQcG6/nRA2oW09EzE/GdrJALeJbGCCpmq7OPIZOVHQujUKGoQ4RO+grvkB1x5D
	Jl+0q26gbrSvyXYyKmKwJtJSGEbfUsZXenbNvo1gbAGC2YyDnA3zvgnn9JeGckeW
	FuMSR7cWA91SLNL7T+N5q9TEAlIuPDV9zhkj+fbniMFIWp0UtRDYJxYeHG7W45Pz
	ncyclO5s5NpDH0mcbl/DnPm3qOaAbaJUdGuznsGlFq6WEq03ns8tKZ+QZRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792cab464-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:30:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fdba7f818so2083970a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415444; x=1751020244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TU8mtSZU0G3e/vpytaHll2AVzRvf35xT6/rG2wBi1+U=;
        b=G4MJm4Za1JH6oT84ALfzwLvP6SRGbqjuHXrI8kODfpLMB5NioATIIt7xo4Yld0zIon
         ehBCrbsQnsGjT6HXvALNfNTIUHMTmyhxKVUzjHlJt1AvjM5+Z9mO/GSf2w9/8DCi7zWO
         bBjYY52BBLt7PJisQECZhdpMv6q8t9Y6YmRk2NPBdzKGa0XGEH7s3GsgmQQa+I9ZC1Xf
         /0vAlnz5IPsxb7HZX1ktpUyMKR1ZjGmGcApi8vT4Ch/cHqItDNY5I8Y+0gnameYH0cwp
         GSDz969XOJ9c3T8/01h1SQJb6+AV/9lrBTrsj5JgyFjq1pKr2zCVxMcGBn29UhX61ITu
         FH5A==
X-Forwarded-Encrypted: i=1; AJvYcCXP6ItXKilJVcRcdG9mlu6SE7fQCBTfoLBrG2vcuBKbmkHVy1Y4041ka/V5dJbVR2/vfFwgCp8NMKlzhUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuo7zM41G0hTQN/sdZpMZZMrIE1b9crL7n6QuCh7TxQSq4lx8Y
	Ncc3L9tGI/WL2VBcAOod4rmlXHIHVAx3VUPsJwGLi0EX3I6bKjsTuJiaICaeU7a/thGxlWq3SQW
	1HNeesqqfMvuOGesYt2pkqZdAO9RWdJK0eGIFqdHtnjcm/26nWrcikmGxIl/xTXKo23Q=
X-Gm-Gg: ASbGncvz+R9CMgWBhXEU1BGMF460WVYui7gMpWMwWwn/dDsR/iH+YWdwUISegep7IZO
	h3fFKh+5Kil1DQmKe1MlggYRGy0Tdv215GZyro3ys8VO6eKPkG9CNj5WBLrYN+0nsE8ninXTWzz
	NzBHIrmGI3/qICqm0Lqfxv8/WQDDHo6J6NOYgdrDOTWHNUzAsKpnsaGdI6HjkHTqp0JRwk5nR6g
	wJRtqcH17F8O6sVZM2DF9IzCWhO0rysYEBiOPzSxlgmwgcCYm4oHwSdQjjaLUE7beBBmPKLmvy0
	7riDs982BkNAl18xm9EoQ91F3LEVqvv3k65vPAApQZIAF//FsycfUe+uyJ0=
X-Received: by 2002:a05:6a20:e616:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-22026d2a7ddmr3949863637.7.1750415443790;
        Fri, 20 Jun 2025 03:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbABCw6JW0Oz+95JAMsrKVWxcJJvpq0lO029mDpH7UZsS9QxxUAUwGtMnwmvH7CIQbnMGnow==
X-Received: by 2002:a05:6a20:e616:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-22026d2a7ddmr3949816637.7.1750415443400;
        Fri, 20 Jun 2025 03:30:43 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:43 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Fri, 20 Jun 2025 16:00:12 +0530
Message-Id: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -8lYFqiGGySuU_cIZf3yBjZkHATdf9Pw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfX6uy9wyAv7qYK
 3G4PAHonInFahBOJhawdXZ485he0688EHIsW6w92hpdIoFrxQmfuOnaFQrjxx1d580hW5WKI7Sn
 5nJZMzr5Hi8NdWkFqQ48FdeaT7NuCD5BgQHPIlLD0Ohjl7nEZAL64smkiirZxF4NtxRp/miiCc1
 qCrHJgmFhydat6kE6jtFhkvgFJ+/jj8LwGYEsrxQ9K4A9UROYLBsSJOAZkTluoXmzTTMnOIZJuI
 i/HxVeo8Zr4XlXdw8XpV6O1xp3ywgCIIBTD9damN/oAIeNKPr75sGco+Y/vK/1x9YtYslBo1seb
 9pa4rbd6wSuaUARZNoXHR37IgtVgwDRHJtFMHEnOc5AxSnY+naDuza2qafDKvp/KJEMMKLiibhf
 FzDxtJOlAJG/Zv+BymshD7D50YLxTjm7offRdGjuiaEAu4HiYdfWGE5zy+jWGceb1VGqj+Nc
X-Proofpoint-ORIG-GUID: -8lYFqiGGySuU_cIZf3yBjZkHATdf9Pw
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68553854 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pGReym1pqKqKmaA-xlUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200076

On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 13c9d4a6f015..b82b925c1f8d 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -14,6 +14,7 @@
 #include <linux/printk.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -468,6 +469,7 @@ struct wsa883x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
 	int active_ports;
@@ -1547,6 +1549,44 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_reset_powerdown(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	if (wsa883x->sd_reset)
+		reset_control_assert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 1);
+}
+
+static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
+{
+	if (wsa883x->sd_reset)
+		reset_control_deassert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 0);
+}
+
+static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
+{
+	wsa883x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(wsa883x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
+				     "Failed to get reset\n");
+	else if (wsa883x->sd_reset)
+		return 0;
+	/*
+	 * else: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
+	if (IS_ERR(wsa883x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+				     "Shutdown Control GPIO not found\n");
+	return 0;
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1567,13 +1607,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
-		goto err;
-	}
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1596,11 +1632,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 0);
+
+	wsa883x_reset_deassert(wsa883x);
+	ret = devm_add_action_or_reset(dev, wsa883x_reset_powerdown, wsa883x);
+	if (ret)
+		return ret;
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
-		gpiod_direction_output(wsa883x->sd_n, 1);
 		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
 				    "regmap_init failed\n");
 		goto err;
-- 
2.34.1

