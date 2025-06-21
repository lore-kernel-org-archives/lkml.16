Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAA27146A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535789; cv=none; b=cSvVwMHK+p7to449P52x4C71MOGvniooO7X1ytWNL7SHvfU9Uam1UXd15K++uhTCZoffjsmm6HqDJJ5Mnqo1PJ6kY6VWYB3SVLGlUiRLHutrxS2iZjOr4FzYRo9vG4C8Uot5dK6BC/hzjUleJVqwlgHOyfVV869wMauoEUvIcQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535789; c=relaxed/simple;
	bh=weSsLLbXmweIsEysxpMRpS7St0Z74YJTWedM4TDgow4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAv7gePb1hnx7JoRJgjTOi4jhcvlQhSPwkGms/cwkboMQ6uqkPriUW6yS3+jN23/mcitaVyI8Z7zfMEIw7vS5wMpRtTVyCKFQQZQWsLJS6zgtKEBWT1fQPT5n0E1TZs0SzNhV0ei5zkZK8zgB55/jYY775lrslmvY1yBULjZeko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhLM9JwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhLM9JwE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LJP5US001964
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FXtvYm/oA+Ibq5DjGlmUKY9aOduwgKSXY/MyPkbtto=; b=GhLM9JwE4oaEY3eS
	30kk5JvggYqjwHaAIXQnuBivP7tJd6Q7UiJw4vqSinzjd8i15CGuq/NaZ/vxSjgV
	hioNBM2wDyizUo3393eFmAuW0HjWG1vDwEge0qj/pHFzPjbHZj8TGw/hFL6lbRvj
	E+0kSesbvHA/8tMc9SQvJRKQOpJNooFPxP0nF/AiZIKNy7E0C8yV+TXfwkoLZpcL
	kkzt39nMRzoPqEX4svb/PtleXDDcBEI6ShXR3L5wY6KTf59bykbsEQmmfxbiJsEe
	Ux+mI89CjQZTnr0CXfHZtCEup8f/EbGKP87QUIXCdATSkOSXjSMOiP5+Rc7KKdrk
	drRBmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrxnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40d2308a4so27427685a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535785; x=1751140585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FXtvYm/oA+Ibq5DjGlmUKY9aOduwgKSXY/MyPkbtto=;
        b=RGmhxch03omGHkZP35ryfq1O1QzZjmGO8AAcgxfwC0IT/L06MRxVfkGYJhdEWn+iCi
         5yglH0qi489Z1YpaOzLntcsFLVy9OmnY7vw4dGpZgE+rxHxZqzl1+WYsRdcf8jFVzrDu
         fCfEETX/VgyUpNLPYpd5z73PxxwAaCDQgPNaiJxU2/9WNYzctmgmJH5pL1ysDzuGd1QE
         XG22gXJc3NTGetJZ+Q9mBtsk4Nf65Haj6zKb2rx2Ra8fumOMXyNjO8ONKedb94c5mL+z
         yTmrGVRLQJ1j0jKFi/jf+wenVQiiYlEsLLBV8qoZCUl3qY/9do4pF5k37wKINEt0gOYU
         G1Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWAXb0vzKbQEYyod4tuqkmGMdJjoI0k+nU0cTAjXMXZopcO3GChZg717kN27MqyWahHBiAqlM6iQl9OQDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4RY+eqHgvbZPdBKy+7IiO0oBkgGvV0YHfiPK8AzRkVryaW73P
	Dj1gnaCTMvzBZsDcFuBQlc4cYuRi4hzu+igXuWz9SMAmxfov7QkdiBm3A4FMCcSoxODgfB7w2aS
	ZlpwSG+SbhziGPgqmQWpRk8QXHHCMETeHsSqBFanyZOcff47Flq+jDzlcIJxbutXWzlKZlSbTe2
	XtlA==
X-Gm-Gg: ASbGncuxAnwRMoIHC5HsjEUTYVw5oADGQ4SO1Ej3DBOc3vKf2v8ksG31trVMAICUOrd
	y53XcIKL2sIR2idoG5L25U9OeiQUq27gONwXBDVHHnAUgRnbANs3GHkynF5137L976GjTyJsOqF
	xKMShCr/qgpg+rJ9WozgNGnewH52kOqrNUn0CNVZ0gbpcWdswGNZ7HFeDK2Aau9xUUqQbe/Xf9x
	qH2dMoQV5OMBSH/Jy2uejNh130tm8PoH+JFRYNdeTaPs1FY10vwVGWFuvJDDAZ0oFAUY1HzuqB8
	p9jAj0QX5YZRjF/a3bzcSK6Jo4QMYrGhr6Dqf+mAcuTpb59jbR8Iw9dpOMhb4E6sRxS5K5aFh+y
	0EtkIAcOKgexoagt/INZD04yy+VRqUHbnD4o=
