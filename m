Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A561A83E8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161543; cv=none; b=rd/YiQnEjEPPC0epRmDkbWrqgYmQqICZ//4EaH2kRuTEylaGHsovSeq9HwIOBLyPgBGWWNdR7M9gOKVLgjlOFebn6w47sfcZGwJxabgGygcW9E91WTo0EPgf1Fn+97ghXqHo+ECkUCPnDLjkaoc8vClH+NV6H3NTPLEv3HeyMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161543; c=relaxed/simple;
	bh=c3CUAg0HasaSA/PE3Dal6+uZcOy1QkgqJaYpeHte2pc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p0EQCfj/8B7ZnPhQ1D5tVF/s1G/7yHu/0UK42HxT1Vm2Ur9OqXB8zvayw2TXA/cs63SAawxGa8ma33qJEsrBVQQmmR9L/+d8MEEARxNbbQEPnSfSXYNLG3n05xlO0EixTPRyPpEmUHpItNkwvPcq08bkFRu4L35fHlyDTO+DfQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WksyA/Y+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WksyA/Y+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRp1e006232
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+lQ/vPOzh1nV31LxscU3xt
	CwW1jtDDyo2XMZFjX21to=; b=WksyA/Y+47uZF+BlN855cmP0x/0uw/wzT1waLd
	qhKRNqp+6c1MbZ5+0vU7/bzhxeNIzXAsLarcsU5JlN7dlLbCP7Xh9OywczdXV3Xf
	WTj52J2NeeK+Zw4o+P/wxlZNBbkQQZcWUNObDudfZJDVXa/ZND7aHj4As5t+mQ08
	Q894T2yukSHsFSXulLLRam+6PkTlLj95lJazpisuz18twsyN4hwrSWX6QZFI0i5E
	Q6l+R/XINbhKSpty4oChSrGMGbPAyCgliA8fgs44Rg2ZtiatVqw3W4AHj+5MqeAk
	aFLEBW5L5GWQJs04WqKCdNC1fAQoILD50Uy0XACqB0i2YkZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpr176-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:39:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6e7c6a3fbso100566876d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161540; x=1747766340;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lQ/vPOzh1nV31LxscU3xtCwW1jtDDyo2XMZFjX21to=;
        b=X2ZPrVW5KmNKwIg62tzwYasugvyn65NlZ6jTzsAzYsqROkPcWl+q5EUtnQHBZe+ywt
         PCtWPa96WpboINmmxBzHqTlHLHUXGrH//DOn3fKLsKxPpJ4adazkjpWaBpnl6rZVJa6G
         4ZQ8Lo4yG/sobDPMJsI7eZn2ZlXgskbhH1kJDbsKORZifGqDG7uRk7BDqt2cMCExc1aX
         S1ci4WNZBeVb33MfIUdr75YiG4zfxRttxGnYnT7WiUdegEAWvU+ZOyIa7abVJYGGqQQs
         wYtVSGSawtTI/7bjcLAjkJbXzLNm4K7Cp7Np8fQTzXnMVBgKs6EJwKhccAK6csoqXKGg
         vSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcDPAazyHES3SUWYu/QDjphSw2Dc4TlAtwKO332mvR5J0AjRLxc9r2dMenib7Hs6LQTigPV0U/y7w3slg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qkLKm1GpLajXZW6abuu2s9GUNdUBr1hs4OwKAS9/0u/c3/ng
	cZ391U9VNb7bgCduGo9LXRJJpNlWzRzLpIPrhmRTQ9DlFnGFNpY59tP3CZ0O6X7raqHhuZMBPIO
	mbX6B6/HyZ+KBrVLDMBKwqMxhhG05QMzTrC2tRnbvXQv19ci9+73J21Jqtxlp1+s=
X-Gm-Gg: ASbGncs9v3EO6sRnt0RkAJLwp2nnzMdWNvZpvSQskF9b+j0ULvWU2EsqmxD+sxEYg/i
	4+a/LusjBrPvjSa0hEO0c8EI69VOm+9Zdz0RbgOQosARPjYLfbjVgx1okTGOQkgYY0vpIXUEz1F
	hfTJzYtPgX8aClHfkow4DTAU0G6aIrq8CqCeY/W/UvtB0P/nbvRJ7qZUbh6g1i9hqf2QsaonwiT
	mIyDCMVSLtwV9NMEQAM223zPn6S6bKotYflM404/pf3byVjm469NNoX3Xi4J1j4E6uKTfh5QuSh
	lh8CDu5gRkLpJANpisJymbFv3BJ/vZXpEsvfTedaweN0mSf4jj8To18uXz881gNuxKuWz8bHbqf
	9JYyQQYbAGxFVaGj4m4Khcy6w
