Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5823315A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731258; cv=none; b=WWtclOm/3OM5rgQ0qKSjHAfcsQ4qJ3KnUZgUN4faE/47sIvDVpQ1YpLr2Wefy+EWavpR6A0ljCGXYK505a3DRwvhw5qMTo5+92trQt7U0FkVmXVf7udN7xOSnBD3upv/IXw5Tqhw+hjDAxPDMX20g9VrCU+ZuEqcepkBc6kI5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731258; c=relaxed/simple;
	bh=s2o+RnAnwuuTYdNz0c1fk/UXp0JDkRHvl3NhwSnxORg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxwpqaFYh02jS3uPSYojlQ+O3IcDbDs9t4pLtlk4fek0maI1zolsg1rzDJbOqNECV44IE7jjtdRAY954iBQ3KzPcBlm1ZasxSi60ic2xTuNOR42Gcv02tKaZI2SUG8Afw4st9P1ZDkv0D2uY9PpJVYsu36IL8nYkAOUA/gTMx7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTbTcNjo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTbTcNjo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlEpi021903
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXsS7jxuGefUn2n4a2PcfVZg4ooOKFqRyiTGh+plE6Q=; b=mTbTcNjoFIMpupY3
	M9nf6M0iO7jrbBzOGCTzmv3I2kNdXddeHZRe0dd0S5f+z8qnJv1CHG0J8AoxAZk7
	IOrfelL6P9VYacCnzrgEJgoXHNMv60fcBq+41/cSO47ZY6TS8TcW/FkmPBPfEErX
	kVaX4UR9oF/IDnupDcV3/1+gtp+UheDaCCwSjESMwRiDOY2DrEJHP6R8r4wMgNrw
	N+lqT1YympUowDsgf7W9iGveMmU5bISNygHLS0U9i9vV5K7nN4e4j1zXhXUSNgEn
	3tvuiPf8En5fSQZmNmtewgJaiGNpuqB8HZU/eaMW/NOaiXxSn17UROsd53gXvhFs
	M7DviA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgahe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so745153185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731255; x=1751336055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXsS7jxuGefUn2n4a2PcfVZg4ooOKFqRyiTGh+plE6Q=;
        b=t8Cd8JZWrvdGCjRInASNTw+NA9HHXc7susIRz1eIob63AKI+a5EY7gORsNBXaInT7M
         0koZNS8QeR7B1WHLPDTQUaSwzAA3vFVGN+nNXvztSQpzAlwpR1b0K0U17/D3W4HOpT3J
         9rgQ858xT52dKL14CPASSllI+fiMwmYV8+jtZLI8d7kTvHmGVOwUfieMXCIowETCoak0
         H7FloMEJ8+jEQYKp49rjfL9iF5mIF39VVHBbXfbuj+oCxKe+24eUXdPmyckkClFtvADp
         /6Xxh8AqCgnRnQtJwnO6MdnB8s6bpA1RI4SwXwBiaI/fqmEivWXYBilXh2Q4N+UFKTdV
         agcA==
X-Forwarded-Encrypted: i=1; AJvYcCUjRP+ZTl4+26hJNzzZ1rlr8MsF50M2kKlToY05Umje8thJEXBd+koaJpwNON5djI2vbxXWtE+MoK7ndxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PCdai63q+6HFRQR4o2YDox1srAFLB9V60J9Gf4C9K6bo19+8
	YGIVK8LN9jopYkkXEZ1NVZy6RMKiLiT2bwUoRnfVc/KdNWFSe1xhBN6BxyvlKPTpqY8iNQajxyJ
	aYalDnL+zdlPz6JKv/kAxjJsj9uYmFPa1XchNLckpFqcditneUSpSjtQPOhiGg0ayiEE=
X-Gm-Gg: ASbGncvwlivTEST8sU3x3mfBLSywUUWrDb0t8w0uG2bVO4EkVTUO3VVxGzgn0KzXg08
	v4EZUe/R0tc9GjUKlH7YDD5PJTclUmIYUf9ncxrzwiHXBcKazYC/8F5/RIP3wLSBuusvsqeRRx2
	aeDTHMKokJYk1qoH9r8nOwHx07EpaRSdekrDHybOhxxtTtC5astyc6bI7S/tHRNO3luv7/xfJkb
	f6Oa2YfeyDitZVflX6E2OxiwSIJqV98V1Kjyu1gpANE1L32NdOk4+jpclLPxtcSThAZF8RhuDj8
	Kxht3qwqVS1M72MB4SsbeDD+jPPa2Oj5F6ShsAfOwvL/ikrqnCkiVtGuG3HJeeqrfo89hTSSAsC
	6T/0pN3raM9AB2RgOQH7GYc5p/dGDtgHUmTQ=
X-Received: by 2002:a05:620a:1922:b0:7cd:331d:bb3e with SMTP id af79cd13be357-7d3f9935e7emr2022905085a.32.1750731254935;
        Mon, 23 Jun 2025 19:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPRQEcxIl/1tKf9CY1/kqMs19qtzRY7gdh2XwyltdEkmnKpY5wXHxxDtB4ZK5neoLM+qrbsg==