X-Received: by 2002:a05:620a:4094:b0:7d0:9d42:732b with SMTP id af79cd13be357-7d3f98d8cbdmr1074126785a.20.1750535785405;
        Sat, 21 Jun 2025 12:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEphDP4IOn/xKx05euM3/unH/TYC++bj6aRlmPjOgRxXWSiKB2HZrEbxSLCpf8wSoJb5xsTjQ==
X-Received: by 2002:a05:620a:4094:b0:7d0:9d42:732b with SMTP id af79cd13be357-7d3f98d8cbdmr1074123885a.20.1750535784932;
        Sat, 21 Jun 2025 12:56:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:12 +0300
Subject: [PATCH v2 3/4] firmware: qcom: enable QSEECOM on Lenovo Yoga C630
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-3-6e8f635640c5@oss.qualcomm.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=weSsLLbXmweIsEysxpMRpS7St0Z74YJTWedM4TDgow4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Y4X6J8WHnl5LgZrvWzOJ30bbtuGZwy4WMxE1mgF5Hcn
 law3r2T0ZiFgZGLQVZMkcWnoGVqzKbksA87ptbDDGJlApnCwMUpABPZbc3+z/Q262u/aoYz4ptV
 JFt0djNd2rKbwSLpwQR2r1DO3yf63T5ePcDlls46VcuWaw9jeuSmw11N79Vy7d7ktYt8O/dcdN4
 2kY1mNgqXAvlm/TzyIvGsUHb+z5TFzLyvd/fzJz4xvlcQpmLRN8/HYK2b2mF5zm2ZLKnM05b8mm
 xxf5rwPK9Zlxtabfg/2howqG44LR18am+NXeehTfqXbkWeT3FwSrofXyyS5zL9g+YR/uVdCz5N1
 Qt1837vpNLnGqsu6ZBSV/t0YYRL2I7ImRteMvRJhybWfwhbNf/43kTnczLxVW5LgjJcYjc+0v7N
 dqlgn6HkTyUZcY4wn7aNu1Q6zsud+2359O3TiKmBqocA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNyBTYWx0ZWRfX+/LBlIVfwt5+
 5STmVxlgj/nmmEoyESfKbz5XTdqi23rHMuT6/I41dclrNWCF0HYUAu0R2hCxq5orYkptiXN3GpE
 PszYbCBVG6pyCUrrYI/T458pOZGjq8p4WCCE6c2Xkgbgm7GlYYTT9rk7A08hOzn4CyE3LU0CgFj
 CRaXQm3i3N93TKCUDaBQQ80XCbB7Q05vgGI2qUdjw0bCjNevRjc1rplYrFWV/tTEqCAynwIyPw0
 DdsyBaFguCuxPjwNrsn9MzVrbx1HeIBpcmzmRFLzA1wj3Pl/gpcm2L/cM/IEFn6Eovt/hH8pVLA
 cgLT8gQyi2PdT3Kb0Z7AkUDUnmBd3Cvinf+zLLTpvSWvt3KndOOrZoRSlS33dPn8I8hHOl2hQbo
 GKEyyNDndQiFOOgmJHo3pt/cGcuq+JmtkD9aHIb9tgQQlcL4W4EZ+mAAJsTAbYUQo9aquYqr
X-Proofpoint-ORIG-GUID: KCWNWz4PpiIaGkeNtcqXalT_d3L0HuOU
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=68570e6b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WOWBbpsv7UBti09GJWYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KCWNWz4PpiIaGkeNtcqXalT_d3L0HuOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210127

QSEECOM driver end UEFI vars access works on the Lenovo Yoga C630. This
platform has only one storage (UFS) shared between Linux and SecureOS
world, uefisecapp can not update variables directly. It requires some
additional steps in order to update variables, which are not yet reverse
engineered.

Enable the QSEECOM device on that laptop and set up a quirk, making UEFI
vars read-only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fa7a3c4c8f006599dbf6deec0a060e1158c91586..3b1fbdbe79cdfe9dbb1a4ff5afae53b469441ed5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/firmware/qcom/qcom_qseecom.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/init.h>
@@ -1980,6 +1981,8 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
+static unsigned long qcom_qseecom_ro_uefi = QCOM_QSEECOM_QUIRK_RO_UEFIVARS;
+
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
  + any potential issues with this, only allow validated machines for now.
@@ -1995,6 +1998,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "lenovo,yoga-c630", .data = &qcom_qseecom_ro_uefi, },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,blackrock" },

-- 
2.39.5

