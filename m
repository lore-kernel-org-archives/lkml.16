Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551A1A255C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250340; cv=none; b=Kh5S5JEca5u6SDnaA8WuDDro2IOOwyo/pEnQ+jooJQBsacOYFQkEaKqBBKXWSE8H2pRuIIFCCnLmYrzLZVhMNoIRVUUfuGgRU/RtGR0oQ/bfpjN/ae7DN2fdLFTRhYOx1qxngjZOaY+yGH56/XvC2BlCHJbTWb/PYNMA3y9Io6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250340; c=relaxed/simple;
	bh=lxvekQGPDsOMYef1m807SVoHXf2uXvzLwYRmS9A6iAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mc7VKOEOA4X2QCitRHM7qA/6Z34HlHEwiaCyE2zw36d8YkjpFPc4Jyl+ZpXeIl97fyZF8frEAbGhvBeezJ40NsiyBgqgsrmVyIZjXGjvFKMe+t4Jj7tMce/69A4j11rr6OncD2lVyjQotebxiDruNafexxhHGtNE8zAFqdSC0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6SH1/P5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6SH1/P5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434kFYq027211
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLxjbqM9PSW7oEolDee1xiNk/Q1KHNR7QJsWA/AIg1k=; b=C6SH1/P5jRelggFM
	jH5mBWY0G8kLiH4Lnx2X8AD7OopyfOO5PolWhygJAYzaxUH4DX7p0iacv0e0wwnb
	0xWmdgaOqPgPxDFkNKJJBZl4vzt2sF1LFm2E+S56gPxKDxeRChoszrd6XfaKxJO+
	3uWqj5AAuJjp8E4arHEmne45TwLI8PMGxUk8L3cHb1vNS/m7kaOshak5zt5GUccR
	uVrpkchKgPu4bSBQhk4ZeRfQJZ7dP0FhaBMyyD63HG6PQTDAuqkHLXiWO96wbZKD
	NUNtKh77wmUPLQegxX8H9uti1zyvyXfIHDCm1rXNy07JQ7i5hJmjpQF1jbxp5Sge
	fW96sA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh783np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:32:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so301114385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250336; x=1746855136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLxjbqM9PSW7oEolDee1xiNk/Q1KHNR7QJsWA/AIg1k=;
        b=huoRnwuADjcvvNsuSSIL5/tEF0g79J+8x8bxB1nyU7QEfxmfSAU2hupMK0/+dVpXdC
         O3cLcItnU547ZD2zb1Ca17WtOif6sluQCx6S5Hoat8gSe47nZcU+HGsEUfb/9iEbf/oG
         JyCqKCx+ZmhZ5Tx7lejifgBWON/lfpttO2mrKIrTifbZaUOGkxL3+qAY4qquFeeaPMT6
         iTNVQSAhRfJzpSJqr4/VTdn4L4D4d5HwPaUht/WA/ECC+DRVmnHbId24zPWMXCWHgHec
         s4HTDBtYcj5GzUgyG+eUAdu8MzKR0/UVska/GO1ovBDkBMc8gNGKJXbELd8l6rD/A0/K
         QiSg==
X-Forwarded-Encrypted: i=1; AJvYcCUQJYbhCNQETb1B024CLRHJAnxAvxtY5h9XRQ8ocwTMA6oUZCdUg8VRr19BO4owTDLuzeGNaEmiZki0Vcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybRSk2nM/le1mU6Xzo+ILlAp05zlWOa05y6gORIOYyvQwVj5GD
	mzti7RHcTrv+vQ5hbswXItq24mi3nCfaickGJNlRcPQFFFnp56O5Qer2SKowTpoidb355M8o9IQ
	Sh8nkKUsyqUNFBK1+pmGmGqwWVrX6xdbuIol+xmVUWXYxsgYwYCTRziJjVka3dRU=