X-Received: by 2002:a05:620a:1922:b0:7cd:331d:bb3e with SMTP id af79cd13be357-7d3f9935e7emr2022901985a.32.1750731254441;
        Mon, 23 Jun 2025 19:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:57 +0300
Subject: [PATCH v3 6/8] firmware: qcom: scm: add modparam to control
 QSEECOM enablement
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-6-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l/2vDz7zeLnp6OwntquJZV6YAtUYQ1dSv5z/W2j9Xfw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YU57MOZyPTF/dlmU/ODlc/cNRYcel5y538c/YknT9vr
 KZ4qP5cJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmMp+N/Z+NbJ3txjX7GioD
 /sdFlzMbu/ieiEotK///rsihPOJijY/1k4+bL22pOzPdPkiM629qs5+N0VG7X2tSfUulSiPflqZ
 l7tml6dJ9Pn+Hw/IeuSOn+H79nNe0ZEbNWen5n+/GKUcEJi0X/JI+J65Ecb4ot0yh4AH7om8MtU
 FLD0yNbcuQ3OVw/OSG8ss3Dbse90spqpXvPqpZsJl54b7bTpXSonahWyZ9Yr7Tk9fNl/M8vU1a4
 TVzTVb+f6bLM9Y3bUyV1I3eU51z1b/0v873JzHz/t/VSBSU2NTxYbXVtB/3/qlMaS1hWcYgv7lb
 Uu6nROf8g5y5jA+N2ZSKU/WvfTy1k7m34nP1nQsHFNIcAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: YqctLOr_V-8fnbX2wCgUY6JtapsBnf-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfXy2xTmckjN/F6
 50skZjPIYtH+VJvHFE8PQVjqsOZGOBAGemN7F17Cp8icW3F7IfFYG8tPm/YYrFs3AVhubiWhABs
 0suLDVcXVolI9piujnsF+bB/+/bkXQDMr3p7RIcfbS4IKjqOE8zejI5+Q7fId9MG0mAxZ7348fs
 OuOb5X8ZMe5os8Nk2xzGKPKhMNK3kDT+d5HY/AdFk8EoiGnvTLKEnygI+uKcewCK7DfVxONA7Lq
 EzioO1N25uAxgg96qKgKKOlMBEpToQHSv2FX40uelyhMK2aybbZ3C5vNkQG3x1oWa+zUC8NzeJV
 cXJEQ53u+WE9IOSXA5QzJv/IfM8J6cb0oYvkWDPzIbJueFseQtzJZdBchluNNq2104zhKrZSbpt
 ik1PmKkKCw894QOLOH1p3r6xstyfUjLVAk8wjKtG6RiI8sjyByedtf65XG4APWeXAWj08KOR
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a09f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JMKUWE_9wimnfyHsXasA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YqctLOr_V-8fnbX2wCgUY6JtapsBnf-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240017

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In preparation to enabling QSEECOM for the platforms rather than
individual machines provide a mechanism for the user to override default
selection. Allow users to use qcom_scm.qseecom modparam.

Setting it to 'force' will enable QSEECOM even if it disabled or not
handled by the allowlist.

Setting it to 'off' will forcibly disable the QSEECOM interface,
allowing incompatible machines to function.

Setting it to 'roefivars' will enable the QSEECOM interface, making UEFI
variables read-only.

All other values mean 'auto', trusting the allowlist in the module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 27ef2497089e11b5a902d949de2e16b7443a2ca4..5bf59eba2a863ba16e59df7fa2de1c50b0a218d0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1983,9 +1983,14 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
 static unsigned long qcom_qseecom_ro_uefi = QCOM_QSEECOM_QUIRK_RO_UEFIVARS;
 
+static char *qseecom = "auto";
+MODULE_PARM_DESC(qseecom, "Enable QSEECOM interface (force | roefivars | off | auto)");
+module_param(qseecom, charp, 0);
+
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
- + any potential issues with this, only allow validated machines for now.
+ * any potential issues with this, only allow validated machines for now. Users
+ * still can manually enable or disable it via the qcom_scm.qseecom modparam.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
@@ -2013,11 +2018,27 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(unsigned long *quirks)
+static bool qcom_scm_qseecom_machine_is_allowed(struct device *scm_dev,
+						unsigned long *quirks)
 {
 	const struct of_device_id *match;
 	struct device_node *np;
 
+	if (!strcmp(qseecom, "off")) {
+		dev_info(scm_dev, "qseecom: disabled by modparam\n");
+		return false;
+	} else if (!strcmp(qseecom, "force")) {
+		dev_info(scm_dev, "qseecom: forcibly enabled\n");
+		*quirks = 0;
+		return true;
+	} else if (!strcmp(qseecom, "roefivars")) {
+		dev_info(scm_dev, "qseecom: enabling with R/O UEFI variables\n");
+		*quirks = QCOM_QSEECOM_QUIRK_RO_UEFIVARS;
+		return true;
+	} else if (strcmp(qseecom, "auto")) {
+		dev_warn(scm_dev, "qseecom: invalid value for the modparam, ignoring\n");
+	}
+
 	np = of_find_node_by_path("/");
 	if (!np)
 		return false;
@@ -2065,7 +2086,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed(&quirks)) {
+	if (!qcom_scm_qseecom_machine_is_allowed(scm->dev, &quirks)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}

-- 
2.39.5