X-Received: by 2002:ad4:5ce7:0:b0:6ec:f51f:30e9 with SMTP id 6a1803df08f44-6f896df90b0mr6746766d6.4.1747161540014;
        Tue, 13 May 2025 11:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzYJSPEfUW6mWY6P3xiKJzFtmy2XLPu3POn1xl6PAmrl/J92bfhsNhVSP4WgBUAToIj3wmxg==
X-Received: by 2002:ad4:5ce7:0:b0:6ec:f51f:30e9 with SMTP id 6a1803df08f44-6f896df90b0mr6746436d6.4.1747161539625;
        Tue, 13 May 2025 11:38:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c12b7sm17383921fa.50.2025.05.13.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:38:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pinctrl: qcom: several fixes for the pinctrl-msm
 code
Date: Tue, 13 May 2025 21:38:56 +0300
Message-Id: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCRI2gC/3WNzQ6CMBCEX4Xs2SWlgqgn38NwKP2RTSjFLjYaw
 rtbuXuZ5JtkvlmBbSTLcC1WiDYRU5gyyEMBelDTwyKZzCCFbEQjjjjTpJc4omePjt7YS9k43Vp
 lpIa8mqPN9W68d5kH4iXEz36Qql/735UqFGjUpW/dqRZnV98Cc/l8qVEH78sc0G3b9gUZ/rott
 QAAAA==
X-Change-ID: 20250503-pinctrl-msm-fix-b225fc7ead2c
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=c3CUAg0HasaSA/PE3Dal6+uZcOy1QkgqJaYpeHte2pc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5HBpZLzHjAdSK7DQFj9CvNEnUbwQkbBUaesB
 x0JexswuYyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCORwQAKCRCLPIo+Aiko
 1TdAB/wLAWRvtRldup2CF+4QJA+CpINrBjI9tNtzRBrskSI7a6vngrIm243V00uM/JCo0S81gNg
 LgR4+jMtR/qiP9rHwLmDN71DoH9P7jG273ftPuJs/nEk7fuzch6e8KvL/CTMVo/xZTVIktSMEu/
 Ot/964xQzHjhpgLjK0nPI1JhbBLBHRWqJw0ldNXaW4QXMF3TIh2F4Td/RUWbzbVl72nrrWdBH/j
 NRUu7MJeNsW4vkrzHweg2PkaZdDmxEADr1aMkomZm8MjTaC7uWh5+4om2S80cc2ys4HPxWQSvdG
 +F+LP8oXaw2pPDcavJFksjM5iSxQZAA13rZ0K7DG0+FZfNQw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: j7E9uA8nRE2T5YCvlCltCKGj1cf4Xk92
X-Proofpoint-ORIG-GUID: j7E9uA8nRE2T5YCvlCltCKGj1cf4Xk92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3NyBTYWx0ZWRfX+YPGtNdCqkuG
 aQwrzKzlOF2iUW39B8By61JyHkKL5FUeiE94bs08iGIVUlJS71Ka5wwwUJ50FBAs85EbmGCNYLr
 3HaDxhpQcZEBfP5nW1c4dNndLatq4BZdE5oaK8e5T4reScpmL8FI5dVY3xjQiSyNiGYuGQ/y3n2
 cHh5bAWnYd4Ax3MzYIPhtseEStepVDWrDdlglw0pbWOK6UXRLcpS3reyntWpAbG/yqnNkJ1hmFq
 lZEB3+eezuY8OAx3fBUI5YF7PbV8qbrduO29RdhdIFOfBZF+OSty+3HXuuuQmGltdIAkNxNMol5
 wkIm/+VHdrTJjWUJLZP2NOkGaNfJV/ZuTIW2777sKpXaivKsRAjW9YfvfkpwUxuc5r2s3jz8bE2
 UD0QnT9pCEDHvIRMPkzN0YOfQemx1igxE1mnXDbTl+sq4Rnwyr3r4Ut/WoSyVQTuE4i6CrzN
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682391c4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yL6wTZgN64zhq57P54QA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=849 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130177

Fix/rework several issues in the pinctrl-msm common code. The most
important fix is the one for the gpio-hog handling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Moved gpiochip validation to gpiochip core (Bartosz, Linus)
- Squashed two last patches (Bartosz)
- Link to v1: https://lore.kernel.org/r/20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      gpiolib: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()
      pinctrl: qcom: switch to devm_gpiochip_add_data()

 drivers/gpio/gpiolib.c                  |  6 ++++++
 drivers/pinctrl/qcom/pinctrl-apq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-apq8084.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm.c      | 34 +++++++++++++--------------------
 drivers/pinctrl/qcom/pinctrl-msm.h      |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8226.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8660.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8960.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs404.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm670.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |  1 -
 59 files changed, 19 insertions(+), 78 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250503-pinctrl-msm-fix-b225fc7ead2c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