X-Gm-Gg: ASbGnctuwxktV/KozYFtpt8ILouopFHB3Zhm9TEQtklMUYtOuqzc+mP2XwxV9+KJfj7
	PDz87NBuUBroTg3QWqkZeDRIwcnKguGQkkr/bVfA4CJSc3Wg8r1B+BO2aAOccotIwwF7DOTxydg
	EXp96lcQkr0+G4QtuCNGOGRc4eTtFIoXlETRsA6M746JtVbu2CSw0pX4NmHeYT4tf9JGw1If77u
	Hrr0PMN3ndn2uhjHh4eQZhFqYToF7kYxkwLIfTD81ihjaBc/SzDiZzFz9xHJt/11k61XIlYV6bO
	s3B0sXDZAYU+00RIdbZ3wTvVAHf2ewIYbr4+FNC2SiyTJaGc4Q5rQ5JxRMTDFh5FS10/Bu8GQrd
	AVC3xeio3+MFTdEYp2poWhzjl
X-Received: by 2002:ac8:5756:0:b0:48c:4512:568a with SMTP id d75a77b69052e-48d5b96cbdcmr24116461cf.2.1746250336694;
        Fri, 02 May 2025 22:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTs25BvVtFCFuCcyCdpmXaV7jb4YgOclzlqSXZmWEcq9CovXVDxtZt7lIGjGZ2T9NIbNewhA==
X-Received: by 2002:ac8:5756:0:b0:48c:4512:568a with SMTP id d75a77b69052e-48d5b96cbdcmr24116391cf.2.1746250336393;
        Fri, 02 May 2025 22:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:08 +0300
Subject: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lxvekQGPDsOMYef1m807SVoHXf2uXvzLwYRmS9A6iAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXZb6OKq+z//iyeZr/AmTBOABud1Az5/Ibx
 XbLDa4Nh5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1dW1B/4/H8EvUOxYkySSbIaOqwGKUP8s76idmHDQ+SXplOVQ5t8vJ85UvryWnDddYDriqHjv6Mp
 yFR/5yRd/c/laBCtZRrm3wZY84JHjQr/iREwEHFng8Vb+vLE08XKQQRS7GalFCYxsa7qxuEWIpm
 qPaoSJqiVKfyfujGC8MEJCKtPikx05xkdp1SY4U2xRSH2WZWecGv1Sxb57PXy4ZUzvHJlPMmZ9s
 Ay1YA+qeDcIZ+2Bex0/JVyNCieEGnHceafd/nbTSJ+6IO2LG0Z+y/K58cUjaY1/6tZ29pm3GZ5+
 JwWH23qlxchhnAXcg5U1wtBN0LvTNdQ8G9nF0hsh71zVT2GE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6815aa61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=04QupZ5m7bBPoSiWPbYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: EJ3_7s_vvWCXr9M6J4hzyK-fcOc-ztLY
X-Proofpoint-ORIG-GUID: EJ3_7s_vvWCXr9M6J4hzyK-fcOc-ztLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0MiBTYWx0ZWRfX7eB5jlfgFNSy
 aQeO7ldNNPgNF7nW/W1ErLGZ+PhcGzSpH7zuIr3bmOnySk4kIOAzy4O8aTm7MOCY/mFAR+R8HN9
 oVgGNPhqqDSppqtqt2/xdh7nrqLxUk6x3DlfJUjuqgfnhnRMWTBhGtHHT2rT0DyMrCuBAHdfiek
 QhJhi77gOSgvbIYHnreZBJUwOrP5aEvnSdfYc9Kwtj19InuLNOgOuj6Pk8/84DWH+GjD90t0Grn
 JAnJ9v9Ly49cTB5Emh+/FkjOEeShwHXvz/cev5GVZ/SyFg1UDgWLZfwFoj+7L91D6T3Sc5Q2feQ
 WuzPM672sHZRNLqUtmn4ZVlHuZ1CMyddS7COwWIdbdmSYiIN83b9Hdb5KnrLLTpDDWDZg4+dOSJ
 8zAJFBNTA/l92QOw3hNothZuvoRtFjHVtEkjuYcIKk4tqLruNnsYP47Paszbr81olohm33fG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030042

In order to simplify cleanup actions, use devres-enabled version of
gpiochip_add_data().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
 
-	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
 		return ret;
@@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
 			dev_err(pctrl->dev, "Failed to add pin range\n");
-			gpiochip_remove(&pctrl->chip);
 			return ret;
 		}
 	}
@@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
 
 void msm_pinctrl_remove(struct platform_device *pdev)
 {
-	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pctrl->chip);
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 

-- 
2.39.5

